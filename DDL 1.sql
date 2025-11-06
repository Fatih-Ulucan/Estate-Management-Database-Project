-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-06-09 20:55:01.91

-- tables
-- Table: Agent_Assigments
CREATE TABLE Agent_Assigments (
    Id integer  NOT NULL,
    Listing_Id integer  NOT NULL,
    Agents_Id integer  NOT NULL,
    Assigned_date date  NOT NULL,
    CONSTRAINT Agent_Assigments_pk PRIMARY KEY (Id)
) ;

-- Table: Agents
CREATE TABLE Agents (
    Id integer  NOT NULL,
    First_name varchar2(50)  NOT NULL,
    Last_name varchar2(50)  NOT NULL,
    Email varchar2(50)  NOT NULL,
    Phone_Number varchar2(20)  NOT NULL,
    CONSTRAINT Agents_pk PRIMARY KEY (Id)
) ;

-- Table: Amenitity
CREATE TABLE Amenitity (
    Id integer  NOT NULL,
    Name varchar2(50)  NOT NULL,
    category varchar2(50)  NOT NULL,
    CONSTRAINT Amenitity_pk PRIMARY KEY (Id)
) ;

-- Table: Contract
CREATE TABLE Contract (
    Id integer  NOT NULL,
    User_Id integer  NOT NULL,
    Properties_Id integer  NOT NULL,
    Type varchar2(50)  NOT NULL,
    Start_date date  NOT NULL,
    Price number(10,2)  NOT NULL,
    CONSTRAINT Contract_pk PRIMARY KEY (Id)
) ;

-- Table: Inquiry
CREATE TABLE Inquiry (
    Id integer  NOT NULL,
    User_Id integer  NOT NULL,
    Listing_Id integer  NOT NULL,
    "date" date  NOT NULL,
    status varchar2(50)  NOT NULL,
    CONSTRAINT Inquiry_pk PRIMARY KEY (Id)
) ;

-- Table: Listing
CREATE TABLE Listing (
    Id integer  NOT NULL,
    Properties_Id integer  NOT NULL,
    Type varchar2(50)  NOT NULL,
    Price number(10,2)  NOT NULL,
    Listing_Date date  NOT NULL,
    is_active integer  NOT NULL,
    CONSTRAINT Listing_pk PRIMARY KEY (Id)
) ;

-- Table: Owner
CREATE TABLE Owner (
    Id integer  NOT NULL,
    First_name varchar2(50)  NOT NULL,
    Last_name varchar2(50)  NOT NULL,
    Email varchar2(100)  NOT NULL,
    Phone_Number varchar2(20)  NOT NULL,
    CONSTRAINT Owner_pk PRIMARY KEY (Id)
) ;

-- Table: Payment
CREATE TABLE Payment (
    Id integer  NOT NULL,
    Contract_Id integer  NOT NULL,
    "Date" date  NOT NULL,
    Amount number(10,2)  NOT NULL,
    Status varchar2(50)  NOT NULL,
    CONSTRAINT Payment_pk PRIMARY KEY (Id)
) ;

-- Table: Properties
CREATE TABLE Properties (
    Id integer  NOT NULL,
    Owner_Id integer  NOT NULL,
    Adress varchar2(50)  NOT NULL,
    City varchar2(50)  NOT NULL,
    Type varchar2(50)  NOT NULL,
    Size_sqm varchar2(50)  NOT NULL,
    CONSTRAINT Properties_pk PRIMARY KEY (Id)
) ;

-- Table: Property_amenities
CREATE TABLE Property_amenities (
    Properties_Id integer  NOT NULL,
    Amenitity_Id integer  NOT NULL,
    CONSTRAINT Property_amenities_pk PRIMARY KEY (Properties_Id,Amenitity_Id)
) ;

-- Table: Property_photos
CREATE TABLE Property_photos (
    Id integer  NOT NULL,
    Properties_Id integer  NOT NULL,
    photo_url varchar2(100)  NOT NULL,
    Description varchar2(50)  NOT NULL,
    CONSTRAINT Property_photos_pk PRIMARY KEY (Id)
) ;

