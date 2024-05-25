#!/bin/bash
# Define the virtual environment directory and the dependencies file
VENV_DIR="app-venv"
REQUIREMENTS_FILE="requirements.txt"
# Check if the virtual environment directory exists
if [ ! -d "$VENV_DIR" ]; then
    echo "Virtual environment not found. Creating one..."
    python3 -m venv "$VENV_DIR"
    # Activate the virtual environment
    source "$VENV_DIR/bin/activate"
    # Upgrade pip
    pip install --upgrade pip
    # Install necessary packages
    if [ -f "$REQUIREMENTS_FILE" ]; then
        echo "Installing dependencies from $REQUIREMENTS_FILE..."
        pip install -r "$REQUIREMENTS_FILE"
    else
        echo "$REQUIREMENTS_FILE not found. Installing FastAPI..."
        pip install fastapi
    fi
else
    # Activate the virtual environment
    source "$VENV_DIR/bin/activate"
    if [ -f "$REQUIREMENTS_FILE" ]; then
        echo "Installing dependencies from $REQUIREMENTS_FILE..."
        pip install -r "$REQUIREMENTS_FILE"
    else
        echo "$REQUIREMENTS_FILE not found. Installing FastAPI..."
        pip install fastapi
    fi
fi
# Run the FastAPI application
fastapi dev app/main.py --reload --port 3302
