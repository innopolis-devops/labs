from datetime import datetime

def test_time(self, app):
    time = datetime.now()
    time = datetime(time.year, time.month,
                    time.day, time.hour,
                    time.minute, time.second)

    app_time = datetime(int(app.year), int(app.month),
                        int(app.number), int(app.hour),
                        int(app.minute), int(app.second))

    self.assertLess(app_time.timestamp() - time.timestamp(), 
                    5, "Wrong time")
