#!/bin/sh
##
## FILE: bootstrap.sh
## Created by Marcus Dobeck
##
## DESCRIPTION: Prepare venv if required, and install deps
##
## Update - had to set setuptools at specific vesion in order for ansible pip install to work correctly. Added functions to support this.
## Read path from ansible and go there.

################################################
####SETUP######
## Fallback .venv Directory
VENV=".venv"
echo "Note, this may take a few minutes to install setuptools, etc within venv."
#echo "Please enter your proxy username"
#read USERNAME

####ONLY ONE CAN BE UNCOMMENTED AT A TIME. Or terrible, unthinkable things will happen.
#Uncomment for Python 3
#ACTPATH=Scripts
#Uncomment for Python 2
ACTPATH=bin
################################################


################################################
####Functions######
venv_check () {
    [ "$VIRTUAL_ENV" == "" ] && {
        return 1
        exit
    }
return 0
}

pkgutil_check() {
    python -c "import sys, pkgutil; sys.exit(0 if pkgutil.find_loader(sys.argv[1]) else 1)" "$1" 
}

pkgutil_upgrade() {
    for pkg in "$@"
      do
             echo pip install -U "$pkg"
             pip install -U "$pkg"
    done
}

pkgutil_install() {
    for pkg in "$@"
      do
            echo pip install "$pkg"
             pip install "$pkg"
    done
}


################################################
####Start Script######
venv_check || {
    [ -d "$VENV" ] && {
        source "${VENV}/$ACTPATH/activate"
        } || {
    command -v virtualenv > /dev/null && {
        virtualenv "--no-site-packages" "$VENV"
        source "${VENV}/$ACTPATH/activate"
        }
    }
}
venv_check
venv_check && {
    pkgutil_upgrade pip "setuptools"
    pkgutil_install "ansible" "ansible-lint" # You can specify version by using something like: pkgutil_install "ansible>=2.3.0,<2.4.0" Also put a space between pkgs
}
echo "done!"
## Non-Explicit Exit
