#!/bin/sh

for pkg in screen zsh vim ssh tcsh git-core 
do
    sudo aptitude install $pkg
done

sudo cp ../files/source.list /etc/apt/
