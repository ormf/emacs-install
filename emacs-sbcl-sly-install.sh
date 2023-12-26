#!/bin/bash

sudo apt install -y sbcl emacs
sbcl --load /tmp/emacs-install/quicklisp.lisp
cp /tmp/emacs-install/.sbclrc ~/
cp -R /tmp/emacs-install/.emacs.d ~/
emacs &
