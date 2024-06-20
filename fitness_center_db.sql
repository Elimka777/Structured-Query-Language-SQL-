USE fitness_center_db;

-- Creating the Members table
CREATE TABLE Members (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT
);

-- Creating the WorkoutSessions table
CREATE TABLE WorkoutSessions (
    session_id INT PRIMARY KEY,
    member_id INT,
    session_date DATE,
    session_time VARCHAR(50),
    activity VARCHAR(255),
    FOREIGN KEY (member_id) REFERENCES Members(id)
);

-- Task 1: SQL Data Insertion

-- Inserting records into the Members table
INSERT INTO Members (id, name, age) VALUES (1, 'Jane Doe', 28);
INSERT INTO Members (id, name, age) VALUES (2, 'John Smith', 35);
INSERT INTO Members (id, name, age) VALUES (3, 'Alice Johnson', 22);

-- Inserting records into the WorkoutSessions table
INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity) 
VALUES (1, 1, '2024-06-15', '09:00 AM', 'Yoga');
INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity) 
VALUES (2, 2, '2024-06-15', '10:00 AM', 'Weight Training');
INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity) 
VALUES (3, 1, '2024-06-16', '08:00 AM', 'Cardio');
INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity) 
VALUES (4, 3, '2024-06-17', '11:00 AM', 'Swimming');

-- Task 2: SQL Data Update

-- Updating the workout session time for Jane Doe
UPDATE WorkoutSessions 
SET session_time = '05:00 PM' 
WHERE member_id = (SELECT id FROM Members WHERE name = 'Jane Doe') 
AND session_date = '2024-06-15'
AND activity = 'Yoga';

-- Task 3: SQL Data Deletion

-- Disable foreign key checks to allow deletion
SET FOREIGN_KEY_CHECKS = 0;

-- Deleting the associated workout sessions first
DELETE FROM WorkoutSessions
WHERE member_id = (SELECT id FROM Members WHERE name = 'John Smith');

-- Deleting the member record
DELETE FROM Members 
WHERE name = 'John Smith';

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;
