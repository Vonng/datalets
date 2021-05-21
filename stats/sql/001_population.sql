
-------------------------------------------------------------------------
-- 人口年鉴数据
-------------------------------------------------------------------------
DROP TABLE IF EXISTS stats.pop_yearly;
CREATE TABLE stats.pop_yearly
(
    time            DATE PRIMARY KEY, -- 统计年度,
    total           NUMERIC,          --    总人口
    male            NUMERIC,          --    男性人口(万人)
    female          NUMERIC,          --    女性人口(万人)
    urban           NUMERIC,          --    城镇人口(万人)
    rural           NUMERIC,          --    乡村人口(万人)
    r_birth         NUMERIC,          --    人口出生率(‰)
    r_death         NUMERIC,          --    人口死亡率(‰)
    r_incr          NUMERIC,          --    人口自然增长率(‰)
    youth           NUMERIC,          --    0-14岁人口
    labor           NUMERIC,          --    15-64岁人口
    older           NUMERIC,          --    65岁及以上人口
    r_dep           NUMERIC,          --    总抚养比(%)
    r_dep_youth     NUMERIC,          --    少儿抚养比(%)
    r_dep_older     NUMERIC,          --    老年抚养比(%)
    lifespan_avg    NUMERIC,          --    平均预期寿命(岁)
    lifespan_male   NUMERIC,          --    男性平均预期寿命(岁)
    lifespan_female NUMERIC           --    女性平均预期寿命(岁)
);

-------------------------------------------------------------------------
-- 人口普查数据
-------------------------------------------------------------------------
DROP TABLE IF EXISTS stats.pop_census;
CREATE TABLE stats.pop_census
(
    time             DATE PRIMARY KEY, -- 时间
    total            NUMERIC,          -- 人口普查总人口(万人)
    male             NUMERIC,          -- 人口普查男性人口数(万人)
    female           NUMERIC,          -- 人口普查女性人口数(万人)
    r_sex            NUMERIC,          -- 人口普查性别比(女=100)
    urban            NUMERIC,          -- 人口普查城镇人口数(万人)
    rural            NUMERIC,          -- 人口普查乡村人口数(万人)
    hukou            NUMERIC,          -- 人口普查家庭户规模(人/户)
    youth            NUMERIC,          -- 人口普查0-14岁人口占总人口比重(%)
    labor            NUMERIC,          -- 人口普查15-64岁人口占总人口比重(%)
    older            NUMERIC,          -- 人口普查65岁及以上人口占总人口比重(%)
    han              NUMERIC,          -- 人口普查汉族人口数(万人)
    r_han            NUMERIC,          -- 人口普查汉族占总人口比重(%)
    minority         NUMERIC,          -- 人口普查少数民族人口数(万人)
    r_minority       NUMERIC,          -- 人口普查少数民族占总人口比重(%)
    edu_advanced     NUMERIC,          -- 人口普查每十万人口中受大专及以上教育人口数(人)
    edu_high         NUMERIC,          -- 人口普查每十万人口中受高中和中专教育人口数(人)
    edu_middle       NUMERIC,          -- 人口普查每十万人口中受初中教育人口数(人)
    edu_primary      NUMERIC,          -- 人口普查每十万人口中受小学教育人口数(人)
    edu_illiteracy   NUMERIC,          -- 人口普查文盲人口数(万人)
    illiteracy_ratio NUMERIC,          -- 人口普查文盲率(%)
    urban_ratio      NUMERIC,          -- 人口普查城镇化率(%)
    lifespan_avg     NUMERIC,          -- 人口普查平均预期寿命(岁)
    lifespan_male    NUMERIC,          -- 人口普查男性平均预期寿命(岁)
    lifespan_female  NUMERIC           -- 人口普查女性平均预期寿命(岁)
);

-------------------------------------------------------------------------
-- 人口分省年鉴数据
-------------------------------------------------------------------------
DROP TABLE IF EXISTS stats.pop_province;
CREATE TABLE stats.pop_province
(
    time     DATE NOT NULL, -- 年份
    province TEXT NOT NULL, -- 省份
    total    NUMERIC,       -- 年份-省份 总人口
    PRIMARY KEY (time, province)
);


-------------------------------------------------------------------------
-- 人口分省年鉴数据
-------------------------------------------------------------------------
DROP TABLE IF EXISTS stats.high_school;
CREATE TABLE stats.high_school
(
    time       DATE PRIMARY KEY,   -- 年份（yyyy-01-01）
    normal     NUMERIC,            -- 普高学生
    vocational NUMERIC             -- 职高学生
);


