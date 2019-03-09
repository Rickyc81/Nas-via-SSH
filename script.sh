#!/bin/bash

# Montaggio via ssh Nas di rete

UTENTE="admin"				                 # Utente sul nas
HOST_REMOTO="" 				                 # Ip locale al momento
PERCORSO_REMOTO=""			                 # /HDA_DATI o HDB_DATI
PORTA_SSH=668			                     # Porta ssh su Nas 
PERCORSO_LOCALE=""                           # /NAS in home
URI="$UTENTE@$HOST_REMOTO:$PERCORSO_REMOTO"  # Compositazione URI

case "$1" in
	mount)
		if ! mount | grep "$URI on $PERCORSO_LOCALE" > /dev/null
			then echo "Mounting $URI su $PERCORSO_LOCALE in corso.."
			sshfs -C