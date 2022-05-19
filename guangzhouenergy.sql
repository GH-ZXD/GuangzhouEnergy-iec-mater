-- 风电光伏报表数据过滤规则导入

drop table default.dataFilterBI;
drop table default.dataFilterBIORC;
-- 创建textfile表
create table if not exists dataFilterBI
(
    id int,
    stationid int,
    stationUnitId int,
    messageAddress int
)
row format delimited fields terminated by ','
stored as textfile;

--导入数据
load data inpath '/tmp/linkis/hadoop/test/filterbi.csv' into table default.dataFilterBI 

-- 创建ORC表
create table if not exists dataFilterBIORC
(
    id int,
    stationid int,
    stationUnitId int,
    messageAddress int
)
row format delimited fields terminated by ','
stored as orc;

-- textfile表导入orc表
insert into table default.dataFilterBIORC
select * from default.dataFilterBI;

select * from default.dataFilterBIORC;


-- 风电光伏实时上报数据过滤规则导入
drop table default.dataFilter;
drop table default.dataFilterORC;
-- 创建textfile表
create table if not exists data_dev.dataFilter
(
    id int,
    stationid int,
    stationUnitId int,
    messageAddress int
)
row format delimited fields terminated by ','
stored as textfile;

--导入数据
load data inpath '/tmp/linkis/hadoop/test/filter.csv' into table default.dataFilter 

-- 创建ORC表
create table if not exists dataFilterORC
(
    id int,
    stationid int,
    stationUnitId int,
    messageAddress int
)
row format delimited fields terminated by ','
stored as orc;

-- textfile表导入orc表
insert into table default.dataFilterORC
select * from default.dataFilter;

select * from default.dataFilterORC;

-- 煤层气过滤规则导入
drop table default.dataFilter_CBM;
drop table default.dataFilter_CBMORC;
-- 创建textfile表
create table if not exists dataFilter_CBM
(
    id          string,
    stationsId   string,
    setNameId        string,
    typeName         string,
    dataValueIndex  string,
    dataValueIndexName     string,
    stationsUnitId  string
)
row format delimited fields terminated by ','
stored as textfile;

--导入数据
load data inpath '/tmp/linkis/hadoop/test/filter_CBM.csv' into table default.dataFilter_CBM; 

select * from default.dataFilter_CBM;

-- 创建ORC表
create table if not exists dataFilter_CBMORC
(
   id          string,
    stationsId   string,
    setNameId        string,
    typeName         string,
    dataValueIndex  string,
    dataValueIndexName     string,
    stationsUnitId  string
)
row format delimited fields terminated by ','
stored as orc;

insert into table dataFilter_CBMORC values
(1	,'hd'	,'hd_set1_data'	,'analogQuantity'	,30		,'有功功率'		,1	),
(2	,'hd'	,'hd_set2_data'	,'analogQuantity'	,30		,'有功功率'		,2	),
(3	,'hd'	,'hd_set3_data'	,'analogQuantity'	,30		,'有功功率'		,3	),
(4	,'hd'	,'hd_set4_data'	,'analogQuantity'	,30		,'有功功率'		,4	),
(5	,'dl'	,'dl_set1_data'	,'1号机组实时数据'	,11		,'1号机功率'		,1	),
(6	,'dl'	,'dl_set2_data'	,'2号机组实时数据'	,11		,'2号机功率'		,2	),
(7	,'dl'	,'dl_set3_data'	,'3号机组实时数据'	,11		,'3号机功率'		,3	),
(8	,'dl'	,'dl_set4_data'	,'4号机组实时数据'	,11		,'4号机功率'		,4	),
(9	,'dl'	,'dl_set5_data'	,'5号机组实时数据'	,11		,'5号机功率'		,5	),
(10	,'dl'	,'dl_set6_data'	,'6号机组实时数据'	,11		,'6号机功率'		,6	),
(11	,'dl'	,'dl_set7_data'	,'7号机组实时数据'	,11		,'7号机功率'		,7	),
(12	,'dl'	,'dl_set8_data'	,'8号机组实时数据'	,11		,'8号机功率'		,8	),
(13	,'dl'	,'dl_set9_data'	,'9号机组实时数据'	,11		,'9号机功率'		,9	),
(14	,'dl'	,'dl_set10_data'	,'10号机组实时数据'	,11		,'10号机功率'	,10	),
(15	,'bgs'	,'bgs_set1_get'	,'1号机组模拟量数据'	,5		,'实际功率'		,1	),
(16	,'bgs'	,'bgs_set2_get'	,'2号机组模拟量数据'	,5		,'实际功率'		,2	),
(17	,'bgs'	,'bgs_set3_get'	,'3号机组模拟量数据'	,5		,'实际功率'		,3	),
(18	,'bgs'	,'bgs_set4_get'	,'4号机组模拟量数据'	,5		,'实际功率'		,4	),
(19	,'bgs'	,'bgs_set5_get'	,'5号机组模拟量数据'	,5		,'实际功率'		,5	),
(20	,'bgs'	,'bgs_set6_get'	,'6号机组模拟量数据'	,5		,'实际功率'		,6	),
(21	,'bgs'	,'bgs_set7_get'	,'7号机组运行数据'	    ,7		,'实际功率'		,7	),
(22	,'bgs'	,'bgs_set8_get'	,'8号机组运行数据'	    ,7		,'实际功率'		,8	),
(23	,'bgs'	,'bgs_set9_get'	,'9号机组模拟量数据'	,5		,'实际功率'		,9	),
(24	,'bgs'	,'bgs_set10_get'	,'10号机组模拟量数据'	,5		,'实际功率'		,10	),
(25	,'bgs'	,'bgs_set11_get'	,'11号机组模拟量数据'	,11		,'11号机功率'	,11	),
(26	,'bgs'	,'bgs_set12_get'	,'12号机组模拟量数据'	,11		,'12号机功率'	,12	);

