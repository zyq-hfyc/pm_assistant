create database pm_assistant;
show databases;
use pm_assistant;
show tables;COMMENT

-- -------------------------------------- 角色表 ------------------------------------------
DROP TABLE IF EXISTS role_info;
CREATE TABLE role_info(
role_id INT NOT NULL PRIMARY KEY auto_increment COMMENT '角色Id',
role_name VARCHAR(38) NOT NULL COMMENT '角色名称',
role_desc VARCHAR(64) NOT NULL  COMMENT '角色描述',
create_by VARCHAR(100) NOT NULL DEFAULT 'system_init' COMMENT '创建人',
create_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间', 
upDATE_by VARCHAR(100) NOT NULL DEFAULT 'system_init' COMMENT '修改人',
upDATE_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
data_status VARCHAR(1) NOT NULL DEFAULT '1' COMMENT '状态（0 无效 ， 1 有效）'
) COMMENT='角色表' ENGINE=INNODB DEFAULT CHARSET=utf8;

-- -------------------------------------- 用户信息表 ------------------------------------------
DROP TABLE IF EXISTS user_info;
CREATE TABLE user_info(
user_id INT NOT NULL PRIMARY KEY auto_increment COMMENT '主键',
user_name VARCHAR(38) NOT NULL COMMENT '用户名',
role_id INT NOT NULL COMMENT '用户角色',
mobile_phone VARCHAR(11) NOT NULL  COMMENT '手机号',
telephone_num VARCHAR(13) COMMENT '固定电话号码',
mail VARCHAR(50) COMMENT '邮箱',
create_by VARCHAR(100) NOT NULL DEFAULT 'system_init' COMMENT '创建人',
create_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间', 
upDATE_by VARCHAR(100) NOT NULL DEFAULT 'system_init' COMMENT '修改人',
upDATE_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
data_status VARCHAR(1) NOT NULL DEFAULT '1' COMMENT '状态（0 无效 ， 1 有效）',
FOREIGN KEY(role_id) REFERENCES role_info(role_id)
) COMMENT='用户信息表' ENGINE=INNODB DEFAULT CHARSET=utf8;


-- -------------------------------------- 项目信息表 ------------------------------------------
DROP TABLE IF EXISTS project_info;
CREATE TABLE project_info(
project_id INT NOT NULL PRIMARY KEY auto_increment COMMENT '项目ID（主键）',
project_name VARCHAR(38) NOT NULL COMMENT '项目名称',
bussiness_manager INT NOT NULL COMMENT '项目BM',
product_manager INT NOT NULL  COMMENT '产品经理',
ops INT COMMENT '运维',
create_by VARCHAR(100) NOT NULL DEFAULT 'system_init' COMMENT '创建人',
create_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间', 
upDATE_by VARCHAR(100) NOT NULL DEFAULT 'system_init' COMMENT '修改人',
upDATE_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
data_status VARCHAR(1) NOT NULL DEFAULT '1' COMMENT '状态（0 无效 ， 1 有效）',
FOREIGN KEY(bussiness_manager) REFERENCES user_info(user_id),
FOREIGN KEY(product_manager) REFERENCES user_info(user_id),
FOREIGN KEY(ops) REFERENCES user_info(user_id)
) COMMENT='银行信息表' ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------- 创建待跟踪需求表-------------------------------------------------------
DROP TABLE IF EXISTS backlog_info;
CREATE TABLE backlog_info(
backlog_id INT NOT NULL PRIMARY KEY auto_increment COMMENT '待跟踪需求Id',
project_id INT NOT NULL COMMENT '项目ID（主键）',
demand_desc VARCHAR(256) NOT NULL COMMENT '需求描述',
status INT NOT NULL  COMMENT '需求的状态 0：待评估工作量  1：工作量确认中   2：待排期  3：排期完成   4：开发中  5：自测联调中  6：测试中   7：待上线   8：已上线   9：暂停',
product_manager INT NOT NULL  COMMENT '产品经理(user_info的主键)',
demand_review_DATE DATE NOT NULL COMMENT '需求评审日期',
jira_code VARCHAR(32) NOT NULL COMMENT 'jira编号',
backlog_owner  INT NOT NULL COMMENT '跟踪人(user_info的主键)',
create_by VARCHAR(100) NOT NULL DEFAULT 'system_init' COMMENT '创建人',
create_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间', 
upDATE_by VARCHAR(100) NOT NULL DEFAULT 'system_init' COMMENT '修改人',
upDATE_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
data_status VARCHAR(1) NOT NULL DEFAULT '1' COMMENT '状态（0 无效 ， 1 有效）',
FOREIGN KEY(product_manager) REFERENCES user_info(user_id),
FOREIGN KEY(backlog_owner) REFERENCES user_info(user_id),
FOREIGN KEY(project_id) REFERENCES project_info(project_id)
) COMMENT='待跟踪需求信息表' ENGINE=INNODB DEFAULT CHARSET=utf8;


