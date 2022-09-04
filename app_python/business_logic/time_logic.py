"""
Author: Timur Nugaev, BS19-SD01
This module is the business logic module of the server
It is responsible for the business logic layer of the application
In other words, use cases lie here
"""
from datetime import datetime
import pytz


def get_time(zone: str):
    time_zone = pytz.timezone(zone)
    current_date_and_time = datetime.now(time_zone)
    current_time = current_date_and_time.strftime("%H:%M:%S")
    return current_time
