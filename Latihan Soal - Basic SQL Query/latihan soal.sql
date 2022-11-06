-- 1.	Ubah jam kerja pegawai yang bekerja di Project 2 menjadi 20 jam.
update works_on
set hours = 20
where pno = 'P2';

-- 2.	Hapus Project yang berada di bawah departemen “Administration”
delete from project
where dnum = (
    select dnumber
    from department
    where dname = 'Administration'
    );

-- 3.	Tampilkan Fname dan Lname pegawai yang berjenis kelamin wanita (F).
select fname , lname
from employee
where sex = 'F';

-- 4.	Tampilkan Fname dan Ssn pegawai yang bekerja di departemen “Research”.
select fname, ssn
from employee
where dno = (
    select dnumber
    from department
    where dname = 'Research'
    );

-- 5.	Tampilkan nama departemen (secara unik) tempat pegawai yang memiliki nama berawalan huruf “A” bekerja
select distinct dname as "Nama Departemen"
from employee
join department on employee.dno = department.dnumber
where fname like 'A%';

-- 6.	Tampilkan nama departemen dan nama project dimana pegawai bernama “Alicia” bekerja.
select dname as "Nama Departemen", pname as "Nama Project"
from employee
join department on employee.dno = department.dnumber
join works_on on employee.ssn = works_on.essn
join project on works_on.pno = project.pnumber
where fname = 'Alicia';

-- 7.	Tampilkan daftar FName pegawai yang bekerja di suatu project.
select fname
from employee
where exists (
    select *
    from works_on
    where essn = employee.ssn
    );

-- 8.	Tampilkan nama project yang dikerjakan oleh pegawai bernama “Franklin”
select pname as "Nama Project"
from employee
join works_on on employee.ssn = works_on.essn
join project on works_on.pno = project.pnumber
where fname = 'Franklin';

-- 9.	Tampilkan nama pegawai beserta nama pasangannya (suami/istri) yang terdaftar sebagai dependent dari pegawai tersebut
select fname || ' ' || lname as "Nama Pegawai", dependent_name
from employee
join dependent on employee.ssn = dependent.essn
where dependent.relationship = 'Spouse';

-- 10.	Tambahkan salary pegawai yang bekerja di departemen “Administration” sebesar 10000.
update employee
set salary = salary + 10000
where dno = (
    select dnumber
    from department
    where dname = 'Administration'
    );
