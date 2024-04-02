-- Create the database
CREATE DATABASE FinancialServices_db;

-- Use the newly created database
USE FinancialServices_db;

-- Create User table
CREATE TABLE User (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(50),
    mname VARCHAR(50),
    sname VARCHAR(50),
    mail VARCHAR(100),
    address VARCHAR(255),
    phno VARCHAR(15),
    age INT,
    jobname VARCHAR(100),
    healthcondition VARCHAR(255),
    health_insurance_id INT,
    term_life_insurance_id INT,
    FOREIGN KEY (health_insurance_id) REFERENCES HealthInsurance(id),
    FOREIGN KEY (term_life_insurance_id) REFERENCES TermLifeInsurance(id)
);

-- Create Contact Person table
CREATE TABLE ContactPerson (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    cname VARCHAR(100),
    cnumber VARCHAR(15),
    email VARCHAR(100),
    brokerId INT,
    FOREIGN KEY (brokerId) REFERENCES User(id)
);

-- Create Job table
CREATE TABLE Job (
    jobname VARCHAR(100) PRIMARY KEY,
    position VARCHAR(100),
    sector VARCHAR(100),
    branch VARCHAR(100),
    salary DECIMAL(10, 2)
);

-- Create HealthInsurance table
CREATE TABLE HealthInsurance (
    id INT PRIMARY KEY AUTO_INCREMENT,
    health_in_name VARCHAR(100),
    yrscover INT,
    premium DECIMAL(10, 2),
    coverage_type VARCHAR(100),
    max_limit DECIMAL(10, 2),
    deductible DECIMAL(10, 2),
    network VARCHAR(100),
    provider VARCHAR(100),
    contact_person VARCHAR(100),
    contact_number VARCHAR(15),
    policy_number VARCHAR(50),
    start_date DATE,
    end_date DATE
);

-- Create TermLifeInsurance table
CREATE TABLE TermLifeInsurance (
    id INT PRIMARY KEY AUTO_INCREMENT,
    term_life_in_name VARCHAR(100),
    yrscover INT,
    premium DECIMAL(10, 2),
    coverage_amount DECIMAL(10, 2),
    beneficiary VARCHAR(100),
    contact_person VARCHAR(100),
    contact_number VARCHAR(15),
    policy_number VARCHAR(50),
    start_date DATE,
    end_date DATE
);

-- Create Stocks table
CREATE TABLE Stocks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    stockname VARCHAR(100),
    current_rate DECIMAL(10, 2)
);

-- Create MutualFunds table
CREATE TABLE MutualFunds (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fundname VARCHAR(100),
    current_value DECIMAL(10, 2)
);

-- Create RealEstate table
CREATE TABLE RealEstate (
    id INT PRIMARY KEY AUTO_INCREMENT,
    property_name VARCHAR(100),
    location VARCHAR(100),
    estimated_value DECIMAL(10, 2)
);

-- Create a linking table to associate users with their assets
CREATE TABLE UserAssets (
    user_id INT,
    stock_id INT,
    mutual_fund_id INT,
    real_estate_id INT,
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (stock_id) REFERENCES Stocks(id),
    FOREIGN KEY (mutual_fund_id) REFERENCES MutualFunds(id),
    FOREIGN KEY (real_estate_id) REFERENCES RealEstate(id)
);

-- Insert sample data into Job table
INSERT INTO Job (jobname, position, sector, branch, salary)
VALUES
('Manager', 'Managerial Position', 'Finance', 'Head Office', 75000.00),
('Developer', 'Software Developer', 'Technology', 'Development', 60000.00),
('Nurse', 'Registered Nurse', 'Healthcare', 'Hospital', 55000.00),
('Teacher', 'Educator', 'Education', 'School', 50000.00),
('Engineer', 'Mechanical Engineer', 'Engineering', 'Manufacturing', 70000.00),
('Doctor', 'Physician', 'Healthcare', 'Hospital', 80000.00),
('Accountant', 'Accountant', 'Finance', 'Accounting Firm', 60000.00),
('Lawyer', 'Attorney', 'Legal', 'Law Firm', 90000.00),
('Chef', 'Head Chef', 'Hospitality', 'Restaurant', 45000.00),
('Salesperson', 'Sales Representative', 'Sales', 'Retail', 50000.00);

