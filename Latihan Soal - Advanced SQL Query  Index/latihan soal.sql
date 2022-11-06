-- 1. Tampilkan jumlah pegawai dari masing-masing departemen.
select dname, count(*) as jumlah_pegawai
from employee, department
where employee.dno = department.dnumber
group by dname;
-- 2. Tampilkan nama employee yang bekerja sebagai manager dan juga memiliki anak perempuan 
select fname || ' ' || lname as "Nama Manager"
from employee
where exists (
 select *
 from department
 where employee.ssn = department.mgr_ssn
 ) and exists (
 select *
 from dependent
 where dependent.essn = employee.ssn and
 dependent.sex = 'F'
 );
-- 3. Tampilkan semua nama employee beserta salary dan nama departemennya. Jika employee tersebut memiliki dependent, tampilkan nama dependennya dan relasinya dengan employee 
select e.fname || ' ' || e.lname as "Nama Pegawai", salary, dname as "Nama Departemen", d2.dependent_name as "Nama Dependent", d2.relationship
from employee e
join department d on e.dno = d.dnumber
left join dependent d2 on e.ssn = d2.essn;
-- 4. Tampilkan semua nama employee yang memiliki gaji di atas rata rata gaji semua pegawai 
(catatan: gunakan EXISTS untuk query soal ini) 
select fname || ' ' || lname as "Nama Pegawai"
from employee
where exists (
 select *
 from employee e2
 where e2.salary > (
 select avg(salary)
 from employee
 ) and e2.ssn = employee.ssn
 );
-- 5. Tampilkan nama dari semua pegawai yang menjadi supervisor pegawai lainnya 
select fname || ' ' || lname as "Nama Pegawai"
from employee
where exists (
 select *
 from employee e2
 where e2.super_ssn = employee.ssn
 );
-- 6. Tampilkan gaji (sebelum dan sesudah kenaikan) dari masing-masing employee jika untuk tiap jam dari proyek, employee mendapat tambahan gaji $1000/jam 
select fname || ' ' || lname as "Nama Pegawai",
 salary as "Gaji sebelum Kenaikan",
 salary + (select sum(hours) from works_on where essn = employee.ssn) 
* 1000 as "Gaji Setelah Kenaikan"
from employee;
-- 7. Untuk masing-masing employee yang memiliki lebih dari 1 proyek, tampilkan nama employee, ssn employee, dan jumlah proyek yang dikerjakan oleh masing-masing employee. 
select fname || ' ' || lname as "Nama Pegawai", ssn as "SSN Pegawai", 
count(pno) as "Jumlah Proyek"
from employee
join works_on on employee.ssn = works_on.essn
group by fname, lname, ssn
having count(pno) > 1;
-- 8. Buat table view yang berisi data employee yang ditambah dengan informasi nama proyek dan lama jamnya yang sedang dikerjakan tiap employee beserta departemen tiap employee. 
create view employee_project as
select fname employee_fname, lname employee_lname, ssn employe_ssn, pno as 
proyek, hours, dname as departemen
from employee
join works_on on employee.ssn = works_on.essn
join department on employee.dno = department.dnumber;
-- 9. Dari tabel view yang sudah dibuat, tampilkan “employee_fname”, “employee_lname”, “proyek”, “departemen” 
select employee_fname, employee_lname, proyek, departemen
from employee_project;
-- 10. Dari tabel view yang sudah dibuat, tampilkan “employee_fname”, “employee_lname” diikuti total durasi jam semua proyek yang dikerjakan masing-masing employee
select employee_fname, employee_lname, sum(hours) as "Total Jam"
from employee_project
group by employee_fname, employee_lname