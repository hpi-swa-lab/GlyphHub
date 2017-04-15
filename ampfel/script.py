from requests import get
from subprocess import run
from time import sleep

current_state = 'asd'

while True:
    response = get('https://api.travis-ci.org/repos/HPI-SWA-Lab/BP2016H1/builds')
    new_state = response.json()[0]["result"]
    print(new_state, current_state) 

    if new_state != current_state:
        if new_state == 0:
            run(["tg/bin/telegram-cli", "-W", "-e", "chat_set_photo", "BBP", "./gruenesAmpelmann.png"])
        elif ((new_state == 1 and current_state != None)
          or (new_state == None and current_state != 1)):
            run(["tg/bin/telegram-cli", "-W", "-e", "chat_set_photo", "BBP", "./rotesAmpelmann.png"])

    current_state = new_state
    sleep(5)
