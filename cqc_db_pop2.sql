#This file is a sample for how we might code our dbms

#Tables
DROP DATABASE IF EXISTS Curbside;
CREATE DATABASE IF NOT EXISTS Curbside;
USE Curbside;

#
# Table structure for table 'CUSTOMER'
#

DROP TABLE IF EXISTS EMPLOYEE;

#Employee
CREATE TABLE EMPLOYEE (
	EmployeeID varchar(4) not null, 
    Name varchar(10),
    storeID varchar(4), 
    phone int,
    email varchar(20),
    PRIMARY KEY (`EmployeeID`),
    INDEX (`EmployeeID`)
);

#Order Details
CREATE TABLE OrderDetails (
	OrderID INT NOT NULL AUTO_INCREMENT,
    CustID int,
    timePlaced timestamp,
    timeAssembled timestamp,
    prepperEmployeeID varchar(4),
    timeDelivered timestamp,
    delivererEmployeeID varchar(4),
    state varchar(10),
    storeID varchar(4),
    PRIMARY KEY (OrderID),
    Index (OrderID)
);

CREATE TABLE Customer(
	CustID int not null auto_increment,
    custName varchar(10),
    phone varchar(10),
    laneNum int,
	Primary Key (CustID),
    INDEX (CustID)
);


#Product List
CREATE TABLE Product(
	# storeID varchar(4),
    UPC varchar(12) not null,
    details varchar(50),
    storageType varchar(20),
    Primary Key (UPC),
    INDEX (UPC)
);

#Order Items
CREATE TABLE OrderItems(
	OrderID int not null,
    stageID int,
    lineNumber int,
    UPC varchar(12),
    quantityOrdered int,
    quantitySupplied int,
    Index (OrderID),
	PRIMARY KEY (OrderID, lineNumber),
    FOREIGN KEY (OrderID) REFERENCES OrderDetails(OrderID),
    FOREIGN KEY (UPC) REFERENCES Product(UPC)
);

#Store
CREATE TABLE Store(
	storeID varchar(4) not null,
    address varchar(50),
    Primary Key (storeID),
    INDEX (storeID)
);

#Product Inventory
CREATE TABLE Inventory(
	UPC varchar(12) not null,
	storeID varchar(4) not null,
    location varchar(4),
    quantity int,
    Primary Key (storeID, UPC),
    INDEX (storeID, UPC),
	Foreign Key (storeID) REFERENCES Store(storeID),
    Foreign Key (UPC) REFERENCES Product(UPC)
);

# Store insert
INSERT INTO Store (storeID, `address`) VALUES ('1001', '11675 FM 2154 College Station, TX 77845-4737');
INSERT INTO Store (storeID, `address`) VALUES ('1002', '725 E Villa Maria Rd College Station, TX 77802');
INSERT INTO Store (storeID, `address`) VALUES ('1003', '1900 Texas Ave S College Station, TX 77840');

#INSERT INTO Orders ()

# Nate and Gabes Employee Table

INSERT INTO Employee(employeeID, Name, storeID, phone, email) VALUES ('1007', 'Shaggy', '1002',  1112223333, 'shaggy@gmail.com');
INSERT INTO Employee(employeeID, Name, storeID, phone, email) VALUES ('1008', 'Velma', '1002',  1212223333, 'Velma@gmail.com');
INSERT INTO Employee(employeeID, Name, storeID, phone, email) VALUES ('1009', 'Daphne', '1003',  1312223333, 'Daphne@gmail.com');
INSERT INTO Employee(employeeID, Name, storeID, phone, email) VALUES ('1010', 'Fred', '1003', 1412223333, 'Fred@gmail.com');
INSERT INTO Employee(employeeID, Name, storeID, phone, email) VALUES ('1011', 'Scooby', '1003', 1512223333, 'Scooby@gmail.com');
INSERT INTO Employee(employeeID, Name, storeID, phone, email) VALUES ('1012', 'Scrappy', '1003', 1612223333, 'Scrappy@gmail.com');

# Eduardo and Estela's Customer Data works

