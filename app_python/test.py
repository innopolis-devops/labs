from datetime import datetime
import main

datetime_format = ""

def test():
    str = main.index()
    assert datetime.strptime(str, "%Y-%m-%d %H:%M:%S")
