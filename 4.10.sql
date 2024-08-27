-- a. MaHS, HoTenHS, GioiTinh, MaLop, TenLop, NamHoc, MaGVCN, HoTenGV (chủ nhiệm) của học sinh trong trường.
SELECT h.ma_hs, h.ho_ten_hs, h.gioi_tinh, h.ma_lop, l.ten_lop, l.nam_hoc, l.ma_gvcn, g.ho_ten_gv from hoc_sinh h
join lop l on  l.ma_lop = h.ma_lop
join giao_vien g on  l.ma_gvcn = g.ma_gv;

--    b. MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
SELECT h.ma_hs, h.ho_ten_hs, k.hoc_ky, k.ma_mh, m.ten_mh, k.diem_thi_giua_ky, k.diem_thi_cuoi_ky from hoc_sinh h
join ket_qua_hoc_tap k  on  k.ma_hs = h.ma_hs
join mon_hoc m  on  k.ma_mh = m.ma_mh;

--    c. MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaLop, MaGV (phụ trách), HoTenGV (phụ trách) của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
SELECT kq.ma_hs, hs.ho_ten_hs, kq.hoc_ky, kq.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky,
       hs.ma_lop, lop.ma_gvcn, gv.ho_ten_gv
from ket_qua_hoc_tap kq
join hoc_sinh hs ON kq.ma_hs = hs.ma_hs
join mon_hoc mh ON kq.ma_mh = mh.ma_mh
join lop ON hs.ma_lop = lop.ma_lop
join giao_vien gv ON lop.ma_gvcn = gv.ma_gv;

--    d. MaHS, HoTenHS, MaLop, MaGVCN, HoTenGV (chủ nhiệm), HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaGV (phụ trách), HoTenGV (phụ trách) của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường.
SELECT k.ma_hs, h.ho_ten_hs, h.ma_lop, l.ma_gvcn, gv_cn.ho_ten_gv as ho_ten_gv_chu_nhiem,
       k.hoc_ky, k.ma_mh, mh.ten_mh, k.diem_thi_giua_ky, k.diem_thi_cuoi_ky,
       l.ma_gvcn as ma_gv_phu_trach, gv_phu_trach.ho_ten_gv as ho_ten_gv_phu_trach
from ket_qua_hoc_tap k
join hoc_sinh h ON k.ma_hs = h.ma_hs
join lop l ON h.ma_lop = l.ma_lop
join giao_vien gv_cn ON l.ma_gvcn = gv_cn.ma_gv
join mon_hoc mh ON k.ma_mh = mh.ma_mh
left join giao_vien gv_phu_trach ON l.ma_gvcn = gv_phu_trach.ma_gv;

--    e. MaHS, HoTenHS, MaLop, MaGVCN, HoTenGV (chủ nhiệm), HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaGV (phụ trách), HoTenGV (phụ trách) của những học sinh nữ với các môn học đã có kết quả thi cuối kỳ hoặc giữa kỳ được 9 điểm trở lên.
SELECT kq.ma_hs, h.ho_ten_hs, h.ma_lop, l.ma_gvcn, gv_cn.ho_ten_gv as ho_ten_gv_chu_nhiem,
       kq.hoc_ky, kq.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky,
       l.ma_gvcn as ma_gv_phu_trach, gv_phu_trach.ho_ten_gv as ho_ten_gv_phu_trach
from ket_qua_hoc_tap kq
join hoc_sinh h on kq.ma_hs = h.ma_hs
join lop l on h.ma_lop = l.ma_lop
join giao_vien gv_cn on l.ma_gvcn = gv_cn.ma_gv
join mon_hoc mh on kq.ma_mh = mh.ma_mh
left join giao_vien gv_phu_trach on l.ma_gvcn = gv_phu_trach.ma_gv
where (kq.diem_thi_cuoi_ky >= 9 or kq.diem_thi_giua_ky >= 9) and h.gioi_tinh = 'Nữ';

