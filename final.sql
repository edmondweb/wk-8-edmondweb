-- Active: 1758186501498@@127.0.0.1@3306@librarymanagement

-- Create a database
CREATE DATABASE LibraryManagement;
USE LibraryManagement;

-- Create a) Books Table

CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    ISBN VARCHAR(13) UNIQUE NOT NULL,
    PublishedYear INT,
    Genre VARCHAR(100),
    AvailableCopies INT DEFAULT 0
);

-- Create b) Membership Table

CREATE TABLE Members(
    MemberID 
)
