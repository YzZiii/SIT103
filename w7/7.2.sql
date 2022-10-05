use SIT103;

CREATE TABLE Customers
(
customer_id int,
name varchar(60),
address varchar(100),
phone_num varchar(20),
email varchar(20),
PRIMARY KEY (customer_id)
);            
 
CREATE TABLE Plans
(
plan_id int,
plan_name varchar(50),
data_speed int,
limit_data int,
cost decimal(6,2),
PRIMARY KEY (plan_id)
);

CREATE TABLE CustomerPlans
(
customerplan_id int,
customer_id int,
plan_id int,
decripition varchar(50),
PRIMARY KEY (customerplan_id),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
FOREIGN KEY (plan_id) REFERENCES Plans(plan_id)
);

CREATE TABLE Phones
(
phone_id int,
maker varchar(50),
phone_System varchar(50),
phone_storage int,
PRIMARY KEY (phone_id)
);

 
CREATE TABLE Orders
(
order_id int,
customer_id int,
total decimal(6,2),
order_date date,
PRIMARY KEY (order_id),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE PhoneOrder
(
phoneorder_id int,
order_id int,
phone_id int,
price decimal(6,2),
PRIMARY KEY (phoneorder_id),
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (phone_id) REFERENCES Phones(phone_id)
);

CREATE TABLE Returns
(
return_id int,
customer_id int,
order_id int,
return_reason varchar(50),
PRIMARY KEY(return_id),
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Payments
(
payment_id int,
order_id int,
customer_id int,
payment_method varchar(50),
PRIMARY KEY(payment_id),
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Invoices
(
invoice_id int,
payment_id int,
price decimal(6,2),
invoice_date date,
Invoices_tax varchar(50),
PRIMARY KEY(invoice_id),
FOREIGN KEY (payment_id) REFERENCES Payments(payment_id)
);

/* Customers row */
INSERT INTO Customers VALUES('1','Bryson','33 Thomas st,Hampton','0433937583','bryson@gmail.com');
INSERT INTO Customers VALUES('2','Amber','446 Elizabeth st, Melbourne','0428457482','amber@gmail.com');
INSERT INTO Customers VALUES('3','Tom','915 collins st','0423485984','tom@gmail.com');
INSERT INTO Customers VALUES('4','Yi','639 little lonsdale st','0433936599','yi@gmail.com');
INSERT INTO Customers VALUES('5','Yiu','200 Spencer st','0423435923','yiu@gmail.com');

select *
from Customers;


/* Plans row */
INSERT INTO Plans VALUES('201','Base plan ',' 20','40','58.9');
INSERT INTO Plans VALUES('202','Essential plan','50','180','68.9');
INSERT INTO Plans VALUES('203','Base plan', '20','40','59.9');
INSERT INTO Plans VALUES('204','Preminum plan','100','300','89.9');
INSERT INTO Plans VALUES('205','Premium plan','100','300','89.9');
select *
from Plans;

/* CustomersPlans row */
INSERT INTO CustomerPlans VALUES('301','1','201','No lock-in contract');
INSERT INTO CustomerPlans VALUES('302','3','203','No lock-in contract');
INSERT INTO CustomerPlans VALUES('303','5','205','No lock-in contract');
INSERT INTO CustomerPlans VALUES('304','4','204','No lock-in contract');
INSERT INTO CustomerPlans VALUES('305','2','202','No lock-in contract');

select *
from CustomerPlans;

/* Orders row */
INSERT INTO Orders VALUES('401','1','1323.3','2022-8-29');
INSERT INTO Orders VALUES('402','4','1523.3','2022-8-31');
INSERT INTO Orders VALUES('403','2','1523.3','2022-9-3');
INSERT INTO Orders VALUES('404','3','1323.3','2022-8-12');
INSERT INTO Orders VALUES('405','5','1423.3','2022-8-22');

select *
from Orders;

/* Phones row */
INSERT INTO Phones VALUES('1','iphone','ios','64');
INSERT INTO Phones VALUES('2','iphone','ios','128');
INSERT INTO Phones VALUES('3','Samsung','Android','256');
INSERT INTO Phones VALUES('4','iphone','ios','128');
INSERT INTO Phones VALUES('5','Samsung','Android','512');

select *
from Phones;

/* PhoneOrders row */
INSERT INTO PhoneOrder VALUES('101','401','1','859.9');
INSERT INTO PhoneOrder VALUES('102','402','2','1259.9');
INSERT INTO PhoneOrder VALUES('103','403','3','1459.9');
INSERT INTO PhoneOrder VALUES('104','404','4','1259.9');
INSERT INTO PhoneOrder VALUES('105','405','5','1859.9');

select *
from PhoneOrder;

/* Returns row */
INSERT INTO Returns VALUES('10','5','401','The customer ordered the wrong product or size');
INSERT INTO Returns VALUES('11','1','402','The merchant shipped the wrong product or size');
INSERT INTO Returns VALUES('12','2','403','The product was damaged or defective');
INSERT INTO Returns VALUES('13','4','404','The product arrived too late. ...');
INSERT INTO Returns VALUES('14','3','405','The product arrived too late. ...');

select *
from Returns;

/* Payments row */
INSERT INTO Payments VALUES('101','405','1','debit');
INSERT INTO Payments VALUES('102','403','4','debit');
INSERT INTO Payments VALUES('103','402','3','cash');
INSERT INTO Payments VALUES('104','401','2','debit');
INSERT INTO Payments VALUES('105','404','5','debit');

select *
from Payments;

/* Invoices row */
INSERT INTO Invoices VALUES('10001','101','1900','2022-8-29','50');
INSERT INTO Invoices VALUES('10002','102','1700','2022-8-21','90');
INSERT INTO Invoices VALUES('10003','103','2100','2022-8-27','100');
INSERT INTO Invoices VALUES('10004','104','1500','2022-8-28','60');
INSERT INTO Invoices VALUES('10005','105','1800','2022-8-26','30');

select *
from Invoices;