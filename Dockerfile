# https://ricardolsmendes.medium.com/mysql-mariadb-with-scheduled-backup-jobs-running-in-docker-1956e9892e78
FROM alpine:3.20.1

ENV MYSQL_ROOT_PASSWORD \   
    DB_HOST  \

WORKDIR /workspace
    
COPY backup-database.sh /root/backup.sh

RUN apk update && \
    apk upgrade && \
    apk add --no-cache mariadb-client && \
    chmod a+x /root/backup.sh

CMD  [ "/root/backup.sh" ]
