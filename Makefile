# PGURL (default to 'meta')
PGURL?=postgres://dbuser_dba:DBUser.DBA@:5432/meta
GFDIR?=/var/lib/grafana/dashboards/

default: all
all: sql ui restart

# copy
ui:
	sudo mkdir -p ${GFDIR}
	sudo rm -rf ${GFDIR}/stat
	sudo cp -rf ui/* ${GFDIR}/

# copy to sandbox
copy:
	scp -r ./* meta:~/datalets/

# restart
re:
	sudo systemctl restart grafana-server

.PHONY: default all ui sql re