-- SQL Dump COMPANY Relational Database

--
-- Database: company
--

-- --------------------------------------------------------
CREATE SCHEMA COMPANY;
SET SEARCH_PATH TO COMPANY;
--
-- Table structure for table department
--

CREATE TABLE department (
  dname varchar(15) NOT NULL,
  dnumber int NOT NULL,
  Mgr_ssn char(9) DEFAULT NULL,
  Mgr_ssn_date date DEFAULT NULL
);

--
-- Dumping data for table department
--

INSERT INTO department (dname, dnumber, Mgr_ssn, Mgr_ssn_date) VALUES
('Headquarters', 1, '888665555', '1981-06-19'),
('Fake', 2, NULL, NULL),
('Administration', 4, '987654321', '1995-01-01'),
('Research', 5, '333445555', '1988-05-22');

-- --------------------------------------------------------

--
-- Table structure for table dependent
--

CREATE TABLE dependent (
  Essn char(9) NOT NULL,
  Dependent_name varchar(15) NOT NULL,
  Sex char(1) DEFAULT NULL,
  Bdate date DEFAULT NULL,
  Relationship varchar(8) DEFAULT NULL
);

--
-- Dumping data for table dependent
--

INSERT INTO dependent (Essn, Dependent_name, Sex, Bdate, Relationship) VALUES
('123456789', 'Alice', NULL, NULL, 'Daughter'),
('123456789', 'Elizabeth', NULL, NULL, 'Spouse'),
('123456789', 'Michael', NULL, NULL, 'Son'),
('333445555', 'Alice', 'F', NULL, NULL),
('333445555', 'Joy', NULL, NULL, 'Spouse'),
('333445555', 'Theodore', NULL, NULL, 'Son'),
('987654321', 'Abner', NULL, NULL, 'Spouse');

-- --------------------------------------------------------

--
-- Table structure for table dept_locations
--

CREATE TABLE dept_locations (
  Dnumber int NOT NULL,
  Dlocation varchar(15) NOT NULL
);

--
-- Dumping data for table dept_locations
--

INSERT INTO dept_locations (Dnumber, Dlocation) VALUES
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire'),
(5, 'Houston'),
(5, 'Sugarland');

-- --------------------------------------------------------

--
-- Table structure for table employee
--

CREATE TABLE employee (
  Fname varchar(15) NOT NULL,
  Minit char(1) DEFAULT NULL,
  Lname varchar(15) NOT NULL,
  Ssn char(9) NOT NULL,
  Bdate date DEFAULT NULL,
  Address varchar(30) DEFAULT NULL,
  Sex char(1) DEFAULT NULL,
  Salary decimal(10,2) DEFAULT NULL,
  Super_ssn char(9) DEFAULT NULL,
  Dno int NOT NULL
);

--
-- Dumping data for table employee
--

INSERT INTO employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) VALUES
('John', 'B', 'Smith', '123456789', '1965-01-09', 'Fondren', 'M', '30000.00', '333445555', 5),
('Franklin', 'T', 'Wong', '333445555', '1955-12-08', 'Houston', 'M', '40000.00', '888665555', 5),
('Joyce', NULL, 'English', '453453453', NULL, NULL, 'F', '25000.00', '987654321', 5),
('Ramesh', NULL, 'Narayan', '666884444', NULL, NULL, 'F', '38000.00', '888665555', 5),
('James', NULL, 'Borg', '888665555', NULL, NULL, 'M', '55000.00', '333445555', 1),
('Jennifer', 'S', 'Wallace', '987654321', '1941-06-19', 'Bellaire', 'F', '43000.00', '333445555', 4),
('Ahmad', NULL, 'Jabbar', '987987987', NULL, NULL, 'M', '25000.00', '987654321', 4),
('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', 'Castle', 'F', '25000.00', NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table project
--

CREATE TABLE project (
  Pname varchar(15) NOT NULL,
  Pnumber int NOT NULL,
  Plocation varchar(15) DEFAULT NULL,
  Dnum int NOT NULL
);

--
-- Dumping data for table project
--

INSERT INTO project (Pname, Pnumber, Plocation, Dnum) VALUES
('ProductX', 1, 'Bellaire', 5),
('ProductY', 2, 'Suharland', 5),
('ProductZ', 3, 'Houston', 5),
('Computerization', 10, 'Stafford', 4),
('Reorganization', 20, 'Houston', 1),
('Newbenefits', 30, 'Stafford', 4);

-- --------------------------------------------------------

--
-- Table structure for table works_on
--

CREATE TABLE works_on (
  Essn char(9) NOT NULL,
  Pno int NOT NULL,
  Hours decimal(3,1) NOT NULL
);

--
-- Dumping data for table works_on
--

INSERT INTO works_on (Essn, Pno, Hours) VALUES
('123456789', 1, '32.5'),
('123456789', 2, '7.5'),
('333445555', 2, '10.0'),
('333445555', 3, '10.0'),
('333445555', 10, '10.0'),
('333445555', 20, '10.0'),
('453453453', 1, '20.0'),
('453453453', 3, '20.0'),
('666884444', 3, '40.0'),
('888665555', 20, '0.0'),
('987654321', 20, '15.0'),
('987654321', 30, '20.0'),
('987987987', 10, '35.0'),
('987987987', 30, '5.0'),
('999887777', 10, '10.0'),
('999887777', 30, '30.0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table department
--
ALTER TABLE department
  ADD PRIMARY KEY (dnumber),
  ADD UNIQUE (dname);

--
-- Indexes for table dependent
--
ALTER TABLE dependent
  ADD PRIMARY KEY (Essn,Dependent_name);

--
-- Indexes for table dept_locations
--
ALTER TABLE dept_locations
  ADD PRIMARY KEY (Dnumber,Dlocation);

--
-- Indexes for table employee
--
ALTER TABLE employee
  ADD PRIMARY KEY (Ssn);

--
-- Indexes for table project
--
ALTER TABLE project
  ADD PRIMARY KEY (Pnumber),
  ADD UNIQUE (Pname);

--
-- Indexes for table works_on
--
ALTER TABLE works_on
  ADD PRIMARY KEY (Essn,Pno);

--
-- Constraints for dumped tables
--

--
-- Constraints for table dependent
--
ALTER TABLE dependent
  ADD CONSTRAINT dependent_ibfk_1 FOREIGN KEY (Essn) REFERENCES employee (Ssn);

--
-- Constraints for table dept_locations
--
ALTER TABLE dept_locations
  ADD CONSTRAINT dept_locations_ibfk_1 FOREIGN KEY (Dnumber) REFERENCES department (dnumber);

--
-- Constraints for table employee
--
ALTER TABLE employee
  ADD CONSTRAINT employee_ibfk_1 FOREIGN KEY (Super_ssn) REFERENCES employee (Ssn),
  ADD CONSTRAINT employee_ibfk_2 FOREIGN KEY (Dno) REFERENCES department (dnumber);

--
-- Constraints for table project
--
ALTER TABLE project
  ADD CONSTRAINT project_ibfk_1 FOREIGN KEY (Dnum) REFERENCES department (dnumber);

--
-- Constraints for table works_on
--
ALTER TABLE works_on
  ADD CONSTRAINT works_on_ibfk_1 FOREIGN KEY (Essn) REFERENCES employee (Ssn),
  ADD CONSTRAINT works_on_ibfk_2 FOREIGN KEY (Pno) REFERENCES project (Pnumber);
