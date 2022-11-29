--Create Tables
CREATE TABLE "Departments" (
    "Dept_No" VARCHAR(10)   NOT NULL,
    "Dept_Name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Dept_No"
     )
);

CREATE TABLE "Titles" (
    "Title_ID" VARCHAR(10)   NOT NULL,
    "Title" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Title_ID"
     )
);

CREATE TABLE "Employees" (
    "Employee_No" INTEGER   NOT NULL,
    "Title_ID" VARCHAR(10)   NOT NULL,
    "Birth_Date" DATE   NOT NULL,
    "First_Name" VARCHAR(30)   NOT NULL,
    "Last_Name" VARCHAR(30)   NOT NULL,
    "Sex" VARCHAR(30)   NOT NULL,
    "Hire_Date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "Employee_No"
     )
);

CREATE TABLE "Salaries" (
    "ID" SERIAL   NOT NULL,
    "Employee_No" INTEGER   NOT NULL,
    "Salary" MONEY   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Department_Employees_Junction" (
    "Employee_No" INTEGER   NOT NULL,
    "Dept_No" VARCHAR(10)   NOT NULL
);

CREATE TABLE "Department_Manager_Junction" (
    "Dept_No" VARCHAR(10)   NOT NULL,
    "Employee_No" INTEGER   NOT NULL
);

ALTER TABLE "Department_Employees_Junction" ADD CONSTRAINT "fk_Department_Employees_Junction_Employee_No" FOREIGN KEY("Employee_No")
REFERENCES "Employees" ("Employee_No");

ALTER TABLE "Department_Employees_Junction" ADD CONSTRAINT "fk_Department_Employees_Junction_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Departments" ("Dept_No");

ALTER TABLE "Department_Manager_Junction" ADD CONSTRAINT "fk_Department_Manager_Junction_Dept_No" FOREIGN KEY("Dept_No")
REFERENCES "Departments" ("Dept_No");

ALTER TABLE "Department_Manager_Junction" ADD CONSTRAINT "fk_Department_Manager_Junction_Employee_No" FOREIGN KEY("Employee_No")
REFERENCES "Employees" ("Employee_No");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_Title_ID" FOREIGN KEY("Title_ID")
REFERENCES "Titles" ("Title_ID");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_Employee_No" FOREIGN KEY("Employee_No")
REFERENCES "Employees" ("Employee_No");

--Import Data From CSVs
