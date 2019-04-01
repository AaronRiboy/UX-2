CREATE TABLE Services(
serviceCode CHAR(5) PRIMARY KEY,
title VARCHAR(25) NOT NULL
);

INSERT INTO Services VALUES
('SV001','Medical Care'),
('SV002','Companionship'),
('SV003','Assisted Living'),
('SV004','Buying Grocery'),
('SV005','House Keeping'),
('SV006','Activities');

CREATE TABLE Users (
  username varchar(20) PRIMARY KEY,
  password varchar(40) NOT NULL,
  fullname varchar(60) NOT NULL,
  email varchar(50) NOT NULL,
  mobile int(15) NOT NULL,
  address varchar(255),
  user_type varchar(20) NOT NULL
);

INSERT INTO Users VALUES
('puikei', 'puikei123', 'Pui Kei', 'ass@gmail.com', 1234567, '', 'senior'),
('pura', 'puraveen123', 'puraveen kumar', 'assa@awqwq', 123456, '', 'service-provider'),
('purav', '123456789', 'Puraveen Kumar Nagarajan', 'swsw@fsnsn', 123232323, '', 'service-provider'),
('balaji', 'balaji9545', 'Puraveen Kumar', 'purav_kumar@live.com', 123456789, '', 'senior'),
('kumar', 'kumar12345', 'Puraveen Kumar', 'kumarbalaji@live.com', 1012920192, '', 'senior'),
('aaron', 'aaron123456', 'Aaron Kajenderan', 'Aaro_nriboy@gmail.com', 123512733, '', 'service-provider'),
('kajen', 'kajen12345', 'Aaron Kajenderan', 'Aaronriboy@gmail.com', 166248411, '', 'senior'),
('service', 'sp', 'Service Provider Name', 'service@gmail.com', 0123456789, '', 'service-provider');

CREATE TABLE Request(
ID INT(3) PRIMARY KEY AUTO_INCREMENT,
demander varchar(20) NOT NULL,
supplier varchar(20),
service CHAR(5) NOT NULL,
status VARCHAR(10) NOT NULL DEFAULT 'pending',
acquiredDate DATETIME NOT NULL,
requestCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
FOREIGN KEY (demander) REFERENCES Users(username),
FOREIGN KEY (supplier) REFERENCES Users(username),
FOREIGN KEY (service) REFERENCES Services(serviceCode)
);

ALTER TABLE Request AUTO_INCREMENT=101;

INSERT INTO Request (demander,service,acquiredDate) VALUES
('balaji','SV001','2019-04-12 15:25:00'),
('puikei','SV004','2019-04-12 13:25:00');

INSERT INTO Request (demander,supplier,service,status,acquiredDate) VALUES
('purav','service','SV003','completed','2019-03-12 18:25:00');


CREATE TABLE ProvidedServices(
provider varchar(20) NOT NULL,
service CHAR(5) NOT NULL,
FOREIGN KEY (provider) REFERENCES Users(username),
FOREIGN KEY (service) REFERENCES Services(serviceCode)
);

INSERT INTO ProvidedServices VALUES
('service','SV001'),
('service','SV003'),
('service','SV004'),
('service','SV006');

CREATE TABLE Reviews (
target varchar(255) NOT NULL,
request INT(3) NOT NULL,
rating INT(1) NOT NULL,
notes VARCHAR(255),
FOREIGN KEY (target) REFERENCES Users(username),
FOREIGN KEY (request) REFERENCES Request(ID)
);

INSERT INTO Reviews VALUES
('purav',103,4,''),
('service',103,5,'Great service!');