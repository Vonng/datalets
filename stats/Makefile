# PGURL (default to 'meta')
PGURL?=postgres://dbuser_dba:DBUser.DBA@:5432/meta
GFDIR?=/var/lib/grafana/dashboards/

default: all
all: sql ui restart

# load grafana dashboards
ui:
	sudo mkdir -p ${GFDIR}
	sudo rm -rf ${GFDIR}/stats
	sudo cp -rf ui/* ${GFDIR}/

# load table and data
sql:
	psql ${PGURL} -f sql/000_schema.sql              # schema `stats`
	psql ${PGURL} -f sql/001_population.sql          # population schema
	psql ${PGURL} -f sql/002_population_data.sql     # population data
	psql ${PGURL} -f sql/011_monetary.sql            # monetary schema & data

# restart
restart:
	sudo systemctl restart grafana-server

.PHONY: default all ui sql restart