-- textfile表导入orc表
insert into table default.dataFilter_CBMORC
select * from default.dataFilter_CBM;

select * from default.dataFilter_CBMORC;

-- 光伏风电场站建表（目前进度只有到建表，大部分建表语句是和客户合作开发）
	
create table if not exists data_dev.TEXT_text		
(
id string comment '自增主键',
stations_unit_id string comment '厂商ID',
stations_id string comment '场站ID',
message_address string comment '寄存器地址',
message_info_to_float string comment '实时数据值',
message_info_length string comment '实时数据长度',
create_time string comment '数据采集时间'
)
partitioned by (ds string) ;
use data_dev
select * from TEXT_text

SELECT TABLE_NAME FROM data_dev


SELECT * FROM dba_tables


data_devdata_dev--光伏场站明细数据源表
drop table if exists data_dev.ODS_DAILY_DETAIL_CACHE_TABLE;		
create table if not exists data_dev.ODS_DAILY_DETAIL_CACHE_TABLE		
(
id int comment '自增主键',
stations_unit_id int comment '厂商ID',
stations_id int comment '场站ID',
message_address int comment '寄存器地址',
message_info_to_float double comment '实时数据值',
qualifiers_type string comment '限定词（预留字段）',
message_info_length int comment '实时数据长度',
create_time date comment '数据采集时间'
)
partitioned by (ds string) ;



use default
select * from testexchangis1

select * from datafilter

--光伏场站数据点表	
drop table if exists data_dev.DIM_PV_DATA_POINT_table;		
create table if not exists data_dev.DIM_PV_DATA_POINT_table						
(
id int comment '自增主键ID',
pv_array_on string comment '光伏分区编号',
signal_point_name string comment '信息点名称',
signal_point_unit string comment '信息点单位',
signal_point_type string comment '采集点类型',
register_address int comment '寄存器地址',
station_unit_id int comment '厂商ID',
stations_id int comment '场站ID'
)
partitioned by (ds string) ;

--光伏场站厂商数据表	
drop table if exists data_dev.DIM_PV_unit_data_table;		
create table if not exists data_dev.DIM_PV_unit_data_table								
(
id int comment '自增主键',
station_unit_id int comment '厂商ID',
unit_name string comment '厂商名称',
unit_ip string comment '子场站IP',
unit_port string comment '子场站端口',
station_name string comment '场站名称',
stations_id int comment '场站ID'
)
partitioned by (ds string) ;

