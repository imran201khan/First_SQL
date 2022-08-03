use world;
select * from train;

-- 1. How money people survived and how many deid

select count(Survived) from train
where Survived=1
union 
select count(Survived) from train
where Survived=0;

-- 2. count female and male Passengers

select Sex ,count(*) as Totel from train
group by Sex;

-- 3. how many male and female  Survived and dead
-- more male dead and more female survived

select  Sex ,Survived,count(*) as Totel from train
group by Sex,Survived
order by Survived;

-- 4. aprox 40% of survived people
select ((select count(Survived) from train group by Survived having Survived=1)/count(*))*100
as Survived_percentage from train;

-- 5. Check Null Values
-- -- i. No null Null Values in PassengerId
select count(PassengerId) from train where PassengerId is null;
-- -- ii. no null values in PassengerId  
select count(Survived) from train where Survived is null;

-- i think row drop that had null values

select count(*) from train where age is null;

-- 29.7 is Avg age of Passengers

select round(avg(Age),1) as avg_age from train;

-- count =113 Passenger that i not adult

select count(Age) as not_adult from train where Age <18;

-- Maximum and minimum Age

select max(Age),min(Age) from train;

-- Passengers count whose age >60

Select count(*) from train where age >60;

-- Passengers count whose   age <=60 and >=18

select count(*) from train where age between 17 and 61;

select *  from train;

-- count people classwise
select Pclass ,count(*) as Passengers  from train
group by Pclass;

-- %people classwise
select Pclass ,round(count(*)/714,2) as Percentage from train
group by Pclass;

-- count Gender Travling class wise

select Sex,Pclass,count(*) as Count from train
group by Sex,Pclass
order by Sex asc,Count desc;
select * from train;

-- create new columns Family =SibSp+Parch+1

select SibSp + Parch + 1 as Family from train ;

-- Count Passenger Whos Titel is Master

select count(*) from train
where Name like '%Master%';

-- Count Passenger Whos Titel is Miss

select count(*) from train
where Name like '%Miss%';

-- Count Passenger Whos Titel is Mrs
select count(*) from train
where Name like '%Mrs%';

-- Count Passenger Whos Titel is Mr
select count(*) from train
where Name like '%Mr%';

-- Count Passenger Whos Titel is not Mr,Master,Miss,Mrs

select count(*) from train
where Name not  like '%Mr%' and Name not  like '%Miss%' and  Name not  like '%Mrs%' and
Name not  like '%Master%';
select * from train;

-- Opps some Ticket are same

select count(distinct Ticket) from train;

 -- max and min,avg fare
 
 select max(Fare),min(Fare),avg(Fare) from train;
 
--  7 passengers whos travel with Fare 0
select count(*) from train where Fare=0;

-- 135 distinct embarked
select count(distinct  Cabin) from train;

-- Embarked
select distinct embarked from train;
-- Survived People by embarked
select Embarked ,count(*) as Totel from train
where Survived =1
group by Embarked;

--
select Sex,Survived,Embarked ,count(*) as Totel,avg(Age) as avg_age from train
group by Sex,Survived,Embarked
order by Sex,Survived;












