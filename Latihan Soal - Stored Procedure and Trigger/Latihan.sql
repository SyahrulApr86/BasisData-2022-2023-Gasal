-- Buatlah stored procedure/function totalSalary untuk menghitung total gaji yang diterima
-- oleh employee jika total gajinya sama dengan akumulasi gaji awal ditambah dengan
-- tambahan dana $100 per dependent yang dimiliki oleh employee. Stored
-- procedure/function ini menerima 3 buah argumen, yaitu nama employee yang terbagi
-- menjadi fname, minit, lname. Contoh: pemanggilan totalSalary(‘Franklin’, ‘T’, ‘Wong’) akan
-- mengembalikan nilai 40300 karena Franklin T Wong memiliki 3 dependent dengan salary
-- awal sebesar $40,000.00. Maka salary yang diterima Franklin T Wong =
-- $40,000.00+(3*$100)= $40,300.00. Setelah stored procedure dibuat, lakukan pengetesan
-- dengan memanggil: SELECT totalSalary(‘Franklin’, ‘T’, ‘Wong’) 
create or replace function totalSalary(fname_par varchar, minit_par
varchar, lname_par varchar)
 returns numeric as
$$
declare
 salary_var numeric;
 total_dependent integer;
begin
    select count(*)
    from employee,
    dependent
    where employee.ssn = dependent.essn
    and employee.fname = fname_par
    and employee.minit = minit_par
    and employee.lname = lname_par
    into total_dependent;
    select salary
    into salary_var
    from employee
    where fname = fname_par
    and minit = minit_par
    and lname = lname_par;
 return salary_var + (total_dependent * 100);
end;
$$
language plpgsql;

-- Berdasarkan peraturan yang dibuat oleh company, tanggungan (dependent) yang dimiliki
-- oleh employee tidak boleh lebih dari 3 orang. Oleh karena itu, buatlah stored
-- procedure/function dan trigger checkTotalDependent untuk memastikan jumlah tanggungan
-- yang dimiliki oleh employee tidak lebih dari 3 dependent. Perhatikan event apa saja yang
-- perlu mengaktifkan trigger yang Anda buat. Setelah stored procedure & trigger dibuat,
-- lakukan pengetesan untuk perintah SQL berikut ini: INSERT INTO DEPENDENT VALUES
-- ('123456789', 'Nate', NULL, NULL, 'Son'); 
create or replace function checkTotalDependent()
    returns trigger as
$$
begin
    if (select count(*)
        from dependent
        where essn = new.essn) >= 3 
    then
        raise exception 'Total dependent must be less than 3';
    end if;
    return new;
end;
$$
language plpgsql;

create trigger checkTotalDependent
    before insert or update
    on dependent
    for each row
execute procedure checkTotalDependent();

-- Buatlah stored procedure/function checkSalary dan trigger salaryViolation untuk
-- memastikan bahwa gaji yang diterima oleh employee tidak lebih besar dari gaji yang
-- diterima manajer departemen. Perhatikan event apa saja yang perlu untuk mengaktifkan
-- trigger yang Anda buat. Setelah stored procedure & trigger dibuat, lakukan pengetesan
-- untuk perintah SQL berikut ini: UPDATE employee SET salary = 45000 WHERE ssn =
-- '123456789';’
create or replace function checkSalary()
    returns trigger as
$$
declare
    manager_salary numeric;
begin
    select min(salary)
    from department
    join employee on department.mgr_ssn = employee.ssn
    into manager_salary;

    if new.salary > (manager_salary) then
        raise exception 'Salary must be less than manager salary';
    end if;
    return new;
end;
$$
language plpgsql;

create trigger salaryViolation
    before insert or update
    on employee
    for each row
execute procedure checkSalary();