-- Insert sample data into HealthInsurance table
INSERT INTO HealthInsurance (health_in_name, yrscover, premium, coverage_type, max_limit, deductible, network, provider, contact_person, contact_number, policy_number, start_date, end_date)
VALUES
('Health Ins 1', 5, 2000.00, 'Individual', 50000.00, 1000.00, 'Preferred', 'HealthCare Inc.', 'John Doe', '123-456-7890', 'HI123456', '2023-01-01', '2028-01-01'),
('Health Ins 2', 10, 3000.00, 'Family', 100000.00, 1500.00, 'Standard', 'MediCorp', 'Jane Smith', '987-654-3210', 'HI654321', '2020-03-15', '2030-03-15'),
('Health Ins 3', 3, 1500.00, 'Individual', 30000.00, 2000.00, 'Preferred', 'HealthFirst', 'Alice Johnson', '555-123-4567', 'HI789012', '2022-07-01', '2025-07-01'),
('Health Ins 4', 7, 2500.00, 'Family', 75000.00, 1200.00, 'Preferred', 'MediCare', 'Robert Brown', '222-333-4444', 'HI456789', '2021-05-01', '2028-05-01'),
('Health Ins 5', 2, 1800.00, 'Individual', 40000.00, 1500.00, 'Standard', 'HealthPlus', 'Emily White', '999-888-7777', 'HI987654', '2024-09-01', '2026-09-01'),
('Health Ins 6', 4, 2200.00, 'Family', 80000.00, 2000.00, 'Preferred', 'MediCare', 'Michael Green', '777-666-5555', 'HI345678', '2022-12-01', '2026-12-01'),
('Health Ins 7', 6, 2800.00, 'Individual', 60000.00, 1800.00, 'Standard', 'HealthFirst', 'Sophia King', '444-555-6666', 'HI234567', '2023-04-01', '2029-04-01'),
('Health Ins 8', 8, 3200.00, 'Family', 120000.00, 2500.00, 'Preferred', 'MediCorp', 'David Davis', '111-222-3333', 'HI876543', '2020-07-01', '2028-07-01'),
('Health Ins 9', 1, 1300.00, 'Individual', 25000.00, 1000.00, 'Standard', 'HealthCare Inc.', 'Emma Brown', '666-777-8888', 'HI567890', '2025-02-01', '2026-02-01'),
('Health Ins 10', 9, 3500.00, 'Family', 150000.00, 3000.00, 'Preferred', 'MediPlus', 'Olivia Miller', '333-444-5555', 'HI109876', '2021-11-01', '2030-11-01');

-- Insert sample data into TermLifeInsurance table
INSERT INTO TermLifeInsurance (term_life_in_name, yrscover, premium, coverage_amount, beneficiary, contact_person, contact_number, policy_number, start_date, end_date)
VALUES
('Term Life Ins 1', 20, 5000.00, 500000.00, 'Spouse', 'John Doe', '123-456-7890', 'TLI123456', '2022-01-01', '2042-01-01'),
('Term Life Ins 2', 30, 7000.00, 1000000.00, 'Children', 'Jane Smith', '987-654-3210', 'TLI654321', '2020-05-15', '2050-05-15'),
('Term Life Ins 3', 15, 4000.00, 750000.00, 'Parents', 'Alice Johnson', '555-123-4567', 'TLI789012', '2023-10-01', '2038-10-01'),
('Term Life Ins 4', 25, 6000.00, 800000.00, 'Sibling', 'Robert Brown', '222-333-4444', 'TLI456789', '2021-07-01', '2046-07-01'),
('Term Life Ins 5', 10, 3000.00, 400000.00, 'Children', 'Emily White', '999-888-7777', 'TLI987654', '2024-09-01', '2034-09-01'),
('Term Life Ins 6', 20, 5500.00, 900000.00, 'Spouse', 'Michael Green', '777-666-5555', 'TLI345678', '2022-12-01', '2042-12-01'),
('Term Life Ins 7', 18, 4800.00, 650000.00, 'Parents', 'Sophia King', '444-555-6666', 'TLI234567', '2023-04-01', '2041-04-01'),
('Term Life Ins 8', 22, 6300.00, 1100000.00, 'Children', 'David Davis', '111-222-3333', 'TLI876543', '2020-07-01', '2042-07-01'),
('Term Life Ins 9', 12, 3500.00, 600000.00, 'Spouse', 'Emma Brown', '666-777-8888', 'TLI567890', '2025-02-01', '2037-02-01'),
('Term Life Ins 10', 28, 6800.00, 950000.00, 'Parents', 'Olivia Miller', '333-444-5555', 'TLI109876', '2021-11-01', '2049-11-01');

