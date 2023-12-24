create database project1;
use project1;

#creating publisher table
create table publisher(
publisherName VARCHAR(25) PRIMARY KEY,
publisherAddress VARCHAR(50),
phoneNo VARCHAR(20));

alter table publisher
modify column publisherAddress VARCHAR(255);

INSERT INTO publisher
		(PublisherName, PublisherAddress, Phoneno)
		VALUES
		('DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Chilton Books','Not Available','Not Available'),
		('George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
		('Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),		
		('Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018','212-419-5300'),
		('Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),
		('Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
		('Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
		('Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
		('W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
		('Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
		('Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745');


#creating books table
create table books(
bookID int auto_increment primary key,
bookTitle VARCHAR(100),
bookPublisherName VARCHAR(25),
FOREIGN KEY (bookPublisherName) references publisher (publisherName)
);

INSERT INTO books
		(bookTitle, bookPublisherName)
		VALUES 
		('The Name of the Wind', 'DAW Books'),
		('It', 'Viking'),
		('The Green Mile', 'Signet Books'),
		('Dune', 'Chilton Books'),
		('The Hobbit', 'George Allen & Unwin'),
		('Eragon', 'Alfred A. Knopf'),
		('A Wise Mans Fear', 'DAW Books'),
		('Harry Potter and the Philosophers Stone', 'Bloomsbury'),
		('Hard Boiled Wonderland and The End of the World', 'Shinchosa'),
		('The Giving Tree', 'Harper and Row'),
		('The Hitchhikers Guide to the Galaxy', 'Pan Books'),
		('Brave New World', 'Chalto & Windus'),
		('The Princess Bride', 'Harcourt Brace Jovanovich'),
		('Fight Club', 'W.W. Norton'),
		('Holes', 'Scholastic'),
		('Harry Potter and the Chamber of Secrets', 'Bloomsbury'),
		('Harry Potter and the Prisoner of Azkaban', 'Bloomsbury'),
		('The Fellowship of the Ring', 'George Allen & Unwin'),
		('A Game of Thrones', 'Bantam'),
		('The Lost Tribe', 'Picador USA');

#creating branch table
create table library_branch(
branchId int auto_increment primary key,
branchName VARCHAR(15),
branchAddress VARCHAR(50)
);

INSERT INTO library_branch
		(BranchName, BranchAddress)
		VALUES
		('Sharpstown','32 Corner Road, New York, NY 10012'),
		('Central','491 3rd Street, New York, NY 10014'),
		('Saline','40 State Street, Saline, MI 48176'),
		('Ann Arbor','101 South University, Ann Arbor, MI 48104');
        
## creating customer table
create table customer(
cardNo int auto_increment PRIMARY KEY,
name VARCHAR(60),
address VARCHAR(100),
phone VARCHAR(50)
);

INSERT INTO customer
		(name, address, phone)
		VALUES
		('Joe Smith','1321 4th Street, New York, NY 10014','212-312-1234'),
		('Jane Smith','1321 4th Street, New York, NY 10014','212-931-4124'),
		('Tom Li','981 Main Street, Ann Arbor, MI 48104','734-902-7455'),
		('Angela Thompson','2212 Green Avenue, Ann Arbor, MI 48104','313-591-2122'),
		('Harry Emnace','121 Park Drive, Ann Arbor, MI 48104','412-512-5522'),
		('Tom Haverford','23 75th Street, New York, NY 10014','212-631-3418'),
		('Haley Jackson','231 52nd Avenue New York, NY 10014','212-419-9935'),
		('Michael Horford','653 Glen Avenue, Ann Arbor, MI 48104','734-998-1513');
        
## creating loan table 
create table loan(
loanID INT auto_increment PRIMARY KEY,
bookID int,
branchId int,
cardNo int,
dateout date,
datedue date,
FOREIGN KEY (bookID) references books(bookID),
FOREIGN KEY (branchId) references library_branch(branchId),
FOREIGN KEY (cardNo) references customer(cardNo)
);

INSERT INTO loan
		(bookID, branchId, cardNo, dateout, datedue)
		VALUES
('1', '1', '1', '18-01-01', '18-02-02'),
('2', '1', '1', '18-01-01', '18-02-02'),
('3', '1', '1', '18-01-01', '18-02-02'),
('4', '1', '1', '18-01-01', '18-02-02'),
('5', '1', '2', '18-01-03', '18-02-03'),
('6', '1', '2', '18-01-03', '18-02-03'),
('7', '1', '2', '18-01-03', '18-02-03'),
('8', '1', '2', '18-01-03', '18-02-03'),
('9', '1', '2', '18-01-03', '18-02-03'),
('11', '1', '2', '18-01-03', '18-02-03'),
('12', '2', '5', '17-12-12', '18-01-12'),
('10', '2', '5', '17-12-12', '17-01-12'),
('20', '2', '5', '18-02-03', '18-03-03'),
('18', '2', '5', '18-01-05', '18-02-05'),
('19', '2', '5', '18-01-05', '18-02-05'),
('19', '2', '1', '18-01-03', '18-02-03'),
('11', '2', '6', '18-01-07', '18-02-07'),
('1', '2', '6', '18-01-07', '18-02-07'),
('2', '2', '1', '18-01-07', '18-02-07'),
('3', '2', '1', '18-01-07', '18-02-07'),
('5', '2', '5', '17-12-12', '18-01-12'),
('4', '3', '3', '18-01-09', '18-02-09'),
('7', '3', '2', '18-01-03', '18-02-03'),
('17', '3', '2', '18-01-03', '18-02-03'),
('16', '3', '4', '18-01-03', '18-02-03'),
('15', '3', '4', '18-01-03', '18-02-03'),
('15', '3', '7', '18-01-03', '18-02-03'),
('14', '3', '4', '18-01-03', '18-02-03'),
('13', '3', '7', '18-01-03', '18-02-03'),
('13', '3', '2', '18-01-03', '18-02-03'),
('19', '3', '2', '17-12-12', '18-01-12'),
('20', '4', '3', '18-01-03', '18-02-03'),
('1', '4', '2', '18-01-12', '18-02-12'),
('3', '4', '7', '18-01-03', '18-02-03'),
('18', '4', '7', '18-01-03', '18-02-03'),
('12', '4', '2', '18-01-04', '18-02-04'),
('11', '4', '3', '18-01-15', '18-02-15'),
('9', '4', '3', '18-01-15', '18-02-15'),
('7', '4', '7', '18-01-01', '18-02-02'),
('4', '4', '3', '18-01-01', '18-02-02'),
('1', '4', '3', '17-02-02', '18-03-02'),
('20', '4', '3', '18-01-03', '18-02-03'),
('1', '4', '2', '18-01-12', '18-02-12'),
('3', '4', '7', '18-01-13', '18-02-13'),
('18', '4', '7', '18-01-13', '18-02-13'),
('12', '4', '2', '18-01-14', '18-02-14'),
('11', '4', '3', '18-01-15', '18-02-15'),
('9', '4', '3', '18-01-15', '18-02-15'),
('7', '4', '7', '18-01-19', '18-02-19'),
('4', '4', '3', '18-01-19', '18-02-19'),
('1', '4', '3', '18-01-22', '18-02-22');

## creating book copies table
create table book_copies(
copies_id int auto_increment PRIMARY KEY,
bookID int,
branchId int,
No_of_copies int,
FOREIGN KEY (bookID) references books(bookID),
FOREIGN KEY (branchId) references library_branch(branchId)
);

INSERT INTO book_copies
		(bookID,BranchId, no_of_copies)
		VALUES
		('1','1','5'),
		('2','1','5'),
		('3','1','5'),
		('4','1','5'),
		('5','1','5'),
		('6','1','5'),
		('7','1','5'),
		('8','1','5'),
		('9','1','5'),
		('10','1','5'),
		('11','1','5'),
		('12','1','5'),
		('13','1','5'),
		('14','1','5'),
		('15','1','5'),
		('16','1','5'),
		('17','1','5'),
		('18','1','5'),
		('19','1','5'),
		('20','1','5'),
		('1','2','5'),
		('2','2','5'),
		('3','2','5'),
		('4','2','5'),
		('5','2','5'),
		('6','2','5'),
		('7','2','5'),
		('8','2','5'),
		('9','2','5'),
		('10','2','5'),
		('11','2','5'),
		('12','2','5'),
		('13','2','5'),
		('14','2','5'),
		('15','2','5'),
		('16','2','5'),
		('17','2','5'),
		('18','2','5'),
		('19','2','5'),
		('20','2','5'),
		('1','3','5'),
		('2','3','5'),
		('3','3','5'),
		('4','3','5'),
		('5','3','5'),
		('6','3','5'),
		('7','3','5'),
		('8','3','5'),
		('9','3','5'),
		('10','3','5'),
		('11','3','5'),
		('12','3','5'),
		('13','3','5'),
		('14','3','5'),
		('15','3','5'),
		('16','3','5'),
		('17','3','5'),
		('18','3','5'),
		('19','3','5'),
		('20','3','5'),
		('1','4','5'),
		('2','4','5'),
		('3','4','5'),
		('4','4','5'),
		('5','4','5'),
		('6','4','5'),
		('7','4','5'),
		('8','4','5'),
		('9','4','5'),
		('10','4','5'),
		('11','4','5'),
		('12','4','5'),
		('13','4','5'),
		('14','4','5'),
		('15','4','5'),
		('16','4','5'),
		('17','4','5'),
		('18','4','5'),
		('19','4','5'),
		('20','4','5');
        
## creating author table
create table author(
authorID int auto_increment PRIMARY KEY,
bookID int,
authorName VARCHAR(40),
FOREIGN KEY (bookID) references books(bookID)
);

INSERT INTO author
		(BookID,AuthorName)
		VALUES
		('1','Patrick Rothfuss'),
		('2','Stephen King'),
		('3','Stephen King'),
		('4','Frank Herbert'),
		('5','J.R.R. Tolkien'),
		('6','Christopher Paolini'),
		('6','Patrick Rothfuss'),
		('8','J.K. Rowling'),
		('9','Haruki Murakami'),
		('10','Shel Silverstein'),
		('11','Douglas Adams'),
		('12','Aldous Huxley'),
		('13','William Goldman'),
		('14','Chuck Palahniuk'),
		('15','Louis Sachar'),
		('16','J.K. Rowling'),
		('17','J.K. Rowling'),
		('18','J.R.R. Tolkien'),
		('19','George R.R. Martin'),
		('20','Mark Lee');
        
## Solving analysis questions
# 1. How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

SELECT COUNT(book_copies.copies_id) AS total_copies
FROM book_copies
JOIN books ON book_copies.bookID = books.bookID
JOIN library_branch ON book_copies.branchId = library_branch.branchId
WHERE books.bookTitle = 'The Lost Tribe' AND library_branch.branchName = 'Sharpstown';

-- answer = 1 copies

# 2. How many copies of the book titled "The Lost Tribe" are owned by each library branch? 

SELECT count(book_copies.bookID) as Total_copies
from book_copies
JOIN books on book_copies.bookID = books.bookID
JOIN library_branch on book_copies.branchId = library_branch.branchId
where books.bookTitle = 'The Lost Tribe';

-- answer 4 total_copies

# 3. Retrieve the names of all borrowers who do not have any books checked out?
SELECT customer.name
FROM customer
LEFT JOIN loan ON customer.cardNo = loan.cardNo
WHERE loan.loanId IS NULL;

-- answer is Michale Horford

# 4. Retrieve the names of all borrowers who have checked out 'The Name of the Wind'?
 SELECT customer.name
 FROM customer
 JOIN loan ON customer.cardNo = loan.cardNo
 JOIN book_copies on loan.bookId = book_copies.copies_id
 JOIN books on book_copies.bookID = books.bookID
 where bookTitle = "The Name of the Wind";
 
 -- answer = Joe Smith, Tom Haverford, Jane Smith, Tom Li, Jane Smith, Tom Li
 
 # 5. For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address. 
SELECT books.bookTitle AS book_title,
customer.name AS borrower_name,
customer.address AS borrower_address
FROM loan
JOIN book_copies on loan.bookID = book_copies.copies_id
JOIN books on book_copies.bookID = books.bookID
JOIN customer on loan.loanID = customer.cardNo
JOIN library_branch on book_copies.branchID = library_branch.branchID
where branchName = "Sharpstown" and datedue = "18-02-03";

# 6. For each library branch, retrieve the branch name and the total number of books loaned out from that branch?
SELECT library_branch.branchName,
count(DISTINCT loan.bookID) as Total_books_loaned
FROM library_branch
LEFT JOIN book_copies on library_branch.branchID = book_copies.branchID
LEFT JOIN loan on book_copies.copies_id = loan.bookId
GROUP BY library_branch.branchID, library_branch.branchName;

-- answer = shaprstown = 20, Central = 0, Saline = 0, Ann Arbor  =0.

# 7. Retrieve the names, addresses, and number of books checked out for all borrowers who have more than five books checked out?
SELECT
    customer.name,
    customer.address,
    COUNT(loan.loanId) AS num_books_checked_out
FROM
    customer
JOIN loan ON customer.cardNo = loan.loanId
GROUP BY
    customer.cardNo, customer.name, customer.address
HAVING
    num_books_checked_out > 5;
    
# 8. For each book authored by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central"?
SELECT
    books.bookTitle,
    COUNT(book_copies.copies_id) AS num_copies_owned
FROM
    books
JOIN book_copies ON books.bookID = book_copies.bookID
JOIN library_branch ON book_copies.branchId = library_branch.branchId
JOIN author ON books.bookID = books.bookID  -- Join with the authors table
WHERE
    author.authorName = 'Stephen King'
    AND library_branch.branchName = 'Central'
GROUP BY
    books.bookID, books.bookTitle;
