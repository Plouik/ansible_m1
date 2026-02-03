## Prérequis
Installer vagrant sur le pc host, utiliser devcontainer en networking mode host. Vagrant créer les machines depuis le shell du pc host

vagrant box:
https://portal.cloud.hashicorp.com/vagrant/discover/debian
# créer une vm
vagrant up
# détruire une vm
vagrant destroy
# ssh private key path
.vagrant/machines/$NAME/private_key
# run ssh with vagrant
vagrant ssh $NAME