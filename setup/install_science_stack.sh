#!env bash

# A script to install the scientific python stack with homebrew <brew.sh> on OSX


# The MIT License (MIT)
#
# Copyright (c) 2015 The-Master777 (https://github.com/the-master777)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


# - Install Homebrew -
if ! type "brew" > /dev/null 2>&1; then
	echo "Installing Homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update and check
echo "Checking for updates"
brew update && brew upgrade --all && brew cleanup && brew doctor

if [ $? -ne 0 ]; then
	echo "Errors detected"
	read -t 5 -p "Press CTRL+C to abort or any key to continue (5 sec)" -n 1
fi

# - Install dependencies -
brew install gcc
brew install gfortran
brew install swig
brew install libpng

# Python 3
brew install python3
pip3 install --upgrade pip setuptools

# Tap Homebrew Science <brew.sh/homebrew-science>
brew tap homebrew/science

# - Install scientific stack -
pip3 install nose
pip3 install numpy
pip3 install scipy
pip3 install sympy

brew install freetype
pip3 install matplotlib

brew install zmq
brew install pyqt5
pip3 install gnureadline
pip3 install pyzmq
pip3 install pygments
pip3 install ipython