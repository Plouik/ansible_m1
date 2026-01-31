#!/bin/bash
chmod -R 600 ../ansible_m1/ #ansible cfg security pratice
chmod 700 setup_ssh.sh
pip3 install -r .devcontainer/requirements.txt --break-system-packages
ansible-galaxy install -r .devcontainer/requirements.yml
activate-global-python-argcomplete
