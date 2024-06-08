#!/bin/bash
set -e

function customize {
#	id
	cp -R /tmp/.ssh/* /root/.ssh/
#	ls -ltr /tmp/.ssh
#	ls -ltr /root/.ssh
	chmod 700 /root/.ssh
	chmod 644 /root/.ssh/id_rsa.pub
	chmod 600 /root/.ssh/id_rsa
	chmod 600 /root/.ssh/authorized_keys

	su - postgres -c "cp -R /tmp/.ssh/* ~postgres/.ssh/ && chmod 700 ~postgres/.ssh && chmod 644 ~postgres/.ssh/id_rsa.pub && chmod 600 ~postgres/.ssh/id_rsa && chmod 600 ~postgres/.ssh/authorized_keys"

	/usr/sbin/sshd 2>&1
}

customize  &

/usr/local/bin/docker-entrypoint.sh "$@" &
#/usr/local/bin/docker-entrypoint.sh "postgres" "-c" "wal_level=hot_standby" "-c" "port=5432" "-c" "hba_file=/var/lib/postgresql/config/pg_hba.conf" "-c" "archive_mode=on" "-c" "archive_command=barman-wal-archive -U root --port 222 barman postgres %p" "-c" "max_wal_senders=2" "-c" "max_replication_slots=2" "-c" "log_directory=/var/lib/postgresql/data/log" "-c" "log_filename=postgresql.log" &
sleep infinity 