-- Insert sample data into User table
INSERT INTO User (fname, mname, sname, mail, address, phno, age, jobname, healthcondition, health_insurance_id, term_life_insurance_id)
VALUES
('Rhea', 'Ajaykumar', 'Patel', 'rhea.ajaykumar@example.com', '123 OakTree', '555-123-4567', 35, 'Manager', 'Good', 1, 1),
('Anindya','Sanjeev', 'Zarbade', 'anindya.sanjeev@example.com', '456 OakTree', '555-987-6543', 40, 'Nurse', 'Excellent', 2, 2),
('Taniya','Harish', 'Sanyal', 'taniya.harish@example.com', '789 Mira Road', '555-321-9876', 45, 'Developer', 'Fair', 3, 3),
('Aditya', 'Utsav', 'Ladge', 'aditya.utsav@example.com', '246 Thane West', '555-222-3333', 50, 'Accountant', 'Excellent', 4, 4),
('Divyanshi','Utsav', 'Patil', 'divyanshi.utsav@example.com', '135 Kharghar Street', '555-444-5555', 28, 'Chef', 'Good', 5, 5),
('Charles', 'Richards', 'Dzouza', 'charles.richards@example.com', '579 Maple Street', '555-666-7777', 32, 'Doctor', 'Excellent', 6, 6),
('Dhea', 'Ajaykumar', 'Patel', 'dhea.ajaykumar@example.com', '792 Thane', '555-888-9999', 38, 'Lawyer', 'Fair', 7, 7),
('Arunima', 'Sanjeev', 'Zarbade', 'arunima.sanjeev@example.com', '369 Kharghar Street', '555-101-1212', 45, 'Salesperson', 'Good', 8, 8),
('Urvashi','Akaykumar', 'Patel', 'urvashi.ajaykumar@example.com', '951 Rokade Road', '555-131-1414', 31, 'Engineer', 'Excellent', 9, 9),
('Anshuman','Manish', 'Karduge', 'anshuman.manish@example.com', '753 Lights Road Thane', '555-161-1717', 29, 'Teacher', 'Fair', 10, 10);

-- Insert sample data into Stocks table
INSERT INTO Stocks (stockname, current_rate)
VALUES
('BlueCoast Meridian', 150.00),
('Rustomjee', 200.00),
('TechCorp', 100.00),
('HealthSolutions', 75.00),
('GreenEnergy Inc.', 50.00),
('ABC Pharmaceuticals', 120.00),
('XYZ Communications', 80.00),
('FashionHouse', 90.00),
('FoodMart', 110.00),
('GlobalBanks', 130.00);

-- Insert sample data into MutualFunds table
INSERT INTO MutualFunds (fundname, current_value)
VALUES
('Growth Fund', 1000.00),
('Income Fund', 1500.00),
('Balanced Fund', 1200.00),
('Technology Fund', 800.00),
('Healthcare Fund', 900.00),
('Real Estate Fund', 1100.00),
('Energy Fund', 950.00),
('Consumer Goods Fund', 850.00),
('Utilities Fund', 700.00),
('International Fund', 1300.00);

-- Insert sample data into RealEstate table
INSERT INTO RealEstate (property_name, location, estimated_value)
VALUES
('Sunrise Villa', 'City A', 300000.00),
('Ocean View Apartment', 'City B', 250000.00),
('Mountain Retreat', 'City C', 400000.00),
('Urban Loft', 'City D', 350000.00),
('Lakefront Estate', 'City E', 500000.00),
('Downtown Condo', 'City F', 200000.00),
('Suburban House', 'City G', 450000.00),
('Riverside Mansion', 'City H', 600000.00),
('Countryside Cottage', 'City I', 280000.00),
('Luxury Penthouse', 'City J', 700000.00);

-- Insert sample data into UserAssets table to link users with their assets
INSERT INTO UserAssets (user_id, stock_id, mutual_fund_id, real_estate_id)
VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 6, 6, 6),
(7, 7, 7, 7),
(8, 8, 8, 8),
(9, 9, 9, 9),
(10, 10, 10, 10);

INSERT INTO ContactPerson (name, cname, cnumber, email, brokerId)
VALUES
('John Doe', 'HealthCare Inc.', '123-456-7890', 'john.doe@example.com', 1),
('Jane Smith', 'MediCorp', '987-654-3210', 'jane.smith@example.com', 2),
('Alice Johnson', 'HealthFirst', '555-123-4567', 'alice.johnson@example.com', 3),
('Robert Brown', 'MediCare', '222-333-4444', 'robert.brown@example.com', 4),
('Emily White', 'HealthPlus', '999-888-7777', 'emily.white@example.com', 5);

-- Alter User table to add advisor_id column
ALTER TABLE User ADD COLUMN advisor_id INT;

-- Update User table to set advisor_id based on contact_person
UPDATE User u
INNER JOIN ContactPerson cp ON u.mail = cp.email
SET u.advisor_id = cp.id;

-- Create a relationship between User and ContactPerson tables
ALTER TABLE User ADD CONSTRAINT fk_user_advisor FOREIGN KEY (advisor_id) REFERENCES ContactPerson(id);
