#!/bin/bash
chmod 600 ../ansible_m1/ #ansible cfg security pratice
pip3 install -r .devcontainer/requirements.txt --break-system-packages
ansible-galaxy install -r .devcontainer/requirements.yml
activate-global-python-argcomplete
