-- ------------------------ 初始化角色表 --------------------------------------------------------
--  select * from role_info;
insert into role_info(role_id,role_name,role_desc)values(1,'后端技术经理','后端的技术经理'); -- 1
insert into role_info(role_id,role_name,role_desc)values(2,'前端技术经理','前端的技术经理'); -- 2
insert into role_info(role_id,role_name,role_desc)values(3,'项目经理','项目经理'); -- 3
insert into role_info(role_id,role_name,role_desc)values(4,'项目总监','项目总监'); -- 4
insert into role_info(role_id,role_name,role_desc)values(5,'测试经理','测试经理'); -- 5
insert into role_info(role_id,role_name,role_desc)values(6,'运维经理','运维经理'); -- 6
insert into role_info(role_id,role_name,role_desc)values(7,'测试','测试'); -- 7
insert into role_info(role_id,role_name,role_desc)values(8,'运维','运维'); -- 8
insert into role_info(role_id,role_name,role_desc)values(9,'产品经理','产品经理'); -- 9
insert into role_info(role_id,role_name,role_desc)values(10,'BM','BM'); -- 10
insert into role_info(role_id,role_name,role_desc)values(11,'后端开发','java后端开发'); -- 11
insert into role_info(role_id,role_name,role_desc)values(12,'IOS开发','IOS开发'); -- 12
insert into role_info(role_id,role_name,role_desc)values(13,'安卓开发','安卓开发'); -- 13
insert into role_info(role_id,role_name,role_desc)values(14,'H5开发','H5开发'); -- 14
insert into role_info(role_id,role_name,role_desc)values(15,'SA','系统分析师'); -- 15
insert into role_info(role_id,role_name,role_desc)values(16,'架构师','架构师'); -- 16
-- ------------------------ 初始化人员表 --------------------------------------------------------
SELECT 
    ui.user_name, ui.mobile_phone, ri.role_name
FROM
    user_info ui,
    role_info ri
WHERE
    ui.role_id = ri.role_id;
    
insert into user_info(user_id,user_name,role_id,mobile_phone)values(1,'石先江',1,'15019215020');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(2,'游若鱼',3,'18520892589');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(3,'张振兴',2,'18902837203');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(4,'皇甫永超',3,'18688994926');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(5,'陈小东',4,'18129961963');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(6,'庄小雨',5,'13631628397');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(7,'吴伦清',15,'13826519531');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(8,'覃丽春',11,'18565855696');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(9,'张昊',11,'18594281078');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(10,'徐传川',11,'15811837723');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(11,'郭孟飞',11,'13028816615');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(12,'郑伟凯',11,'13682519413');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(13,'徐晓鸣',11,'17600297244');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(14,'陈强',11,'15118142857');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(15,'林敏',13,'18879080822');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(16,'孙嘉乐',12,'15889775945');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(17,'袁子奕',14,'13570575874');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(18,'沈小恒',14,'13652253340');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(19,'桂宁',7,'18123631961');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(20,'邓巧巧',7,'15889521501');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(21,'李文斌',7,'18720073591');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(22,'沈杰',9,'13601867345');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(23,'郭东',9,'18621814728');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(24,'孙佳',9,'13636441352');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(26,'陈涛',9,'13537595828');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(27,'程鹏远',10,'13311381925');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(28,'邵天琦',10,'13942176088');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(29,'翟颖',10,'15018493337');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(30,'潘磊',10,'13564722467');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(31,'瞿亚玲',10,'18583959227');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(32,'郑平',10,'18121380856');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(33,'雷春',10,'18018641869');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(34,'邹亮',8,'13925222655');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(35,'张志平',8,'13751058453');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(36,'雷树朝',8,'18565884568');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(37,'陈敏',8,'15986818096');
insert into user_info(user_id,user_name,role_id,mobile_phone)values(38,'朱洲',8,'18025332327');

-- ------------------------------ 初始化项目信息 --------------------------------------------------
SELECT 
    p.project_name 项目名称,
    u1.user_name BM,
    u2.user_name 产品经理,
    u3.user_name 运维
FROM
    project_info p,
    user_info u1,
    user_info u2,
    user_info u3
WHERE
    p.bussiness_manager = u1.user_id
        AND p.product_manager = u2.user_id
        AND p.ops = u3.user_id;

insert into project_info(project_id,project_name,bussiness_manager,product_manager ,ops)values(1,'新安银行',33,24,35);
insert into project_info(project_id,project_name,bussiness_manager,product_manager ,ops)values(2,'平顶山银行',28,24,37);
insert into project_info(project_id,project_name,bussiness_manager,product_manager ,ops)values(3,'黑龙江省联社',27,23,34);
insert into project_info(project_id,project_name,bussiness_manager,product_manager ,ops)values(4,'鞍山银行',27,22,37);
insert into project_info(project_id,project_name,bussiness_manager,product_manager ,ops)values(5,'福州农商行',32,23,38);
insert into project_info(project_id,project_name,bussiness_manager,product_manager ,ops)values(6,'赣州银行',29,24,35);
insert into project_info(project_id,project_name,bussiness_manager,product_manager ,ops)values(7,'桂林银行',32,23,37);
insert into project_info(project_id,project_name,bussiness_manager,product_manager ,ops)values(8,'济宁银行',27,23,34);
insert into project_info(project_id,project_name,bussiness_manager,product_manager ,ops)values(9,'江阴银行',28,24,36);
insert into project_info(project_id,project_name,bussiness_manager,product_manager ,ops)values(10,'紫金银行',33,23,38);
insert into project_info(project_id,project_name,bussiness_manager,product_manager ,ops)values(11,'紫金银行',29,26,37);
insert into project_info(project_id,project_name,bussiness_manager,product_manager ,ops)values(12,'自贡银行',31,24,35);
insert into project_info(project_id,project_name,bussiness_manager,product_manager ,ops)values(13,'佛山银行',28,26,36);

-- ------------------------------------------------------------------------------------------------
-- 插入考勤数据
insert into attendance_info(user_id,attendance_type,attendance_hours,record_date,start_time,end_time,remark)values(17,1,0.5,DATE('2019-09-26'),'2019-09-26 09:00:00','2019-09-26 09:30:00','调休');
insert into attendance_info(user_id,attendance_type,attendance_hours,record_date,start_time,end_time,remark)values(9,1,3,DATE('2019-09-20'),'2019-09-20 09:00:00','2019-09-20 12:00:00','调休');
insert into attendance_info(user_id,attendance_type,attendance_hours,record_date,start_time,end_time,remark)values(9,1,0.5,DATE('2019-09-17'),'2019-09-17 09:00:00','2019-09-17 09:30:00','调休');
insert into attendance_info(user_id,attendance_type,attendance_hours,record_date,start_time,end_time,remark)values(20,1,3,DATE('2019-09-16'),'2019-09-16 09:00:00','2019-09-16 12:00:00','调休');
insert into attendance_info(user_id,attendance_type,attendance_hours,record_date,start_time,end_time,remark)values(20,1,3,DATE('2019-09-11'),'2019-09-11 09:00:00','2019-09-11 12:00:00','广州银行影像资料回传发版调休');