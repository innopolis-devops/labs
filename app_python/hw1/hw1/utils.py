import requests


def get_moscow_time():
    headers ={
        'Connection': 'keep-alive',
        'Cache-Control': 'max-age=0',
        'Upgrade-Insecure-Requests': '1',
        'User-Agent': 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.116 Safari/537.36 OPR/40.0.2308.81',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        'DNT': '1',
        'Accept-Encoding': 'gzip, deflate, lzma, sdch',
        'Accept-Language': 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4'
    }
    resp = requests.get(url='https://www.timeapi.io/api/Time/current/zone?timeZone=Europe/Moscow', headers=headers)
    data = resp.json()
    time = 'error'
    if resp.status_code == 200 and len(data['dateTime']) > 10 and 'T' in data['dateTime']:
        time = data['dateTime'].split('T')[1][:8]
    return time
