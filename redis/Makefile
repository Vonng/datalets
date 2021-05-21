# PGURL (default to 'meta')
PGURL?=postgres://dbuser_dba:DBUser.DBA@:5432/meta
GFDIR?=/var/lib/grafana/dashboards/

default: all
all: ui restart

# load grafana dashboards
ui:
	sudo mkdir -p ${GFDIR}
	sudo rm -rf ${GFDIR}/redis
	sudo cp -rf ui/* ${GFDIR}/

# restart
restart:
	sudo systemctl restart grafana-server

.PHONY: default all ui restart