--设备基础信息表	
drop table if exists data_dev.DIM_EQUIPMENT_BASIC_INFO_TABLE;		
create table if not exists data_dev.DIM_EQUIPMENT_BASIC_INFO_TABLE										
(
id int comment '自增主键',
ownership_company string comment '归属子公司',
power_plant_code string comment '发电厂编码（统一社会信用代码）',
station_name string comment '发电厂名称',
equipment_code string comment '分区编码',
equipment_model string comment '分区型号',
rated_capacity double comment '额定容量（万千瓦）',
production_date date comment '投产日期（yyyy-mm-dd）',
rated_voltage  double comment '额定电压（千伏）',
rated_power_factor double comment '额定功率因数',
altitude double comment '海拔（例如:各风机的海拔）',
station_address string comment '发电厂地址'
)
partitioned by (ds string);

--设备基础手工录入表			
drop table if exists data_dev.ft_pv_array_info;		
create table if not exists data_dev.ft_pv_array_info												
(
id int comment '自增主键',
ownership_company string comment '归属子公司',
power_plant_code string comment '发电厂编码（统一社会信用代码）',
station_name string comment '发电厂名称',
pv_array_on string comment '分区编码',
equipment_model string comment '分区型号',
pv_array_capacity double comment '额定容量（万千瓦）',
pv_array_production_date date comment '投产日期（yyyy-mm-dd）',
rated_voltage  double comment '额定电压（千伏）',
rated_power_factor double comment '额定功率因数',
altitude double comment '海拔（例如:各风机的海拔）',
station_address string comment '发电厂地址',
update_usr double comment '最终修改人',
update_time double comment '修改时间',
status string comment '状态',
version string comment '版本号'
)
partitioned by (ds string);




--计划电量表		
drop table if exists data_dev.DWD_PLAN_ELECTRICITY_TABLE;	
create table if not exists data_dev.DWD_PLAN_ELECTRICITY_TABLE										
(
station_name string comment '场站名称',
year string comment '年份',
month string comment '月份',
month_plan_on_grid_power double comment '月计划上网电量',
year_plan_on_grid_power double comment '年计划上网电量',
year_study_generating_capacity double comment '年可研发电量',
year_study_utilization_hours double comment '年可研利用小时数'
)
partitioned by (ds string);

--关口表数据		
drop table if exists data_dev.DWD_GATEWAY_TABLE_DATA;			
create table if not exists data_dev.DWD_GATEWAY_TABLE_DATA										
(
station_name string comment '场站名称',
station_id string comment '场站ID',
report_time string comment '时间（年月日）',
main_positive_total_active_power double comment '关口表主表正向总有功',
main_positive_total_reactive_power double comment '关口表主表正向总无功',
main_reverse_total_active_power double comment '关口表主表反向总有功',
main_reverse_total_reactive_power double comment '关口表主表反向总无功',
Secondary_positive_total_active_power double comment '关口表副表正向总有功',
Secondary_positive_total_reactive_power  double comment '关口表副表正向总无功',
Secondary_reverse_total_active_power double comment '关口表副表反向总有功',
Secondary_reverse_total_reactive_power double comment '关口表副表反向总无功',
create_time date comment '记录生成时间'
)
partitioned by (ds string);

--倍率表数据				
drop table if exists data_dev.MAGNIFICATION_TABLE;	
create table if not exists data_dev.MAGNIFICATION_TABLE										
(
id int comment '自增主键',
station_id varchar(255) comment '场站ID',
tb_name double comment '表计名称',
magnification double comment '倍率',
state  double comment '主副表状态，1为主表，2为副表',
create_time date comment '记录生成时间'
)
partitioned by (ds string);


--光伏分区日指标数据缓存表 		
drop table if exists data_dev.DWD_PV_ARRAY_DAILY_DETAIL_CACHE_TABLE;			
create table if not exists data_dev.DWD_PV_ARRAY_DAILY_DETAIL_CACHE_TABLE										
(
station_id string comment '场站编号',
pv_array_on  string comment '光伏分区编号/名称',
station_name string comment '归属场站名称',
state_type int comment '当日光伏分区状态',
pv_array_production_date string comment '投产时间',
pv_array_capacity double comment '装机容量(kW)',
daily_active_energy double comment '日正向有功',
daily_reverse_active_energy double comment '日反向有功',
daily_generation double comment '日发电量(kWh)',
total_generation  double comment '累计发电量（kWh）',
daily_utilization_hours double comment '日等效利用小时（h）',
daily_fault_hours    double comment '故障发生小时',
daily_fault_times double comment '故障发生次数',
daily_power_loss double comment '日分区故障损失电量',
energy_change_efficiency double comment '逆变器转换效率',
dispersion_ratio double comment '组串离散率',
report_time string comment '日报时间',
create_time date comment '记录生成日期'
)
partitioned by (ds string);


