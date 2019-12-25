-- ------------------------ 初始化角色表 --------------------------------------------------------
--  select * from role_info;
INSERT INTO role_info(role_id,role_name,role_desc)VALUES(1,'后端技术经理','后端的技术经理'); -- 1
INSERT INTO role_info(role_id,role_name,role_desc)VALUES(2,'前端技术经理','前端的技术经理'); -- 2
INSERT INTO role_info(role_id,role_name,role_desc)VALUES(3,'项目经理','项目经理'); -- 3
INSERT INTO role_info(role_id,role_name,role_desc)VALUES(4,'项目总监','项目总监'); -- 4
INSERT INTO role_info(role_id,role_name,role_desc)VALUES(5,'测试经理','测试经理'); -- 5
INSERT INTO role_info(role_id,role_name,role_desc)VALUES(6,'运维经理','运维经理'); -- 6
INSERT INTO role_info(role_id,role_name,role_desc)VALUES(7,'测试','测试'); -- 7
INSERT INTO role_info(role_id,role_name,role_desc)VALUES(8,'运维','运维'); -- 8
INSERT INTO role_info(role_id,role_name,role_desc)VALUES(9,'产品经理','产品经理'); -- 9
INSERT INTO role_info(role_id,role_name,role_desc)VALUES(10,'BM','BM'); -- 10
INSERT INTO role_info(role_id,role_name,role_desc)VALUES(11,'后端开发','java后端开发'); -- 11
INSERT INTO role_info(role_id,role_name,role_desc)VALUES(12,'IOS开发','IOS开发'); -- 12
INSERT INTO role_info(role_id,role_name,role_desc)VALUES(13,'安卓开发','安卓开发'); -- 13
INSERT INTO role_info(role_id,role_name,role_desc)VALUES(14,'H5开发','H5开发'); -- 14
INSERT INTO role_info(role_id,role_name,role_desc)VALUES(15,'SA','系统分析师'); -- 15
INSERT INTO role_info(role_id,role_name,role_desc)VALUES(16,'架构师','架构师'); -- 16
-- ------------------------ 初始化人员表 --------------------------------------------------------
SELECT 
    ui.user_name, ui.mobile_phone, ri.role_name
FROM
    user_info ui,
    role_info ri
WHERE
    ui.role_id = ri.role_id;
    
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(1,'石先江',1,'15019215020');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(2,'游若鱼',3,'18520892589');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(3,'张振兴',2,'18902837203');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(4,'皇甫永超',3,'18688994926');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(5,'陈小东',4,'18129961963');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(6,'庄小雨',5,'13631628397');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(7,'吴伦清',15,'13826519531');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(8,'覃丽春',11,'18565855696');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(9,'张昊',11,'18594281078');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(10,'徐传川',11,'15811837723');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(11,'郭孟飞',11,'13028816615');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(12,'郑伟凯',11,'13682519413');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(13,'徐晓鸣',11,'17600297244');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(14,'陈强',11,'15118142857');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(15,'林敏',13,'18879080822');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(16,'孙嘉乐',12,'15889775945');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(17,'袁子奕',14,'13570575874');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(18,'沈小恒',14,'13652253340');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(19,'桂宁',7,'18123631961');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(20,'邓巧巧',7,'15889521501');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(21,'李文斌',7,'18720073591');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(22,'沈杰',9,'13601867345');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(23,'郭东',9,'18621814728');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(24,'孙佳',9,'13636441352');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(26,'陈涛',9,'13537595828');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(27,'程鹏远',10,'13311381925');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(28,'邵天琦',10,'13942176088');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(29,'翟颖',10,'15018493337');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(30,'潘磊',10,'13564722467');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(31,'瞿亚玲',10,'18583959227');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(32,'郑平',10,'18121380856');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(33,'雷春',10,'18018641869');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(34,'邹亮',8,'13925222655');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(35,'张志平',8,'13751058453');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(36,'雷树朝',8,'18565884568');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(37,'陈敏',8,'15986818096');
INSERT INTO user_info(user_id,user_name,role_id,mobile_phone)VALUES(38,'朱洲',8,'18025332327');

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

INSERT INTO project_info(project_id,project_name,bussiness_manager,product_manager ,ops)VALUES(1,'新安银行',33,24,35);
INSERT INTO project_info(project_id,project_name,bussiness_manager,product_manager ,ops)VALUES(2,'平顶山银行',28,24,37);
INSERT INTO project_info(project_id,project_name,bussiness_manager,product_manager ,ops)VALUES(3,'黑龙江省联社',27,23,34);
INSERT INTO project_info(project_id,project_name,bussiness_manager,product_manager ,ops)VALUES(4,'鞍山银行',27,22,37);
INSERT INTO project_info(project_id,project_name,bussiness_manager,product_manager ,ops)VALUES(5,'福州农商行',32,23,38);
INSERT INTO project_info(project_id,project_name,bussiness_manager,product_manager ,ops)VALUES(6,'赣州银行',29,24,35);
INSERT INTO project_info(project_id,project_name,bussiness_manager,product_manager ,ops)VALUES(7,'桂林银行',32,23,37);
INSERT INTO project_info(project_id,project_name,bussiness_manager,product_manager ,ops)VALUES(8,'济宁银行',27,23,34);
INSERT INTO project_info(project_id,project_name,bussiness_manager,product_manager ,ops)VALUES(9,'江阴银行',28,24,36);
INSERT INTO project_info(project_id,project_name,bussiness_manager,product_manager ,ops)VALUES(10,'紫金银行',33,23,38);
INSERT INTO project_info(project_id,project_name,bussiness_manager,product_manager ,ops)VALUES(11,'紫金银行',29,26,37);
INSERT INTO project_info(project_id,project_name,bussiness_manager,product_manager ,ops)VALUES(12,'自贡银行',31,24,35);
INSERT INTO project_info(project_id,project_name,bussiness_manager,product_manager ,ops)VALUES(13,'佛山银行',28,26,36);

-- ------------------------------------------------------------------------------------------------
-- 插入考勤数据
INSERT INTO attendance_info(user_id,attendance_type,attendance_hours,record_date,start_time,end_time,remark)VALUES(17,1,0.5,DATE('2019-09-26'),'2019-09-26 09:00:00','2019-09-26 09:30:00','调休');
INSERT INTO attendance_info(user_id,attendance_type,attendance_hours,record_date,start_time,end_time,remark)VALUES(9,1,3,DATE('2019-09-20'),'2019-09-20 09:00:00','2019-09-20 12:00:00','调休');
INSERT INTO attendance_info(user_id,attendance_type,attendance_hours,record_date,start_time,end_time,remark)VALUES(9,1,0.5,DATE('2019-09-17'),'2019-09-17 09:00:00','2019-09-17 09:30:00','调休');
INSERT INTO attendance_info(user_id,attendance_type,attendance_hours,record_date,start_time,end_time,remark)VALUES(20,1,3,DATE('2019-09-16'),'2019-09-16 09:00:00','2019-09-16 12:00:00','调休');
INSERT INTO attendance_info(user_id,attendance_type,attendance_hours,record_date,start_time,end_time,remark)VALUES(20,1,3,DATE('2019-09-11'),'2019-09-11 09:00:00','2019-09-11 12:00:00','广州银行影像资料回传发版调休');