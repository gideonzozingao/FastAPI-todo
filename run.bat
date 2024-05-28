@echo off
setlocal

REM Define the virtual environment directory and the dependencies file
set VENV_DIR=app-venv
set REQUIREMENTS_FILE=requirements.txt

REM Function to check if a command exists
:command_exists
where %1 >nul 2>nul
if %ERRORLEVEL% == 0 (
    exit /b 0
) else (
    exit /b 1
)

REM Check if Python3 is installed
call :command_exists python
if %ERRORLEVEL% == 1 (
    echo Python is not installed. Please install Python3.
    exit /b 1
)

REM Check if virtual environment directory exists
if not exist "%VENV_DIR%" (
    echo Virtual environment not found. Creating one...
    python -m venv "%VENV_DIR%"
)

REM Activate the virtual environment
call "%VENV_DIR%\Scripts\activate.bat"

REM Upgrade pip
python -m pip install --upgrade pip

REM Install necessary packages
if exist "%REQUIREMENTS_FILE%" (
    echo Installing dependencies from %REQUIREMENTS_FILE%...
    python -m pip install -r "%REQUIREMENTS_FILE%"
) else (
    echo %REQUIREMENTS_FILE% not found. Installing FastAPI...
    python -m pip install fastapi
)

REM Run the FastAPI application
python -m uvicorn app.main:app --reload --port 3302
