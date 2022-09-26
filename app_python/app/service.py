"""Datetime module."""
from datetime import datetime
from pytz import timezone


def __current_time(zone):
    fmt = "%Y-%m-%d %H:%M:%S %Z%z"
    return datetime.now(timezone(zone)).strftime(fmt)


def msk_time():
    """Get time in Moscow timezone"""
    zone = 'Europe/Moscow'
    return __current_time(zone)
