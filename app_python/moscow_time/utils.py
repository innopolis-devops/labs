import pathlib
from functools import wraps

VISITS_PATH = pathlib.Path('visits.txt')


def increment_visits(func):

    @wraps(func)
    async def wrapper(*args, **kwargs):
        VISITS_PATH.touch(exist_ok=True)
        with open(VISITS_PATH, 'r') as file:
            data = file.read()
            visits = int(data) if data.isdigit() else 0
        with open(VISITS_PATH, 'w') as file:
            file.write(str(visits + 1))
        return await func(*args, **kwargs)

    return wrapper


async def current_visits():
    VISITS_PATH.touch(exist_ok=True)
    with open(VISITS_PATH, 'r') as file:
        data = file.read()
        return int(data) if data.isdigit() else 0