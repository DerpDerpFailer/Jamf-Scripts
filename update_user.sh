#!/bin/sh

# Récupération de l'utilisateur connecté
loggedInUser=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`

# Récupération de l'email de l'utilisateur connecté
userEMail=`dscl . -read /Users/$loggedInUser | grep NetworkUser: | awk '{print $2}'`

# MAJ de l'inventaire
jamf recon -endUsername $userEMail
