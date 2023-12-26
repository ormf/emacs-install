#!/bin/bash

sudo apt install -y sbcl emacs
cp -f /tmp/emacs-install/.sbclrc ~/
cp -Rf /tmp/emacs-install/.emacs.d ~/
sbcl --load /tmp/emacs-install/quicklisp.lisp
