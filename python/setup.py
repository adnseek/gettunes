"""
Setup script for Demucs installation
This script helps install Demucs and its dependencies
"""

import subprocess
import sys
import os

def install_demucs():
    """Install Demucs via pip"""
    print("Installing Demucs...")
    try:
        subprocess.check_call([sys.executable, '-m', 'pip', 'install', 'demucs'])
        print("✓ Demucs installed successfully!")
        return True
    except subprocess.CalledProcessError as e:
        print(f"✗ Failed to install Demucs: {e}")
        return False

def check_python_version():
    """Check if Python version is compatible"""
    version = sys.version_info
    if version.major == 3 and version.minor >= 8:
        print(f"✓ Python {version.major}.{version.minor}.{version.micro} detected")
        return True
    else:
        print(f"✗ Python 3.8+ required, but {version.major}.{version.minor}.{version.micro} found")
        return False

def main():
    print("=== GetTunes Setup ===\n")

    if not check_python_version():
        print("\nPlease install Python 3.8 or higher from https://www.python.org/")
        sys.exit(1)

    if install_demucs():
        print("\n✓ Setup complete! You can now run the application.")
    else:
        print("\n✗ Setup failed. Please install Demucs manually:")
        print("  pip install demucs")
        sys.exit(1)

if __name__ == '__main__':
    main()
