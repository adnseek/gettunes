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
    echo ERROR: Python not found. Please install Python 3.8-3.11 from https://www.python.org/
    echo.
    echo IMPORTANT: Python 3.11 is recommended!
    echo Download: https://www.python.org/downloads/release/python-31110/
    echo.
    pause
    exit /b 1
)

for /f "tokens=2" %%i in ('python --version 2^>^&1') do set PYTHON_VERSION=%%i
echo Found Python %PYTHON_VERSION%
echo.

echo Checking Python version compatibility...
python -c "import sys; exit(0 if (3, 8) <= sys.version_info[:2] <= (3, 11) else 1)"
if %errorlevel% neq 0 (
    echo.
    echo WARNING: Your Python version might not be compatible with Demucs!
    echo Demucs officially supports Python 3.8 - 3.11
    echo.
    echo Please install Python 3.11: https://www.python.org/downloads/release/python-31110/
    echo.
    pause
    exit /b 1
)

echo ✓ Python version compatible!
echo.

echo [3/3] Installing Demucs...
python -m pip install demucs
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Demucs installation failed.
    echo.
    echo Please try manually:
    echo   pip install demucs
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo ✓ Setup complete! You can now run:
echo   npm start
echo ========================================
echo.
echo Note: First run will download AI models (~2GB)
echo This is normal and only happens once.
echo.
pause
