# rsync_backup

## Installation (Linux)
### Get the program

``` git clone https://github.com/ycarissan/rsync_backup.git```

creates a directory rsync_backup in the current directory.

```chmod 755 ./rsync_backup/backup.sh```

makes the script executable.

### Edit the backup.sh script (6 first lines)

The first lines of the script allow for tuning the script according to your need (what you want to backup, where and what you want to exclude).
Edit these lines using the values as template.

### Edit the to_exclude.txt file to your liking

``` cd rsync_backup ```

Edit the `to_exclude.txt` file with your favorite editor and modify it according to your needs. The files and directories, which match your entries in the file will not be saved.

### Edit your crontab

```crontab -e```

#### Some examples of crontabs (see crontab doc for further info or [here](https://crontab.guru/examples.html) or [here](https://quickref.me/cron.html) ):
##### Runs every week at 5am with no output or error file
```0 5 * * 1 /home/yannick/rsync_backup/backup.sh > /dev/null 2>&1```

##### Runs every hour and sends notification with log and error files
```@hourly env DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus /home/yannick/rsync_backup/backup.sh >> /home/yannick/rsync_backup/log 2>> /home/yannick/rsync_backup/err```

### Chill