--光伏分区手工录入日指标表 		
 		
drop table if exists data_dev.DWD_PV_ARRAY_MANUAL_ENTRY_DAILY_DETAIL		;			
create table if not exists data_dev.DWD_PV_ARRAY_MANUAL_ENTRY_DAILY_DETAIL												
(
station_id string comment '场站编号',
pv_array_on  string comment '光伏分区编号/名称',
station_name string comment '归属场站名称',
state_type int comment '当日光伏分区状态',
pv_array_production_date string comment '投产时间',
pv_array_capacity double comment '装机容量(kW)',
daily_active_energy double comment '日正向有功',
daily_reverse_active_energy double comment '日反向有功',
daily_generation double comment '日发电量(kWh)',
total_generation  double comment '累计发电量（kWh）',
daily_utilization_hours double comment '日等效利用小时（h）',
daily_fault_hours    double comment '故障发生小时',
daily_fault_times double comment '故障发生次数',
daily_power_loss double comment '日分区故障损失电量',
energy_change_efficiency double comment '逆变器转换效率',
dispersion_ratio double comment '组串离散率',
report_time string comment '日报时间',
create_time date comment '记录生成日期'
)
partitioned by (ds string);


--光伏分区周指标缓存数据表		 			
drop table if exists data_dev.DWD_PV_ARRAY_WEEKLY_DETAIL_CACHE_TABLE;			
create table if not exists data_dev.DWD_PV_ARRAY_WEEKLY_DETAIL_CACHE_TABLE														
(
station_id string comment '场站编号',
pv_array_on  string comment '光伏分区编号/名称',
station_name string comment '归属场站名称',
pv_array_production_date date comment '投产时间',
pv_array_capacity double comment '装机容量(kW)',
weekly_use_ratio double comment '本周可利用率(%)',
weekly_utilization_hours double comment '本周等效利用小时数(h)',
weekly_generation double comment '累计周发电量(kWh)',
weekly_fault_times  double comment '故障发生次数',
weekly_fault_hours double comment '故障发生小时',
weekly_power_loss    double comment '周故障损失电量（kWh）',
weekly_energy_change_efficiency double comment '本周逆变器转换效率',
weekly_dispersion_ratio double comment '本周组串离散率',
create_time date comment '创建时间',
year string comment '年',
week_no string comment '周数'
)
partitioned by (ds string);


--发电机组手工录入周指标表				 			
drop table if exists data_dev.DWD_PV_ARRAY_MANUAL_ENTRY_WEEK_DETAIL;			
create table if not exists data_dev.DWD_PV_ARRAY_MANUAL_ENTRY_WEEK_DETAIL																
(
station_id string comment '场站编号',
pv_array_on  string comment '光伏分区编号/名称',
station_name string comment '归属场站名称',
pv_array_production_date date comment '投产时间',
pv_array_capacity double comment '装机容量(kW)',
weekly_use_ratio double comment '本周可利用率(%)',
weekly_utilization_hours double comment '本周等效利用小时数(h)',
weekly_generation double comment '累计周发电量(kWh)',
weekly_fault_times  double comment '故障发生次数',
weekly_fault_hours double comment '故障发生小时',
weekly_power_loss    double comment '周故障损失电量（kWh）',
weekly_energy_change_efficiency double comment '本周逆变器转换效率',
weekly_dispersion_ratio double comment '本周组串离散率',
create_time date comment '创建时间',
year string comment '年',
week_no string comment '周数'
)
partitioned by (ds string);



--光伏分区月指标缓存数据表						 			
drop table if exists data_dev.DWD_PV_ARRAY_MONTH_DETAIL_CACHE_TABLE;			
create table if not exists data_dev.DWD_PV_ARRAY_MONTH_DETAIL_CACHE_TABLE																		
(
station_id string comment '场站编号',
pv_array_on  string comment '光伏分区编号/名称',
station_name string comment '归属场站名称',
pv_array_production_date date comment '投产时间',
pv_array_capacity double comment '装机容量(kW)',
mouth_utilization_hours double comment '本月等效利用小时数(h)',
mouth_use_ratio double comment '本月可利用率(%)',
mouth_total_generation double comment '累计月发电量(kWh)',
mouth_fault_times  double comment '月故障发生次数',
mouth_fault_hours double comment '月故障小时数',
mouth_energy_change_efficiency  double comment '本月逆变器转换效率',
mouth_dispersion_ratio double comment '本月离散率',
year string comment '年',
mouth_no string comment '周数',
create_time date comment '创建时间'
)
partitioned by (ds string);


