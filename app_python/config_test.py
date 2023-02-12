from flask import testing
from app import app

client = testing.FlaskClient(app)