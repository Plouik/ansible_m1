#!/bin/bash
chmod -R 600 ../ansible_m1/
chmod 700 setup_ssh.sh
pip3 install -r .devcontainer/requirements.txt --break-system-packages
ansible-galaxy collection install community.general
activate-global-python-argcomplete
