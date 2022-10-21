select * from DONGXE where SoChoNgoi > 5;


select * from NHACUNGCAP where MaNhaCC in (select MaNhaCC from DANGKYCUNGCAP where (DongXe in (select DongXe from DONGXE where HangXe in ('Toyota')) and MaMP in (select MaMP from MUCPHI where DonGia = 15000))or (DongXe in (select DongXe from DONGXE where HangXe in ('KIA')) and MaMP in (select MaMP from MUCPHI where DonGia = 20000)));


select * from NHACUNGCAP order by TenNhaCC asc;
select * from NHACUNGCAP order by MaSoThue desc;

select count(MaNhaCC) from DANGKYCUNGCAP where MaNhaCC in (select MaNhaCC from NHACUNGCAP where TenNhaCC in ('Cty TNHH Toàn Pháp')) and NgayBatDauCungCap >= '2015-11-20';


select distinct HangXe from DONGXE;

select A.MaDKCC,A.MaNhaCC,E.TenNhaCC,E.DiaChi,E.MaSoThue,C.TenLoaiDV,D.DonGia,B.HangXe,A.NgayBatDauCungCap,A.NgayKetThucCungCap from DANGKYCUNGCAP A
inner join DONGXE B on A.DongXe = B.DongXe
inner join LOAIDICHVU C on A.MaLoaiDV = C.MaLoaiDV
inner join MUCPHI D on A.MaMP = D.MaMP
right join NHACUNGCAP E on A.MaNhaCC = E.MaNhaCC;


select * from NHACUNGCAP where MaNhaCC in (select MaNhaCC from DANGKYCUNGCAP where DongXe in ('Hiace')or DongXe in ('Cerato'));


select * from NHACUNGCAP where MaNhaCC not in (select MaNhaCC from DANGKYCUNGCAP);