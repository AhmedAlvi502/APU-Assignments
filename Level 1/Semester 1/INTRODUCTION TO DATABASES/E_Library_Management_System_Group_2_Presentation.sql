
CREATE DATABASE E_Library_Management_System_Group_2;
USE E_Library_Management_System_Group_2;


-- DATA DEFINITION QUERIES

create table Members (
member_ID VARCHAR(10) PRIMARY KEY,
first_name VARCHAR(250),
last_name VARCHAR(250),
contact_number VARCHAR(15),
email VARCHAR(100) UNIQUE,
neighborhood VARCHAR(100),
date_joined DATE,
active_status BIT,
gender CHAR(10),
age INT
);


create table Feedback (
feedback_ID VARCHAR(10) PRIMARY KEY,
member_ID VARCHAR(10) FOREIGN KEY REFERENCES Members(member_ID),
feedback_content TEXT,
[submission_date] DATE,
);


create table Rooms (
room_ID VARCHAR(10) PRIMARY KEY,
room_number VARCHAR(10),
capacity INT,
availability_status BIT
);

create table Reservations (
reservation_ID VARCHAR(10) PRIMARY KEY,
member_ID VARCHAR(10) FOREIGN KEY REFERENCES Members(member_ID),
room_ID VARCHAR(10) FOREIGN KEY REFERENCES Rooms(room_ID),
reservation_date DATE,
reservation_time TIME,
activity_description TEXT,
);


create table Logs (
logID VARCHAR(10) PRIMARY KEY,
action VARCHAR(100),
timestamp DATETIME,
member_ID VARCHAR(10) FOREIGN KEY (member_ID) REFERENCES Members(member_ID),
);


create table Authors (
author_ID VARCHAR(10) PRIMARY KEY,
[name] VARCHAR(100),
biography TEXT
);


create table Publishers (
publisher_ID VARCHAR(10) PRIMARY KEY ,
[name] VARCHAR(100),
[Address] TEXT,
contact_details VARCHAR(100)
);


create table Categories (
category_ID VARCHAR(10) PRIMARY KEY,
category_name VARCHAR(250),
borrowing_rules TEXT,
maxLoan_period INT,
maxItems_allowed INT
);


create table PopularGenres (
genre_ID VARCHAR(10) PRIMARY KEY,
genre_name VARCHAR(250),
borrow_count INT
);


create table Items(
item_ID VARCHAR(10) PRIMARY KEY,
barcode VARCHAR(50) UNIQUE,
title VARCHAR(250),
author_ID VARCHAR(10) FOREIGN KEY REFERENCES Authors(author_ID),
publisher_ID VARCHAR(10) FOREIGN KEY REFERENCES Publishers(publisher_ID),
genre_ID VARCHAR(10) FOREIGN KEY REFERENCES PopularGenres(genre_ID),
category_ID VARCHAR(10) FOREIGN KEY REFERENCES Categories(category_ID),
producer VARCHAR(100),
[description] TEXT,
is_reference BIT,
loan_duration INT,
borrowable BIT,
);


create table BorrowedItems (
borrow_ID VARCHAR(10) PRIMARY KEY,
member_ID VARCHAR(10) FOREIGN KEY REFERENCES Members(member_ID), 
item_ID VARCHAR(10)	FOREIGN KEY REFERENCES Items(item_ID),
borrow_date DATE,
due_date DATE,
return_date DATE,
overdue_days INT,
fine_amount DECIMAL(10, 2) );


--INSERTING RECORDS

INSERT INTO Members ( member_id, first_name, last_name, contact_number, Email, Neighborhood, date_joined, 
active_status, Gender, Age)
VALUES
('M01', 'John', 'Doe', '+60123456789', 'john.doe@example.com', 'Bukit Jalil', '2022-01-15', 1, 'Male', 30),
('M02', 'Jane', 'Smith', '+60134567890', 'jane.smith@example.com', 'Ampang', '2021-07-20', 1, 'Female', 28),
('M03', 'Ali', 'Khan', '+60145678901', 'ali.khan@example.com', 'Serdang Raya', '2023-03-01', 1, 'Male', 35),
('M04', 'Sara', 'Lee', '+60156789012', 'sara.lee@example.com', 'Awan Besar', '2022-06-15', 0, 'Female', 25),
('M05', 'Mike', 'Johnson', '+60167890123', 'mike.johnson@example.com', 'Bukit Jalil', '2020-09-30', 0, 'Male', 50),
('M06',  'Emily', 'Davis', '+60178901234', 'emily.davis@example.com', 'Ampang', '2022-08-25', 1, 'Female', 40),
('M07', 'Noah', 'Wilson', '+60189012345', 'noah.wilson@example.com', 'Serdang Raya', '2021-05-10', 0, 'Male', 45),
('M08', 'Olivia', 'Brown', '+60190123456', 'olivia.brown@example.com', 'Awan Besar', '2023-02-20', 1, 'Female', 29),
('M09', 'Liam', 'Taylor', '+60101234567', 'liam.taylor@example.com', 'Bukit Jalil', '2020-12-05', 1, 'Male', 34),
('M10', 'Sophia', 'Martinez', '+60112345678', 'sophia.martinez@example.com', 'Ampang', '2022-04-17', 0, 'Female', 37);


