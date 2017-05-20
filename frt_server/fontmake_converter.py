import os
import subprocess
import zipfile
import shutil
import glob

from sqlalchemy import inspect
from frt_server.font import Font

def process(source_filename, family, user, commit_message):
    convert_font_after_upload(family, source_filename)

    source_otf_path = os.path.join(family.source_folder_path(), 'master_otf')

    otf_filenames = [os.path.basename(filename) for filename in glob.glob(source_otf_path + '/*.otf')]
    if len(otf_filenames) < 1:
        raise FileNotFoundError('No otf files were generated')

    if is_ufo_file(source_filename):
        process_ufo_file(family, source_filename[:-4], otf_filenames[0], user)
    else:
        process_glyphs_file(family, source_filename, otf_filenames, user)

    family.create_commit(commit_message, user)

def is_glyphs_file(filename):
    return filename.endswith('.glyphs')

def is_ufo_file(filename):
    return filename.endswith('.ufo.zip')

def unzip_file_for_family(family, filename):
    with zipfile.ZipFile(os.path.join(family.source_folder_path(), filename), "r") as ufo_zip_file:
        ufo_zip_file.extractall(family.source_folder_path())

def convert_font_after_upload(family, filename):
    """invoke fontmake in our source folder. no cleanup performed after"""
    type_parameter = None
    if is_glyphs_file(filename):
        type_parameter = "-g"
        temporary_filename = filename
    elif is_ufo_file(filename):
        unzip_file_for_family(family, filename)
        temporary_filename = filename[:-4]
        folders = glob.glob(os.path.join(family.source_folder_path(), '*.ufo'))
        if len(folders) != 1:
            raise Error(family.source_folder_path() + " should contain exactly 1 match for *.ufo, but contains " + len(folders))
        source = os.path.join(family.source_folder_path(), folders[0])
        destination = os.path.join(family.source_folder_path(), temporary_filename)
        if source != destination:
            move_file(source, destination)
        type_parameter = "-u"
    else:
        raise Exception("Exception: File is neither .ufo nor .glyphs")

    fontmake_result = subprocess.run(['fontmake', type_parameter, temporary_filename, '--no-production-names', '-o', 'otf', '--verbose', 'CRITICAL'],
            cwd=family.source_folder_path())
    if fontmake_result.returncode != 0:
        raise Exception("Exception: Fontmake failed to compile a font")

def create_uploaded_font(family, font_name, ufo_filename, otf_filename, user):
    font = family.font_for_file_named(ufo_filename)
    if font:
        return font

    font = Font(font_name=font_name, author_id=user._id)
    family.fonts.append(font)
    session = inspect(family).session
    session.commit()
    session.refresh(font)

    font.clean_folders()
    font.ensure_folder_exists()
    return font

def process_glyphs_file(family, glyphs_filename, otf_filenames, user):
    source_otf_path = os.path.join(family.source_folder_path(), 'master_otf')
    source_ufo_path = os.path.join(family.source_folder_path(), 'master_ufo')

    for otf_filename in otf_filenames:
        font_name = otf_filename[:-4]
        ufo_filename = font_name + '.ufo'
        font = create_uploaded_font(family, font_name, ufo_filename, otf_filename, user)

        move_file(os.path.join(source_ufo_path, ufo_filename), os.path.join(font.ufo_folder_path(), ufo_filename))
        move_file(os.path.join(source_otf_path, otf_filename), os.path.join(font.otf_folder_path(), otf_filename))

    shutil.rmtree(source_ufo_path)
    shutil.rmtree(source_otf_path)

def process_ufo_file(family, ufo_filename, otf_filename, user):
    source_otf_path = os.path.join(family.source_folder_path(), 'master_otf')
    font_name = otf_filename[:-4]

    font = create_uploaded_font(family, font_name, ufo_filename, otf_filename, user)

    move_file(os.path.join(family.source_folder_path(), ufo_filename), os.path.join(font.ufo_folder_path(), ufo_filename))
    move_file(os.path.join(source_otf_path, otf_filename), os.path.join(font.otf_folder_path(), otf_filename))

    shutil.rmtree(source_otf_path)

def move_file(source, destination):
    if os.path.exists(destination):
        if (os.path.isdir(destination)):
            shutil.rmtree(destination)
        else:
            os.remove(destination)
    shutil.move(source, destination)
