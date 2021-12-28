# https://ricardolsmendes.medium.com/mysql-mariadb-with-scheduled-backup-jobs-running-in-docker-1956e9892e78
FROM alpine:latest

ENV MYSQL_ROOT_PASSWORD \   
    DB_HOST  \
    
COPY scripts/backup-database.sh /root/backup.sh
RUN ls -alF /root
RUN ls -alf scripts/

RUN apk update && \
    apk upgrade && \
    apk add --no-cache mariadb-client && \
    chmod a+x ~/backup.sh

CMD  [ "/root/backup.sh" ]