--光伏分区月指标缓存数据表						 			
drop table if exists data_dev.DWD_PV_ARRAY_MANUAL_ENTRY_MONTH_DETAIL;			
create table if not exists data_dev.DWD_PV_ARRAY_MANUAL_ENTRY_MONTH_DETAIL																		
(
station_id string comment '场站编号',
pv_array_on  string comment '光伏分区编号/名称',
station_name string comment '归属场站名称',
pv_array_production_date date comment '投产时间',
pv_array_capacity double comment '装机容量(kW)',
mouth_utilization_hours double comment '本月等效利用小时数(h)',
mouth_use_ratio double comment '本月可利用率(%)',
mouth_total_generation double comment '累计月发电量(kWh)',
mouth_fault_times  double comment '月故障发生次数',
mouth_fault_hours double comment '月故障小时数',
mouth_energy_change_efficiency  double comment '本月逆变器转换效率',
mouth_dispersion_ratio double comment '本月离散率',
year string comment '年',
mouth_no string comment '周数',
create_time date comment '创建时间'
)
partitioned by (ds string);



--光伏集电线路与分区维度表								 			
drop table if exists data_dev.ODS_PV_ROUTE_ARRAY;			
create table if not exists data_dev.ODS_PV_ROUTE_ARRAY																		
(
station_id string comment '场站编号',
station_name string comment '归属场站名称',
route_id string comment '集电线编号',
pv_array_on string comment '光伏分区编号/名称',
station_type int comment '场站发电类型'
)
partitioned by (ds string);


--光伏集电线路日缓存表表								 			
drop table if exists data_dev.DWD_PV_FARM_DAILY_ROUTE;			
create table if not exists data_dev.DWD_PV_FARM_DAILY_ROUTE																		
(
station_id string comment '场站编号',
station_name string comment '归属场站名称',
route_id string comment '集电线编号',
daily_route_generation  string comment '集电线发电量',
production_date date comment '投产时间',
rated_capacity  string comment '总装机容量',
daily_utilization_hours string comment '日等效利用小时',
report_time string comment '日报时间',
create_time date comment '创建时间'
)
partitioned by (ds string);


--光伏场站日指标缓存数据表										 			
drop table if exists data_dev.DWD_PV_FARM_DAILY_DETAIL_CACHE_TABLE;			
create table if not exists data_dev.DWD_PV_FARM_DAILY_DETAIL_CACHE_TABLE																		
(
station_id string comment '场站编号',
station_name int comment '归属场站名称',
run_num int comment '正常运行子阵数量',
fault_num  int comment '故障子阵数量',
repair_num int comment '维修子阵数量',
standby_num  int comment '待机子阵数量',
operation_days int comment '并网发电运行天数(天)',
daily_generation double comment '日发电量',
daily_net_in_generation double comment '日上网电量',
daily_net_out_generation double comment '日下网电量（kW·h)',
total_station_use_generation double comment '综合场用电量（kW·h）',
daily_theory_generation  double comment '日理论发电量',
daily_total_radiation double comment '日累计辐射强度(MJ/㎡)',
daily_110KV_generation  double comment '主变高压侧110KV开关日发电量(kWh)',
daily_35KV_generation double comment '主变低压侧35KV开关日发电量(kWh)',
daily_utilization_hours double comment '日等效利用小时（h）',
daily_in_net_hours double comment '日在网时长（h）',
daily_sunshine_hours double comment '日照时数（h）',
daily_waive_light_generation double comment '弃光电量',
daily_waive_light_ratio  double comment '弃光率',
daily_power_loss double comment '日损失电量（kWh）',
daily_fault_ratio  double comment '日故障率（%）',
daily_energy_change_efficiency double comment '日逆变器转换效率（%）',
daily_dispersion_ratio double comment '日组串离散率',
pr_value double comment 'PR值（系统效率）',
power_factor double comment '功率因数',
daily_fault_times double comment '日故障次数',
daily_fault_hours  double comment '日故障小时数',
report_time string comment '日报时间',
create_time date comment '创建时间'
)
partitioned by (ds string);



