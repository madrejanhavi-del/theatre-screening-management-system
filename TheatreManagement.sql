DROP DATABASE IF EXISTS Theatre;
CREATE DATABASE Theatre;
USE Theatre;

CREATE TABLE Theatre (
    Theatre_ID INT PRIMARY KEY,
    Theatre_Name VARCHAR(100),
    Location VARCHAR(100),
    Contact VARCHAR(15)
);

CREATE TABLE Screen (
    Screen_ID INT PRIMARY KEY,
    Screen_Type VARCHAR(50),
    Theatre_ID INT,
    FOREIGN KEY (Theatre_ID)
        REFERENCES Theatre(Theatre_ID)
);

CREATE TABLE Movie (
    Movie_ID INT PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    Duration INT
);

CREATE TABLE ShowDetails (
    Show_ID INT PRIMARY KEY,
    Show_Time DATETIME,
    Screen_ID INT,
    Movie_ID INT,
    FOREIGN KEY (Screen_ID)
        REFERENCES Screen(Screen_ID),
    FOREIGN KEY (Movie_ID)
        REFERENCES Movie(Movie_ID)
);

CREATE TABLE Seat (
    Seat_No INT PRIMARY KEY,
    Seat_Type VARCHAR(50),
    Screen_ID INT,
    FOREIGN KEY (Screen_ID)
        REFERENCES Screen(Screen_ID)
);

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY,
    Booking_Date DATE,
    Customer_ID INT,
    Total_Amount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
);

CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Amount DECIMAL(10,2),
    Payment_Mode VARCHAR(30),
    Status VARCHAR(20),
    Booking_ID INT,
    FOREIGN KEY (Booking_ID)
        REFERENCES Booking(Booking_ID)
);

CREATE TABLE Ticket (
    Ticket_ID INT PRIMARY KEY,
    Price DECIMAL(10,2),
    Ticket_Status VARCHAR(20),
    Booking_ID INT,
    FOREIGN KEY (Booking_ID)
        REFERENCES Booking(Booking_ID)
);

INSERT INTO Theatre VALUES
(1, 'PVR Cinemas', 'Pune', '9876543210'),
(2, 'INOX Movies', 'Mumbai', '9876501234');

INSERT INTO Screen VALUES
(101, '2D', 1),
(102, '3D', 1),
(201, 'IMAX', 2);

INSERT INTO Movie VALUES
(1, 'Inception', 'Thriller', 148),
(2, 'Interstellar', 'Sci-Fi', 169),
(3, 'Avengers Endgame', 'Action', 181),
(4, 'Inside Out', 'Animation', 95);

INSERT INTO ShowDetails VALUES
(1, '2026-11-02 18:00:00', 101, 1),
(2, '2026-11-02 20:00:00', 102, 2),
(3, '2026-11-03 17:00:00', 201, 3),
(4, '2026-11-03 14:00:00', 101, 4);

INSERT INTO Seat VALUES
(1, 'Regular', 101),
(2, 'Premium', 101),
(3, 'Regular', 102),
(4, 'Recliner', 201),
(5, 'Premium', 201);

INSERT INTO Customer VALUES
(1, 'Aarav Sharma', 'aarav@example.com', '9876543211'),
(2, 'Priya Patil', 'priya@example.com', '9876543212'),
(3, 'Rohan Mehta', 'rohan@example.com', '9876543213');

INSERT INTO Booking VALUES
(1, '2026-11-01', 1, 500.00),
(2, '2026-11-01', 2, 700.00),
(3, '2026-11-02', 3, 350.00);

INSERT INTO Payment VALUES
(1, 500.00, 'UPI', 'Success', 1),
(2, 700.00, 'Card', 'Success', 2),
(3, 350.00, 'Cash', 'Pending', 3);

INSERT INTO Ticket VALUES
(1, 250.00, 'Booked', 1),
(2, 250.00, 'Booked', 1),
(3, 350.00, 'Booked', 2),
(4, 350.00, 'Booked', 2),
(5, 350.00, 'Booked', 3);

SELECT * FROM Theatre;

SELECT * FROM Screen;

SELECT * FROM Movie;

SELECT * FROM ShowDetails;

SELECT * FROM Seat;

SELECT * FROM Customer;

SELECT * FROM Booking;

SELECT * FROM Payment;

SELECT * FROM Ticket;

SELECT Title, Genre, Duration
FROM Movie
WHERE Duration > 150;

SELECT Theatre.Theatre_Name, Screen.Screen_ID, Screen.Screen_Type
FROM Theatre
JOIN Screen
ON Theatre.Theatre_ID = Screen.Theatre_ID;

SELECT Movie.Title, ShowDetails.Show_Time, Screen.Screen_Type
FROM Movie
JOIN ShowDetails
ON Movie.Movie_ID = ShowDetails.Movie_ID
JOIN Screen
ON ShowDetails.Screen_ID = Screen.Screen_ID;

SELECT Customer.Name, Booking.Booking_ID, Booking.Booking_Date,
       Booking.Total_Amount
FROM Customer
JOIN Booking
ON Customer.Customer_ID = Booking.Customer_ID;

SELECT Genre, COUNT(*) AS Number_Of_Movies
FROM Movie
GROUP BY Genre;

SELECT SUM(Amount) AS Total_Successful_Payments
FROM Payment
WHERE Status = 'Success';

UPDATE Movie
SET Duration = 150
WHERE Movie_ID = 1;

SELECT * FROM Movie
WHERE Movie_ID = 1;
