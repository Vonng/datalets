# 国家统计局数据分析



* 第7次人口普查数据分析
* 货币数据分析

## Quick Start

Run this on pigsty meta node

```bash
make  
```






### Details

```bash
# load data (PGURL=meta)
# export PGURL=postgres://dbuser_dba:DBUser.DBA@:5432/meta
make data

# load dashboards (sudo required, GFDIR=/var/lib/grafana/dashboards/dashboards)
# export GFDIR=/var/lib/grafana/dashboards/dashboards
make ui

# load misc deps (optional)
make misc          # add china.json geojson resource to grafana static dir  
```


## FHS

* ui:   grafana dashboards
* bin:  binary scripts to parse , load , transform data
* data: database schema definition, base line data, functions...
* misc: other resource files
