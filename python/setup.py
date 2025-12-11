"""
Setup script for Demucs installation
This script helps install Demucs and its dependencies
Works with Python 3.8 - 3.14+
"""

import subprocess
import sys
import os

def install_demucs():
    """Install Demucs via pip (tries multiple methods)"""
    print("Installing Demucs...")

    # Method 1: Try installing from GitHub (latest version, supports Python 3.14)
    try:
        print("Trying latest version from GitHub...")
        subprocess.check_call([
            sys.executable, '-m', 'pip', 'install', '-U',
            'git+https://github.com/facebookresearch/demucs#egg=demucs'
        ])
        print("✓ Demucs installed successfully from GitHub!")
        return True
    except subprocess.CalledProcessError:
        print("  GitHub installation failed, trying PyPI...")

    # Method 2: Try installing from PyPI
    try:
        print("Trying stable version from PyPI...")
        subprocess.check_call([sys.executable, '-m', 'pip', 'install', 'demucs'])
        print("✓ Demucs installed successfully from PyPI!")
        return True
    except subprocess.CalledProcessError as e:
        print(f"  PyPI installation also failed.")
        return False

def check_python_version():
    """Check if Python version is compatible"""
    version = sys.version_info
    if version.major == 3 and version.minor >= 8:
        print(f"✓ Python {version.major}.{version.minor}.{version.micro} detected")
        if version.minor >= 12:
            print("  Note: Python 3.12+ detected. Will install latest Demucs from GitHub.")
        return True
    else:
        print(f"✗ Python 3.8+ required, but {version.major}.{version.minor}.{version.micro} found")
        return False

def test_demucs():
    """Test if Demucs is working"""
    try:
        subprocess.check_call([sys.executable, '-m', 'demucs', '--help'],
                            stdout=subprocess.DEVNULL,
                            stderr=subprocess.DEVNULL)
        return True
    except:
        return False

def main():
    print("=== GetTunes Setup ===\n")

    if not check_python_version():
        print("\nPlease install Python 3.8 or higher from https://www.python.org/")
        sys.exit(1)

    print()
    if install_demucs():
        print("\nTesting installation...")
        if test_demucs():
            print("✓ Demucs is working correctly!")
            print("\n✓ Setup complete! You can now run the application.")
        else:
            print("⚠ Demucs installed but test failed.")
            print("  The app will use fallback method if Demucs doesn't work.")
    else:
        print("\n⚠ Demucs installation failed.")
        print("  Don't worry! The app will work with a fallback method.")
        print("  For best quality, try manually:")
        print("    pip install -U git+https://github.com/facebookresearch/demucs")

if __name__ == '__main__':
    main()
