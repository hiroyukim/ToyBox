#!/bin/sh

for pkg in screen zsh vim ssh tcsh git-core 
do
    aptitude install $pkg
done

