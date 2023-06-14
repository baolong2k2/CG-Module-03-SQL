USE QuanLySinhVien;

#Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT*FROM STUDENT
WHERE STUDENTNAME LIKE 'H%';


#Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT*FROM CLASS
WHERE STARTDATE LIKE '%12%';

#Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
SELECT*FROM SUBJECT
WHERE CREDIT > 2 AND CREDIT < 6;


#Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
UPDATE STUDENT 
SET 
    CLASSID = 2
WHERE
    STUDENTID = 1;
    
    
# Dữ liệu sắp xếp theo điểm thi (mark) giảm dần (DESC). nếu trùng sắp theo tên tăng dần (ASC)
SELECT 
    S.STUDENTNAME, SUB.SUBNAME, M.MARK
FROM
    STUDENT S
        JOIN
    MARK M ON S.STUDENTID = M.MARKID
        JOIN
    SUBJECT SUB ON M.SUBID = SUB.SUBID
ORDER BY MARK DESC , STUDENTNAME ASC;