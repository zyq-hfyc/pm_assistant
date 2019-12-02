-- 查询某人的加班总时长，已调休总时长，剩余调休总时长
SELECT 
    t.jiaban, t.tiaoxiu, (t.jiaban - t.tiaoxiu) shengyu
FROM
    (SELECT 
        tmp.user_id,
            MAX(CASE
                WHEN tmp.attendance_type = 0 THEN tmp.attendance_hours
            END) jiaban,
            MAX(CASE
                WHEN tmp.attendance_type = 1 THEN tmp.attendance_hours
            END) tiaoxiu
    FROM
        (SELECT 
        SUM(ai.attendance_hours) attendance_hours,
            attendance_type,
            ai.user_id
    FROM
        attendance_info ai
    WHERE
        ai.attendance_type IN (0 , 1)
    GROUP BY ai.attendance_type , ai.user_id) tmp
    GROUP BY tmp.user_id) t
WHERE
    t.user_id = 19;
	
-- 查询考勤信息
SELECT 
    ai.attendance_id,
    ui.user_id,
    ui.user_name,
    ai.attendance_type,
    ai.attendance_hours,
    DATE_FORMAT(ai.record_date, '%Y-%m-%d') record_date,
    DATE_FORMAT(ai.start_time, '%Y-%m-%d %T') start_time,
    DATE_FORMAT(ai.end_time, '%Y-%m-%d %T') end_time,
    ai.remark,
    ai.data_status
FROM
    user_info ui,
    attendance_info ai
WHERE
    ui.user_id = ai.user_id