INSERT INTO Customer (custName, phone, laneNum) VALUES ('Justin Mal', '5135312966', 1);
INSERT INTO Customer (custName, phone, laneNum) VALUES ('Betty Mary', '2704033875', 3);
INSERT INTO Customer (custName, phone, laneNum) VALUES ('Adriana Ma', '7083342554', 2);
INSERT INTO Customer (custName, phone, laneNum) VALUES ('Ben Swartz', '3396584429', 4);
INSERT INTO Customer (custName, phone, laneNum) VALUES ('Miguel Lui', '3808669886', 3);
INSERT INTO Customer (custName, phone, laneNum) VALUES ('Tyler Chas', '2535035422', 5);
INSERT INTO Customer (custName, phone, laneNum) VALUES ('Emma Willo', '7406135089', 1);
INSERT INTO Customer (custName, phone, laneNum) VALUES ('Juan Alerr', '3163392600', 6);
INSERT INTO Customer (custName, phone, laneNum) VALUES ('Lucy Lee', '2604942514', 5);
INSERT INTO Customer (custName, phone, laneNum) VALUES ('Maria Hern', '2539894234', 4);


# Dan, Ingrid, Joshua, Antony

Insert into product(UPC, details, storageType)Values("041220954957", "Original Flour Tortillas 20ct Bag", "Dry");
Insert into product(UPC, details, storageType)Values("001217610010", "8/28oz. COLOSSAL BEEF HOT SAUSAGE. ", "Refrigerated");
Insert into product(UPC, details, storageType)Values("889698492645", "Lays Potato Chips, Classic, 8 oz", "Dry");
Insert into product(UPC, details, storageType)Values("004122010249", "Organics Green Peas 16 oz", "Refigerated");
Insert into product(UPC, details, storageType)Values("001600016166", "BC R&C creamy White", "Frozen");
Insert into product(UPC, details, storageType)Values("002850013502", "Lucky leaf red tart cherries", "Frozen");
Insert into product(UPC, details, storageType)Values("004161700220","Rum baking powder" "Refigerated","Dry");

Insert into product(UPC, details, storageType) Values ("605806000324", "Stalks of Celery", "Refrigerated");
Insert into product(UPC, details, storageType) Values ("024000162865", "Del Monte French Cut Green Beans", "Dry");
Insert into product(UPC, details, storageType) Values ("072250037129", "Nature's Own Honey Wheat Bread", "Dry");
Insert into product(UPC, details, storageType) Values ("017400118051", "Minute Instant Rice", "Dry");
Insert into product(UPC, details, storageType) Values ("021000626793", "Kraft Cheeze Wiz Dip", "Dry");

insert into Product(UPC, details, storageType) values ('021000044719', 'Kraft Mozzarella String Cheese 20oz/24ct', 'Refrigerated');
insert into Product(UPC, details, storageType) values ('047677483088', 'M&Ms Vanilla Ice Cream Cookie Sandwich 4 fl oz', 'Frozen');
insert into Product(UPC, details, storageType) values ('013800103215', 'Stouffers Lasagna 10.50oz', 'Frozen');
insert into Product(UPC, details, storageType) values ('752907606211', 'Lean Ground Beef 1lb', 'Refrigerated');
insert into Product(UPC, details, storageType) values ('023700014108', 'Tyson Chicken Strips 25oz', 'Frozen');

