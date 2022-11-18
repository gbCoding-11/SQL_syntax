/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [EmployeeID]
      ,[FirstName]
      ,[LastName]
      ,[Age]
      ,[Gender]
  FROM [SQL Tutorial].[dbo].[EmployeeDemographics]



  select EmployeeID,FirstName,Age
  from [SQL Tutorial].dbo.EmployeeDemographics
  Union All
  select EmployeeID,JobTitle,Salary
  from [SQL Tutorial].dbo.EmployeeSalary
  order by EmployeeID