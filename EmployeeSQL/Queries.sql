--List the following details of each employee: employee number, last name, first name, sex, and salary
SELECT "Employees"."Employee_No", "Employees"."Last_Name", "Employees"."First_Name", "Employees"."Sex", "Salaries"."Salary"
FROM "Employees"
INNER JOIN "Salaries" ON
"Employees"."Employee_No"="Salaries"."Employee_No"

--List first name, last name, and hire date for employees who were hired in 1986
SELECT "First_Name", "Last_Name", "Hire_Date"
FROM "Employees"
WHERE CAST("Hire_Date" AS text) LIKE '1986%'

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name
SELECT DMJ."Dept_No", DEP."Dept_Name", DMJ."Employee_No", EMP."Last_Name", EMP."First_Name"
FROM "Employees" AS EMP
	JOIN "Department_Manager_Junction" AS DMJ
	ON (EMP."Employee_No" = DMJ."Employee_No")
		JOIN "Departments" AS DEP
		ON (DMJ."Dept_No" = DEP."Dept_No")

--List the department of each employee with the following information: employee number, last name, first name, and department name
SELECT  EMP."Employee_No", EMP."Last_Name", EMP."First_Name", DEP."Dept_Name"
FROM "Employees" AS EMP
	JOIN "Department_Employees_Junction" AS DEJ
	ON (EMP."Employee_No" = DEJ."Employee_No")
		JOIN "Departments" AS DEP
		ON (DEJ."Dept_No" = DEP."Dept_No")

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"
SELECT "First_Name", "Last_Name", "Sex"
FROM "Employees"
WHERE "First_Name" = 'Hercules' AND "Last_Name" LIKE 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT  EMP."Employee_No", EMP."Last_Name", EMP."First_Name", DEP."Dept_Name"
FROM "Employees" AS EMP
	JOIN "Department_Employees_Junction" AS DEJ
	ON (EMP."Employee_No" = DEJ."Employee_No")
		JOIN "Departments" AS DEP
		ON (DEJ."Dept_No" = DEP."Dept_No")
		WHERE "Dept_Name" = 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT  EMP."Employee_No", EMP."Last_Name", EMP."First_Name", DEP."Dept_Name"
FROM "Employees" AS EMP
	JOIN "Department_Employees_Junction" AS DEJ
	ON (EMP."Employee_No" = DEJ."Employee_No")
		JOIN "Departments" AS DEP
		ON (DEJ."Dept_No" = DEP."Dept_No")
		WHERE "Dept_Name" = 'Sales' OR "Dept_Name" = 'Development'

--List the frequency count of employee last names (i.e., how many employees share each last name), in descending order
SELECT COUNT("Last_Name"), "Last_Name"
FROM "Employees"
GROUP BY "Last_Name"
ORDER BY COUNT("Last_Name") DESC