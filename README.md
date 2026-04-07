# SLO-GIT1 - Déploiement et configuration

slo-git1 est une machine virtuelle fonctionnant sous incus.

- **Hôte** : slo-git1
- **Hyperviseur** : slo-hv1
- **CPU / Mémoire** : 2 vCPU / 2 GB (t3.small)
- **Clavier** : fr
- **IP** : 192.168.16.6 (vlan16)
- **Taille disque** : 50 GiB
- **Utilisateur par défaut** : tubes
- **Mot de passe par défaut** : heurtevent.org
- **Mot de passe actuel** : Dans le dossier [dav.heurtevent.org/nodes/slo-git1 du gestionnaire de mot de passe Vaultwarden](https://git.heurtevent.org) 

## Dossiers distants importants
| **Chemin** | **Rôle** |
| - | - |
| /home/tubes | Dossier de l'utilisateur tubes |
| /root | Dossier de l'utilisateur racine |
| /var/backups | Sauvegardes du système |
| /home/tubes/srv-ct-gitea | Dossier d'installation du service gitea |
| /home/tubes/backup-vols | Sauvegarde des volumes conteneurs |
| /srv/gitea | Dossier de déploiement du service gitea (créé par l'installation) |
| /home/tubes/.config/containers/systemd/ | Contient le fichier du service gitea |

## Sauvegardes
| **Chemin** | **Rôle** | **Fréquence** | **Utilisateur** |
| - | - | - | - |
| /var/backups/etc-root-usr.tgz | /etc /root /usr | Hebdo Lun 2:17 | root |
| /var/backups/home.tgz | /home | Hebdo Mar 3:23 | root |
| /var/backups/srv.tgz | /srv | Hebdo Mer 4:34 | root |
| /home/tubes/backup-vols/gitea-vol-daily.tar | Volume gitea | Quotidien 5:47 | tubes |
| /home/tubes/backup-vols/gitea-vol-weekly.tar | Volume gitea | Hebdo Jeudi 6:57 | tubes |
| /home/tubes/backup-vols/gitea-vol-monthly.tar | Volume gitea | Mensu 1er 7:07 | tubes |

## Provisionnement

Création de la machine virtuelle

`bash vm.sh launch-console`

- Les variables sont définies dans le fichier [./vars](./vars).
- Le fichier de configuration réseau est [netplan.yaml](./netplan.yaml) au format netplan.
- Le fichier de configuration de la machine est [user-data.yaml](./user-data.yaml) au format cloud-init.

Le script :
- Charge ces fichiers
- Installe et démarre la machine virtuelle en mode console.
- Redémarre la machine virtuelle après le premier démarrage et la commande sort.

La commande suivante permet de suivre les étapes de provisionnement et de configuration de base.

`bash vm.sh console`

Pour sortir du mode console, `CTRL + a` puis `q`.

## Configuration initiale

Après le configuration de base, sortez de la console et appliquez les scripts suivants :

| **Script** | **Description** |
| - | - |
| [02-ssh-import-id.sh](./02-ssh-import-id.sh) | Importe la clé SSH configuré dans [./vars](./vars). |
| [03-get-config.sh](./03-get-config.sh) | Sauvegarde la configuration cloud-init |
| [04-create-folders.sh](./04-create-folders.sh) | Créé certains dossiers distants |
| [05-copy-crontab-root.sh](./05-copy-crontab-root.sh) | Copie le [fichier de configuration crontab pour l'utilisateur racine](./files/crontab/crontab-root.txt) et l'importe dans crontab sur le serveur |
| [06-copy-crontab-user.sh](./06-copy-crontab-user.sh) | Copie le [fichier de configuration crontab pour l'utilisateur tubes](./files/crontab/crontab-user.txt) et l'importe dans crontab sur le serveur |
| [07-clone-repo.sh](./07-clone-repo.sh) | Clone le [dépôt du service](https://github.com/dheurtev/srv-ct-gitea) dans [./files/repo/srv-ct-gitea](./files/repo/srv-ct-gitea) |
| [08-copy-repo-to-vm.sh](./08-copy-repo-to-vm.sh) | Copie les fichiers de [./files/repo/srv-ct-gitea](./files/repo/srv-ct-gitea) vers le serveur dans /home/tubes/srv-ct-gitea |

Pour la configuration du service, il faut de connecter à la machine virtuelle via SSH avec l'utilisateur tubes puis exécuter les commandes suivantes :
```bash
cd /home/tubes/srv-ct-gitea
bash deploy.sh
```



