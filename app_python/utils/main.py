from datetime import datetime

def get_current_time_formatted():
    return datetime.now().strftime("%H:%M:%S")