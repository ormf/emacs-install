#!/bin/bash

sudo apt install -y sbcl emacs
sbcl --load /tmp/emacs-install/quicklisp.lisp
cp -f /tmp/emacs-install/.sbclrc ~/
cp -Rf /tmp/emacs-install/.emacs.d ~/
emacs &
