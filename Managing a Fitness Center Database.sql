USE fitness_center_db;

INSERT INTO Members (id, name, age) VALUES (1, 'Jane Doe', 28);
INSERT INTO Members (id, name, age) VALUES (2, 'John Smith', 35);
INSERT INTO Members (id, name, age) VALUES (3, 'Alice Johnson', 22);

INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity) 
VALUES (1, 1, '2024-06-15', '09:00 AM', 'Yoga');
INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity) 
VALUES (2, 2, '2024-06-15', '10:00 AM', 'Weight Training');
INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity) 
VALUES (3, 1, '2024-06-16', '08:00 AM', 'Cardio');
INSERT INTO WorkoutSessions (session_id, member_id, session_date, session_time, activity) 
VALUES (4, 3, '2024-06-17', '11:00 AM', 'Swimming');

UPDATE WorkoutSessions 
SET session_time = '05:00 PM' 
WHERE member_id = (SELECT id FROM Members WHERE name = 'Jane Doe') 
AND session_date = '2024-06-15'
AND activity = 'Yoga';

USE fitness_center_db;

-- Disable safe updates to allow deletion
SET SQL_SAFE_UPDATES = 0;

-- Delete the associated workout sessions first
DELETE FROM WorkoutSessions
WHERE member_id = (SELECT id FROM Members WHERE name = 'John Smith');

-- Delete the member record
DELETE FROM Members 
WHERE name = 'John Smith';

-- Re-enable safe updates
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM Members
SELECT * FROM WorkoutSessions