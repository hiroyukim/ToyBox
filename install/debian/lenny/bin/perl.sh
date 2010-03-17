#!/bin/sh

for pkg in libperl5.10 libperl-dev libcurl4-openssl-dev libmysqlclient15-dev
do
    aptitude install $pkg
done
