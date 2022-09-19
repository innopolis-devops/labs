
# Moscow Time

## Description
Application shows the current Moscow time

## Installation
* Install [Python](https://www.python.org/)
* Install Flask with command:  
```$ pip install Flask```

## Starting application
* Go to the directory **app_python**
* Enter to the venv with:  
```> venv\Scripts\activate```  
on Windows or  
```$ . venv/bin/activate```  
on MacOS/Linux

* Enter command to launch application:  
```$ flask --app main run```  

## Usage
* Go to [localhost](http://127.0.0.1:5000/) to check if the application is working:
```http://127.0.0.1:5000/```

## Docker
* Install Docker
* Do ```docker pull glebsmetanin/moscow_time```
* Do ```docker run -d -p 5000:5000 glebsmetanin/moscow_time```

## Contact
Gleb Smetanin, BS19-SD-01 \
email: g.smetanin@innopolis.university