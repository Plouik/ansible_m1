#!/bin/bash
rm -f /root/.ssh/known_hosts

declare -A vm
vm[one]="192.168.33.10"
vm[two]="192.168.33.11"

for hostname in "${!vm[@]}"; do
	private_key_path="/root/.ssh/${hostname}"
	cp ".vagrant/machines/${hostname}/virtualbox/private_key" "${private_key_path}"
	chmod 400 "${private_key_path}"
	echo "Testing ssh vagrant@${vm[${hostname}]} -i ${private_key_path}"
	ssh -o BatchMode=yes "vagrant@${vm[${hostname}]}" -o StrictHostKeyChecking=no -i "${private_key_path}" 'exit 0'

	RCODE=$?
	if [[ ${RCODE} -ne 0 ]]; then
		echo "  [!] Unable to ssh on: ${hostname}"
	else
		echo "OK"
	fi
done

ansible-playbook ssh_setup_playbook.yml