create database TravelOntheGo;
use TravelOntheGo;
create table PASSENGER(Passenger_name varchar(50),Category varchar(10),Gender varchar(2),
Boarding_City varchar(15),Destination_City varchar(15),Distance int,Bus_Type varchar(10));
create table PRICE(Bus_type varchar(10),Distance int,Price int);
insert PASSENGER values('Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper');
insert PASSENGER values('Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting');
insert PASSENGER values('Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper');
insert PASSENGER values('Khusboo','AC','F','Chennai','Mumbai',1500,'Sleeper');
insert PASSENGER values('Udit','on-AC','M','Trivandrum','Panaji',1000,'Sleeper');
insert PASSENGER values('Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting');
insert PASSENGER values('Hemant','Non-AC','M','Mumbai','Chennai',700,'Sleeper');
insert PASSENGER values('Manish','Non-AC','M','Bengaluru','Chennai',500,'Sitting');
insert PASSENGER values('Pirush','AC','M','Pune','Nagpur',700,'Sitting');
insert PASSENGER values('Ram','AC','M','Bengaluru','Chennai',350,'Sleeper');
insert PASSENGER values('Sita','AC','F','Mumbai','Chennai',700,'Sleeper');
truncate PASSENGER;
insert PRICE values('Sleeper',350,770);
insert PRICE values('Sleeper',500,1100);
insert PRICE values('Sleeper',600,1320);
insert PRICE values('Sleeper',700,1540);
insert PRICE values('Sleeper',1000,2200);
insert PRICE values('Sleeper',1200,2640);
insert PRICE values('Sleeper',1500,2770);
insert PRICE values('Sitting',500,620);
insert PRICE values('Sitting',600,744);
insert PRICE values('Sitting',700,868);
insert PRICE values('Sitting',1000,1240);
insert PRICE values('Sitting',1200,1488);
insert PRICE values('Sitting',1500,1860);
select * from PASSENGER;
#How many female and how many male passengers travelled for a min distance of 600 Kms
select Gender,count(Gender) from PASSENGER where distance>=600 and Gender = 'F';
select Gender,count(Gender) from PASSENGER where distance>=600 and Gender = 'M';
#Find the minimum ticket Price for Sleeper class
select min(Price)  from PRICE where Bus_Type='Sleeper';
#Select passenger names whose names start with Character 'S'
select Passenger_name from PASSENGER where Passenger_name like 'S%';
#6.Calculate price charged for each passenger displaying Passenger Name,Boarding City,Destination City,
 #      bus_type, Price in the output
 Select p.Passenger_Name,p.Boarding_City,p.Destination_City,p.Bus_type,PRICE.price 
 from PASSENGER as P,PRICE 
 where p.distance=PRICE.distance;
 #7.What are the passenger name/s, and his/her ticket Price who travelled in Sitting Bus for a distance of 1000kms
 select p.passenger_name,r.price from PASSENGER as p inner join PRICE as r on p.Distance=r.Distance
 where  p.distance>=500 and p.Bus_Type='Sitting'and r.bus_type=p.Bus_type;
#8.What will be the sitting and sleeper bus charge for Pallavi to travel from Bangalore to Panaji
select price,Bus_Type from PRICE where distance=
(select distance from PASSENGER where Passenger_name='Pallavi');
#9.List the distances from the Passenger table which are unique in decending order
select distinct distance from PASSENGER order by distance desc;
#10.display passenger name and percentage of distance travelled by the passenger from the 
#total distance travelled by all passengers without using user variable
select SUM(distance) as a from PASSENGER;
select Passenger_Name,distance/(select SUM(distance) as a from PASSENGER)*100 from PASSENGER;
#11.Display the distance,price in three categories in table PRICE
# a) Expensive if the cost is more than 1000
# b)Average cost if the cost is less than 1000 and greater than 500
# c)cheap otherwise
select distinct distance,price,
case 
 when price>1000 then 'expensive'
 when price<1000 and price>500 then 'Average'
 when price < 500 then 'cheap'
 END costtype
 from PRICE;
 