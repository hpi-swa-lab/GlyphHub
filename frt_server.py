#!/usr/bin/env python3

import sys
if sys.version_info < (3, 0):
    sys.stdout.write("Sorry, requires Python 3.x, not Python 2.x\n")
    sys.exit(1)

from frt_server.run import create_app, setup_database

app = create_app()
setup_database(app)
app.run(debug = True, port = 8000)
