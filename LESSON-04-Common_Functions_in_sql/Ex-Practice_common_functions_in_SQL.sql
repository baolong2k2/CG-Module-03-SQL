USE QuanLySinhVien;

# Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT*, MAX(CREDIT) AS 'LARGEST CREDIT'
FROM SUBJECT 
GROUP BY SUBID, SUBNAME
HAVING MAX(CREDIT) >= ALL (SELECT MAX(CREDIT) FROM SUBJECT GROUP BY SUBID, SUBNAME);


# Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT S.SUBID, S.SUBNAME, S.CREDIT, S.STATUS, MAX(MARK) AS HIGHEST_MARK
FROM SUBJECT S JOIN MARK M ON S.SUBID = M.SUBID
GROUP BY SUBID
HAVING MAX(MARK) >= ALL (SELECT MAX(MARK) FROM MARK GROUP BY SUBID);


# Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT S.STUDENTID, S.STUDENTNAME, AVG(MARK) AS 'Điểm trung bình'
FROM STUDENT S JOIN MARK M ON S.STUDENTID = M.STUDENTID
GROUP BY STUDENTID
HAVING AVG(MARK) >= ALL (SELECT AVG(MARK) FROM MARK GROUP BY STUDENTID)
ORDER BY AVG(MARK) DESC;