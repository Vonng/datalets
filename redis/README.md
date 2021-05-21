# Redis监控系统

Redis的监控比较简单，因此不再作为单独的软件产品管理。


本项目只提供监控Dashboards，包括4个监控面板：
  * Redis Overview : 关注所有Redis集群，全局汇总信息。
  * Redis Cluster  : 关注单个Redis集群
  * Redis Instance : 关注单个Redis实例
  * Redis Node     : 关注用于单台用于部署Redis的机器节点

### Caveats

* Redis Exporter需要您自行配置。
* 本监控面板按照 `cls` 与 `ins` 标签组织，用户需要自行为Redis实例关联身份。
* 本项目使用的Redis Exporter为自行编写的Exporter，少量指标与开源社区的Redis Exporter有所出入，请按需调整即可。
* Pigsty的Prometheus[配置文件](https://github.com/Vonng/pigsty/blob/master/roles/prometheus/files/rules/redis.yml)中已经自动包含了Redis衍生指标的定义与常用报警规则