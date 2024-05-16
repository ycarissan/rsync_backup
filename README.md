# rsync_backup

## Installation (Linux)
### Get the program

``` git clone https://github.com/ycarissan/rsync_backup.git```

creates a directory rsync_backup in the current directory.

```chmod 755 ./rsync_backup/backup.sh```

makes the script executable.

### Edit the to_exclude.txt file to your liking

``` cd rsync_backup ```

Edit the `to_exclude.txt` file with your favorite editor and modify it according to your needs. The files and directories, which match your entries in the file will not be saved.

### Edit your crontab

```crontab -e```

#### Some examples of crontabs (see crontab doc for further info):
##### Runs every week at 5am
```0 5 * * 1 /home/yannick/rsync_backup/backup.sh ```

##### Runs every and sends notification
```@hourly env DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus /home/yannick/rsync_backup/backup.sh ```

### Chill