-- Table: User
CREATE TABLE "User" (
    Id integer  NOT NULL,
    First_name varchar2(50)  NOT NULL,
    Last_name varchar2(50)  NOT NULL,
    Email varchar2(100)  NOT NULL,
    Phone_Number varchar2(11)  NOT NULL,
    type varchar2(50)  NOT NULL,
    CONSTRAINT User_pk PRIMARY KEY (Id)
) ;

-- Table: Viewing
CREATE TABLE Viewing (
    Id integer  NOT NULL,
    Inquiry_Id integer  NOT NULL,
    Scheduled_date date  NOT NULL,
    Notes varchar2(50)  NOT NULL,
    CONSTRAINT Viewing_pk PRIMARY KEY (Id)
) ;

-- foreign keys
-- Reference: Agent_Assigments_Agents (table: Agent_Assigments)
ALTER TABLE Agent_Assigments ADD CONSTRAINT Agent_Assigments_Agents
    FOREIGN KEY (Agents_Id)
    REFERENCES Agents (Id);

-- Reference: Agent_Assigments_Listing (table: Agent_Assigments)
ALTER TABLE Agent_Assigments ADD CONSTRAINT Agent_Assigments_Listing
    FOREIGN KEY (Listing_Id)
    REFERENCES Listing (Id);

-- Reference: Contract_Properties (table: Contract)
ALTER TABLE Contract ADD CONSTRAINT Contract_Properties
    FOREIGN KEY (Properties_Id)
    REFERENCES Properties (Id);

-- Reference: Contract_User (table: Contract)
ALTER TABLE Contract ADD CONSTRAINT Contract_User
    FOREIGN KEY (User_Id)
    REFERENCES "User" (Id);

-- Reference: Inquiry_Listing (table: Inquiry)
ALTER TABLE Inquiry ADD CONSTRAINT Inquiry_Listing
    FOREIGN KEY (Listing_Id)
    REFERENCES Listing (Id);

-- Reference: Inquiry_User (table: Inquiry)
ALTER TABLE Inquiry ADD CONSTRAINT Inquiry_User
    FOREIGN KEY (User_Id)
    REFERENCES "User" (Id);

-- Reference: Listing_Properties (table: Listing)
ALTER TABLE Listing ADD CONSTRAINT Listing_Properties
    FOREIGN KEY (Properties_Id)
    REFERENCES Properties (Id);

-- Reference: Payment_Contract (table: Payment)
ALTER TABLE Payment ADD CONSTRAINT Payment_Contract
    FOREIGN KEY (Contract_Id)
    REFERENCES Contract (Id);

-- Reference: Properties_Owner (table: Properties)
ALTER TABLE Properties ADD CONSTRAINT Properties_Owner
    FOREIGN KEY (Owner_Id)
    REFERENCES Owner (Id);

-- Reference: Property_amenities_Amenitity (table: Property_amenities)
ALTER TABLE Property_amenities ADD CONSTRAINT Property_amenities_Amenitity
    FOREIGN KEY (Amenitity_Id)
    REFERENCES Amenitity (Id);

-- Reference: Property_amenities_Properties (table: Property_amenities)
ALTER TABLE Property_amenities ADD CONSTRAINT Property_amenities_Properties
    FOREIGN KEY (Properties_Id)
    REFERENCES Properties (Id);

-- Reference: Property_photos_Properties (table: Property_photos)
ALTER TABLE Property_photos ADD CONSTRAINT Property_photos_Properties
    FOREIGN KEY (Properties_Id)
    REFERENCES Properties (Id);

-- Reference: Viewing_Inquiry (table: Viewing)
ALTER TABLE Viewing ADD CONSTRAINT Viewing_Inquiry
    FOREIGN KEY (Inquiry_Id)
    REFERENCES Inquiry (Id);

-- End of file.

