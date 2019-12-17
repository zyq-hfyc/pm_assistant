create database pm_assistant;
show databases;
use pm_assistant;
show tables;

-- -------------------------------------- 角色表 ------------------------------------------
-- drop table role_info;
create table role_info(
role_id int not null primary key auto_increment comment '角色Id',
role_name varchar(38) not null comment '角色名称',
role_desc varchar(64) not null  comment '角色描述',
create_by varchar(100) not null default 'system_init' comment '创建人',
create_date datetime not null default current_timestamp comment '创建时间', 
update_by varchar(100) not null default 'system_init' comment '修改人',
update_date datetime not null default current_timestamp comment '修改时间',
data_status varchar(1) not null default '1' comment '状态（0 无效 ， 1 有效）'
) comment='角色表' ENGINE=INNODB DEFAULT CHARSET=utf8;

-- -------------------------------------- 用户信息表 ------------------------------------------

-- drop table user_info;
create table user_info(
user_id int not null primary key auto_increment comment '主键',
user_name varchar(38) not null comment '用户名',
role_id int not null comment '用户角色',
mobile_phone varchar(11) not null  comment '手机号',
telephone_num varchar(13) comment '固定电话号码',
mail varchar(50) comment '邮箱',
create_by varchar(100) not null default 'system_init' comment '创建人',
create_date datetime not null default current_timestamp comment '创建时间', 
update_by varchar(100) not null default 'system_init' comment '修改人',
update_date datetime not null default current_timestamp comment '修改时间',
data_status varchar(1) not null default '1' comment '状态（0 无效 ， 1 有效）',
foreign key(role_id) references role_info(role_id)
) comment='用户信息表' ENGINE=INNODB DEFAULT CHARSET=utf8;


-- -------------------------------------- 项目信息表 ------------------------------------------
-- drop table project_info;
create table project_info(
project_id int not null primary key auto_increment comment '项目ID（主键）',
project_name varchar(38) not null comment '项目名称',
bussiness_manager int not null comment '项目BM',
product_manager int not null  comment '产品经理',
ops int comment '运维',
create_by varchar(100) not null default 'system_init' comment '创建人',
create_date datetime not null default current_timestamp comment '创建时间', 
update_by varchar(100) not null default 'system_init' comment '修改人',
update_date datetime not null default current_timestamp comment '修改时间',
data_status varchar(1) not null default '1' comment '状态（0 无效 ， 1 有效）',
foreign key(bussiness_manager) references user_info(user_id),
foreign key(product_manager) references user_info(user_id),
foreign key(ops) references user_info(user_id)
) comment='银行信息表' ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------- 创建待跟踪需求表-------------------------------------------------------
-- drop table backlog_info;
create table backlog_info(
backlog_id int not null primary key auto_increment comment '待跟踪需求Id',
project_id int not null comment '项目ID（主键）',
demand_desc varchar(256) not null comment '需求描述',
status int not null  comment '需求的状态 0：待评估工作量  1：工作量确认中   2：待排期  3：排期完成   4：开发中  5：自测联调中  6：测试中   7：待上线   8：已上线   9：暂停',
product_manager int not null  comment '产品经理(user_info的主键)',
demand_review_date date not null comment '需求评审日期',
jira_code varchar(32) not null comment 'jira编号',
backlog_owner  int not null comment '跟踪人(user_info的主键)',
create_by varchar(100) not null default 'system_init' comment '创建人',
create_date datetime not null default current_timestamp comment '创建时间', 
update_by varchar(100) not null default 'system_init' comment '修改人',
update_date datetime not null default current_timestamp comment '修改时间',
data_status varchar(1) not null default '1' comment '状态（0 无效 ， 1 有效）',
foreign key(product_manager) references user_info(user_id),
foreign key(backlog_owner) references user_info(user_id),
foreign key(project_id) references project_info(project_id)
) comment='待跟踪需求信息表' ENGINE=INNODB DEFAULT CHARSET=utf8;


