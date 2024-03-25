mysqldump --defaults-extra-file=/etc/mysql/dev_pass.cnf lesson9 > /opt/mysql_backup/dump-$(date +"%d.%m.%y")_$(date +"%H:%M:%S").sql
