# PGURL (default to 'meta')
PGURL?=postgres://dbuser_dba:DBUser.DBA@:5432/meta
GFDIR?=/var/lib/grafana/dashboards/

default: all


#-----------------------------#
# install
#-----------------------------#
all: sql ui restart

ui:
	sudo mkdir -p ${GFDIR}
	sudo rm -rf ${GFDIR}/covid
	sudo cp -rf ui/* ${GFDIR}/

sql:
	psql ${PGURL} -f sql/000_base.sql    # base schema


#-----------------------------#
# downlaod and load data
#-----------------------------#
download:
	curl -fSL https://covid19.who.int/WHO-COVID-19-global-table-data.csv -o data/latest.csv
	curl -fSL https://covid19.who.int/WHO-COVID-19-global-data.csv       -o data/history.csv

load: trunc
	cat data/history.csv | psql ${PGURL} -c "COPY covid.country_history FROM STDIN CSV HEADER;";
	cat data/latest.csv  | psql ${PGURL} -c "COPY covid.country_latest FROM STDIN CSV HEADER;";

trunc:
	psql ${PGURL} -c 'TRUNCATE covid.country_history, covid.country_latest;';

reload: download load

# restart
restart:
	sudo systemctl restart grafana-server

.PHONY: default all ui sql restart