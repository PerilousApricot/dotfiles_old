#!/bin/bash

wget http://git-core.googlecode.com/files/git-1.7.12.tar.gz
tar -xvzf git-1.7.12.tar.gz 
cd git-1.7.12
make prefix=~/CommonHomeTools/build/git/local/ NO_OPENSSL=1 NO_EXPAT=1 install
