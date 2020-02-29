SSH
http://www.linux-france.org/prj/edu/archinet/systeme/ch13s04.html


ssh -L [port local]:[adresse_remote]:[port remote] [utilisateur@adresse_du_serveur]


M0:$ ssh -L 1234:HOSTNAME:80 M1
la commande est passée sur M0.

La commande ouvre une connexion entre le M0:1234 vers HOSTNAME:80 en utilisant le serveur sshd M1:22 (actif sur M1 et sur le port 22). Tout dépend de la valeur que va prendre HOSTNAME. HOSTNAME indique la machine distante sur lequel s'opére la connexion.
HOSTNAME utilise comme référence la machine distante. localhost référence donc M1


# Tunnel from localhost to gateway
ssh -L $SSH_PORT:localhost:10234 $GATEWAY_IP

# Tunnel from gateway to server OCR
ssh -L 10234:localhost:22 $SERVER_IP

# Check that the tunnel is open with :
ssh -p $SSH_PORT localhost
