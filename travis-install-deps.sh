#! /bin/sh

# Temporary install script that installs the now separate Locale::Recode.

set -e

git clone https://github.com/gflohr/Locale-Recode.git
cd Locale-Recode
perl Makefile.PL
make
make install
cd ..
rm -r Locale-Recode
cpanm --quiet --installdeps --notest .
