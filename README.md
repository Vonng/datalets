# Datalets

用于演示Pigsty数据分析功能的案例集合，将本项目克隆至 pigsty meta 节点上，选择所需案例安装即可。

```bash
git clone https://github.com/Vonng/datalets.git
```

## Datalet 说明

"Datalet"类似于"小程序（Applet）"，是一个功能完备的自包含的数据应用。
例如，Pigsty监控系统就是一个Datalet，Pigsty的专业版面板和附加功能就将以Datalet的形式发布。

**Datalet的特征是**：

* 专注于数据处理、分析与可视化
* 既没有"前端"，也没有"后端"
* 使用PostgreSQL存储数据实现业务逻辑
* 使用Grafana进行数据可视化并交互
* 在用户界面（ui），数据（sql），可执行文件（bin）三者中至少包含一项。
* 可以在Pigsty环境中直接安装运行，通过`make`实现一键安装。

**Datalet的目录结构**：

* `ui` ： 存储监控面板的JSON定义。如果有多个Dashboard，放置在Datalet同名目录中，如`ui/redis`
* `sql` ： 存储发布至Pigsty元数据库的SQL脚本，通常包含表定义与原始数据。
* `bin` ： 存储二进制或脚本文件，用于生成、处理、维护数据
* `Makefile`： Datalet的安装脚本


## Datalets Examples




### 案例1：[国家统计局数据分析与可视化](stats/)

* 第七次中国人口普查数据分析
* 货币供应量数据分析

```bash
cd stats;
make           # 添加面板与数据
```


### 案例2：[全球新冠疫情数据分析与可视化](covid/)

分析WHO官方发布的疫情数据

```bash
cd covid;
make           # 添加面板与数据 
make reload    # 下载并加载最新数据
```


### 案例3： [ISD全球地表气象观测站数据](isd/)

呈现全球3万个地表气象观测站120年间的观测数据

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

```bash
make            # 安装datalet: 数据与面板
make reload     # 加载当天数据库日志作为分析样本
```


### 其他筹划中案例

已经做过的尚未移植或脱敏的案例，视情况加入

* 旅游地点打卡，时空数据分析可视化
* 基于Grafana实现工厂工控系统，工业互联网
* 人群画像分析，广告行业，标签圈选。
* 热力图，大屏。
* 搜索框，全文检索，基本增删改查
* PostgreSQL 系统目录数据分析