INSERT INTO Feedback (feedback_ID, member_ID, feedback_content, submission_date)
VALUES
('F01', 'M01', 'The library has an excellent collection of books, but the DVD section could use more variety.', '2024-01-05'),
('F02', 'M02', 'The staff is very helpful and courteous. Great experience overall!', '2024-01-10'),
('F03', 'M03', 'Meeting rooms are well-maintained, but the reservation process can be improved.', '2024-01-15'),
('F04', 'M04', 'The overdue fine policy should be more lenient for frequent members.', '2024-01-20'),
('F05', 'M05', 'I appreciate the new additions to the fiction section. Keep it up!', '2024-01-25'),
('F06', 'M06', 'The library could benefit from extended operating hours on weekends.', '2024-01-30'),
('F07', 'M07', 'It would be great to have more e-books and digital resources.', '2024-02-05'),
('F08', 'M08', 'The reading area is peaceful and comfortable. Highly recommended!', '2024-02-10'),
('F09', 'M09', 'I faced some technical issues while reserving a meeting room online.', '2024-02-15'),
('F10', 'M10', 'The library’s genre categorization makes it very easy to find books.', '2024-02-20');


INSERT INTO Rooms (room_ID, 
room_number, Capacity, availability_status)
VALUES
('R01', 'R001', 10, 1),
('R02', 'R002', 15, 1),
('R03', 'R003', 20, 0),
('R04', 'R004', 12, 1),
('R05', 'R005', 25, 1),
('R06', 'R006', 18, 0),
('R07', 'R007', 8, 1),
('R08', 'R008', 30, 1),
('R09', 'R009', 50, 1),
('R10', 'R010', 5, 1);


INSERT INTO Reservations (reservation_ID, member_ID, room_ID, 
reservation_date, reservation_time, activity_description)
VALUES
('RV01', 'M01', 'R01', '2024-12-05', '14:00:00', 'Group Study'),        
('RV02', 'M02', 'R02', '2024-12-10', '10:00:00', 'Workshop'),           
('RV03', 'M01', 'R03', '2024-12-15', '09:00:00', 'Presentation'),       
('RV04', 'M03', 'R01', '2024-12-20', '15:00:00', 'Research'),           
('RV05', 'M01', 'R02', '2024-12-25', '10:00:00', 'Group Study'),      
('RV06', 'M01', 'R02', '2024-12-12', '14:00:00', 'Team Meeting'),       
('RV07', 'M07', 'R01', '2024-12-07', '11:00:00', 'Project Planning'),   
('RV08', 'M03', 'R03', '2024-12-21', '09:30:00', 'Discussion'),         
('RV09', 'M01', 'R02', '2024-12-14', '10:00:00', 'Community Event'),    
('RV10', 'M03', 'R01', '2024-12-18', '13:00:00', 'Private Study'),  
('RV11', 'M05', 'R04', '2024-12-28', '16:00:00', 'Community Event'),
('RV12', 'M03', 'R05', '2024-12-23', '08:00:00', 'Project Planning'),
('RV13', 'M03', 'R07', '2024-12-06', '18:00:00', 'Group Study'),
('RV14', 'M04', 'R08', '2024-07-07', '12:00:00', 'Workshop'),
('RV15', 'M06', 'R09', '2024-07-14', '11:00:00', 'Team meeting'),
('RV16', 'M05', 'R10', '2024-07-14', '17:00:00', 'Community Event')


