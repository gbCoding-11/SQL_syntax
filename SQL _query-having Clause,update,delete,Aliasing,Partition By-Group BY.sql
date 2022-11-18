	--having Clause

select jobtitle, count(jobtitle)
from [SQL Tutorial].dbo.EmployeeDemographics a
join [SQL Tutorial].dbo.EmployeeSalary b
	on a.EmployeeID = b.EmployeeID
group by JobTitle
having COUNT(jobtitle) > 1


select jobtitle, Avg(Salary)
from [SQL Tutorial].dbo.EmployeeDemographics a
join [SQL Tutorial].dbo.EmployeeSalary b
	on a.EmployeeID = b.EmployeeID
group by JobTitle
having avg(Salary) > 1	-- right after the group by and before the order by
order by AVG(salary)


	--update date
select *
from [SQL Tutorial].dbo.EmployeeDemographics

update [SQL Tutorial].dbo.EmployeeDemographics
set EmployeeID = 1012, age=31, Gender='female'
where FirstName='Stanley' and LastName = 'Hudson'


	--delete data
select * from [SQL Tutorial].dbo.EmployeeDemographics
where EmployeeID = 1003	--지워질 data 지우기전에 확인차 select - excute 1차
delete from [SQL Tutorial].dbo.EmployeeDemographics
where EmployeeID = 1003		--execute 2차 때 지워진다.


	--Aliasing column name
select firstname + ' ' + LastName as Fullname	--alisasing column name
from [SQL Tutorial].dbo.EmployeeDemographics

select Avg(Age) as AvgAge		--aliasing column name 
from [SQL Tutorial].dbo.EmployeeDemographics

	--Aliasing table name
select demo.EmployeeID, Sal.Salary
from [SQL Tutorial].dbo.EmployeeDemographics as Demo	--as 생략해도 된다.
	join [SQL Tutorial].dbo.EmployeeSalary as Sal
	on Demo.EmployeeID = Sal.EmployeeID

	--Aliasing table name	--as 생략가능
	--A,b,c,d,로는 추천안한다. 나중에 뭐가 뭔지 알아보기 어려울수있다.
	--Demographic의 demo / Salary의 sal / Warehouse의 ware 같은 식으로 해야 나중에 읽을때 알아보기 편한다.


	-- Partition By		-count(gender)보기
select FirstName, LastName, Gender, Salary
	,COUNT(Gender) over (partition by gender) as TotalGender
from [SQL Tutorial].dbo.EmployeeDemographics dem
join [SQL Tutorial].dbo.EmployeeSalary sal
	on dem.EmployeeID = sal.EmployeeID


	--Group By			-count(gender)보기 -한 row씩밖에 못한다 생각하면 됨.
					-- sticking it on one line in the select statement
select Gender, COUNT(Gender)
from [SQL Tutorial].dbo.EmployeeDemographics dem
join [SQL Tutorial].dbo.EmployeeSalary sal
	on dem.EmployeeID = sal.EmployeeID
group by Gender

	--결론 : 데이터 다 보고 싶으면 PARTITION BY, 요약해서 하나씩 한줄씩만 보려면 GROUP BY