-- ----------------------------- 创建workpackages_info-------------------------------------------------------
DROP TABLE IF EXISTS workpackages_info;
CREATE TABLE workpackages_info(
workpackages_id INT NOT NULL PRIMARY KEY auto_increment COMMENT '工作包信息表主键',
backlog_id INT NOT NULL COMMENT '待跟踪需求Id',
workload_pd INT NOT NULL  COMMENT '工作量（人/天）',
dev_review INT NOT NULL  COMMENT '研发侧复核人(user_info的主键)',
bm_review INT NOT NULL COMMENT '业务侧复核人',
planned_front_dev INT COMMENT '计划投入前端(user_info的主键)',
planned_java_dev  INT COMMENT '计划投入后端(user_info的主键)',
planned_test	  INT COMMENT '计划投入测试(user_info的主键)',
jira_code VARCHAR(56) COMMENT 'jira链接编码',
product_manager INT COMMENT '产品经理(user_info的主键)',
create_by VARCHAR(100) NOT NULL DEFAULT 'system_init' COMMENT '创建人',
create_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间', 
upDATE_by VARCHAR(100) NOT NULL DEFAULT 'system_init' COMMENT '修改人',
upDATE_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
data_status VARCHAR(1) NOT NULL DEFAULT '1' COMMENT '状态（0 无效 ， 1 有效）',
FOREIGN KEY(backlog_id) REFERENCES backlog_info(backlog_id),
FOREIGN KEY(dev_review) REFERENCES user_info(user_id),
FOREIGN KEY(bm_review) REFERENCES user_info(user_id),
FOREIGN KEY(planned_front_dev) REFERENCES user_info(user_id),
FOREIGN KEY(planned_java_dev) REFERENCES user_info(user_id),
FOREIGN KEY(planned_test) REFERENCES user_info(user_id),
FOREIGN KEY(product_manager) REFERENCES user_info(user_id)
) COMMENT='工作包信息表' ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------- 创建project_plan_info-------------------------------------------------------
DROP TABLE IF EXISTS project_plan_info;
CREATE TABLE project_plan_info(
project_plan_id INT NOT NULL PRIMARY KEY auto_increment COMMENT '主键',
workpackages_id INT NOT NULL COMMENT '工作包信息表主键',
demand_detail_info VARCHAR(128) NOT NULL COMMENT '详细功能描述',
start_DATE DATE NOT NULL COMMENT '开始时间',
end_DATE DATE NOT NULL COMMENT '开始时间',
workload_pd INT NOT NULL  COMMENT '工作量（人/天）',
is_plan_content INT NOT NULL DEFAULT 1 COMMENT '是否是计划工作内容(0：否  1：是)',
dev_id INT NOT NULL  COMMENT '开发人员(user_info的主键)',
test_id INT NOT NULL COMMENT '测试人员(user_info的主键)',
project_manager INT COMMENT '项目经理(user_info的主键)',
create_by VARCHAR(100) NOT NULL DEFAULT 'system_init' COMMENT '创建人',
create_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间', 
upDATE_by VARCHAR(100) NOT NULL DEFAULT 'system_init' COMMENT '修改人',
upDATE_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
data_status VARCHAR(1) NOT NULL DEFAULT '1' COMMENT '状态（0 无效 ， 1 有效）',
FOREIGN KEY(workpackages_id) REFERENCES workpackages_info(workpackages_id),
FOREIGN KEY(dev_id) REFERENCES user_info(user_id),
FOREIGN KEY(test_id) REFERENCES user_info(user_id),
FOREIGN KEY(project_manager) REFERENCES user_info(user_id)
) COMMENT='项目计划信息表' ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------- 创建 milestone_info -------------------------------------------------------
DROP TABLE IF EXISTS milestone_info;
CREATE TABLE milestone_info(
milestone_id INT NOT NULL PRIMARY KEY auto_increment COMMENT '里程碑id',
project_plan_id INT NOT NULL COMMENT 'project_plan_info 的主键',
dev_self_test_start DATE NOT NULL COMMENT '开发自测开始时间',
dev_self_test_end DATE NOT NULL COMMENT '开发自测结束时间',
modules_test_start DATE NOT NULL COMMENT '模块测试开始时间',
modules_test_end DATE NOT NULL COMMENT '模块测试结束时间',
sit_test_start DATE NOT NULL COMMENT 'SIT测试开始时间',
sit_test_end DATE NOT NULL COMMENT 'SIT测试结束时间',
uat_test_start DATE NOT NULL COMMENT 'UAT测试开始时间',
uat_test_end DATE NOT NULL COMMENT 'UAT测试结束时间',
back_release_DATE DATE NOT NULL COMMENT '后端发版时间',
front_release_DATE DATE NOT NULL COMMENT '前端发版时间',
create_by VARCHAR(100) NOT NULL DEFAULT 'system_init' COMMENT '创建人',
create_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间', 
upDATE_by VARCHAR(100) NOT NULL DEFAULT 'system_init' COMMENT '修改人',
upDATE_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
data_status VARCHAR(1) NOT NULL DEFAULT '1' COMMENT '状态（0 无效 ， 1 有效）',
FOREIGN KEY(project_plan_id) REFERENCES project_plan_info(project_plan_id)
) COMMENT='项目里程碑信息表' ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------- 创建 daily_record_info -------------------------------------------------------
DROP TABLE IF EXISTS daily_record_info;
CREATE TABLE daily_record_info(
daily_record_id INT NOT NULL PRIMARY KEY auto_increment COMMENT '主键',
user_id INT NOT NULL COMMENT '用户id(user_info主键)',
record_month VARCHAR(4) NOT NULL COMMENT '月份(示例：201909)',
record_DATE VARCHAR(8) NOT NULL COMMENT '记录日期(示例：20190901)',
planned_content  INT NOT NULL COMMENT '计划完成内容 project_plan_id(项目计划信息表)',
actual_content INT NOT NULL COMMENT '实际完成内容 project_plan_id(项目计划信息表)',
is_finish INT NOT NULL DEFAULT 1 COMMENT '是否完成(0：未完成  1：完成)',
postpone_cause VARCHAR(96)  COMMENT '延期原因',
is_planned_content INT NOT NULL DEFAULT 0 COMMENT '是否是计划内的工作(0：否 1：是)',
create_by VARCHAR(100) NOT NULL DEFAULT 'system_init' COMMENT '创建人',
create_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间', 
upDATE_by VARCHAR(100) NOT NULL DEFAULT 'system_init' COMMENT '修改人',
upDATE_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
data_status VARCHAR(1) NOT NULL DEFAULT '1' COMMENT '状态（0 无效 ， 1 有效）',
FOREIGN KEY(user_id) REFERENCES user_info(user_id),
FOREIGN KEY(planned_content) REFERENCES project_plan_info(project_plan_id),
FOREIGN KEY(actual_content) REFERENCES project_plan_info(project_plan_id)
) COMMENT='日报记录信息表' ENGINE=INNODB DEFAULT CHARSET=utf8;

