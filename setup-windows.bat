@echo off
echo === GetTunes Setup (Windows) ===
echo.

echo [1/3] Installing Node.js dependencies...
call npm install
if %errorlevel% neq 0 (
    echo ERROR: npm install failed
    pause
    exit /b 1
)
echo.

echo [2/3] Checking Python installation...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Python not found. Please install Python 3.8+ from https://www.python.org/
    pause
    exit /b 1
)
echo.

echo [3/3] Installing Demucs...
python -m pip install demucs
if %errorlevel% neq 0 (
    echo WARNING: Demucs installation failed. You can try manually:
    echo   pip install demucs
    pause
    exit /b 1
)
echo.

echo ========================================
echo Setup complete! You can now run:
echo   npm start
echo ========================================
pause
