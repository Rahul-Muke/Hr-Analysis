# HR ANALYTICS #

#1#
#Average Attrition rate for all Departments#
use hr1;
select department,round(avg(Attritionrate)) from hr_1
group by department;

#2#
#Average Hourly rate of Male Research Scientist#
select gender,avg(HourlyRate),JobRole from hr_1
where JobRole='Research Scientist' and  gender="Male"
group by jobrole;

#3#
#Attrition rate Vs Monthly income stats#
select
case
 when MonthlyIncome between 1000 and 20000 then "1000-20000"
 when MonthlyIncome between 21000 and 50000 then "21000-50000"
 else "above 50000"
 end as income_range,
 avg(case when Attrition="No" then 1 else 0 end) as attrition_rate
 from hr_1
 inner join hr2
 on hr_1.EmployeeNumber=hr2.EmployeeID
 group by income_range;
 
#4#
#Average working years for each Department#
select department,avg(TotalWorkingYears) from hr_1
inner join hr2
on hr_1.EmployeeNumber=hr2.EmployeeID
group by department;

#5#
#Departmentwise No of Employees#
select department,count(EmployeeNumber) from hr_1
group by department;

#6#
#Count of Employees based on Educational Fields#
select count(EmployeeNumber),EducationField from hr_1
group by EducationField;

#7#
#Job Role Vs Work life balance#
select jobrole,WorkLifeBalance from hr_1 
inner join hr2 
on hr_1.EmployeeNumber=hr2.EmployeeID ;

#8#
#Attrition rate Vs Year since last promotion relation#
select attrition,attritionrate,YearsSinceLastPromotion from hr_1
inner join hr2
on hr_1.EmployeeNumber=hr2.EmployeeID ;

#9#
#Gender based Percentage of Employee#
SELECT
  gender,
  COUNT(*) AS total_employees,
  (COUNT(*) * 100.0) / SUM(COUNT(*)) OVER () AS percentage
FROM hr_1
GROUP BY gender;

#10#
#Deptarment / Job Role wise job satisfaction#
SELECT JobRole,department ,AVG(JobSatisfaction) AS jobSatisfaction
FROM Hr_1
GROUP BY JobRole,department;