-------------------------------------------------------------------------
-- 备注
-------------------------------------------------------------------------
COMMENT ON TABLE  stats.pop_yearly IS '人口统计年鉴表';
COMMENT ON COLUMN stats.pop_yearly.time IS '年份 yyyy-01-01';
COMMENT ON COLUMN stats.pop_yearly.total IS '总人口';
COMMENT ON COLUMN stats.pop_yearly.male IS '男性人口(万人)';
COMMENT ON COLUMN stats.pop_yearly.female IS '女性人口(万人)';
COMMENT ON COLUMN stats.pop_yearly.urban IS '城镇人口(万人)';
COMMENT ON COLUMN stats.pop_yearly.rural IS '乡村人口(万人)';
COMMENT ON COLUMN stats.pop_yearly.r_birth IS '人口出生率(‰)';
COMMENT ON COLUMN stats.pop_yearly.r_death IS '人口死亡率(‰)';
COMMENT ON COLUMN stats.pop_yearly.r_incr IS '人口自然增长率(‰)';
COMMENT ON COLUMN stats.pop_yearly.youth IS '0-14岁人口';
COMMENT ON COLUMN stats.pop_yearly.labor IS '15-64岁人口';
COMMENT ON COLUMN stats.pop_yearly.older IS '65岁及以上人口';
COMMENT ON COLUMN stats.pop_yearly.r_dep IS '总抚养比(%)';
COMMENT ON COLUMN stats.pop_yearly.r_dep_youth IS '少儿抚养比(%)';
COMMENT ON COLUMN stats.pop_yearly.r_dep_older IS '老年抚养比(%)';
COMMENT ON COLUMN stats.pop_yearly.lifespan_avg IS '平均预期寿命(岁)';
COMMENT ON COLUMN stats.pop_yearly.lifespan_male IS '男性平均预期寿命(岁)';
COMMENT ON COLUMN stats.pop_yearly.lifespan_female IS '女性平均预期寿命(岁)';

COMMENT ON TABLE  stats.pop_census IS '人口普查数据';
COMMENT ON COLUMN stats.pop_census.time IS '年份 yyyy-01-01';
COMMENT ON COLUMN stats.pop_census.total IS '人口普查总人口(万人)';
COMMENT ON COLUMN stats.pop_census.male IS '人口普查男性人口数(万人)';
COMMENT ON COLUMN stats.pop_census.female IS '人口普查女性人口数(万人)';
COMMENT ON COLUMN stats.pop_census.r_sex IS '人口普查性别比(女=100)';
COMMENT ON COLUMN stats.pop_census.urban IS '人口普查城镇人口数(万人)';
COMMENT ON COLUMN stats.pop_census.rural IS '人口普查乡村人口数(万人)';
COMMENT ON COLUMN stats.pop_census.hukou IS '人口普查家庭户规模(人/户)';
COMMENT ON COLUMN stats.pop_census.youth IS '人口普查0-14岁人口占总人口比重(%)';
COMMENT ON COLUMN stats.pop_census.labor IS '人口普查15-64岁人口占总人口比重(%)';
COMMENT ON COLUMN stats.pop_census.older IS '人口普查65岁及以上人口占总人口比重(%)';
COMMENT ON COLUMN stats.pop_census.han IS '人口普查汉族人口数(万人)';
COMMENT ON COLUMN stats.pop_census.r_han IS '人口普查汉族占总人口比重(%)';
COMMENT ON COLUMN stats.pop_census.minority IS '人口普查少数民族人口数(万人)';
COMMENT ON COLUMN stats.pop_census.r_minority IS '人口普查少数民族占总人口比重(%)';
COMMENT ON COLUMN stats.pop_census.edu_advanced IS '人口普查每十万人口中受大专及以上教育人口数(人)';
COMMENT ON COLUMN stats.pop_census.edu_high IS '人口普查每十万人口中受高中和中专教育人口数(人)';
COMMENT ON COLUMN stats.pop_census.edu_middle IS '人口普查每十万人口中受初中教育人口数(人)';
COMMENT ON COLUMN stats.pop_census.edu_primary IS '人口普查每十万人口中受小学教育人口数(人)';
COMMENT ON COLUMN stats.pop_census.edu_illiteracy IS '人口普查文盲人口数(万人)';
COMMENT ON COLUMN stats.pop_census.illiteracy_ratio IS '人口普查文盲率(%)';
COMMENT ON COLUMN stats.pop_census.urban_ratio IS '人口普查城镇化率(%)';
COMMENT ON COLUMN stats.pop_census.lifespan_avg IS '人口普查平均预期寿命(岁)';
COMMENT ON COLUMN stats.pop_census.lifespan_male IS '人口普查男性平均预期寿命(岁)';
COMMENT ON COLUMN stats.pop_census.lifespan_female IS '人口普查女性平均预期寿命(岁)';

COMMENT ON TABLE  stats.pop_province IS '分省人口数据';
COMMENT ON COLUMN stats.pop_province.time IS '年份 yyyy-01-01';
COMMENT ON COLUMN stats.pop_province.province IS '省份全程';
COMMENT ON COLUMN stats.pop_province.total IS '总人口(万人)';

COMMENT ON TABLE  stats.high_school IS '高中学生人数数据';
COMMENT ON COLUMN stats.high_school.time IS '年份 yyyy-01-01';
COMMENT ON COLUMN stats.high_school.normal IS '普通高中学生人数';
COMMENT ON COLUMN stats.high_school.vocational IS '中等职业技术学校学生人数(万人)';
