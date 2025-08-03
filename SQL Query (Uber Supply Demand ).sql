create database Uber_Supply

CREATE TABLE uber_requests (
    request_id INT PRIMARY KEY,
    request_timestamp DATETIME,
    pickup_point VARCHAR(50),
    status VARCHAR(50),
    driver_id INT)

INSERT INTO uber_requests VALUES
(1, '2025-08-01 08:00:00', 'Airport', 'Completed', 101),
(2, '2025-08-01 09:15:00', 'City', 'Cancelled', NULL),
(3, '2025-08-01 10:30:00', 'Airport', 'No Cars Available', NULL),
(4, '2025-08-01 11:45:00', 'City', 'Completed', 102),
(5, '2025-08-01 12:00:00', 'Airport', 'Cancelled', NULL)

select * from uber_requests 

--SAMPLE INSIGHTS
-- a. Count of trips per status
SELECT status, COUNT(*) AS total_requests
FROM uber_requests
GROUP BY status

-- b. Requests per pickup point
SELECT pickup_point, COUNT(*) AS total_requests
FROM uber_requests
GROUP BY pickup_point

-- c. Cancellations without driver assigned
SELECT COUNT(*) AS cancelled_without_driver
FROM uber_requests
WHERE status = 'Cancelled' AND driver_id IS NULL
