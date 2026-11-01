DROP DATABASE IF EXISTS Theatre;
CREATE  DATABASE Theatre;
USE Theatre;

CREATE TABLE Theatre (
Theatre_ID INT PRIMARY KEY,
Theatre_Name VARCHAR (100),
Location VARCHAR (100),
Contact VARCHAR (15)
);

CREATE TABLE Screen (
Screen_ID INT PRIMARY KEY,
Screen_Type VARCHAR (50),
Theatre_ID INT,
FOREIGN KEY (Theatre_ID)
REFERENCES Theatre (Theatre_ID)
);

CREATE TABLE Movie (
Movie_ID INT PRIMARY KEY,
Title VARCHAR (100),
Genre VARCHAR (50),
Duration INT
);

CREATE TABLE ShowDetails (
Show_ID INT PRIMARY KEY,
Show_Time DATETIME,
Screen_ID INT,
Movie_ID INT,
FOREIGN KEY (Screen_ID)
REFERENCES Screen (Screen_ID),
FOREIGN KEY (Movie_ID)
REFERENCES Movie (Movie_ID)
);

CREATE TABLE Seat (
Seat_No INT PRIMARY KEY,
Seat_Type VARCHAR (50),
Screen_ID INT,
FOREIGN KEY (Screen_ID)
REFERENCES Screen (Screen_ID)
);

CREATE TABLE Customer (
Customer_ID INT PRIMARY KEY,
Name VARCHAR (100),
Email VARCHAR (100),
Phone VARCHAR (15)
);

CREATE TABLE Booking (
Booking_ID INT PRIMARY KEY,
Booking_Date DATE,
Customer_ID INT,
Total_Amount DECIMAL(10,2),
FOREIGN KEY (Customer_ID)
REFERENCES Customer (Customer_ID)
);

CREATE TABLE Payment (
Payment_ID INT PRIMARY KEY,
Amount DECIMAL (10,2),
Payment_Mode VARCHAR (30),
Status VARCHAR (20),
Booking_ID INT,
FOREIGN KEY (Booking_ID)
REFERENCES Booking (Booking_ID)
);

CREATE TABLE Ticket (
Ticket_ID INT PRIMARY KEY,
Price DECIMAL (10,2),
Ticket_Status VARCHAR (20),
Booking_ID INT,
FOREIGN KEY (Booking_ID)
REFERENCES Booking (Booking_ID)
);