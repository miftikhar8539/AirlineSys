# ✈️ Pakistan Airline System

![SQL](https://img.shields.io/badge/Database-Microsoft_SQL_Server-red?style=flat&logo=microsoftsqlserver)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

## 📋 Overview

**Pakistan Airline System** is a comprehensive airline database management system built using **Microsoft SQL Server**. It manages all aspects of airline operations including passenger records, flight schedules, ticket bookings, payments, and airport information.

### Key Highlights
- ✅ Complete database schema (8 tables)
- ✅ Sample data for testing
- ✅ Complex queries (JOINs, GROUP BY, HAVING, ORDER BY)
- ✅ Stored Procedures with input/output parameters
- ✅ Views (Simple, Regular, Partitioned, Materialized)
- ✅ Triggers (INSERT, UPDATE, DELETE)
- ✅ Indexes (Single, Composite, Unique, Full-text, Clustered)
- ✅ User management & privileges

---

## 🗄️ Database Schema

**Database Name:** `PakistanAirlineSystem`

### Tables Structure

| Table | Description |
|-------|-------------|
| **Passenger** | Passenger personal information (ID, name, DOB, age, mobile, gender) |
| **Airline** | Airline companies with contact details |
| **Flight** | Flight schedule (number, name, times, origin, destination, seats) |
| **Class** | Ticket classes (Business/Economy) with fare prices |
| **Ticket** | Booked tickets (PNR, seat number, passenger details) |
| **Payment** | Payment transactions (mode, amount) |
| **Country** | Country codes and names |
| **Airport** | Airport details (code, name, city, country) |

### Entity Relationship Diagram
┌──────────┐ ┌──────────┐ ┌──────────┐
│Passenger │────▶│ Ticket │◀────│ Flight │
├──────────┤ ├──────────┤ ├──────────┤
│Passengerid│ │PNR_No │ │Flight_no │
│F_Name │ │Seat_no │ │Flight_name│
│L_Name │ │Class_type│ │Origin │
│DOB │ │Date_time │ │Destination│
│Age │ └──────────┘ │Airline_name│
│Mobile_no │ │ └──────────┘
│Gender │ │ │
└──────────┘ │ │
▼ ▼
┌──────────┐ ┌──────────┐
│ Payment │ │ Airline │
├──────────┤ ├──────────┤
│Transact_ID│ │Airline_name│
│Payment_mode│ │Contact_no│
│Amount │ └──────────┘
└──────────┘
│
▼
┌──────────┐ ┌──────────┐
│ Class │ │ Airport │
├──────────┤ ├──────────┤
│Class_type│ │Airport_code│
│Fare │ │Airport_name│
│Flight_no │ │City │
└──────────┘ │Country_code│
│ └──────────┘
│ │
│ ▼
│ ┌──────────┐
│ │ Country │
│ ├──────────┤
│ │Country_code│
└──────▶│Country_name│
└──────────┘

text

---

## 📊 Sample Data

### Passengers
| Passengerid | F_Name | L_Name | Age | Gender |
|-------------|--------|--------|-----|--------|
| 1 | Ali | Ahmed | 34 | M |
| 2 | Hamza | Khan | 38 | F |
| 3 | Usman | Zafar | 31 | M |
| 4 | Ammad | Hussain | 29 | F |

### Airlines
| Airline_name | Contact_no |
|--------------|------------|
| Pakistan International Airlines | 111-786-786 |
| AirBlue | 111-247-258 |
| SereneAir | 111-737-363 |

### Flights
| Flight_no | Flight_name | Origin | Destination | Seats |
|-----------|-------------|--------|-------------|-------|
| 101 | PIA101 | KHI | JFK | 150 |
| 102 | PIA102 | LHE | LHR | 180 |
| 201 | AB201 | ISB | DXB | 160 |
| 202 | AB202 | KHI | YYZ | 140 |
| 301 | SA301 | LHE | DXB | 170 |

---

## 📝 Key Queries & Features

### Aggregate Functions
```sql
-- Average fare by class
SELECT Class_type, AVG(Fare) AS Average_Fare FROM Class GROUP BY Class_type;

-- Flight count by airline
SELECT Airline_name, COUNT(*) AS Flight_Count FROM Flight GROUP BY Airline_name;

-- Total payments
SELECT SUM(Amount) AS Total_Payment FROM Payment;
Joins
sql
-- Inner Join: Flight with Airline
SELECT F.Flight_no, F.Flight_name, A.Airline_name 
FROM Flight F INNER JOIN Airline A ON F.Airline_name = A.Airline_name;

-- Left Join: Passenger with Ticket
SELECT P.Passengerid, P.F_Name, T.PNR_No 
FROM Passenger P LEFT JOIN Ticket T ON P.Passengerid = T.Passengerid;
Stored Procedures
sql
-- Simple procedure
CREATE PROCEDURE SimpleProcedure AS BEGIN SELECT 'Hello, World!' AS Message; END;

-- With input parameter
CREATE PROCEDURE GetPassengerById @PassengerId INT AS BEGIN SELECT * FROM Passenger WHERE Passengerid = @PassengerId; END;

-- With output parameter
CREATE PROCEDURE GetFlightCountByAirline @AirlineName VARCHAR(50), @FlightCount INT OUTPUT AS BEGIN SELECT @FlightCount = COUNT(*) FROM Flight WHERE Airline_name = @AirlineName; END;
Triggers
sql
-- Insert trigger
CREATE TRIGGER trg_InsertPassenger ON Passenger AFTER INSERT AS BEGIN PRINT 'A new passenger has been added:'; SELECT * FROM inserted; END;

-- Update trigger
CREATE TRIGGER trg_UpdatePassenger ON Passenger AFTER UPDATE AS BEGIN PRINT 'Passenger information has been updated:'; SELECT * FROM inserted; END;

-- Delete trigger
CREATE TRIGGER trg_DeletePassenger ON Passenger AFTER DELETE AS BEGIN PRINT 'A passenger has been deleted:'; SELECT * FROM deleted; END;
Views
sql
-- Simple view
CREATE VIEW vv_Passengers AS SELECT * FROM Passenger;

-- Materialized view
CREATE VIEW vv_MaterializedView WITH SCHEMABINDING AS SELECT Airline_name, COUNT(*) AS FlightCount FROM Flight GROUP BY Airline_name;
Indexes
sql
-- Single column index
CREATE INDEX idx_PassengerName ON Passenger (F_Name);

-- Composite index
CREATE INDEX idx_FlightDestination ON Flight (Origin, Destination);

-- Full-text index
CREATE FULLTEXT INDEX ON Passenger (F_Name) KEY INDEX PK_Passenger;
💻 Installation
Prerequisites
Microsoft SQL Server (2016+)

SQL Server Management Studio (SSMS)

OR any SQL client (Azure Data Studio, DBeaver, etc.)

Step-by-Step Setup
sql
-- 1. Open SQL Server Management Studio
-- 2. Connect to your SQL Server instance
-- 3. Run the entire SQL file

-- Option 1: Execute the whole file
-- Open "Airline system.sql" in SSMS and click Execute (F5)

-- Option 2: Run specific parts
-- Copy and paste individual commands into SSMS

-- 4. Verify the database
USE PakistanAirlineSystem;
SELECT * FROM Passenger;
SELECT * FROM Flight;
SELECT * FROM Ticket;
Quick Setup Commands
sql
-- Check if database exists
IF DB_ID('PakistanAirlineSystem') IS NOT NULL 
    DROP DATABASE PakistanAirlineSystem;

-- Create and use database
CREATE DATABASE PakistanAirlineSystem;
USE PakistanAirlineSystem;

-- Run all CREATE TABLE, INSERT, and other statements
-- (Copy everything from the SQL file)
🎯 Features Implemented
Core Features
✅ CRUD Operations - Create, Read, Update, Delete for all tables

✅ Passenger Management - Register and manage passengers

✅ Flight Scheduling - Add, update, and track flights

✅ Ticket Booking - Book tickets with PNR numbers

✅ Payment Processing - Track payments (Credit Card, Debit Card, Cash)

Advanced SQL Features
✅ Aggregate Functions - AVG, COUNT, MAX, MIN, SUM

✅ JOINs - Inner, Left, Right, Full Outer

✅ GROUP BY with HAVING - Filter grouped results

✅ ORDER BY - Sort results

✅ Stored Procedures - With input/output parameters

✅ Triggers - For INSERT, UPDATE, DELETE operations

✅ Views - Simple, Regular, Partitioned, Materialized, Dynamic

✅ Indexes - Single, Composite, Unique, Full-text, Clustered

✅ User Management - Create login, user, and grant privileges

📁 File Structure
text
airline-database-system/
│
├── Airline system.sql        # Complete SQL file (schema + data + queries)
│
└── README.md                 # This file
🚀 Future Enhancements
Web Interface - PHP/HTML frontend for CRUD operations

Online Booking - Real-time seat availability checking

Email Integration - Send booking confirmations

Mobile App - React Native / Flutter

Reporting - Generate PDF reports for bookings

Payment Gateway - Integrate with Stripe/PayPal

👨‍💻 Developer
Muhammad Iftikhar	
Date: June 2024

📄 License
This project is developed for academic purposes. All rights reserved.

⭐ Star this repo if you found it helpful!
