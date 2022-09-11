# Moscow Time app

This is a simple web application that shows the current time in Moscow.

## Usage

You can get the json containing Moscow time by going to the root of the web page with your browser or by running the ```curl``` command in the command line.
```
┌──(kali㉿kali)-[~]
└─$ curl http://127.0.0.1:8000/      
{"msk_time":"21:11:47 04.09.2022"} 
```

## Installing
Install dependencies:
```
pip install -r requirements.txt
```

## Running
Enter the directory with the application and run web server:
```
cd moscow_time
uvicorn main:app --host 127.0.0.1 --port 8000
```

## Implementation
This simple web application was implemented using the FastAPI framework due to its simplicity and speed of development.
The application receives data from ```https://timeapi.io/api/Time/current/zone?timeZone=Europe/Moscow```. This API makes it easy to get the time for any time zone.
You get application documentation by accessing the ```/docs``` endpoint.
