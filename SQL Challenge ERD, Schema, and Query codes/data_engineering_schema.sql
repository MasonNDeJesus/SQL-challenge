-- Simple CREATE TABLE for the titles
-- VARCHAR for the varying characters within the title_id and title columns
-- Titles needed to be created first in order for the imports to occur (which had to be done in the same order)
-- PRIMARY KEY is set to title_id, or the other way around, to uniquely identify each row
CREATE TABLE Titles (
    title_id VARCHAR(10) NOT NULL,
    title VARCHAR(100) NOT NULL,
    PRIMARY KEY (title_id)
);

-- INTEGER for numbers in the emp_no column
-- FOREIGN KEY used on emp_title_id allows for it to be connected to Titles, title_id column, by working with
-- REFERENCES to the title table, specifically the title_id column, which basically connects the tables
-- DATE for the columns with dates
CREATE TABLE Employees (
    emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR(10) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES Titles (title_id)
);

-- Nothing to note other than the setting of # for VARCHAR needed to be high just in case for dept_name
CREATE TABLE departments (
    dept_no VARCHAR(10) NOT NULL,
    dept_name VARCHAR(100) NOT NULL,
	PRIMARY KEY (dept_no)
);

-- Primary key needed to be set with dept_no, then emp_no, as the order matters for this table
-- REFERENCES are made to departments and employees table
CREATE TABLE Dept_Manager (
    dept_no VARCHAR(10) NOT NULL,
    emp_no INTEGER NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);

-- Same thing as the previous table, only the primary key is reversed
CREATE TABLE Dept_Emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments (dept_no)
);

-- REFERENCES to employees
CREATE TABLE Salaries (
    emp_no INTEGER NOT NULL,
    salary INTEGER NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);
