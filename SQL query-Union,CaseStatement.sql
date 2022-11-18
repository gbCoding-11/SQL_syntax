/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [EmployeeID]
      ,[FirstName]
      ,[LastName]
      ,[Age]
      ,[Gender]
  FROM [SQL Tutorial].[dbo].[EmployeeDemographics]


  --Union
  select EmployeeID,FirstName,Age
  from [SQL Tutorial].dbo.EmployeeDemographics
  Union All
  select EmployeeID,JobTitle,Salary
  from [SQL Tutorial].dbo.EmployeeSalary
  order by EmployeeID


  --case statement
  select firstname, lastname, Age,
  (Case
		when Age = 38 then 'stanley'
		when Age > 30 then 'old'
		else 'baby'
	End)
  from [SQL Tutorial].dbo.EmployeeDemographics
  where age is not null
  order by Age desc


  --case statement - calculate salaryAfterRaise
  select firstname, lastname, jobtitle, salary,
	case
		when jobtitle ='salesman' then salary+(Salary*.10) --10% raise
		when JobTitle ='accountant' then salary+(Salary*.05) --5% raise
		when JobTitle = 'HR' then salary + (Salary*.00001) 
		else Salary + (Salary*.03)
	end as salaryAfterRaise
  from [SQL Tutorial].dbo.EmployeeDemographics a
  join [SQL Tutorial].dbo.EmployeeSalary b
  on a.EmployeeID= b.EmployeeID
