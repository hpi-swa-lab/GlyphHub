from requests import get
from subprocess import run
from time import sleep

current_result = get('https://api.travis-ci.org/repos/HPI-SWA-Lab/BP2016H1/builds').json()[0]["result"]

while True:
    response = get('https://api.travis-ci.org/repos/HPI-SWA-Lab/BP2016H1/builds')
    new_result = response.json()[0]["result"]
    build_state = response.json()[0]["state"]

    print(new_result, current_result) 

    if new_result != current_result:
        if build_state == "finished":
            if new_result == 0:
                run(["tg/bin/telegram-cli", "-W", "-e", "chat_set_photo", "BBP", "./gruenesAmpelmann.png"])
            elif ((new_result == 1 and current_result != None)
              or (new_result == None and current_result != 1)):
                run(["tg/bin/telegram-cli", "-W", "-e", "chat_set_photo", "BBP", "./rotesAmpelmann.png"])

    current_result = new_result
    sleep(5)
