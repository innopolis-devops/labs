import pytest

from app import hello_world


def test_not_none_response():
    assert hello_world() is not None


def test_if_string_response():
    assert type(hello_world()) is str


def test_center_in_response():
    assert 'center' in hello_world()
