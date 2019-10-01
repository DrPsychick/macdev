#!/bin/bash

mkdir $HOME/.ssh
chmod 700 $HOME/.ssh

echo "Copy your SSH key to '$HOME/.ssh' and add it to your 'authorized_keys' file (cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys)"
