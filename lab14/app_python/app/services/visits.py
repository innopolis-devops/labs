from app.services.moscow_time import MoscowTime
import aiofiles
import os


class Visits:

    def __init__(self):
        fileDir = os.path.dirname(os.path.realpath('__file__'))
        logsDir = os.path.join(fileDir, 'logs')
        if not os.path.exists(logsDir):
            os.makedirs(logsDir)
        self.visitsFileName = os.path.join(logsDir, 'visits.log')
        self.moscow_time = MoscowTime()

    async def add_visit(self):
        time = self.moscow_time.now()
       
        async with aiofiles.open(self.visitsFileName, 'a') as fp:
            await fp.write(time)
            await fp.write('\n')
            return time

    async def get_visits(self):
        try:
            async with aiofiles.open(self.visitsFileName, 'r') as fp:
                content = await fp.read()
                return content.split('\n')
        except: 
            return []
        


    