INSERT INTO PRODUCT (UPC, DETAILS, STORAGETYPE) VALUES ('363121914816', 'HEB Organics Apple Juice 6.75 oz Boxes 4 pk', 'Dry');
INSERT INTO PRODUCT (UPC, DETAILS, STORAGETYPE) VALUES ('697177905052', 'HEB No Pulp Orange Juice 52 oz', 'Refrigerated');
INSERT INTO PRODUCT (UPC, DETAILS, STORAGETYPE) VALUES ('536123177579', 'HEB Wild Red Soda 12 oz Cans 12 pk', 'Dry');
INSERT INTO PRODUCT (UPC, DETAILS, STORAGETYPE) VALUES ('541675356577', 'HEB Diet Twist Lemon Lime Soda 12 oz Cans 12 pk', 'Dry');
INSERT INTO PRODUCT (UPC, DETAILS, STORAGETYPE) VALUES ('818402766801', 'CocaCola Mexican Coke 12 oz Glass Bottles 4 pk', 'Dry');
INSERT INTO PRODUCT (UPC, DETAILS, STORAGETYPE) VALUES ('967871416068', 'Hill Country Fare Mixed Berry Sports Drink 32 oz', 'Dry');
INSERT INTO PRODUCT (UPC, DETAILS, STORAGETYPE) VALUES ('775158577866', 'HEB BBQ Pork Loin Chops Avg 2.22 lbs', 'Refrigerated');
INSERT INTO PRODUCT (UPC, DETAILS, STORAGETYPE) VALUES ('503459500936', 'HEB Fish Market Shrimp Cocktail 8 oz', 'Refrigerated');
INSERT INTO PRODUCT (UPC, DETAILS, STORAGETYPE) VALUES ('970396559077', 'HEB Ground Chuck Beef 80% Lean 1 lb', 'Refrigerated');
INSERT INTO PRODUCT (UPC, DETAILS, STORAGETYPE) VALUES ('571798661327', 'Pillsbury Original Crescent Dinner Rolls 8 ct', 'Refrigerated');

# Dylan and Karishma (will do in class)
-- Example Insert:
-- INSERT INTO OrderItems (OrderID, LineNumber, ProductUPC, QuantityOrdered, QuantitySupplied) VALUES (101, 1, '012345678912', 5, 5);

-- ORDER #1 (101):  
-- Justin Mal Orders 
-- (1x) HEB Organics Apple Juice 6.75 oz Boxes 4 pk, 
-- (1x) HEB No Pulp Orange Juice 52 oz in line #1, 
-- Prepper: Shaggy, 
-- Deliverer: Shaggy
-- Location: 11675 FM 2154 College Station, TX 77845-4737

-- ORDER #1 (101):
INSERT INTO OrderDetails (CustID, timePlaced, timeAssembled, prepperEmployeeID, timeDelivered, delivererEmployeeID, state, storeID) 
VALUES (1, now(), null, null, null, null, 'Incomplete', '1001');
# Order 1 is populated
INSERT INTO OrderItems (OrderID, stageID, lineNumber, UPC, quantityOrdered, quantitySupplied) VALUES (1, 1, 1,'363121914816', 1, null); # item one
INSERT INTO OrderItems (OrderID, stageID, lineNumber, UPC, quantityOrdered, quantitySupplied) VALUES (1, 1, 2,'697177905052', 1, null); # item two

-- ORDER #2 (102): 
insert into orderDetails(custId, timePlaced, timeAssembled, prepperEmployeeID, timeDelivered, delivererEmployeeId, state, storeID) values
(2, now(), null, null, null, null,'Incomplete', '1002');
# populate order two
Insert into orderitems (orderID, stageID, lineNumber, upc, quantityordered, quantitysupplied)values(2, 2, 1, '021000626793', 5, null); # item one
Insert into orderitems (orderID, stageID, lineNumber, upc, quantityordered, quantitysupplied)values(2, 2, 2, '017400118051', 5, null); # item two




-- Examples
-- INSERT INTO OrderItems (OrderID, LineNumber, ProductUPC, QuantityOrdered, QuantitySupplied) VALUES (101, 1, '697177905052', 1, 0);



-- INSERT INTO OrderDetails (OrderID, CustomerID, CompletionTime, SubmissionTime, PrepperID, DelivererID, Status, StoreID) 
-- VALUES (101, 'C1234', '2022-11-15 14:00:00', '', 'E1234', 'E5678', 'Completed', 'S001');

