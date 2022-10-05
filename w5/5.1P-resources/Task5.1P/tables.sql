CREATE TABLE employee (
	employeeName CHAR(15) NOT NULL,
	street	CHAR(15),
	city	CHAR(10), 
	PRIMARY KEY (employeeName)
);

CREATE TABLE works(
	employeeName CHAR(15) NOT NULL,
	companyName CHAR(15) NOT NULL,
	salary NUMERIC(7),
	PRIMARY KEY (employeeName, companyName), 
	CHECK (salary >=0)
);

CREATE TABLE manages (
	employeeName CHAR(15) NOT NULL,
	managerName	CHAR(15), 
	PRIMARY KEY (employeeName)
);

CREATE TABLE company (
	companyName CHAR(15) NOT NULL,
	city	CHAR(10) NOT NULL,
	PRIMARY KEY (companyName, city)
);
