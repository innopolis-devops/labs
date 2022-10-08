from flask import Flask
from datetime import datetime
import pytz
import markdown

app = Flask(__name__)

@app.route('/')
def time():
    moscowTimeZone = pytz.timezone('Europe/Moscow')
    currentDateInMoscow = datetime.now(moscowTimeZone)
    formatedDate = currentDateInMoscow.strftime('%d-%m-%Y %H:%M:%S')
    return markdown.markdown(formatedDate)

if __name__ == "__main__":
    app.run()