# example of insert statements in mysql
/*
INSERT INTO `CUSTOMER` (`CUSTNUM`, `CUSTNAME`, `SPNUM`, `HQCITY`) VALUES (839, 'Jane\'s Stores', 186, 'Chicago');
INSERT INTO `CUSTOMER` (`CUSTNUM`, `CUSTNAME`, `SPNUM`, `HQCITY`) VALUES (933, 'ABC Home Stores', 137, 'Los Angeles');
INSERT INTO `CUSTOMER` (`CUSTNUM`, `CUSTNAME`, `SPNUM`, `HQCITY`) VALUES (1047, 'Acme Hardware Store', 137, 'Los Angeles');
INSERT INTO `CUSTOMER` (`CUSTNUM`, `CUSTNAME`, `SPNUM`, `HQCITY`) VALUES (1525, 'Fred\'s Tool Stores', 361, 'Atlanta');
INSERT INTO `CUSTOMER` (`CUSTNUM`, `CUSTNAME`, `SPNUM`, `HQCITY`) VALUES (1700, 'XYZ Stores', 361, 'Washington');
INSERT INTO `CUSTOMER` (`CUSTNUM`, `CUSTNAME`, `SPNUM`, `HQCITY`) VALUES (1826, 'City Hardware', 137, 'New York');
INSERT INTO `CUSTOMER` (`CUSTNUM`, `CUSTNAME`, `SPNUM`, `HQCITY`) VALUES (2198, 'Western Hardware', 204, 'New York');
INSERT INTO `CUSTOMER` (`CUSTNUM`, `CUSTNAME`, `SPNUM`, `HQCITY`) VALUES (2267, 'Central Stores', 186, 'New York');
*/
-- Location 1001
 
INSERT INTO `Inventory` ( `UPC`, `storeID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '605806000324'), (select storeID from store where storeID = '1001'), 'A5S2', 20);	
INSERT INTO `Inventory` ( `UPC`, `storeID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '024000162865'), (select storeID from store where storeID = '1001'), 'A1S3', 18);
INSERT INTO `Inventory` ( `UPC`, `storeID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '072250037129'), (select storeID from store where storeID = '1001'), 'A1S6', 19);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '017400118051'), (select storeID from store where storeID = '1001'), 'A2S3', 17);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '021000626793'), (select storeID from store where storeID = '1001'), 'A2S4', 16);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '021000044719'), (select storeID from store where storeID = '1001'), 'A6S1', 17);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '047677483088'), (select storeID from store where storeID = '1001'), 'A8S1', 25);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '013800103215'), (select storeID from store where storeID = '1001'), 'A8S2', 15);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '752907606211'), (select storeID from store where storeID = '1001'), 'A6S3', 9 );
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '023700014108'), (select storeID from store where storeID = '1001'), 'A9S5', 13);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '363121914816'), (select storeID from store where storeID = '1001'), 'A4S3', 24);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '697177905052'), (select storeID from store where storeID = '1001'), 'A7S5', 22);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '536123177579'), (select storeID from store where storeID = '1001'), 'A3S1', 25);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '541675356577'), (select storeID from store where storeID = '1001'), 'A4S2', 28);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '818402766801'), (select storeID from store where storeID = '1001'), 'A3S5', 24);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '967871416068'), (select storeID from store where storeID = '1001'), 'A3S5', 27);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '775158577866'), (select storeID from store where storeID = '1001'), 'A7S2', 21);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '503459500936'), (select storeID from store where storeID = '1001'), 'A6S3', 20);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '970396559077'), (select storeID from store where storeID = '1001'), 'A5S3', 25);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '571798661327'), (select storeID from store where storeID = '1001'), 'A6S3', 21);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '041220954957'), (select storeID from store where storeID = '1001'), 'A1S3', 24);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '001217610010'), (select storeID from store where storeID = '1001'), 'A7S2', 26);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '889698492645'), (select storeID from store where storeID = '1001'), 'A4S2', 25);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '004122010249'), (select storeID from store where storeID = '1001'), 'A7S3', 20);


-- Location 1002

INSERT INTO `Inventory` ( `UPC`, `storeID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '605806000324'), (select storeID from store where storeID = '1002'), 'A5S1', 17);	
INSERT INTO `Inventory` ( `UPC`, `storeID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '024000162865'), (select storeID from store where storeID = '1002'), 'A2S3', 22);
INSERT INTO `Inventory` ( `UPC`, `storeID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '072250037129'), (select storeID from store where storeID = '1002'), 'A1S3', 16);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '017400118051'), (select storeID from store where storeID = '1002'), 'A2S2', 18);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '021000626793'), (select storeID from store where storeID = '1002'), 'A2S4', 20);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '021000044719'), (select storeID from store where storeID = '1002'), 'A6S2', 26);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '047677483088'), (select storeID from store where storeID = '1002'), 'A7S2', 29);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '013800103215'), (select storeID from store where storeID = '1002'), 'A9S1', 12);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '752907606211'), (select storeID from store where storeID = '1002'), 'A6S2', 25);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '023700014108'), (select storeID from store where storeID = '1002'), 'A9S4', 24);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '363121914816'), (select storeID from store where storeID = '1002'), 'A3S6', 24);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '697177905052'), (select storeID from store where storeID = '1002'), 'A7S6', 22);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '536123177579'), (select storeID from store where storeID = '1002'), 'A2S2', 25);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '541675356577'), (select storeID from store where storeID = '1002'), 'A4S4', 16);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '818402766801'), (select storeID from store where storeID = '1002'), 'A3S2', 20);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '967871416068'), (select storeID from store where storeID = '1002'), 'A3S4', 25);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '775158577866'), (select storeID from store where storeID = '1002'), 'A6S4', 26);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '503459500936'), (select storeID from store where storeID = '1002'), 'A6S2', 26);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '970396559077'), (select storeID from store where storeID = '1002'), 'A5S5', 28);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '571798661327'), (select storeID from store where storeID = '1002'), 'A6S3', 27);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '041220954957'), (select storeID from store where storeID = '1002'), 'A1S5', 19);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '001217610010'), (select storeID from store where storeID = '1002'), 'A8S3', 26);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '889698492645'), (select storeID from store where storeID = '1002'), 'A4S1', 25);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '004122010249'), (select storeID from store where storeID = '1002'), 'A9S2', 18);

