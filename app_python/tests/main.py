from datetime import datetime
import pytz
import yaml


def get_current_time_formatted():
    with open("config.yml", "r", encoding="utf-8") as f:
        config = yaml.load(f, Loader=yaml.FullLoader)
    TZ = config["flask"]["timezone"]
    tz = pytz.timezone(TZ)
    return datetime.now(tz)
