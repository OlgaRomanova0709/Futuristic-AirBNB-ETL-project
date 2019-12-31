-- Futuristic Airbnb - ETL
DROP DATABASE IF EXISTS Futuristic_Airbnb_db;
-- Creating Database
CREATE DATABASE IF NOT EXISTS Futuristic_Airbnb_db;

-- ALtering Database to incorporate the Unicode charset
ALTER DATABASE Futuristic_Airbnb_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Fetching the Database
USE Futuristic_Airbnb_db;

-- Dropping the tables if exists
DROP TABLE IF EXISTS Futuristic_Airbnb_Hawaii_RCB;
DROP TABLE IF EXISTS Futuristic_Airbnb_calendar;
DROP TABLE IF EXISTS Futuristic_Airbnb_Property_Reviews;
DROP TABLE IF EXISTS Futuristic_Airbnb_Property_Availability;
DROP TABLE IF EXISTS Futuristic_Airbnb_Property_Address;
DROP TABLE IF EXISTS Futuristic_Airbnb_Listings_Property;
DROP TABLE IF EXISTS Futuristic_Airbnb_Hosts;

-- Creating tables - Fututuristic Host table
CREATE TABLE Futuristic_Airbnb_Hosts (
    host_id INT,
	host_url VARCHAR(200),
    host_name VARCHAR(200),
    host_about blob,
    host_thumbnail_url VARCHAR(200),
    host_picture_url VARCHAR(200),
    host_neighbourhood VARCHAR(200),
    host_since DATE,
    host_location VARCHAR(200),
    host_response_time VARCHAR(200),
    host_response_rate INT,
    host_is_superhost BOOLEAN,
    host_listings_count INT,
    host_has_profile_pic BOOLEAN,
    host_identity_verified BOOLEAN,
    PRIMARY KEY(host_id)
);

CREATE TABLE Futuristic_Airbnb_Listings_Property (
    listing_id INT,
	listing_url VARCHAR(500),
    name VARCHAR(1000),
    summary VARCHAR(1000),
    description VARCHAR(1000),
    transit VARCHAR(1000),
    access VARCHAR(1000),
    house_rules VARCHAR(1000),
    property_type VARCHAR(500),
    room_type VARCHAR(500),
    accommodates INT,
    bathrooms FLOAT,
    bedrooms FLOAT,
    bed_type VARCHAR(500),
    beds FLOAT,
    amenities VARCHAR(2000),
    price FLOAT,
    security_deposit FLOAT,
    cleaning_fee FLOAT,
    guests_included INT, 
    extra_people FLOAT,
	minimum_nights INT,
    maximum_nights INT,
    requires_license BOOLEAN,
    instant_bookable BOOLEAN,
    is_business_travel_ready BOOLEAN,
	cancellation_policy VARCHAR(100),
    require_guest_profile_picture BOOLEAN,
    require_guest_phone_verification BOOLEAN,
    host_id INT,
    PRIMARY KEY(listing_id),
    FOREIGN KEY(host_id) REFERENCES Futuristic_Airbnb_Hosts(host_id) ON DELETE CASCADE
);

CREATE TABLE Futuristic_Airbnb_Property_Address (
	address_id INT NOT NULL AUTO_INCREMENT,
    listing_id INT,
    street VARCHAR(1000),
    neighbourhood VARCHAR(1000),
    neighbourhood_cleansed VARCHAR(1000),   
    neighbourhood_group_cleansed VARCHAR(1000),
    city VARCHAR(1000),
    state VARCHAR(1000),
    zipcode VARCHAR(10),
    market VARCHAR(1000),
    smart_location VARCHAR(1000),
    country VARCHAR(1000),
    country_code VARCHAR(5),
    latitude DECIMAL(8,5),
    longitude  DECIMAL(8,5),
    is_location_exact BOOLEAN,
    PRIMARY KEY(address_id),
    FOREIGN KEY(listing_id) REFERENCES Futuristic_Airbnb_Listings_Property(listing_id) ON DELETE CASCADE
    
);


CREATE TABLE Futuristic_Airbnb_Property_Availability
(
	id INT NOT NULL AUTO_INCREMENT,
    listing_id INT,
	has_availability BOOLEAN,
    availability_30 INT,
    availability_60 INT,
    availability_90 INT,
    availability_365 INT,
    PRIMARY KEY(id),
    FOREIGN KEY(listing_id) REFERENCES Futuristic_Airbnb_Listings_Property(listing_id) ON DELETE CASCADE
);

CREATE TABLE Futuristic_Airbnb_Property_Reviews (
	listing_id INT,
	number_of_reviews INT,
    number_of_reviews_ltm int,
    first_review date,
    last_review date,
    review_scores_rating int,
    review_scores_accuracy int,
    review_scores_cleanliness int,
    review_scores_checkin int,
    review_scores_communication int,
    review_scores_location int,
    review_scores_value int,
    reviews_per_month float,
    review_id int,
    review_date date,
    reviewer_id int,
    reviewer_name varchar(5000),
    comments text,
    PRIMARY KEY(review_id,reviewer_id),
	FOREIGN KEY (listing_id) REFERENCES Futuristic_Airbnb_Listings_Property(listing_id) on delete cascade
);

CREATE TABLE Futuristic_Airbnb_calendar
(
	id INT NOT NULL AUTO_INCREMENT,
    listing_id INT,
	date DATE,
    available BOOLEAN,
    price FLOAT,
    adjusted_price FLOAT,
	minimum_nights INT,
    maximum_nights INT,
    PRIMARY KEY(id),
    FOREIGN KEY(listing_id) REFERENCES Futuristic_Airbnb_Listings_Property(listing_id) ON DELETE CASCADE
);

CREATE TABLE Futuristic_Airbnb_Hawaii_RCB (
    
    id INT NOT NULL AUTO_INCREMENT, 
    city VARCHAR(1000),
    name VARCHAR(1000),
    rating float,
    address VARCHAR(1000),
    zipcode int,
    latitude DECIMAL(10,5),
    longitude DECIMAL(10,5),
    category VARCHAR(1000),
    listing_id int,
    PRIMARY KEY(id),
    FOREIGN KEY(listing_id) references Futuristic_Airbnb_Property_Address(listing_id) on delete CASCADE
    
);

