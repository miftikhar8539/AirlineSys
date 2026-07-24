CREATE DATABASE PakistanAirlineSystem;

use PakistanAirlineSystem;

/*Tables*/

CREATE TABLE Passenger (  
    Passengerid INT PRIMARY KEY,  
    F_Name VARCHAR(50),  
    L_Name VARCHAR(50),  
    DOB DATE,  
    Age INT,  
    Mobile_no VARCHAR(15),  
    Gender CHAR(1)  
);  


CREATE TABLE Airline (  
    Airline_name VARCHAR(50) PRIMARY KEY,  
    Contact_no VARCHAR(15)  
);



CREATE TABLE Flight (  
    Flight_no INT PRIMARY KEY,  
    Flight_name VARCHAR(50),  
    Arrival_time DATETIME,  
    Departure_time DATETIME,  
    Origin VARCHAR(50),  
    Destination VARCHAR(50),  
    Seat_available INT,  
    Airline_name VARCHAR(50),  
    FOREIGN KEY (Airline_name) REFERENCES Airline(Airline_name)  
);  


CREATE TABLE Class (  
    Class_type VARCHAR(20),  
    Fare DECIMAL(10, 2),  
    Flight_no INT,  
    PRIMARY KEY (Class_type, Flight_no),  
    FOREIGN KEY (Flight_no) REFERENCES Flight(Flight_no)  
);  


CREATE TABLE Ticket (  
    PNR_No INT PRIMARY KEY,  
    Flight_no INT,  
    Passengerid INT,  
    Seat_no VARCHAR(10),  
    Origin VARCHAR(50),  
    Destination VARCHAR(50),  
    Class_type VARCHAR(20),  
    Date_time DATETIME,  
    FOREIGN KEY (Flight_no) REFERENCES Flight(Flight_no),  
    FOREIGN KEY (Passengerid) REFERENCES Passenger(Passengerid),  
    FOREIGN KEY (Class_type, Flight_no) REFERENCES Class(Class_type, Flight_no)  
); 


drop table Payment;
CREATE TABLE Payment (  
    Transaction_ID INT PRIMARY KEY,  
    Payment_mode VARCHAR(20),  
    Amount DECIMAL(10, 2), 
	PNR_No INT ,
	FOREIGN KEY(PNR_No) REFERENCES Ticket (PNR_No)
); 

CREATE TABLE Country (  
    Country_code CHAR(3) PRIMARY KEY,  
    Country_name VARCHAR(50)  
);  


CREATE TABLE Airport (  
    Airport_code VARCHAR(10) PRIMARY KEY,  
    Airport_name VARCHAR(50),  
    City VARCHAR(50),  
    Country_code CHAR(3),  
    FOREIGN KEY (Country_code) REFERENCES Country(Country_code)  
);  

/*Insert into Passenger*/

INSERT INTO Passenger (Passengerid, F_Name, L_Name, DOB, Age, Mobile_no, Gender) VALUES  
(1, 'Ali', 'Ahmed', '1990-05-15', 34, '03001234567', 'M'),  
(2, 'Hamza', 'Khan', '1985-08-25', 38, '03017654321', 'F'),  
(3, 'Usman', 'Zafar', '1992-11-30', 31, '03219876543', 'M'),  
(4, 'Ammad', 'Hussain', '1995-03-10', 29, '03334567890', 'F');

/*Insert into Airline*/

INSERT INTO Airline (Airline_name, Contact_no) VALUES  
('Pakistan International Airlines', '111-786-786'),  
('AirBlue', '111-247-258'),  
('SereneAir', '111-737-363');

/*Insert into Flight*/

INSERT INTO Flight (Flight_no, Flight_name, Arrival_time, Departure_time, Origin, Destination, Seat_available, Airline_name) 
VALUES  
(101, 'PIA101', '2024-06-01 08:00:00', '2024-06-01 06:00:00', 'KHI', 'JFK', 150, 'Pakistan International Airlines'),  
(102, 'PIA102', '2024-06-01 10:00:00', '2024-06-01 10:00:00', 'LHE', 'LHR', 180, 'Pakistan International Airlines'),  
(201, 'AB201', '2024-06-01 13:00:00', '2024-06-01 13:00:00', 'ISB', 'DXB', 160, 'AirBlue'),  
(202, 'AB202', '2024-06-01 16:00:00', '2024-06-01 16:00:00', 'KHI', 'YYZ', 140, 'AirBlue'),  
(301, 'SA301', '2024-06-02 07:00:00', '2024-06-02 07:00:00', 'LHE', 'DXB', 170, 'SereneAir');