--光伏场站手工录入日指标表 												 			
drop table if exists data_dev.DWD_MANUAL_ENTRY_PV_FARM_DAILY_DETAIL;			
create table if not exists data_dev.DWD_MANUAL_ENTRY_PV_FARM_DAILY_DETAIL																		
(
station_id string comment '场站编号',
station_name int comment '归属场站名称',
run_num int comment '正常运行子阵数量',
fault_num  int comment '故障子阵数量',
repair_num int comment '维修子阵数量',
standby_num  int comment '待机子阵数量',
operation_days int comment '并网发电运行天数(天)',
daily_generation double comment '日发电量',
daily_net_in_generation double comment '日上网电量',
daily_net_out_generation double comment '日下网电量（kW·h)',
total_station_use_generation double comment '综合场用电量（kW·h）',
daily_theory_generation  double comment '日理论发电量',
daily_total_radiation double comment '日累计辐射强度(MJ/㎡)',
daily_110KV_generation  double comment '主变高压侧110KV开关日发电量(kWh)',
daily_35KV_generation double comment '主变低压侧35KV开关日发电量(kWh)',
daily_utilization_hours double comment '日等效利用小时（h）',
daily_in_net_hours double comment '日在网时长（h）',
daily_sunshine_hours double comment '日照时数（h）',
daily_waive_light_generation double comment '弃光电量',
daily_waive_light_ratio  double comment '弃光率',
daily_power_loss double comment '日损失电量（kWh）',
daily_fault_ratio  double comment '日故障率（%）',
daily_energy_change_efficiency double comment '日逆变器转换效率（%）',
daily_dispersion_ratio double comment '日组串离散率',
pr_value double comment 'PR值（系统效率）',
power_factor double comment '功率因数',
daily_fault_times double comment '日故障次数',
daily_fault_hours  double comment '日故障小时数',
report_time string comment '日报时间',
create_time date comment '创建时间'
)
partitioned by (ds string);



--光伏场站周指标缓存数据表		 												 			
drop table if exists data_dev.DWD_PV_FARM_WEEKLY_DETAIL_CACHE_TABLE;			
create table if not exists data_dev.DWD_PV_FARM_WEEKLY_DETAIL_CACHE_TABLE																		
(
station_name string comment '场站名称',
station_id string comment '场站ID',
total_capacity double comment '总装机容量（kW）',
weekly_generation  double comment '周累计发电量(kWh)',
weekly_net_in_generation double comment '本周上网电量(kW·h)',
weekly_net_out_generation  double comment '本周下网电量(kW·h)',
weekly_total_station_use_generation double comment '本周综合场用电量(kW·h)',
weekly_theory_generation double comment '周理论发电量（kWh）',
weekly_total_radiation double comment '本周平均辐照度',
weekly_utilization_hours double comment '本周等效利用小时数(h)',
weekly_use_ratio double comment '本周可利用率（%）',
weekly_sunshine_hours  double comment '本周累计日照时数',
weekly_station_load_rate double comment '周场站负荷率',
weekly_station_load_rate_ratio  double comment '周负荷率环比',
weekly_power_loss double comment '周损失电量（kWh）',
weekly_fault_solve_ratio double comment '本周故障消缺率',
weekly_energy_change_efficiency double comment '本周逆变器转换效率',
weekly_dispersion_ratio double comment '本周组串离散率',
weekly_PR_value double comment '周场站的PR值',
weekly_fault_ratio  double comment '周设备故障率（%）',
weekly_fault_times int comment '周故障发生次数',
weekly_fault_hours  double comment '周故障小时数',
year string comment '年',
week_no string comment '周数',
create_time date comment '创建时间'
)
partitioned by (ds string);



