import pytest

from app import start


def test_not_none_response():
    assert start() is not None


def test_if_string_response():
    assert type(start()) is str


def test_center_in_response():
    assert 'center' in start()
