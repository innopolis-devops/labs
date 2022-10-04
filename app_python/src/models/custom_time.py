'''
Module with the Time class.
'''
from datetime import datetime
import pytz


class Time:
    '''
    Class that holds current current date and time in a particular timezone.
    '''
    def __init__(self, timezone_str: str):
        self.timezone = pytz.timezone(timezone_str)
        self.set_datetime()
        self.set_date()
        self.set_time()

    def set_datetime(self):
        '''
        Method that sets current datetime in a particular timezone
        and sets them to the Time class attributes.
        '''
        self.datetime = datetime.now(self.timezone)

    def set_date(self):
        '''
        Method that sets current date in string format.
        '''
        self.date = self.datetime.strftime('%Y-%m-%d %a')

    def set_time(self):
        '''
        Method that sets current time in string format.
        '''
        self.time = self.datetime.strftime('%H:%M:%S')
