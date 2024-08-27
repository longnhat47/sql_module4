--    a. Họ tên của toàn bộ học sinh trong trường, nếu họ tên nào trùng nhau thì chỉ hiển thị 1 lần.
SELECT DISTINCT ho_ten_hs FROM hoc_sinh;

--    b. Mã lớp của các lớp đã có học sinh học ở lớp đó. Nếu mã lớp nào trùng nhau thì chỉ hiển thị 1 lần.
SELECT DISTINCT ma_lop FROM hoc_sinh;

--    c. Mã môn học của những môn học đã có ít nhất 1 giáo viên được phân công phụ trách rồi. (*)
SELECT DISTINCT ma_mh FROM phu_trach_bo_mon WHERE ma_mh IS NOT NULL;

--    d. Mã môn học của những môn học đã từng được tổ chức thi ít nhất 1 lần.
SELECT DISTINCT ma_mh FROM ket_qua_hoc_tap;

--    e. Mã giáo viên của những giáo viên đã từng làm chủ nhiệm cho ít nhất 1lớp nào đó.
SELECT DISTINCT ma_gvcn FROM lop;