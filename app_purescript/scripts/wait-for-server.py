import requests
import time

status = True
while status:
    if status:
        #check the the status and assign to offense_response.status_code
        try:
            res = requests.get("http://0.0.0.0:8001")
            if res: break
        except:
            print ("no response")
        finally:
            print("the server isn't yet ready")
            time.sleep(2)
    else:
        print("status code is 200, hence exiting")
        status = False