INSERT INTO Logs (logID,action, timestamp, member_ID)
VALUES
('L01', 'User logged in', '2024-01-10 09:30:00', 'M01'),
('L02', 'Book borrowed: The Great Gatsby', '2024-01-12 14:15:00', 'M01'),
('L03', 'Meeting room reservation: Room R001', '2024-01-15 10:00:00', 'M02'),
('L04', 'Fine paid: Overdue for 1984', '2024-01-18 16:45:00', 'M03'),
('L05', 'User logged out', '2024-01-20 19:00:00', 'M01'),
('L06', 'Item returned: National Geographic July 2024', '2024-01-22 12:30:00', 'M04'),
('L07', 'Meeting room canceled: Room R002', '2024-01-25 11:00:00', 'M02'),
('L08', 'Feedback submitted: Excellent library services', '2024-01-27 17:20:00', 'M05'),
('L09', 'User logged in', '2024-01-28 08:45:00', 'M06'),
('L10', 'Book borrowed: Pride and Prejudice', '2024-01-30 15:00:00', 'M07');


INSERT INTO Authors (author_ID, Name, Biography)
VALUES
('A01', 'F. Scott Fitzgerald', 'American novelist, widely regarded as one of the greatest writers.'),
('A02', 'George Orwell', 'English novelist and essayist, famous for "1984" and "Animal Farm".'),
('A03', 'Jane Austen', 'English novelist known for her romantic fiction.'),
('A04', 'Christopher Nolan', 'Director and producer known for sci-fi films.'),
('A05', 'Charles Dickens', 'Renowned English novelist of the Victorian era.'),
('A06', 'J.K. Rowling', 'British author of the "Harry Potter" series.'),
('A07', 'Ernest Hemingway', 'Famous American author known for his minimalist style.'),
('A08', 'Mark Twain', 'Humorist and author of "The Adventures of Tom Sawyer".'),
('A09', 'Leo Tolstoy', 'Russian author of "War and Peace".'),
('A10', 'Agatha Christie', 'World-famous mystery and crime novelist.');


INSERT INTO Publishers (publisher_ID, Name, Address, contact_details)
VALUES
('PB01', 'Penguin', '123 Penguin St, London', '+441234567890'),
('PB02', 'Harcourt', '456 Harcourt Rd, New York', '+12123456789'),
('PB03', 'NatGeo', '789 NatGeo Blvd, Washington', '+13001234567'),
('PB04', 'Warner Bros.', '100 Warner Ave, Los Angeles','+14151234567'),
('PB05', 'Catan Inc.', '50 Catan Way, Berlin', '+491234567890'),
('PB06', 'Time Inc.', '200 Time Square, New York', '+12129876543'),
('PB07', 'Hasbro', '30 Hasbro Rd, Rhode Island', '+14019876543'),
('PB08', 'Oxford Press', '12 Oxford Ln, London', '+441987654321'),
('PB09', 'Random House', '100 Random Rd, California', '+14159876543'),
('PB10', 'Macmillan', '50 Macmillan Ln, Texas', '+12139876543');


INSERT INTO Categories (category_id, category_name, borrowing_rules,
maxLoan_period, maxItems_allowed)
VALUES
('C01', 'Books', '14-day loan, up to 5 items.', 14, 5),
('C02', 'Magazines', '7-day loan, unlimited items.', 7, NULL),
('C03', 'DVDs', '7-day loan, up to 3 items.', 7, 3),
('C04', 'Games', '3-day loan, up to 2 items.', 3, 2),
('C05', 'Reference', 'Not borrowable, in-library use only.', NULL, NULL),
('C06', 'E-books', 'Digital access, unlimited.', NULL, NULL),
('C07', 'Audio Books', '7-day loan, up to 2 items.', 7, 2),
('C08', 'Journals', '7-day loan, up to 3 items.', 7, 3),
('C09', 'Archives', 'Restricted access.', NULL, NULL),
('C10', 'Research Papers', 'In-library use only.', NULL, NULL);

INSERT INTO PopularGenres (genre_ID, 
genre_name, borrow_count)
VALUES
('G01', 'Fiction', 50),
('G02', 'Education', 30),
('G03', 'Sci-Fi', 45),
('G04', 'Strategy', 20),
('G05', 'Romance', 40),
('G06', 'Mystery', 25),
('G07', 'Biography', 15),
('G08', 'Adventure', 35),
('G09', 'Fantasy', 55),
('G10', 'History', 10);



