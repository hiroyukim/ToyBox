#!/bin/sh

for pkg in ruby1.8-dev
do
    aptitude install $pkg
done
