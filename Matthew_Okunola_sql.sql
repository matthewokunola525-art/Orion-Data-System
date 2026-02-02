select * FROM world.countries
where Name = "Nigeria" ;

select 
ID, Name, Population 
from 
world.city;

select 
Name, continent, Headofstate
from
 world.countries;
 
 select * from world.countries;
 -- the table above return all the columns in the countries table.
 
 -- WHERE clause
 -- returns all the countries in Africa
 select * 
 from world.countries 
 where 
 Continent = "Africa" ;
 
 -- AND operator
 
 -- return the names of all countries in Africa that gain independence in 1960
 
 select name 
 from world.countries 
 where Continent = "Africa" and IndepYear = 1960;
 
 -- return the name and population of countries in either west Africa or East Africa
 select name , population
 from world.countries 
 where Region = "Western Africa" or Region = "Eastern Africa" ;
 
 
 -- return all the countries in the world except European countries
 select name
 Continent 
 from world.countries 
 where not Continent = "Europe" ;
 
 
 -- Working with NULL
 
 USE world;
 
 select * from countries;
 
 -- return countries with no independence year
 
 select name, 
 IndepYear from countries 
 where IndepYear is null;
 -- return countries with independence year.
  select name 
  from countries 
  where IndepYear is not null;
  
-- Limit Clause
select * from countries
 limit 5;
 
 -- Order By 
 
select name, population from countries order by population desc;

-- find the top 5 largest countries by land Mass in Africa

select name,  surfaceArea 
from countries 
where continent = "Africa" 
order by surfaceArea desc 
limit 5;

-- the country with highest life expectancy in Africa

select name ,
 population , LifeExpectancy  
 from countries 
 where continent = 'Africa'
 order by LifeExpectancy desc 
 limit 5;
 
 -- Offset Clause
 select name, Population
 from countries 
 order by population desc
 limit 5 
 offset 3;
 
-- IN 

select HeadOfState,
 Name 
 from world.countries
 -- where name = 'Nigeria' or name = 'Togo'or name = 'Ghana' or name = 'Benin';
 where name in ('Nigeria', 'Ghana', 'Togo', 'Benin');

-- BETWEEN

-- Return countries in Africa that gain Independence between 1960 and 1970

select name , IndepYear from world.countries where continent = 'Africa' and IndepYear between 1960 and 1970;

-- LIKE Operator

select * from world.city;

select * from world.city
 where name like'A%';
 
 -- cities that ends with m
 select * from world.city 
 where name like '%m';
 
 -- cities that contain 'a' 
 select * from world.city 
 where name like '%a';
 
 -- cities that ends with 'm'
 select * from world.city 
 where name like '%a%';
 
 -- return all cities that starts with  and are 5 letters 
 select name from world.city where name like 'A_';
 
 
 -- return the names of all cities that the letter 'b' is their second letter 
 select * from world.city where name like '_b%';
 
 -- Aggregate function
 select * from torilong.student_data;
 
 -- sum function
 
 select sum(tuition_fee) as total_tuition 
 from torilong.student_data;
 
 -- Average function
 select * 
 from 
 torilong.student_data;
 
 -- find the averge student score
 -- Round(value, number_of_decimal_place)
 select round(avg(score),0) as average_score
 from torilong.student_data;
 
 -- count function 
 -- count(*) - count the number of rows in a table 
 -- count(column_name) - counts the number of non-null values inthe specified column
 
 use torilong;
 
 select count(*) from student_data;
 
 select count(scholarship) as scholarship_recipients
 from student_data ;
 
 -- Max and Min function
 select max(tuition_fee) as maximum_tuition, min( tuition_fee) as minimum_tuition
 from student_data;
 
 -- Distinct
 
 select distinct scholarship
 from student_data WHERE scholarship IS NOT NULL;
 
 -- Return the count of the distinct scholarship categories
SELECT count(DISTINCT scholarship) 
FROM student_data 
WHERE scholarship IS NOT NULL ;

-- STRING FUNCTION
-- UPPER

SELECT UPPER(firstname)
FROM student_data;

-- CONCAT function
SELECT concat(firstname, ' ',lastname) AS fullname 
 FROM student_data;
 
 -- REPLACE 
 SELECT REPLACE(email, 'school.edu', 'academy.com') AS email 
 FROM student_data;
 
 -- COALESCE
 
SELECT 
    firstname,
    lastname,
    COALESCE(scholarship, 'NO SCHOLARSHIP') AS scholarship_status
FROM
    student_data;
 
 -- DATE functions
 SELECT NOW();
 
 SELECT CURDATE();
 
 -- TIMESTAMPDIFF
 -- find the student durtion in years
 SELECT 
    CONCAT(firstname, ' ', lastname) AS student_name,
    TIMESTAMPDIFF(YEAR,
        enrollmentdate,
        NOW()) AS years_enrolled
FROM
    student_data;

-- EXTRACT FUNCTION

SELECT EXTRACT(YEAR FROM CURDATE());

-- Get names of all students and their year of enrollment
SELECT 
    CONCAT(firstname, ' ', lastname) AS student_name,
    EXTRACT(YEAR FROM enrollmentdate) AS year
FROM
    student_data; 
USE torilong;

    

    
    

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


 
 
 
 
 



 
 
 
 
 
 
 
 
 
 
 

 