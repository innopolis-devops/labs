from app.services.moscow_time import MoscowTime


class Visits:

    def __init__(self):
        self.moscow_time = MoscowTime()

    def add_visit(self):
        time = self.moscow_time.now()
        with open('logs/visits.log', 'a') as fp:
            fp.write(time)
            fp.write('\n')
            return time

    def get_visits(self):
        with open('logs/visits.log', 'r') as fp:
            return fp.read()
        


    

