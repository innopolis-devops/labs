import unittest
from datetime import datetime, timezone, timedelta
import sys
from pathlib import Path
sys.path[0] = str(Path(sys.path[0]).parent)
from moscow_time import app

class FlaskTestCase(unittest.TestCase):
    
    def setUp(self):
        app.app.config['TESTING'] = True
        self.app = app.app.test_client()

    def test_moscow_time(self):
        self.app.get('/')

        offset = timedelta(hours=3) 
        tz = timezone(offset= offset)
        time = datetime.now(tz)
        time = datetime(time.year, time.month, time.day, 
                        time.hour, time.minute, time.second)

        app_time = datetime(int(app.year), int(app.month),
                        int(app.day), int(app.hour),
                        int(app.minute), int(app.second))

        self.assertLess(app_time.timestamp() - time.timestamp(), 3,
                        "Time does not match")

if __name__ == '__main__':
    unittest.main()