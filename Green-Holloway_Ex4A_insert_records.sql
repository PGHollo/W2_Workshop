USE lana_dog_walking;
-- OWNERS
INSERT IGNORE INTO Owners (owner_id, first_name, last_name, email, phone) VALUES
(102,'Michael','Smith','msmith@gmail.com','410-555-1001'),
(103,'Sarah','Johnson','sjohnson@yahoo.com','410-555-1002'),
(104,'David','Lee','dlee@gmail.com','410-555-1003'),
(105,'Emily','Clark','eclark@yahoo.com','410-555-1004'),
(106,'James','Brown','jbrown@gmail.com','410-555-1005'),
(107,'Olivia','Davis','odavis@yahoo.com','410-555-1006'),
(108,'William','Miller','wmiller@gmail.com','410-555-1007'),
(109,'Sophia','Wilson','swilson@yahoo.com','410-555-1008'),
(110,'Benjamin','Moore','bmoore@gmail.com','410-555-1009'),
(111,'Ava','Taylor','ataylor@yahoo.com','410-555-1010');

-- DOGS
INSERT IGNORE INTO Dogs (dog_id, owner_id, dog_name, breed, age) VALUES
(203,102,'Buddy','Labrador',3),
(204,103,'Bella','Beagle',2),
(205,104,'Charlie','Bulldog',4),
(206,105,'Lucy','Poodle',1),
(207,106,'Max','German Shepherd',5),
(208,107,'Daisy','Golden Retriever',2),
(209,108,'Rocky','Boxer',3),
(210,109,'Luna','Husky',2),
(211,110,'Cooper','Dachshund',4),
(212,111,'Molly','Cocker Spaniel',3);

-- LOCATIONS
INSERT IGNORE INTO Locations (location_id, park_name, address, city, state) VALUES
(405,'Druid Hill Park','900 Druid Park Lake Dr','Baltimore','Maryland'),
(406,'Federal Hill Park','300 Warren Ave','Baltimore','Maryland'),
(407,'Canton Waterfront Park','3001 Boston St','Baltimore','Maryland'),
(408,'Leakin Park','1901 Eagle Dr','Baltimore','Maryland'),
(409,'Carroll Park','1500 Washington Blvd','Baltimore','Maryland'),
(410,'Clifton Park','2801 Harford Rd','Baltimore','Maryland'),
(411,'Herring Run Park','4901 Sinclair Ln','Baltimore','Maryland'),
(412,'Pimlico Park','5201 Park Heights Ave','Baltimore','Maryland'),
(413,'Riverside Park','1800 Covington St','Baltimore','Maryland'),
(414,'Wyman Park','2900 N Charles St','Baltimore','Maryland');

-- WALKS
INSERT IGNORE INTO Walks (walk_id, walk_date, location_id, duration_minutes, notes) VALUES
(304,'2026-02-01',405,20,'Energetic walk'),
(305,'2026-02-02',406,30,'Sunny day'),
(306,'2026-02-03',407,25,'Calm walk'),
(307,'2026-02-04',408,40,'Long trail'),
(308,'2026-02-05',409,15,'Quick outing'),
(309,'2026-02-06',410,35,'Playful dog'),
(310,'2026-02-07',411,20,'Light jog'),
(311,'2026-02-08',412,45,'Extended walk'),
(312,'2026-02-09',413,30,'Nice weather'),
(313,'2026-02-10',414,25,'Relaxed pace');

-- BOOKINGS
INSERT IGNORE INTO Bookings (booking_id, walk_id, dog_id, booking_date, walk_status) VALUES
(607,304,203,'2026-02-01','completed'),
(608,305,204,'2026-02-02','completed'),
(609,306,205,'2026-02-03','completed'),
(610,307,206,'2026-02-04','completed'),
(611,308,207,'2026-02-05','cancelled'),
(612,309,208,'2026-02-06','completed'),
(613,310,209,'2026-02-07','completed'),
(614,311,210,'2026-02-08','scheduled'),
(615,312,211,'2026-02-09','completed'),
(616,313,212,'2026-02-10','scheduled');

INSERT INTO Owners (owner_id, first_name, last_name, email, phone) VALUES
(102,'Michael','Smith','msmith@gmail.com','410-555-1001'),
(103,'Sarah','Johnson','sjohnson@yahoo.com','410-555-1002')
ON DUPLICATE KEY UPDATE
first_name = VALUES(first_name),
last_name = VALUES(last_name),
phone = VALUES(phone);

SELECT 
    o.first_name,
    o.last_name,
    d.dog_name,
    l.park_name,
    w.walk_date,
    b.walk_status
FROM Bookings b
JOIN Dogs d ON b.dog_id = d.dog_id
JOIN Owners o ON d.owner_id = o.owner_id
JOIN Walks w ON b.walk_id = w.walk_id
JOIN Locations l ON w.location_id = l.location_id
ORDER BY w.walk_date;