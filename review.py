#!/usr/bin/env python3

from subprocess import Popen, PIPE
import sys
import os
import re

if len(sys.argv) < 2:
    print('Call with [--all] issue-nr [extra commit hash...]')

options = [arg for arg in sys.argv[1:] if arg.startswith('-')]
arguments = [arg for arg in sys.argv[1:] if not arg.startswith('-')]

issue = arguments[0]
extraCommits = arguments[1:]
optionAll = '--all' in options

def red(text):
    return '\033[31m' + text + '\033[0m'
def green(text):
    return '\033[32m' + text + '\033[0m'
def yellow(text):
    return '\033[33m' + text + '\033[0m'
def blue(text):
    return '\033[34m' + text + '\033[0m'
def coloredOperation(operation):
    if operation == 'A':
        return green(operation)
    if operation == 'D':
        return red(operation)
    if operation == 'M':
        return yellow(operation)
def git(args):
    pr = Popen("/usr/bin/git {}".format(args),
            shell = True,
            stdout = PIPE,
            stderr = PIPE)
    (out, error) = pr.communicate()
    return out.decode('utf-8')
def printDiffOfFile(filePath, commits, operation, full=True, recategorizeCheck=False):
    """Print the diff of file in all commits below each other.
    If full is False and recategorizeCheck is True, we only print if
    only the category changed"""
    onlyRecategorized = recategorizeCheck
    recategorizeChange = None
    newCategory = None
    out = ''

    def bprint(text = '', end='\n'):
        nonlocal out
        out += text + end

    for commit in reversed(commits):
        start = 6 if operation == 'A' else 5
        changes = git('show --format= {} -- {}'.format(commit, filePath)).strip().split('\n')[start:]
        if not changes:
            continue
        recategorized = isOnlyRecategorize(changes)
        onlyRecategorized = onlyRecategorized and operation == 'M' and recategorized
        if operation == 'A' and recategorizeCheck:
            newCategory = changes[0][1:]
        if recategorized:
            recategorizeChange = changes
            if newCategory:
                newCategory = changes[1][1:]
        if not full:
            continue
        bprint()
        bprint('\t' + yellow(commit[0:7]))
        if recategorized:
            bprint('\tcategory from `{}` to `{}`'.format(changes[0][1:], changes[1][1:]))
        else:
            for line in changes:
                if line[0] == '+':
                    bprint('\t' + green(line))
                elif line[0] == '-':
                    bprint('\t' + red(line))
                elif line.strip() != '' and not line.startswith('\\ No newline'):
                    bprint('\t' + line)
        bprint('\t' + yellow('----------'), end='')

    if recategorizeCheck and onlyRecategorized:
        print(' (only `{}` => `{}`)'.format(recategorizeChange[0][1:], recategorizeChange[1][1:]))
    elif full:
        print(out)
    else:
        print()

    if newCategory == 'as yet unclassified':
        print('\t' + red('NOTE: Category was not assigned!'))

def isOnlyRecategorize(changes):
    return changes[0][0] == '-' and changes[1][0] == '+' and \
            all(changedLine[0] != '+' and changedLine[0] != '-' for changedLine in changes[2:])


# find commit hashes for our issue nr (including our other commits in the right order)
reFindCommit = re.compile(r'^\S+')
commits = []
for line in git("log --pretty=format:'%H %s'").split('\n'):
    if line.startswith(tuple(extraCommits)) or 'i #' + issue in line:
        commits.append(reFindCommit.match(line).group(0))

if len(commits) < 1:
    print('No commits matched your query.')
    sys.exit(1)

# condense changes into single dictionary of file=>operation.
# Per file, we only save the newest operation (A, D, M)
reExtractChanges = re.compile(r'^(\S)\s+(.+)$', re.MULTILINE)
changes = {}
for commit in reversed(commits):
    c = git("show {} --name-status --format=".format(commit))
    commitChanges = reExtractChanges.findall(c)
    for operation, changedFile in commitChanges:
        changes[changedFile] = operation

