-------------------------------------------------------------------------
-- 这个文件记记录了一些用于分析的查询，不需要在数据库中实际执行
-------------------------------------------------------------------------

-------------------------------------------------------------------------
-- 将省份转换为二/三字简称
-------------------------------------------------------------------------
CREATE FUNCTION pop.province_shortname(fullname TEXT) RETURNS TEXT AS
$$SELECT CASE fullname
             WHEN '上海市' THEN '上海'
             WHEN '云南省' THEN '云南'
             WHEN '内蒙古自治区' THEN '内蒙古'
             WHEN '北京市' THEN '北京'
             WHEN '吉林省' THEN '吉林'
             WHEN '四川省' THEN '四川'
             WHEN '天津市' THEN '天津'
             WHEN '宁夏回族自治区' THEN '宁夏'
             WHEN '安徽省' THEN '安徽'
             WHEN '山东省' THEN '山东'
             WHEN '山西省' THEN '山西'
             WHEN '广东省' THEN '广东'
             WHEN '广西壮族自治区' THEN '广西'
             WHEN '新疆维吾尔自治区' THEN '新疆'
             WHEN '江苏省' THEN '江苏'
             WHEN '江西省' THEN '江西'
             WHEN '河北省' THEN '河北'
             WHEN '河南省' THEN '河南'
             WHEN '浙江省' THEN '浙江'
             WHEN '海南省' THEN '海南'
             WHEN '湖北省' THEN '湖北'
             WHEN '湖南省' THEN '湖南'
             WHEN '甘肃省' THEN '甘肃'
             WHEN '福建省' THEN '福建'
             WHEN '西藏自治区' THEN '西藏'
             WHEN '贵州省' THEN '贵州'
             WHEN '辽宁省' THEN '辽宁'
             WHEN '重庆市' THEN '重庆'
             WHEN '陕西省' THEN '陕西'
             WHEN '青海省' THEN '青海'
             WHEN '黑龙江省' THEN '黑龙江'
             ELSE ''
             END AS province;
$$ LANGUAGE SQL IMMUTABLE;

-------------------------------------------------------------------------
-- 2020 与 2010 年各省份 人口变化
-------------------------------------------------------------------------
SELECT nw.province         AS province,
       nw.total - od.total AS delta_10y
FROM pop.province nw JOIN pop.province od
    ON nw.time = od.time + '10year'::INTERVAL AND nw.province = od.province
WHERE nw.time = '2020-01-01';

-------------------------------------------------------------------------
-- 人口出生，死亡，自然增长
-------------------------------------------------------------------------
SELECT
  time,
  r_birth / 1000.0 * total AS "出生人口",
  r_death / 1000.0 * total AS "死亡人口" ,
  r_incr / 1000.0 * total  AS  "净增人口"
FROM
    pop.yearly
WHERE $__timeFilter(time) ORDER BY 1;


-------------------------------------------------------------------------
-- 自然增长 (总人口相比去年)
-------------------------------------------------------------------------
SELECT nw.time             AS time,
       nw.total - od.total AS total_delta
FROM pop.yearly nw
         JOIN pop.yearly od
              ON nw.time = od.time + '1year'::INTERVAL
WHERE $__timeFilter(nw.time) ORDER BY 1;

-------------------------------------------------------------------------
-- 自然增长: 青少年增量
-------------------------------------------------------------------------
SELECT nw.time,
       nw.youth - od.youth AS "青少年增量"
FROM pop.yearly nw
         JOIN pop.yearly od
              ON nw.time = od.time + '1year'::INTERVAL
WHERE $__timeFilter(nw.time) ORDER BY 1;

-------------------------------------------------------------------------
-- 自然增长: 壮劳力增量
-------------------------------------------------------------------------
SELECT nw.time,
       nw.labor - od.labor AS "壮劳力增长"
FROM pop.yearly nw
JOIN pop.yearly od
    ON nw.time = od.time + '1year'::INTERVAL
WHERE $__timeFilter(nw.time) ORDER BY 1;

-------------------------------------------------------------------------
-- 自然增长: 老年人增量
-------------------------------------------------------------------------
SELECT nw.time,
       nw.older - od.older AS "老年人增量"
FROM pop.yearly nw
         JOIN pop.yearly od
              ON nw.time = od.time + '1year'::INTERVAL
WHERE $__timeFilter(nw.time) ORDER BY 1;

-------------------------------------------------------------------------
-- 老中青人数 与 抚养比
-------------------------------------------------------------------------
SELECT
  time,
  youth AS "幼",
  labor AS "中",
  older AS "老",
  r_dep AS "抚养比",
  r_dep_youth AS "幼抚养比",
  r_dep_older AS "老抚养比"
FROM
    pop.yearly
WHERE $__timeFilter(time) ORDER BY 1;

-------------------------------------------------------------------------
-- 男女性别比例
-------------------------------------------------------------------------
SELECT
  time,
  male AS "男",
  female AS  "女",
  male - female AS "光棍男"
FROM
    pop.yearly
WHERE $__timeFilter(time) ORDER BY 1;


-------------------------------------------------------------------------
-- 抚养比
-------------------------------------------------------------------------
SELECT
  time,
  youth + older AS "老幼",
  labor AS "劳力",
  r_dep AS "抚养比"
FROM
    pop.yearly
WHERE $__timeFilter(time) ORDER BY 1;


-------------------------------------------------------------------------
-- 学历占比
-------------------------------------------------------------------------
SELECT
    time,
    edu_advanced   AS "高等教育" ,
    edu_high       AS "高中" ,
    edu_middle     AS "初中" ,
    edu_primary    AS "小学" ,
    edu_illiteracy AS "文盲"
FROM
    pop.census
WHERE $__timeFilter(time) ORDER BY 1;

-------------------------------------------------------------------------
-- 普职比
-------------------------------------------------------------------------
SELECT time,
       normal     AS "普通高中",
       vocational AS "职业学校"
FROM pop.high_school
WHERE $__timeFilter(time) ORDER BY 1;

