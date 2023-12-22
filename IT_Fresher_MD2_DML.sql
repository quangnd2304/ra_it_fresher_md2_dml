use student_management;
select * from student;
-- 1. Thêm 1 sinh viên đầy đủ các thông tin
insert into student
values('SV004','Nguyễn Văn D',22,'Hà Nội',1,1);
-- 2. Thêm 2 sinh viên đầy đủ thông tin
insert into student
values('SV005','Nguyễn Văn E',22,'Đà Nẵng',0,1),
('SV006','Nguyễn Văn F',24,'Hà Nội',0,0);
-- 3. Thêm sinh viên với các thông tin mã, tên, tuổi, địa chỉ
insert into student(student_id,student_name,address,age)
values('SV007','Hoàng Thị Thùy','Hà Nội',21);
-- 4. Cập nhật sinh viên có mã là SV003 thành tên Trịnh Văn Chiến
update student
	set student_name = 'Trịnh Văn Chiến'
where student_id = 'SV003';
-- 5. Xóa sinh viên có tên là Nguyễn Văn F
delete from student where student_name = 'Nguyễn Văn F';
-- 6. select: *: lấy tất cả dữ liệu
select * from student;
-- 7. select: columns - lấy thông tin sinh viên gồm mã, tên, tuổi, giới tính
select st.student_id, st.student_name,st.age,st.sex
from student st;
-- 8. select: functions - lấy thông tin sinh viên gồm mã, tên và tuổi nhân 2
select st.student_id,st.student_name,st.age*2 as 'Tuoi2'
from student st;
-- 9. Lấy thông tin sinh viên gồm mã sinh viên, tên sinh viên, tuổi, tên lớp
select st.student_id, st.student_name,st.age, c.class_name
from student st join class_student cs on st.student_id=cs.student_id
	join class c on cs.class_id = c.class_id;

create table categories(
	catalog_id int primary key auto_increment,
    catalog_names varchar(100),
    catalog_status bit
);
create table product(
	product_id char(5) primary key,
    product_name varchar(100),
    catalog_id int,
    product_status bit,
    foreign key(catalog_id) references categories(catalog_id)
);
-- 10. Lấy thông tin các sản phẩm gồm mã sản phẩm, tên, tên danh mục
select p.product_id,p.product_name,c.catalog_names
from product p left join categories c on p.catalog_id = c.catalog_id;
-- 11. Lấy các thông tin mã danh mục, tên danh mục, mã sp, tên sp
select c.catalog_id, c.catalog_names, p.product_id,p.product_name
from product p right join categories c on p.catalog_id = c.catalog_id;
-- 12. where: >,<, >=, <=, =: Lấy thông tin sinh viên có tuổi lớn hơn 21
select *
from student s
where s.age>21;
-- 13. where: and or: lấy thông tin sinh viên có tuổi lớn hơn 21 và có giới tính là 1
select *
from student st
where st.age>21 and st.sex=1;
-- 14. where: between 10 and 20: lấy thông tin sinh viên có tuổi lớn hơn hoặc bằng 22 và nhỏ hơn hoặc bằng 26
select *
from student st
where st.age between 22 and 26; 
-- 15. where: in (10,20,30): lấy thông tin sinh viên có tuổi 20, 21 hoặc 25
select * 
from student st
where st.age in (20,21,25);
-- 16. where: like: lấy thông tin sinh viên có ký tự bắt đầu là N
select *
from student st
where st.student_name like 'N%';
-- 17. Lấy thông tin sinh viên có ký tự thứ 3 là u
select *
from student st
where st.student_name like '__u%';
-- 18. Lấy thông tin sinh viên có địa chỉ chứa ký tự a
select *
from student st
where st.address like '%a%';
-- 19. Limit 3 offset 2: lấy 3 dữ liệu từ vị trí 2: lấy 3 sinh viên đầu
select *
from student
limit 3;
-- 20. Lấy 3 sinh viên từ vị trí 2
select *
from student
limit 3 offset 2;
-- 21. group by: tính tuổi trung bình sinh viên theo giới tính
select st.sex,avg(st.age) as 'Tuổi trung bình'
from student st
group by st.sex;
-- 22. Lấy nhóm giới tính có tuổi trung bình lớn hơn 23
select st.sex, avg(st.age) as 'Tuổi trung bình'
from student st
group by st.sex
having avg(st.age)>23;
-- 23. order by: Lấy thông tin sinh viên theo tuổi tăng dần
select *
from student st
order by st.age asc;
-- 24> lấy thông tin sinh viên theo tuổi tăng dần (tuổi bằng nhau thì theo tên giảm dần)
select *
from student st
order by st.age, st.student_name desc;
-- 25. Câu lệnh truy vấn lồng: kết quả truy vấn này là đầu vào của truy vấn khác
-- In ra thông tin danh mục không chứa sản phẩm
select * 
from categories c
where c.catalog_id not in (
	-- lấy các danh mục đã chứa sản phẩm
	select distinct p.catalog_id from product p
);