-- ----------------------------- 创建workpackages_info-------------------------------------------------------
-- drop table workpackages_info;
create table workpackages_info(
workpackages_id int not null primary key auto_increment comment '工作包信息表主键',
backlog_id int not null comment '待跟踪需求Id',
workload_pd int not null  comment '工作量（人/天）',
dev_review int not null  comment '研发侧复核人(user_info的主键)',
bm_review int not null comment '业务侧复核人',
planned_front_dev int comment '计划投入前端(user_info的主键)',
planned_java_dev  int comment '计划投入后端(user_info的主键)',
planned_test	  int comment '计划投入测试(user_info的主键)',
jira_code varchar(56) comment 'jira链接编码',
product_manager int comment '产品经理(user_info的主键)',
create_by varchar(100) not null default 'system_init' comment '创建人',
create_date datetime not null default current_timestamp comment '创建时间', 
update_by varchar(100) not null default 'system_init' comment '修改人',
update_date datetime not null default current_timestamp comment '修改时间',
data_status varchar(1) not null default '1' comment '状态（0 无效 ， 1 有效）',
foreign key(backlog_id) references backlog_info(backlog_id),
foreign key(dev_review) references user_info(user_id),
foreign key(bm_review) references user_info(user_id),
foreign key(planned_front_dev) references user_info(user_id),
foreign key(planned_java_dev) references user_info(user_id),
foreign key(planned_test) references user_info(user_id),
foreign key(product_manager) references user_info(user_id)
) comment='工作包信息表' ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------- 创建project_plan_info-------------------------------------------------------
-- drop table project_plan_info;
create table project_plan_info(
project_plan_id int not null primary key auto_increment comment '主键',
workpackages_id int not null comment '工作包信息表主键',
demand_detail_info varchar(128) not null comment '详细功能描述',
start_date date not null comment '开始时间',
end_date date not null comment '开始时间',
workload_pd int not null  comment '工作量（人/天）',
is_plan_content int not null default 1 comment '是否是计划工作内容(0：否  1：是)',
dev_id int not null  comment '开发人员(user_info的主键)',
test_id int not null comment '测试人员(user_info的主键)',
project_manager int comment '项目经理(user_info的主键)',
create_by varchar(100) not null default 'system_init' comment '创建人',
create_date datetime not null default current_timestamp comment '创建时间', 
update_by varchar(100) not null default 'system_init' comment '修改人',
update_date datetime not null default current_timestamp comment '修改时间',
data_status varchar(1) not null default '1' comment '状态（0 无效 ， 1 有效）',
foreign key(workpackages_id) references workpackages_info(workpackages_id),
foreign key(dev_id) references user_info(user_id),
foreign key(test_id) references user_info(user_id),
foreign key(project_manager) references user_info(user_id)
) comment='项目计划信息表' ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------- 创建 milestone_info -------------------------------------------------------
-- drop table milestone_info;
create table milestone_info(
milestone_id int not null primary key auto_increment comment '里程碑id',
project_plan_id int not null comment 'project_plan_info 的主键',
dev_self_test_start date not null comment '开发自测开始时间',
dev_self_test_end date not null comment '开发自测结束时间',
modules_test_start date not null comment '模块测试开始时间',
modules_test_end date not null comment '模块测试结束时间',
sit_test_start date not null comment 'SIT测试开始时间',
sit_test_end date not null comment 'SIT测试结束时间',
uat_test_start date not null comment 'UAT测试开始时间',
uat_test_end date not null comment 'UAT测试结束时间',
back_release_date date not null comment '后端发版时间',
front_release_date date not null comment '前端发版时间',
create_by varchar(100) not null default 'system_init' comment '创建人',
create_date datetime not null default current_timestamp comment '创建时间', 
update_by varchar(100) not null default 'system_init' comment '修改人',
update_date datetime not null default current_timestamp comment '修改时间',
data_status varchar(1) not null default '1' comment '状态（0 无效 ， 1 有效）',
foreign key(project_plan_id) references project_plan_info(project_plan_id)
) comment='项目里程碑信息表' ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------- 创建 daily_record_info -------------------------------------------------------
-- drop table daily_record_info;
create table daily_record_info(
daily_record_id int not null primary key auto_increment comment '主键',
user_id int not null comment '用户id(user_info主键)',
record_month varchar(4) not null comment '月份(示例：201909)',
record_date varchar(8) not null comment '记录日期(示例：20190901)',
planned_content  int not null comment '计划完成内容 project_plan_id(项目计划信息表)',
actual_content int not null comment '实际完成内容 project_plan_id(项目计划信息表)',
is_finish int not null default 1 comment '是否完成(0：未完成  1：完成)',
postpone_cause varchar(96)  comment '延期原因',
is_planned_content int not null default 0 comment '是否是计划内的工作(0：否 1：是)',
create_by varchar(100) not null default 'system_init' comment '创建人',
create_date datetime not null default current_timestamp comment '创建时间', 
update_by varchar(100) not null default 'system_init' comment '修改人',
update_date datetime not null default current_timestamp comment '修改时间',
data_status varchar(1) not null default '1' comment '状态（0 无效 ， 1 有效）',
foreign key(user_id) references user_info(user_id),
foreign key(planned_content) references project_plan_info(project_plan_id),
foreign key(actual_content) references project_plan_info(project_plan_id)
) comment='日报记录信息表' ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------- 创建 attendance_info -------------------------------------------------------
-- drop table attendance_info;
create table attendance_info(
attendance_id int not null primary key auto_increment comment '主键',
user_id int not null comment '用户id(user_info主键)',
attendance_type int not null comment '考勤类型(0：加班  1：调休 2：年假  3：病假 4：事假  5：婚假  6：丧假)',
attendance_hours float(5,1) not null comment '考勤工时(小时为单位，精确到1位小数)',
record_date date  not null comment '记录日期',
start_time DateTime not null comment '开始时间',
end_time DateTime not null comment '结束时间',
remark varchar(256) comment '备注',
create_by varchar(100) not null default 'system_init' comment '创建人',
create_date datetime not null default current_timestamp comment '创建时间', 
update_by varchar(100) not null default 'system_init' comment '修改人',
update_date datetime not null default current_timestamp comment '修改时间',
data_status varchar(1) not null default '1' comment '状态（0 无效 ， 1 有效）',
foreign key(user_id) references user_info(user_id)
) comment='考勤记录信息表' ENGINE=INNODB DEFAULT CHARSET=utf8;