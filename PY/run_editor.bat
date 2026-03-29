@echo off
echo Check for dependencies...
pip install -r requirements.txt --quiet
if %errorlevel% neq 0 (
    echo [WARNING] Failed to install/check requirements. Trying to run anyway...
)
echo Launching Dransik ClassiK Editor...
python "Dransik ClassiK Editor.py"
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] The editor crashed or failed to start.
    echo Please ensure Python is installed and added to your PATH.
    pause
)
