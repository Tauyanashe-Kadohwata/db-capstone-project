CREATE DATABASE IF NOT EXISTS littlelemon;

USE littlelemon;

CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    booking_date DATE,
    booking_time TIME,
    guests INT
);

INSERT INTO bookings (customer_name, booking_date, booking_time, guests)
VALUES 
  ('Alice Johnson', '2025-05-20', '18:30:00', 4),
  ('Bob Smith', '2025-05-20', '19:00:00', 2),
  ('Carla Green', '2025-05-21', '17:00:00', 6);

