#!/bin/zsh
sudo apt-get install build-essential cmake git pkg-config libgtk2.0-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libatlas-base-dev gfortran -y
# pip
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
# virtualenv and wrapper
sudo pip install virtualenv virtualenvwrapper
sudo rm -rf ~/.cache/pip

echo '#virtualenv and virtualenvwrapper \nexport WORKON_HOME=$HOME/.virtualenvs \nsource /usr/local/bin/virtualenvwrapper.sh' >> ~/.zshrc
source ~/.zshrc
mkvirtualenv cv

# workon cv
sudo apt-get install python2.7-dev -y
pip install numpy

cd ~
git clone https://github.com/Itseez/opencv.git
git clone https://github.com/Itseez/opencv_contrib.git
cd ~/opencv
git checkout 3.0.0
cd ~/opencv_contrib
git checkout 3.0.0
cd ~/opencv
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_C_EXAMPLES=ON \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
	-D BUILD_EXAMPLES=ON ..

make -j4
sudo make install
sudo ldconfig

# make simbolic link
cd ~/.virtualenvs/cv/lib/python2.7/site-packages/
ln -s /usr/local/lib/python2.7/site-packages/cv2.so cv2.so
