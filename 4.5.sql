-- a. Những học sinh có giới tính là Nam.
SELECT * FROM hoc_sinh WHERE gioi_tinh = "Nam";

-- b. Những học sinh chưa có tên của phụ huynh.
SELECT * FROM hoc_sinh WHERE ho_ten_ph = "";

-- c. Những lớp chưa có giáo viên chủ nhiệm.
SELECT * FROM lop WHERE ma_gvcn = "";

-- d. Những học sinh chưa được phân lớp.
SELECT * FROM hoc_sinh WHERE ma_lop = "";

-- e. Những học sinh nữ có địa chỉ ở Thanh Khê.
SELECT * FROM hoc_sinh WHERE dia_chi = "Thanh Khê";

-- f. Những học sinh nam có địa chỉ ở Hải Châu hoặc những học sinh nữ có địa chỉ ở Thanh Khê.
SELECT * FROM hoc_sinh WHERE (gioi_tinh = 'Nam' AND dia_chi LIKE '%Hải Châu%') OR (gioi_tinh = 'Nữ' AND dia_chi LIKE '%Thanh Khê%');

-- g. Những học sinh nam chưa có tên phụ huynh và những học sinh nữ chưa được phân lớp.
SELECT * FROM hoc_sinh WHERE (gioi_tinh = 'Nam' AND ho_ten_ph = "") OR (gioi_tinh = 'Nữ' AND ma_lop = "");

-- h. Những học sinh nam chưa được phân lớp và những học sinh nam chưa có tên phụ huynh.
SELECT * FROM hoc_sinh WHERE (gioi_tinh = 'Nam' AND ho_ten_ph = "") OR (gioi_tinh = 'Nam' AND ma_lop = "");

-- i. Mã môn học của những môn học được dạy trong học kỳ 2.
SELECT ma_mh from phu_trach_bo_mon WHERE hoc_ky = "Học kỳ 2";