INSERT INTO Items (item_ID, Barcode, Title, author_ID, publisher_ID, genre_ID, category_ID, Producer, Description, 
is_reference, loan_duration, Borrowable)
VALUES
('I01', 'BK001', 'The Great Gatsby', 'A01', 'PB01', 'G01', 'C01', 'Penguin', 'Classic novel set in the Jazz Age.', 0, 14, 1),
('I02', 'BK002', '1984', 'A02', 'PB02', 'G01', 'C01', 'Harcourt', 'Dystopian novel about a totalitarian regime.', 0, 14, 1),
('I03', 'MG001', 'National Geographic July 2024', NULL, 'PB03', 'G02', 'C02', 'NatGeo', 'Science and nature magazine.', 0, 7, 1),
('I04', 'DVD001', 'Inception', NULL, 'PB04', 'G03', 'C03', 'Warner Bros.', 'Sci-fi thriller directed by Christopher Nolan.', 0, 7, 1),
('I05', 'GM001', 'Catan', NULL, 'PB05', 'G04', 'C04', 'Catan Inc.', 'A strategy board game.', 0, 3, 1),
('I06', 'BK003', 'Pride and Prejudice', 'A03', 'PB01', 'G01', 'C01', 'Penguin', 'A classic romance novel.', 0, 14, 1),
('I07', 'BK004', 'To Kill a Mockingbird', 'A02', 'PB01', 'G01', 'C01', 'Penguin', 'A novel about racial inequality.', 0, 14, 1),
('I08', 'DVD002', 'The Matrix', NULL, 'PB04', 'G03', 'C03', 'Warner Bros.', 'A sci-fi action film.', 0, 7, 1),
('I09', 'MG002', 'Time Magazine August 2024', NULL, 'PB03', 'G02', 'C02', 'Time Inc.', 'Weekly magazine covering current events.', 0, 7, 1),
('I10', 'GM002', 'Monopoly', NULL, 'PB05', 'G04', 'C04', 'Hasbro', 'A classic board game.', 0, 3, 1);


INSERT INTO BorrowedItems (borrow_ID, member_ID, item_ID, borrow_date, 
due_date, Return_Date, overdue_days, fine_amount)
VALUES
('B01', 'M01', 'I01', '2022-12-25', '2023-01-15', '2023-01-20', 5, 5.00),
('B02', 'M02', 'I02', '2023-02-01', '2023-02-14', '2023-02-10', NULL, 0.00),
('B03', 'M03', 'I03', '2022-12-01', '2022-12-14', '2022-12-14', NULL, 0.00),
('B04', 'M04', 'I04', '2023-03-10', '2023-03-17', '2023-03-19', 2, 2.00),
('B05', 'M05', 'I05', '2023-04-15', '2023-04-22', '2023-04-25', 3, 3.00),
('B06', 'M06', 'I06', '2024-01-10', '2024-01-24', '2024-01-27', 3, 6.00),
('B07', 'M07', 'I07', '2024-03-01', '2024-03-15', '2024-03-12', NULL, 0.00),
('B08', 'M08', 'I08', '2024-04-05', '2024-04-20', '2024-04-22', 2, 4.00),
('B09', 'M09', 'I09', '2024-05-10', '2024-05-20', '2024-05-19', NULL, 0.00),
('B10', 'M10', 'I10', '2023-06-01', '2023-06-15', '2023-06-18', 3, 3.00),
('B11', 'M06', 'I02', '2024-02-11', '2024-02-21', '2024-02-26', 5, 5.00),
('B12', 'M06', 'I03', '2024-03-14', '2024-03-21', '2024-02-19', NULL, 0.00),
('B13', 'M06', 'I03', '2024-05-05', '2024-05-15', '2024-05-23', 8, 8.00),
('B14', 'M06', 'I06', '2024-02-11', '2024-02-21', '2024-02-26', 5, 5.00),
('B15', 'M06', 'I06', '2024-03-12', '2024-03-21', '2024-02-19', NULL, 0.00),
('B16', 'M06', 'I04', '2024-05-05', '2024-05-15', '2024-05-22', 7, 7.00),
('B17', 'M06', 'I05', '2024-06-07', '2024-06-27', '2024-05-22', NULL, 0.00),
('B18', 'M10', 'I01', '2025-01-01', '2025-01-06', '2025-01-10', 4, 4.00),
('B19', 'M10', 'I03', '2024-09-05', '2024-09-15', '2024-09-20', 5, 5.00);


--DATA MANIPULATION QUERIES 

--Mohammed Yousef Mohammed Mohammed TP085042
--Q1:List all the items name, descriptions, category name and category description
--that are currently not on loan and available for loan. Order the result by category. 
                                                                                                                                      
