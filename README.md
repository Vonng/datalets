# Datalets

用于演示Pigsty数据分析功能的案例集合，将本项目克隆至 pigsty meta 节点上，选择所需案例安装即可。

```bash
git clone https://github.com/Vonng/datalets.git
```


### 案例1：[国家统计局数据分析与可视化](stats/)

* 第七次中国人口普查数据分析
* 货币供应量数据分析

[`stats`](stats/)

```bash
cd stats;
make           # 添加面板与数据
```


### 案例2：[全球新冠疫情数据分析与可视化](covid/)

分析WHO官方发布的疫情数据

[`covid`](covid/)

```bash
cd covid;
make           # 添加面板与数据 
make reload    # 下载并加载最新数据
```


### 案例3： [ISD全球地表气象观测站数据](isd/)

呈现全球3万个地表气象观测站120年间的观测数据

[`isd`](isd/)

```bash
cd isd;
make             # 添加面板与数据 
make station     # 加载气象站数据
make daily       # 加载每日摘要数据
...
```

### 案例4: [Redis监控系统](redis/)

类似Pigsty，但是针对Redis。


```bash
cd redis;
make ui          # 添加面板与数据
```



### 案例5： [PostgreSQL CSV日志分析](pglog/)

给定一份PostgreSQL CSV日志，详细分析日志期间出现的事件。

[`pglog`](pglog/)

```bash
TBD
```


### 案例6： 

利用Grafana制作一个PostgreSQL数据库目录浏览器！ 下一代PgAdmin


### 其他筹划中案例

已经做过的尚未移植或脱敏的案例，视情况加入

* 旅游地点打卡，时空数据分析可视化
* 基于Grafana实现工厂工控系统，工业互联网
* 人群画像分析，广告行业，标签圈选。
* 热力图，大屏。
* 搜索框，全文检索，基本增删改查
* PostgreSQL 系统目录数据分析