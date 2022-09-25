import requests


def get_moscow_time():
    resp = requests.get(url='http://worldtimeapi.org/api/timezone/Europe/Moscow')
    data = resp.json()
    time = 'error'
    if resp.status_code == 200 and len(data['datetime']) > 10 and 'T' in data['datetime']:
        time = data['datetime'].split('T')[1][:8]
    return time