-- ----------------------------- 创建 attendance_info -------------------------------------------------------
DROP TABLE IF EXISTS attendance_info;
CREATE TABLE attendance_info(
attendance_id INT NOT NULL PRIMARY KEY auto_increment COMMENT '主键',
user_id INT NOT NULL COMMENT '用户id(user_info主键)',
attendance_type INT NOT NULL COMMENT '考勤类型(0：加班  1：调休 2：年假  3：病假 4：事假  5：婚假  6：丧假)',
attendance_hours float(5,1) NOT NULL COMMENT '考勤工时(小时为单位，精确到1位小数)',
record_DATE DATE  NOT NULL COMMENT '记录日期',
start_time DATETIME NOT NULL COMMENT '开始时间',
end_time DATETIME NOT NULL COMMENT '结束时间',
remark VARCHAR(256) COMMENT '备注',
create_by VARCHAR(100) NOT NULL DEFAULT 'system_init' COMMENT '创建人',
create_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间', 
upDATE_by VARCHAR(100) NOT NULL DEFAULT 'system_init' COMMENT '修改人',
upDATE_DATE DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
data_status VARCHAR(1) NOT NULL DEFAULT '1' COMMENT '状态（0 无效 ， 1 有效）',
FOREIGN KEY(user_id) REFERENCES user_info(user_id)
) COMMENT='考勤记录信息表' ENGINE=INNODB DEFAULT CHARSET=utf8;