/*Insert into Class*/

INSERT INTO Class (Class_type, Fare, Flight_no) VALUES  
('Business', 100000.00, 101),  
('Economy', 55000.00, 102),  
('Business', 105000.00, 102),  
('Economy', 60000.00, 201),  
('Business', 110000.00, 201),  
('Economy', 45000.00, 202),  
('Business', 50000.00, 202),  
('Economy', 52000.00, 301),  
('Business', 102000.00, 301),
('Economy', 50000.00, 101);

/*Insert into Ticket*/

INSERT INTO Ticket (PNR_No, Flight_no, Passengerid, Seat_no, Origin, Destination, Class_type, Date_time) VALUES  
(1001, 101, 1, '12A', 'KHI', 'JFK', 'Economy', '2024-06-01 06:00:00'),  
(1002, 102, 1, '14B', 'LHE', 'LHR', 'Business', '2024-06-01 10:00:00'),  
(1003, 201, 3, '16C', 'ISB', 'DXB', 'Economy', '2024-06-01 13:00:00'),  
(1004, 202, 4, '18D', 'KHI', 'YYZ', 'Business', '2024-06-01 16:00:00');

/*Insert into Payment*/

INSERT INTO Payment (Transaction_ID, Payment_mode, Amount, PNR_No) VALUES  
(5001, 'Credit Card', 50000, 1001),  
(5002, 'Credit Card', 105000, 1002),  
(5003, 'Debit Card', 60000, 1003),  
(5004, 'Cash', 95000, 1004);

/*Insert into Country*/

INSERT INTO Country (Country_code, Country_name) VALUES  
('PAK', 'Pakistan'),  
('USA', 'United States'),  
('GBR', 'United Kingdom'),  
('UAE', 'United Arab Emirates'),  
('CAN', 'Canada');

/*Insert into Airport*/

INSERT INTO Airport (Airport_code, Airport_name, City, Country_code) VALUES  
('KHI', 'Jinnah International Airport', 'Karachi', 'PAK'),  
('LHE', 'Allama Iqbal International Airport', 'Lahore', 'PAK'),  
('ISB', 'Islamabad International Airport', 'Islamabad', 'PAK'),  
('JFK', 'John F. Kennedy International Airport', 'New York', 'USA');

/*Insert into Airline*/

INSERT INTO Airline (Airline_name, Contact_no) VALUES  
('Pakistan International Airlines', '111-786-786'),  
('AirBlue', '111-247-258'),  
('SereneAir', '111-737-363');

/*Avg*/
SELECT Class_type, AVG(Fare) AS Average_Fare  
FROM Class  
GROUP BY Class_type;

/*Count*/
SELECT Airline_name, COUNT(*) AS Flight_Count  
FROM Flight  
GROUP BY Airline_name;

/*Max*/
SELECT Class_type, MAX(Fare) AS Maximum_Fare  
FROM Class  
GROUP BY Class_type;

/*Min*/
SELECT Class_type, MIN(Fare) AS Minimum_Fare  
FROM Class  
GROUP BY Class_type;

/*Sum*/
SELECT SUM(Amount) AS Total_Payment  
FROM Payment;

/*Inner Joins*/
SELECT F.Flight_no, F.Flight_name, A.Airline_name, A.Contact_no  
FROM Flight F  
INNER JOIN Airline A ON F.Airline_name = A.Airline_name;

/*Left Join*/
SELECT P.Passengerid, P.F_Name, P.L_Name, T.PNR_No, T.Flight_no  
FROM Passenger P  
LEFT JOIN Ticket T ON P.Passengerid = T.Passengerid;

/*Right Join*/
SELECT F.Flight_no, F.Flight_name, C.Class_type, C.Fare  
FROM Flight F  
RIGHT JOIN Class C ON F.Flight_no = C.Flight_no;

/*Full outer Join*/
SELECT F.Flight_no, F.Flight_name, T.PNR_No, T.Passengerid  
FROM Flight F  
FULL OUTER JOIN Ticket T ON F.Flight_no = T.Flight_no;

