# Daily MySQl Backup Dump

This creates a daily dump of a MySql or MariaDB server.

Use this sample compose file:

```YAML
version: '3'

services:

  mariadb-backup:
    image: rockclimber81/mariadb-backup
    environment:
      MYSQL_CONTAINER_NAME: <your container name>
      MYSQL_ROOT_PASSWORD: <your roor password>
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - <your backup folder>:/opt/mysql/backup
    command: crond -f -d 8
```

to be completed ;)