# rsync_backup
# Use restic :

```
sudo apt-get install restic
echo "votre_mot_de_passe_sécurisé" > ~/.restic_password.txt
chmod 400 ~/.restic_password.txt
export RESTIC_PASSWORD_FILE=~/.restic_password.txt
export RESTIC_REPOSITORY=/mnt/sauvegarde_restic
export BACKUP_SOURCE=/chemin/vers/le/répertoire
sudo mkdir -p $RESTIC_REPOSITORY
sudo chown -R votre_utilisateur:votre_utilisateur $RESTIC_REPOSITORY
restic -r $RESTIC_REPOSITORY --password-file $RESTIC_PASSWORD_FILE init
restic -r $RESTIC_REPOSITORY --password-file $RESTIC_PASSWORD_FILE backup $BACKUP_SOURCE
crontab -e
0 2 * * * restic -r $RESTIC_REPOSITORY --password-file $RESTIC_PASSWORD_FILE backup $BACKUP_SOURCE
restic -r $RESTIC_REPOSITORY --password-file $RESTIC_PASSWORD_FILE restore latest --target /chemin/vers/restauration
```