SELECT I.title As ItemName, I.Description, C.category_name, C.borrowing_rules 
AS Category_Description
FROM Items I JOIN Categories C ON I.category_ID = C.category_ID 
WHERE I.borrowable = 1 AND I.item_ID NOT IN 
(SELECT item_ID FROM BorrowedItems WHERE return_date IS NULL)
ORDER BY C.category_name;


--Ahmed Mirahusain Alvi TP084807 
--Q2:Show members who had paid overdue more than 2 times for rental items.
--The results must consist of their first name, last name, contact number,
--number of overdue, and total due amount. Show the results according to neighborhood. 
                                                                                                                                
SELECT m.member_ID, m.first_name, m.last_name, m.contact_number,  
COUNT(b.overdue_days) AS OverdueCount, SUM(b.fine_amount) AS TotalDue 
FROM Members m JOIN BorrowedItems b ON m.member_ID = b.member_ID 
GROUP BY m.Neighborhood, m.member_ID, m.first_name, m.last_name, m.contact_number 
HAVING COUNT( b.overdue_days) > 2 
ORDER BY m.Neighborhood; 


--Ahmed Mirahusain Alvi TP084807 Done
--Q3:Display the active members and list of books they have borrowed in the years 
--2022 and 2023. The result must consist of members’ first name, last name, 
--book name, and the borrow date. Sort the result by borrowed year in ascending order.
                                                                                                    
SELECT m.first_name, m.last_name, i.Title AS BookName, b.borrow_date
FROM Members m
JOIN BorrowedItems b ON m.member_ID = b.member_ID
JOIN Items i ON b.item_ID = i.item_ID
WHERE m.active_status = 1
AND i.category_ID IN (SELECT category_ID FROM Categories WHERE category_name = 'Books')
AND YEAR(b.borrow_date) IN (2022, 2023)
ORDER BY YEAR(b.borrow_date), m.first_name;


--Mahrus Shamsul Ahsan TP085562
--Q4:Show the members who have borrowed items at least 8 times 
--this year. Display their name, item description and the numbers of 
--items they have borrowed.

SELECT m.member_ID, m.first_name, m.last_name,  
COUNT(b.item_ID) AS BorrowCount
FROM Members m JOIN BorrowedItems b ON m.member_ID = b.member_ID
WHERE YEAR(b.borrow_date) = 2024
GROUP BY m.member_ID, m.first_name, m.last_name
HAVING COUNT(b.item_ID) >= 8;

--Mahrus Shamsul Ahsan TP085562
--Q5:Display the members’ name and contact number as well as 
--name and description of the items borrowed the most. 
--Order the result by category type.

SELECT B.borrow_ID, M.first_name + ' ' + M.last_name 
AS member_name, M.contact_number, I.title AS ItemName,
I.description AS item_description,C.category_name
FROM BorrowedItems B JOIN Members M ON B.member_ID = M.member_ID
JOIN Items I ON B.item_ID = I.item_ID
JOIN Categories C ON I.category_ID = C.category_ID
WHERE I.item_ID IN (SELECT TOP 1 b.item_ID FROM BorrowedItems
GROUP BY item_ID ORDER BY COUNT(*) DESC)
ORDER BY C.category_name;

--Mahrus Shamsul Ahsan TP085562
--Q6:Calculate the total fine for a member based on the items 
--they have borrowed.
                                                                  
SELECT m.member_ID, m.First_Name, m.Last_Name, SUM(b.Fine_Amount) 
AS TotalFine
FROM Members m
JOIN BorrowedItems b ON m.Member_ID = b.Member_ID
GROUP BY m.member_ID,m.first_name,m.last_name;


--Mohammed Yousef Mohammed Mohammed TP085042
--Q7:Show members who have reserved a meeting room more 
--than three times in the last month.
                                                                                                 
SELECT R.member_ID, M.first_name, M.last_name, 
COUNT(R.reservation_ID) AS reservation_count 
FROM Reservations R JOIN Members M ON R.member_ID = M.member_ID 
WHERE R.reservation_date >= DATEADD(MONTH, -1, GETDATE()) 
AND R.room_ID LIKE 'R%' 
GROUP BY R.member_ID, M.first_name, M.last_name 
HAVING COUNT(R.reservation_ID) > 3;