/*Group by clause*/
SELECT Origin, SUM(Seat_available) AS Total_Seats  
FROM Flight  
GROUP BY Origin;

/*Order by clause*/
SELECT Passengerid, F_Name, L_Name  
FROM Passenger  
ORDER BY L_Name;

/*Having by clause*/
SELECT Airline_name, COUNT(*) AS Flight_Count  
FROM Flight  
GROUP BY Airline_name  
HAVING COUNT(*) > 1;

/*Stored Procedure*/

CREATE PROCEDURE SimpleProcedure  
AS  
BEGIN  
    SELECT 'Hello, World!' AS Message;  
END;

EXEC SimpleProcedure;


/*Procedure with input parameter*/
CREATE PROCEDURE GetPassengerById  
    @PassengerId INT  
AS  
BEGIN  
    SELECT * FROM Passenger WHERE Passengerid = @PassengerId;  
END;

EXEC GetPassengerById @PassengerId = 1;

/*Procedure with Output parameter*/
CREATE PROCEDURE GetFlightCountByAirline  
    @AirlineName VARCHAR(50),  
    @FlightCount INT OUTPUT  
AS  
BEGIN  
    SELECT @FlightCount = COUNT(*) FROM Flight WHERE Airline_name = @AirlineName;  
END;

DECLARE @Count INT;  
EXEC GetFlightCountByAirline @AirlineName = 'Pakistan International Airlines', @FlightCount = @Count OUTPUT;  
SELECT @Count AS TotalFlights;

/*Creating login and user*/
-- Login  
CREATE LOGIN NewUser WITH PASSWORD = 'Password123';  

--Database User  
USE PakistanAirlineSystem;   
CREATE USER NewUser FOR LOGIN NewUser;

/*Grantong Privilage*/
GRANT SELECT, INSERT, UPDATE, DELETE ON Passenger TO NewUser;

/*Views*/

--Simple view
CREATE VIEW vv_Passengers AS  
SELECT * FROM Passenger;

--Regular view
CREATE VIEW v_FlightInfo AS  
SELECT Flight_no, Flight_name FROM Flight;

--Partitioned view
CREATE VIEW v_PassengerPartitioned AS  
SELECT * FROM Passenger WHERE Age < 30  
UNION ALL  
SELECT * FROM Passenger WHERE Age >= 30;

--Materialized view
CREATE VIEW vv_MaterializedView WITH SCHEMABINDING AS  
SELECT Airline_name, COUNT(*) AS FlightCount  
FROM Flight  
GROUP BY Airline_name;

-- System view
  
SELECT * FROM sys.databases;

--Dynamic view
CREATE VIEW v_Dynamic AS  
SELECT * FROM Flight WHERE Airline_name = 'AirBlue';

/*Triggers*/

--Insert Operations
CREATE TRIGGER trg_InsertPassenger  
ON Passenger  
AFTER INSERT  
AS  
BEGIN  
    PRINT 'A new passenger has been added:';  
    SELECT * FROM inserted; -- Display the newly added passenger details  
END;

--Update Operations
CREATE TRIGGER trg_UpdatePassenger  
ON Passenger  
AFTER UPDATE  
AS  
BEGIN  
    PRINT 'Passenger information has been updated:';  
    SELECT * FROM inserted; -- Display the updated passenger details  
END;

--Delete Operations
CREATE TRIGGER trg_DeletePassenger  
ON Passenger  
AFTER DELETE  
AS  
BEGIN  
    PRINT 'A passenger has been deleted:';  
    SELECT * FROM deleted; -- Display the details of the deleted passenger  
END;


/*Indexes*/

--Single column index
CREATE INDEX idx_PassengerName ON Passenger (F_Name);

--Composite index
CREATE INDEX idx_FlightDestination ON Flight (Origin, Destination);

--Unique index
CREATE UNIQUE INDEX idx_UniqueMobile ON Passenger (Mobile_no);

--Full-text index
CREATE FULLTEXT INDEX ON Passenger (F_Name)   
KEY INDEX PK_Passenger; 

--Clustered index
CREATE CLUSTERED INDEX idx_ClusteredFlight ON Flight (Flight_no);

--Non-clustered index
CREATE NONCLUSTERED INDEX idx_NonClusteredAirline ON Flight (Airline_name);


/*Stored Procedure*/
/*Stored Procedure*/








 

