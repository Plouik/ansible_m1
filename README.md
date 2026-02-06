# Déploiement DevOps de l’application demo_app
## Objectif

L’object final est de déployer notre application demo_app avec docker par terraform depuis sur une VM custom.
Le déploiement doit suivre un workflow devops en partant de gitlab.

- Déployer depuis la branche main :
l’application affiche le texte « prod »

- Déployer depuis une branche git de développement :
l’application affiche comme texte le nom de la branche

L’application demo_app doit être accessible depuis un reverse proxy
(notre devcontainer ou une seconde vm)

## Terraform / Ansible

- Déployer une vm sur un cloud (AWS ou autre) par terraform

- Configurer la vm par ansible après un provisionning terraform

## Ansible / GitLab

- Créer une pipeline gitlab pour déployer automatiquement la collection ansible

- Utiliser les environnements gitlab pour mettre en place un workflow git features / master de déploiement de la collection ansible

## Terraform / GitLab

- Stocker le tf state de l’infrastructure en utilisant le backend gitlab

- Utiliser les environnements gitlab pour mettre en place un workflow git features / master de déploiement de l’infrastructure

## Ansible

- Utiliser un gestionnaire de secret externe (vault ou autre) et récupérer dynamiquement les secrets du playbook

- Utiliser ansible pull pour lancer un playbook d'installation sur la VM

## Docker / Terraform

- Push les images docker sur le docker hub par terraform

## GitLab / Docker / Terraform

- Utiliser les environnements gitlab pour mettre en place un workflow git features / master de déploiement de l’application

## GitLab / Ansible / Docker / Terraform

- La pipeline gitlab deploie sur la vm l’application par terraform via un playbook ansible

- Rendre le déploiement configurable en fonction de la branche git
(le serveur web affiche le nom de la branche git source)