--    f. MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaLop, MaGV (phụ trách), HoTenGV (phụ trách) của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường. Với điều kiện là chỉ hiển thị những môn học mà giáo viên phụ trách môn đó cũng chính là giáo viên chủ nhiệm của lớp.
SELECT kq.ma_hs, hs.ho_ten_hs, kq.hoc_ky, kq.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky,
       hs.ma_lop, lop.ma_gvcn, gv_chu_nhiem.ho_ten_gv AS ho_ten_gv_chu_nhiem
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
JOIN lop ON hs.ma_lop = lop.ma_lop
JOIN giao_vien gv_chu_nhiem ON lop.ma_gvcn = gv_chu_nhiem.ma_gv
JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh
LEFT JOIN phu_trach_bo_mon ptbm ON lop.ma_gvcn = ptbm.ma_gvpt AND mh.ma_mh = ptbm.ma_mh AND kq.hoc_ky = ptbm.hoc_ky
WHERE ptbm.ma_gvpt IS NOT NULL;

--    g. MaMH, MaLop, HocKy của những môn học đã được thi cuối kỳ vào năm 2023
SELECT kq.ma_mh, lop.ma_lop, kq.hoc_ky
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
JOIN lop ON hs.ma_lop = lop.ma_lop
WHERE YEAR(kq.ngay_gio_thi_cuoi_ky) = 2023;

--    h. MaMH, MaLop, HocKy của những môn học đã được thi vào tháng 8 năm 2023
SELECT kq.ma_mh, lop.ma_lop, kq.hoc_ky
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
JOIN lop ON hs.ma_lop = lop.ma_lop
WHERE YEAR(kq.ngay_gio_thi_cuoi_ky) = 2023 AND MONTH(kq.ngay_gio_thi_cuoi_ky) = 8;

--    i. MaMH, MaLop, HocKy của những môn học đã được thi trước ngày 20 tháng 8 năm 2023
SELECT kq.ma_mh, lop.ma_lop, kq.hoc_ky
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
JOIN lop ON hs.ma_lop = lop.ma_lop
WHERE kq.ngay_gio_thi_cuoi_ky < '2023-08-20';

--    j. MaMH, MaLop, HocKy của những môn học đã được thi trước ngày 20 tháng 8 năm 2023 đúng 1 tuần.
SELECT kq.ma_mh, lop.ma_lop, kq.hoc_ky
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
JOIN lop ON hs.ma_lop = lop.ma_lop
WHERE kq.ngay_gio_thi_cuoi_ky >= '2023-08-13' AND kq.ngay_gio_thi_cuoi_ky < '2023-08-20';

--    k. MaMH, MaLop, HocKy của những môn học đã được thi sau ngày 20 tháng 8 năm 2023 đúng 21 ngày.
SELECT kq.ma_mh, lop.ma_lop, kq.hoc_ky
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
JOIN lop ON hs.ma_lop = lop.ma_lop
WHERE kq.ngay_gio_thi_cuoi_ky >= '2023-09-10' AND kq.ngay_gio_thi_cuoi_ky <= '2023-10-01';

--    l. MaMH, MaLop, HocKy của những môn học đã được thi trong khoảng từ ngày 10 đến ngày 20 tháng 8 năm 2023.
 SELECT kq.ma_mh, lop.ma_lop, kq.hoc_ky
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
JOIN lop ON hs.ma_lop = lop.ma_lop
WHERE kq.ngay_gio_thi_cuoi_ky >= '2023-08-10' AND kq.ngay_gio_thi_cuoi_ky <= '2023-08-20';
 
--   m. MaMH, MaLop, HocKy của những môn học đã được thi trong khoảng từ 10 giờ 00 phút ngày 10 đến 20 giờ 30 phút ngày 20 tháng 8 năm 2023.
SELECT kq.ma_mh, lop.ma_lop, kq.hoc_ky
FROM ket_qua_hoc_tap kq
JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
JOIN lop ON hs.ma_lop = lop.ma_lop
WHERE kq.ngay_gio_thi_cuoi_ky >= '2023-08-20 10:00:00' AND kq.ngay_gio_thi_cuoi_ky <= '2023-08-20 20:30:00';