--光伏场站手工录入周指标表 				 												 			
drop table if exists data_dev.DWD_MANUAL_ENTRY_PV_FARM_WEEKLY_DETAIL;			
create table if not exists data_dev.DWD_MANUAL_ENTRY_PV_FARM_WEEKLY_DETAIL																				
(
station_name string comment '场站名称',
station_id string comment '场站ID',
total_capacity double comment '总装机容量（kW）',
weekly_generation  double comment '周累计发电量(kWh)',
weekly_net_in_generation double comment '本周上网电量(kW·h)',
weekly_net_out_generation  double comment '本周下网电量(kW·h)',
weekly_total_station_use_generation double comment '本周综合场用电量(kW·h)',
weekly_theory_generation double comment '周理论发电量（kWh）',
weekly_total_radiation double comment '本周平均辐照度',
weekly_utilization_hours double comment '本周等效利用小时数(h)',
weekly_use_ratio double comment '本周可利用率（%）',
weekly_sunshine_hours  double comment '本周累计日照时数',
weekly_station_load_rate double comment '周场站负荷率',
weekly_station_load_rate_ratio  double comment '周负荷率环比',
weekly_power_loss double comment '周损失电量（kWh）',
weekly_fault_solve_ratio double comment '本周故障消缺率',
weekly_energy_change_efficiency double comment '本周逆变器转换效率',
weekly_dispersion_ratio double comment '本周组串离散率',
weekly_PR_value double comment '周场站的PR值',
weekly_fault_ratio  double comment '周设备故障率（%）',
weekly_fault_times int comment '周故障发生次数',
weekly_fault_hours  double comment '周故障小时数',
year string comment '年',
week_no string comment '周数',
create_time date comment '创建时间'
)
partitioned by (ds string);

--光伏场站手工录入周指标表 				 												 			
drop table if exists data_dev.DWD_MANUAL_ENTRY_PV_FARM_WEEKLY_DETAIL;			
create table if not exists data_dev.DWD_MANUAL_ENTRY_PV_FARM_WEEKLY_DETAIL																				
(
station_name string comment '场站名称',
station_id string comment '场站ID',
total_capacity double comment '总装机容量（kW）',
weekly_generation  double comment '周累计发电量(kWh)',
weekly_net_in_generation double comment '本周上网电量(kW·h)',
weekly_net_out_generation  double comment '本周下网电量(kW·h)',
weekly_total_station_use_generation double comment '本周综合场用电量(kW·h)',
weekly_theory_generation double comment '周理论发电量（kWh）',
weekly_total_radiation double comment '本周平均辐照度',
weekly_utilization_hours double comment '本周等效利用小时数(h)',
weekly_use_ratio double comment '本周可利用率（%）',
weekly_sunshine_hours  double comment '本周累计日照时数',
weekly_station_load_rate double comment '周场站负荷率',
weekly_station_load_rate_ratio  double comment '周负荷率环比',
weekly_power_loss double comment '周损失电量（kWh）',
weekly_fault_solve_ratio double comment '本周故障消缺率',
weekly_energy_change_efficiency double comment '本周逆变器转换效率',
weekly_dispersion_ratio double comment '本周组串离散率',
weekly_PR_value double comment '周场站的PR值',
weekly_fault_ratio  double comment '周设备故障率（%）',
weekly_fault_times int comment '周故障发生次数',
weekly_fault_hours  double comment '周故障小时数',
year string comment '年',
week_no string comment '周数',
create_time date comment '创建时间'
)
partitioned by (ds string);


--光伏场站月指标缓存数据表		 				 												 			
drop table if exists data_dev.DWD_PV_FARM_MONTH_DETAIL_CACHE_TABLE;			
create table if not exists data_dev.DWD_PV_FARM_MONTH_DETAIL_CACHE_TABLE																						
(
station_name string comment '场站名称',
station_id string comment '场站ID',
total_capacity double comment '总装机容量（kW）',
mouth_generation  double comment '本月发电量（万kw·h）',
mouth_sell_generation double comment '本月销售电量(kW·h)',
mouth_net_in_generation  double comment '本月上网电量(kW·h)',
mouth_net_out_generation double comment '本月下网电量(kW·h)',
mouth_total_station_use_generation double comment '本月综合场用电量(kW·h)',
mouth_theory_generation double comment '月理论电量',
mouth_total_radiation double comment '本月平均辐照度',
mouth_utilization_hours double comment '本月等效利用小时数(h)',
mouth_use_ratio  double comment '本月可利用率（%）',
mouth_sunshine_hours double comment '本月累计日照时数',
mouth_power_loss  double comment '月损失电量（kWh）',
mouth_fault_solve_ratio double comment '本月故障消缺率',
mouth_fault_solve_number double comment '本月故障消缺数量',
mouth_energy_change_efficiency double comment '本月逆变器转换效率',
mouth_dispersion_ratio double comment '本月组串离散率',
mouth_fault_times double comment '月设备故障次数',
mouth_fault_rate  double comment '本月故障率',
mouth_fault_hours double comment '月故障发生次数',
mouth_station_send_loss  double comment '场站内的送出线损',
year string comment '年份',
month_no string comment '月份',
create_time date comment '创建时间'
)
partitioned by (ds string);



