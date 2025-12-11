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
    echo WARNING: Python not found.
    echo The app will work with a fallback method, but for best quality install Python 3.8+
    echo Download from: https://www.python.org/
    echo.
    goto skip_python
)

for /f "tokens=2" %%i in ('python --version 2^>^&1') do set PYTHON_VERSION=%%i
echo Found Python %PYTHON_VERSION%
echo.

echo [3/3] Installing Demucs for best quality vocal separation...
echo This may take a few minutes...
echo.

REM Try GitHub installation first (supports Python 3.14)
echo Attempting to install latest Demucs from GitHub...
python -m pip install -U git+https://github.com/facebookresearch/demucs#egg=demucs
if %errorlevel% equ 0 (
    echo ✓ Demucs installed successfully!
    goto done
)

echo.
echo GitHub installation failed, trying PyPI...
python -m pip install demucs
if %errorlevel% equ 0 (
    echo ✓ Demucs installed successfully!
    goto done
)

echo.
echo WARNING: Demucs installation failed.
echo The app will still work using a fallback method.
echo For best quality, try manually:
echo   python -m pip install -U git+https://github.com/facebookresearch/demucs
echo.

:skip_python
:done
echo.
echo ========================================
echo Setup complete! You can now run:
echo   npm start
echo ========================================
echo.
echo Note: First run will download AI models (~2GB)
echo This is normal and only happens once.
echo.
pause