--Abdallah Mohamed Mahmoud Mohamed Mahmoud TP085097 
--Q8:Display the most popular genre of items 
--(books, DVDs, etc.) based on the number
-- of times items in that genre have been borrowed.
                                                                        
SELECT TOP 1 g.genre_name, COUNT(b.item_ID) AS borrow_count
FROM PopularGenres g
JOIN Items i ON g.genre_ID = i.genre_ID
JOIN BorrowedItems b ON i.item_ID = b.item_ID
GROUP BY g.genre_name 
ORDER BY borrow_count DESC;




--Abdallah Mohamed Mahmoud Mohamed Mahmoud TP085097 
--Q8:Display the most popular genre of items (books, DVDs, etc.)
--based on the number of times items in that genre have been borrowed.


SELECT TOP 1 g.genre_name, COUNT(b.item_ID) AS borrow_count
FROM PopularGenres g
JOIN Items i ON g.genre_ID = i.genre_ID
JOIN BorrowedItems b ON i.item_ID = b.item_ID
GROUP BY g.genre_name 
ORDER BY borrow_count DESC;


--Ahmed Mirahusain Alvi TP084807
--Q9:Write query to find number of meeting 
--rooms that are available on 12 October 2024.
--Order by room number.
                                                            
SELECT room_number, Capacity
FROM Rooms
WHERE availability_status = 1
AND room_ID NOT IN 
(SELECT room_ID FROM Reservations 
WHERE Reservation_Date = '2024-10-12')
ORDER BY Room_Number;


--SULTAN ABDULLA OMAR TAKRORI TP085327 
--Q10:List out all rooms that have been 
--reserved on month of July 2024 
--Show them according to the activity.
                                                                                               
SELECT Room_Number, Activity_description
FROM Rooms r
JOIN Reservations res 
ON r.room_ID = res.room_ID
WHERE MONTH(res.reservation_date) = 7 
AND YEAR(res.reservation_date) = 2024;


--SULTAN ABDULLA OMAR TAKRORI 
--Q11:Show the number of books written by each author, 
--sort the result according to book
--count (author with most books sorted on top).
                                                                                                     
SELECT a.name AS author_name, COUNT(i.item_ID) AS BookCount
FROM Authors a
JOIN Items i ON a.author_ID = i.author_ID
WHERE i.category_ID = (SELECT category_ID FROM Categories 
WHERE category_name = 'Books')
GROUP BY a.Name
ORDER BY BookCount DESC;


--Abdallah Mohamed Mahmoud Mohamed Mahmoud TP085097 
--Q12:Display members who have neither borrowed items nor 
--reserved rooms in year 2023
                                                                      
SELECT  m.member_ID, m.first_name, m.last_name, m.contact_number
FROM Members m
WHERE m.member_ID NOT IN (SELECT member_ID 
FROM BorrowedItems WHERE YEAR(borrow_date) = 2023) 
AND m.member_ID NOT IN (SELECT member_ID 
FROM Reservations WHERE YEAR(reservation_date) = 2023);


--Mohammed Yousef Mohammed Mohammed TP085042
--Q13:Among the books borrowed in the year 2024,
--show the list of books that cost the most.
                                                                                                      
SELECT TOP 1 b.borrow_ID, i.title AS book_title, b.member_ID,
b.borrow_date, b.due_date, b.return_date, b.fine_amount 
FROM BorrowedItems b JOIN Items i ON b.item_ID = i.item_ID 
WHERE YEAR(b.borrow_date) = 2024 
ORDER BY b.fine_amount DESC;


--Abdallah Mohamed Mahmoud Mohamed Mahmoud TP085097 
--Q14:Show the publisher whose books are least-in-quantity 
--by genre.
                                                                               
SELECT p.publisher_ID, p.name AS publisher_name, g.genre_name, 
COUNT(i.item_ID) AS item_count
FROM Publishers p
JOIN Items i ON p.publisher_ID = i.publisher_ID
JOIN PopularGenres g ON i.genre_ID = g.genre_ID
GROUP BY p.publisher_ID, p.name, g.genre_name
ORDER BY item_count ASC;


--SULTAN ABDULLA OMAR TAKRORI TP085327
--Q15:Show the number of male member(s) who have 
--reserved the rooms in the library whose age
-- are more than the average age of all members.
                                                                                                
SELECT COUNT(m.member_ID) AS MaleCount
FROM Members m
JOIN Reservations r ON m.member_ID = r.member_ID
WHERE m.Gender = 'Male'
AND m.Age > (SELECT AVG(Age) FROM Members);