--光伏场站手工录入月指标表				 				 												 			
drop table if exists data_dev.DWD_MANUAL_ENTRY_PV_FARM_MONTH_DETAIL		;			
create table if not exists data_dev.DWD_MANUAL_ENTRY_PV_FARM_MONTH_DETAIL																								
(
station_name string comment '场站名称',
station_id string comment '场站ID',
total_capacity double comment '总装机容量（kW）',
mouth_generation  double comment '本月发电量（万kw·h）',
mouth_sell_generation double comment '本月销售电量(kW·h)',
mouth_net_in_generation  double comment '本月上网电量(kW·h)',
mouth_net_out_generation double comment '本月下网电量(kW·h)',
mouth_total_station_use_generation double comment '本月综合场用电量(kW·h)',
mouth_theory_generation double comment '月理论电量',
mouth_total_radiation double comment '本月平均辐照度',
mouth_utilization_hours double comment '本月等效利用小时数(h)',
mouth_use_ratio  double comment '本月可利用率（%）',
mouth_sunshine_hours double comment '本月累计日照时数',
mouth_power_loss  double comment '月损失电量（kWh）',
mouth_fault_solve_ratio double comment '本月故障消缺率',
mouth_fault_solve_number double comment '本月故障消缺数量',
mouth_energy_change_efficiency double comment '本月逆变器转换效率',
mouth_dispersion_ratio double comment '本月组串离散率',
mouth_fault_times double comment '月设备故障次数',
mouth_fault_rate  double comment '本月故障率',
mouth_fault_hours double comment '月故障发生次数',
mouth_station_send_loss  double comment '场站内的送出线损',
year string comment '年份',
month_no string comment '月份',
create_time date comment '创建时间'
)
partitioned by (ds string);


--故障信息表										 			
drop table if exists data_dev.ods_stand_report_miss_electric;			
create table if not exists data_dev.ods_stand_report_miss_electric																				
(
plate varchar(255) comment '板块',
company_name varchar(255) comment '公司名称',
station_name varchar(255) comment '场站名',
machine_num  varchar(255) comment '机组号',
start_time date comment '开始时间',
end_time  date comment '结束时间',
stop_duration varchar(255) comment '停机时长',
loss_electric varchar(255) comment '损失电量',
reason_division varchar(255) comment '原因划分',
fault_type  varchar(255) comment '故障类型',
machine_status varchar(255) comment '机组状态',
again_fault varchar(255) comment '是否重复故障',
detail varchar(255) comment '简略原因'
)
partitioned by (ds string);


-- drop table if exists data_dev.test;
-- create table if not exists data_dev.test
-- (
--   station_name string comment '场站名称',
--   station_id string comment '场站ID',
--   year string comment '年',
--   month_no string comment '月份',
--   month_power_generation double comment '月发电量',
--   month_sales_volume double comment '月销售电量',
--   month_gateway_electricity double comment '月关口电量',
--   month_power_purchase double comment '月购网电量',
--   month_compre_field_power_consumpte double comment '月综合场用电量',
--   month_utilization_hours double comment '月可利用小时数',
--   month_effective_wind_hours double comment '有效风时数(h)',
--   month_failures_hours double comment '月故障小时数',
--   month_num_of_failures double comment '月场站故障次数',
--   month_fault_elimination_rate double comment '场站故障消缺率',
--   month_station_failure_rate double comment '场站设备故障率',
--   month_equipment_availability double comment '设备可利用率',
--   month_power_curve_compliance double comment '功率曲线达标度',
--   month_power_loss double comment '月损失电量',
--   create_time date comment '记录生成周期'
-- )
-- partitioned by (ds string)

-- use default
-- select * from testexchangis
-- 删除表
-- drop table if exists data_dev.dwd_manual_entry_wind_weekly_detail
-- 修改表名
-- alter table data_dev.dwd_wind_farm_daily_cache_table rename to data_dev.dwd_wind_farm_daily_detail_cache_table
-- 修改字段名
-- alter table data_dev.ods_wind_power_detail change message_info_to_aloat message_info_to_float double comment '实时数据值'
