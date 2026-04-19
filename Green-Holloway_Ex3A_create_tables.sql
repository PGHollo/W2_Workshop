DROP SCHEMA IF EXISTS lana_dog_walking;
CREATE SCHEMA lana_dog_walking;
USE lana_dog_walking;

-- Locations (where walks take place)
CREATE TABLE Locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    park_name VARCHAR(100) NOT NULL,
    address VARCHAR(150),
    city VARCHAR(50),
    state VARCHAR(50)
);

-- Owners (customers)
CREATE TABLE Owners (
    owner_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

-- Dogs (pets being walked)
CREATE TABLE Dogs (
    dog_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id INT,
    dog_name VARCHAR(50) NOT NULL,
    breed VARCHAR(50),
    age INT,
    FOREIGN KEY (owner_id) REFERENCES Owners(owner_id)
);

-- Walks (scheduled dog walks)
CREATE TABLE Walks (
    walk_id INT AUTO_INCREMENT PRIMARY KEY,
    walk_date DATE,
    location_id INT,
    duration_minutes INT,
    notes TEXT,
    FOREIGN KEY (location_id) REFERENCES Locations(location_id)
);

-- Bookings (connects dogs to walks)
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    walk_id INT,
    dog_id INT,
    booking_date DATE,
    walk_status VARCHAR(20),
    FOREIGN KEY (walk_id) REFERENCES Walks(walk_id),
    FOREIGN KEY (dog_id) REFERENCES Dogs(dog_id)
);