import os

testing = os.getenv('FRT_TESTING', '0') == '1'

if not testing:
    from config.config import *
else:
    from config.config_test import *
