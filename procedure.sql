DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(guests) AS MaxGuests FROM bookings;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE AddBooking(
    IN customerName VARCHAR(100),
    IN bookingDate DATE,
    IN bookingTime TIME,
    IN guests INT
)
BEGIN
    INSERT INTO bookings (customer_name, booking_date, booking_time, guests)
    VALUES (customerName, bookingDate, bookingTime, guests);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN bookingId INT,
    IN newDate DATE,
    IN newTime TIME,
    IN newGuests INT
)
BEGIN
    UPDATE bookings
    SET booking_date = newDate,
        booking_time = newTime,
        guests = newGuests
    WHERE booking_id = bookingId;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CancelBooking(IN bookingId INT)
BEGIN
    DELETE FROM bookings WHERE booking_id = bookingId;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE ManageBooking(
    IN customerName VARCHAR(100),
    IN bookingDate DATE,
    IN bookingTime TIME,
    IN guests INT
)
BEGIN
    DECLARE existingCount INT;

    SELECT COUNT(*) INTO existingCount
    FROM bookings
    WHERE booking_date = bookingDate AND booking_time = bookingTime;

    IF existingCount = 0 THEN
        INSERT INTO bookings (customer_name, booking_date, booking_time, guests)
        VALUES (customerName, bookingDate, bookingTime, guests);
    ELSE
        SELECT 'Time slot already booked' AS Message;
    END IF;
END //

DELIMITER ;
