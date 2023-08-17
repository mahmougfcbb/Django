#!/usr/bin/env bash
# Exit on error
set -e

# Install Python package requirements
pip install -r requirements.txt

# Install project dependencies using Poetry
poetry install

# Upgrade pip in the virtual environment
/opt/render/project/src/.venv/bin/python -m pip install --upgrade pip

# Collect static files
python manage.py collectstatic --no-input

# Apply database migrations
python manage.py migrate
