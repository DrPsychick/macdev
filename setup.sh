#!/bin/bash

mkdir $HOME/.ssh
chmod 755 $HOME/.ssh

echo "Copy your SSH key to $HOME/.ssh and add it to `authorized_keys` file (cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys)"
