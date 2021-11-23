-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Employees" (
    "employee_no" INT   NOT NULL,
    "employee_title_id" VARCHAR   NOT NULL,
    "birthDt" DATE   NOT NULL,
    "employeeName" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hireDt" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "employee_no"
     )
);

CREATE TABLE "Departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL
);

CREATE TABLE "Dept_Managers" (
    "dept_no" VARCHAR   NOT NULL,
    "employee_no" INT   NOT NULL
);

CREATE TABLE "Dept_Employees" (
    "employee_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL
);

CREATE TABLE "Salaries" (
    "employee_no" INT   NOT NULL,
    "salary" INT   NOT NULL
);

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_title_id" FOREIGN KEY("title_id")
REFERENCES "Employees" ("employee_title_id");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_employee_no" FOREIGN KEY("employee_no")
REFERENCES "Dept_Managers" ("employee_no");

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Dept_Managers" ("dept_no");

ALTER TABLE "Dept_Managers" ADD CONSTRAINT "fk_Dept_Managers_dept_no_employee_no" FOREIGN KEY("dept_no", "employee_no")
REFERENCES "Dept_Employees" ("dept_no", "employee_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_employee_no" FOREIGN KEY("employee_no")
REFERENCES "Dept_Employees" ("employee_no");

