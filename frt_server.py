#!/usr/bin/env python3

import sys
if sys.version_info < (3, 0):
    sys.stdout.write("Sorry, requires Python 3.x, not Python 2.x\n")
    sys.exit(1)

from frt_server.run import create_app, setup_database
import frt_server.settings
import frt_server.config

app = create_app()
setup_database(app, frt_server.config.POPULATE_SAMPLE_DATA)
app.run(debug = frt_server.config.DEBUG, host = frt_server.config.HOST, port = frt_server.config.PORT)
