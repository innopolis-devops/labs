#!/bin/bash
pip install -r requirements.txt
python -m flask --app=main.py run --host=0.0.0.0 --port=5000