-- Location 1003

INSERT INTO `Inventory` ( `UPC`, `storeID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '605806000324'), (select storeID from store where storeID = '1003'), 'A7S2', 20);	
INSERT INTO `Inventory` ( `UPC`, `storeID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '024000162865'), (select storeID from store where storeID = '1003'), 'A2S3', 18);
INSERT INTO `Inventory` ( `UPC`, `storeID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '072250037129'), (select storeID from store where storeID = '1003'), 'A2S6', 19);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '017400118051'), (select storeID from store where storeID = '1003'), 'A1S4', 17 );
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '021000626793'), (select storeID from store where storeID = '1003'), 'A4S5', 16 );
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '021000044719'), (select storeID from store where storeID = '1003'), 'A5S3', 17 );
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '047677483088'), (select storeID from store where storeID = '1003'), 'A8S2', 25 );
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '013800103215'), (select storeID from store where storeID = '1003'), 'A9S1', 15);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '752907606211'), (select storeID from store where storeID = '1003'), 'A6S4', 9 );
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '023700014108'), (select storeID from store where storeID = '1003'), 'A9S1', 13);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '363121914816'), (select storeID from store where storeID = '1003'), 'A3S3', 24);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '697177905052'), (select storeID from store where storeID = '1003'), 'A6S4', 22);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '536123177579'), (select storeID from store where storeID = '1003'), 'A2S5', 25);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '541675356577'), (select storeID from store where storeID = '1003'), 'A3S6', 18);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '818402766801'), (select storeID from store where storeID = '1003'), 'A2S3', 14);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '967871416068'), (select storeID from store where storeID = '1003'), 'A4S2', 17);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '775158577866'), (select storeID from store where storeID = '1003'), 'A6S6', 21);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '503459500936'), (select storeID from store where storeID = '1003'), 'A5S3', 20);
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '970396559077'), (select storeID from store where storeID = '1003'), 'A7S6', 15 );
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '571798661327'), (select storeID from store where storeID = '1003'), 'A6S3', 11 );
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '041220954957'), (select storeID from store where storeID = '1003'), 'A1S2', 14 );
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '001217610010'), (select storeID from store where storeID = '1003'), 'A6S1', 16 );
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '889698492645'), (select storeID from store where storeID = '1003'), 'A2S2', 15 );
INSERT INTO `Inventory` ( `UPC`, `StoreID`, `location`, `quantity`) VALUES ((select UPC from product where upc = '004122010249'), (select storeID from store where storeID = '1003'), 'A6S1', 10 );