# gather all changed package,classname pairs
affectedClasses = set()
rePackageClass = re.compile(r'packages/(.+?)\.package/(.+?).class')
for changedFile, operation in changes.items():
    match = rePackageClass.match(changedFile)
    if match:
        affectedClasses.add((match.group(1), match.group(2)))

# get list of package,class for all classes that were newly added or just deleted
deletedClasses = []
addedClasses = []
for changedClass in affectedClasses:
    propsPath = 'packages/{}.package/{}.class/properties.json'.format(*changedClass)
    if propsPath in changes:
        if changes[propsPath] == 'A':
            addedClasses.append(changedClass)
        if changes[propsPath] == 'D':
            deletedClasses.append(changedClass)

# get list of files that belong to a class that was only changed, not added or deletedn
skipClassPrefixes = tuple(['packages/{}.package/{}.class'.format(*changedClass) for changedClass in deletedClasses + addedClasses])
modifiedClasses = {changedFile: operation
        for changedFile, operation in changes.items()
        if not changedFile.startswith(skipClassPrefixes) and rePackageClass.match(changedFile)}

# get list of all modified files that dont belong to a class
modified = {changedFile: operation
        for changedFile, operation in changes.items()
        if not rePackageClass.match(changedFile)}

# filter our those files that belong to our server code
serverChanges = {changedFile: operation
        for changedFile, operation in modified.items()
        if changedFile.startswith(('server', 'frt_server'))}

# all remaining changed files
modified = {changedFile: operation
        for changedFile, operation in modified.items()
        if not changedFile.startswith(('server', 'frt_server'))}

print()
print('Showing changes for:')
for commit in commits:
    abbrevCommit, subject = git('show {} --no-patch --oneline'.format(commit)).strip().split(' ', 1)
    print(' {} {}'.format(yellow(abbrevCommit), subject))
print()

if len(deletedClasses) > 0:
    print('Deleted Classes:')
    for deletedClass in deletedClasses:
        print(' {} {} ({})'.format(red('D'), deletedClass[1], deletedClass[0]))
    print()

if len(addedClasses) > 0:
    print(blue('Added Classes:'))
    for addedClass in addedClasses:
        print(' {} {} ({})'.format(green('A'), green(addedClass[1]), green(addedClass[0])))
        if not git('show {}:{}'.format(commits[-1], 'packages/{}.package/{}.class/README.md'.format(*addedClass))).strip():
            print(red('   NOTE: No class comment.'))
    print()

if len(modifiedClasses) > 0:
    print('Modified Classes:')
    reMatchMethod = re.compile(r'packages/(.+?)\.package/(.+?)\.class/(instance|class)/(.+)\.st')
    modifications = list(modifiedClasses.items())
    modifications.sort()
    currentClass = None
    currentPackage = None

    for changedFile, operation in modifications:
        match = reMatchMethod.match(changedFile)
        if match:
            if match.group(1) != currentPackage:
                print()
                currentPackage = match.group(1)
                print('  {} package'.format(blue(currentPackage)))

            className = match.group(2) + (' class' if match.group(3) == 'class' else '')
            if className != currentClass:
                print()
                currentClass = className
                print('    ' + blue(currentClass))
            print('      {} {}'.format(coloredOperation(operation), match.group(4).replace('.', ':')), end='')
            printDiffOfFile(changedFile, commits, operation, full=optionAll, recategorizeCheck=True)
    print()

if len(serverChanges) > 0:
    print('Changes on {}:'.format(blue('Server')))
    for changedFile, operation in serverChanges.items():
        print(' {} {}'.format(coloredOperation(operation), changedFile), end='')
        printDiffOfFile(changedFile, commits, operation, full=optionAll, recategorizeCheck=False)
    print()

if len(modified) > 0:
    print('Other changes:')
    for changedFile, operation in modified.items():
        print(' {} {}'.format(coloredOperation(operation), changedFile), end='')
        if 'monticello.meta' in changedFile:
            print()
        else:
            printDiffOfFile(changedFile, commits, operation, full=optionAll, recategorizeCheck=False)
    print()

