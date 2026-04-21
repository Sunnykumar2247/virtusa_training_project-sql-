                      --  SwiftShip E-Commerce Logistics Tracker
-- SECTION 1: DATABASE & TABLE CREATION

CREATE DATABASE IF NOT EXISTS SwiftShipDB;
USE SwiftShipDB;

CREATE TABLE Partners (
    PartnerID       INT             PRIMARY KEY AUTO_INCREMENT,
    PartnerName     VARCHAR(100)    NOT NULL,
    ContactEmail    VARCHAR(150)    UNIQUE NOT NULL,
    Phone           VARCHAR(15),
    Region          VARCHAR(50)     NOT NULL,
    JoinedDate      DATE            NOT NULL,
    IsActive        TINYINT(1)      DEFAULT 1
);


CREATE TABLE Shipments (
    ShipmentID INT PRIMARY KEY AUTO_INCREMENT,
    TrackingNumber VARCHAR(20) UNIQUE NOT NULL,
    PartnerID INT NOT NULL,
    SenderCity VARCHAR(100) NOT NULL,
    DestinationCity VARCHAR(100) NOT NULL,
    Weight_kg DECIMAL(6,2) NOT NULL,
    ShipmentDate DATE NOT NULL,
    PromisedDate DATE NOT NULL,
    ActualDeliveryDate DATE,
    Status VARCHAR(30) DEFAULT 'In Transit',
    FOREIGN KEY (PartnerID) REFERENCES Partners(PartnerID)
);


CREATE TABLE DeliveryLogs (
    LogID           INT             PRIMARY KEY AUTO_INCREMENT,
    ShipmentID      INT             NOT NULL,
    LogDate         DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Location        VARCHAR(100)    NOT NULL,
    StatusUpdate    VARCHAR(50)     NOT NULL,
    Remarks         VARCHAR(255),
    FOREIGN KEY (ShipmentID) REFERENCES Shipments(ShipmentID)
                             ON DELETE CASCADE
                             ON UPDATE CASCADE
);


-- SECTION 2: SAMPLE DATA INSERTION


INSERT INTO Partners (PartnerName, ContactEmail, Phone, Region, JoinedDate) VALUES
('BlueArrow Logistics',   'ops@bluearrow.in',      '9810001001', 'North India',  '2020-03-15'),
('QuickMove Express',     'support@quickmove.in',  '9820002002', 'South India',  '2019-07-22'),
('RapidRun Couriers',     'info@rapidrun.in',       '9830003003', 'West India',   '2021-01-10'),
('SkyLine Deliveries',    'admin@skyline.co.in',   '9840004004', 'East India',   '2020-11-05'),
('FastTrack Freight',     'contact@fasttrack.in',  '9850005005', 'Central India','2022-06-30'),
('PrimePath Logistics',   'hello@primepath.in',    '9860006006', 'North India',  '2021-09-18'),
('EcoShip Partners',      'eco@ecoship.in',         '9870007007', 'West India',   '2023-02-28'),
('NorthStar Cargo',       'cargo@northstar.in',    '9880008008', 'North India',  '2019-12-01'),
('SunBurst Express',      'ops@sunburst.in',       '9890009009', 'South India',  '2022-04-14'),
('Iron Horse Freight',    'iron@ironhorse.in',     '9811001011', 'East India',   '2020-08-20'),
('SwiftWing Couriers',    'swift@swiftwing.in',    '9812002012', 'West India',   '2023-07-07'),
('DeltaMove Solutions',   'delta@deltamove.in',    '9813003013', 'Central India','2021-03-25');



INSERT INTO Shipments
    (TrackingNumber, PartnerID, SenderCity, DestinationCity, Weight_kg,
     ShipmentDate, PromisedDate, ActualDeliveryDate, Status)
VALUES
('SS-2024-00001', 1,  'Delhi',      'Mumbai',       2.50, '2024-06-01', '2024-06-04', '2024-06-03', 'Delivered'),
('SS-2024-00002', 2,  'Chennai',    'Bangalore',    1.20, '2024-06-02', '2024-06-04', '2024-06-07', 'Delivered'),
('SS-2024-00003', 3,  'Pune',       'Hyderabad',    4.80, '2024-06-03', '2024-06-06', NULL,          'In Transit'),
('SS-2024-00004', 1,  'Delhi',      'Kolkata',      3.00, '2024-06-04', '2024-06-07', '2024-06-10', 'Delivered'),
('SS-2024-00005', 4,  'Kolkata',    'Delhi',        0.80, '2024-06-05', '2024-06-08', '2024-06-08', 'Delivered'),
('SS-2024-00006', 5,  'Bhopal',     'Jaipur',       6.50, '2024-06-06', '2024-06-09', NULL,          'Returned'),
('SS-2024-00007', 2,  'Chennai',    'Coimbatore',   1.10, '2024-06-07', '2024-06-09', '2024-06-09', 'Delivered'),
('SS-2024-00008', 6,  'Lucknow',    'Agra',         2.20, '2024-06-08', '2024-06-10', '2024-06-15', 'Delivered'),
('SS-2024-00009', 3,  'Mumbai',     'Nagpur',       5.00, '2024-06-09', '2024-06-12', NULL,          'Lost'),
('SS-2024-00010', 7,  'Ahmedabad',  'Surat',        3.75, '2024-06-10', '2024-06-12', '2024-06-12', 'Delivered'),
('SS-2024-00011', 8,  'Chandigarh', 'Delhi',        1.50, '2024-06-11', '2024-06-13', '2024-06-14', 'Delivered'),
('SS-2024-00012', 9,  'Hyderabad',  'Vijayawada',   0.95, '2024-06-12', '2024-06-14', NULL,          'In Transit'),
('SS-2024-00013', 10, 'Bhubaneswar','Kolkata',      2.80, '2024-06-13', '2024-06-15', '2024-06-18', 'Delivered'),
('SS-2024-00014', 1,  'Delhi',      'Jaipur',       1.00, '2024-06-14', '2024-06-16', '2024-06-16', 'Delivered'),
('SS-2024-00015', 4,  'Kolkata',    'Patna',        4.10, '2024-06-15', '2024-06-17', NULL,          'Returned'),
('SS-2024-00016', 11, 'Mumbai',     'Pune',         0.60, '2024-06-16', '2024-06-17', '2024-06-17', 'Delivered'),
('SS-2024-00017', 5,  'Indore',     'Bhopal',       3.30, '2024-06-17', '2024-06-19', NULL,          'Lost'),
('SS-2024-00018', 12, 'Nagpur',     'Mumbai',       7.00, '2024-06-18', '2024-06-20', '2024-06-20', 'Delivered'),
('SS-2024-00019', 6,  'Agra',       'Mathura',      1.90, '2024-06-19', '2024-06-21', '2024-06-25', 'Delivered'),
('SS-2024-00020', 2,  'Bangalore',  'Mysore',       2.10, '2024-06-20', '2024-06-22', '2024-06-22', 'Delivered');



INSERT INTO DeliveryLogs (ShipmentID, LogDate, Location, StatusUpdate, Remarks) VALUES
(1,  '2024-06-01 09:00:00', 'Delhi Hub',        'Picked Up',        'Package received at origin hub'),
(1,  '2024-06-02 14:00:00', 'Delhi-Mumbai Route','In Transit',      'Out for long-haul transport'),
(1,  '2024-06-03 11:00:00', 'Mumbai Hub',       'Delivered',        'Delivered and signed by receiver'),
(2,  '2024-06-02 10:00:00', 'Chennai Hub',      'Picked Up',        'Package collected from sender'),
(2,  '2024-06-06 16:00:00', 'Bangalore Hub',    'Delayed',          'Vehicle breakdown – rerouted'),
(2,  '2024-06-07 09:30:00', 'Bangalore Hub',    'Delivered',        'Delivered after delay'),
(3,  '2024-06-03 08:00:00', 'Pune Hub',         'Picked Up',        'In origin warehouse'),
(3,  '2024-06-05 12:00:00', 'Pune-Hyd Route',   'In Transit',       'On the road'),
(4,  '2024-06-04 07:00:00', 'Delhi Hub',        'Picked Up',        'Package collected'),
(4,  '2024-06-08 10:00:00', 'Kolkata Hub',      'Delayed',          'Customs clearance issue'),
(4,  '2024-06-10 14:00:00', 'Kolkata Hub',      'Delivered',        'Delivered to door'),
(5,  '2024-06-05 09:00:00', 'Kolkata Hub',      'Picked Up',        'Package received'),
(5,  '2024-06-08 11:00:00', 'Delhi Hub',        'Delivered',        'On-time delivery confirmed'),
(6,  '2024-06-06 10:00:00', 'Bhopal Hub',       'Picked Up',        'Collected from sender'),
(6,  '2024-06-08 17:00:00', 'Jaipur Hub',       'Returned',         'Recipient not found – returned'),
(7,  '2024-06-07 08:00:00', 'Chennai Hub',      'Picked Up',        'Package in warehouse'),
(7,  '2024-06-09 13:00:00', 'Coimbatore Hub',   'Delivered',        'Delivered on time'),
(9,  '2024-06-09 09:00:00', 'Mumbai Hub',       'Picked Up',        'Package collected'),
(9,  '2024-06-10 15:00:00', 'Mumbai-Nagpur',    'In Transit',       'Last seen on Mumbai-Nagpur highway'),
(10, '2024-06-10 08:00:00', 'Ahmedabad Hub',    'Picked Up',        'Package received at hub'),
(10, '2024-06-12 10:00:00', 'Surat Hub',        'Delivered',        'Delivered on schedule'),
(13, '2024-06-13 09:00:00', 'Bhubaneswar Hub',  'Picked Up',        'Package collected'),
(13, '2024-06-16 13:00:00', 'Kolkata Hub',      'Delayed',          'Flood-related delay in Odisha'),
(13, '2024-06-18 11:00:00', 'Kolkata Hub',      'Delivered',        'Delivered post delay'),
(19, '2024-06-25 09:00:00', 'Mathura Hub',      'Delayed',          'Driver absence – delivery delayed');


-- SECTION 3: CORE BUSINESS QUERIES

-- QUERY 1: Delayed Shipments
-- Find shipments delivered AFTER the promised date

SELECT
    s.TrackingNumber,
    p.PartnerName,
    s.SenderCity,
    s.DestinationCity,
    s.PromisedDate,
    s.ActualDeliveryDate,
    DATEDIFF(s.ActualDeliveryDate, s.PromisedDate) AS DelayDays
FROM
    Shipments s
    INNER JOIN Partners p ON s.PartnerID = p.PartnerID
WHERE
    s.ActualDeliveryDate IS NOT NULL
    AND s.ActualDeliveryDate > s.PromisedDate
ORDER BY
    DelayDays DESC;


-- QUERY 2: Partner Performance Scorecard
-- Total shipments, delivered, returned, success rate %

SELECT
    p.PartnerName,
    p.Region,
    COUNT(s.ShipmentID)                             AS TotalShipments,

    SUM(CASE WHEN s.Status = 'Delivered' THEN 1 ELSE 0 END)
                                                    AS Delivered,

    SUM(CASE WHEN s.Status = 'Returned'  THEN 1 ELSE 0 END)
                                                    AS Returned,

    SUM(CASE WHEN s.Status IN ('Lost','In Transit') THEN 1 ELSE 0 END)
                                                    AS PendingOrLost,

    ROUND(
        SUM(CASE WHEN s.Status = 'Delivered' THEN 1 ELSE 0 END)
        / COUNT(s.ShipmentID) * 100,
    2)                                              AS SuccessRate_pct
FROM
    Partners p
    LEFT JOIN Shipments s ON p.PartnerID = s.PartnerID
GROUP BY
    p.PartnerID, p.PartnerName, p.Region
HAVING
    TotalShipments > 0
ORDER BY
    SuccessRate_pct DESC,
    TotalShipments   DESC;


-- QUERY 3: Partner Delay Ranking
-- Rank partners by average delay (least delay = best rank)

SELECT
    p.PartnerName,
    COUNT(s.ShipmentID)                             AS DeliveredShipments,
    ROUND(
        AVG(DATEDIFF(s.ActualDeliveryDate, s.PromisedDate)),
    2)                                              AS AvgDelayDays,
    RANK() OVER (
        ORDER BY AVG(DATEDIFF(s.ActualDeliveryDate, s.PromisedDate)) ASC
    )                                               AS DelayRank
FROM
    Partners p
    INNER JOIN Shipments s ON p.PartnerID = s.PartnerID
WHERE
    s.ActualDeliveryDate IS NOT NULL
GROUP BY
    p.PartnerID, p.PartnerName
ORDER BY
    DelayRank;


-- QUERY 4: Popular Destination Cities (Last 30 Days)
-- Identifies hotspot cities for capacity planning

SELECT
    DestinationCity,
    COUNT(ShipmentID)       AS ShipmentCount
FROM
    Shipments
WHERE
    ShipmentDate >= CURDATE() - INTERVAL 30 DAY
GROUP BY
    DestinationCity
ORDER BY
    ShipmentCount DESC
LIMIT 10;

-- Note for testing: Run this alternative to test with the full dataset:
SELECT
    DestinationCity,
    COUNT(ShipmentID)       AS ShipmentCount
FROM
    Shipments
GROUP BY
    DestinationCity
ORDER BY
    ShipmentCount DESC
LIMIT 10;


-- SECTION 4: ADVANCED ANALYTICS

-- QUERY 5: Shipment Status Classification (CASE statement)
-- Categorize every shipment into human-readable categories

SELECT
    s.TrackingNumber,
    p.PartnerName,
    s.DestinationCity,
    s.Status,
    CASE
        WHEN s.Status = 'Delivered'
             AND s.ActualDeliveryDate <= s.PromisedDate   THEN 'On-Time Delivery'
        WHEN s.Status = 'Delivered'
             AND s.ActualDeliveryDate  > s.PromisedDate   THEN 'Late Delivery'
        WHEN s.Status = 'Returned'                        THEN 'Returned to Sender'
        WHEN s.Status = 'Lost'                            THEN 'Lost in Transit'
        WHEN s.Status = 'In Transit'
             AND CURDATE() > s.PromisedDate               THEN 'Overdue – In Transit'
        WHEN s.Status = 'In Transit'                      THEN 'In Transit (On Time)'
        ELSE 'Pending'
    END                             AS ShipmentCategory,
    s.PromisedDate,
    s.ActualDeliveryDate
FROM
    Shipments s
    INNER JOIN Partners p ON s.PartnerID = p.PartnerID
ORDER BY
    ShipmentCategory;


-- QUERY 6: Full Shipment Timeline using CTE
-- Show every shipment with its latest log entry

WITH LatestLog AS (
    SELECT
        ShipmentID,
        MAX(LogDate)    AS LastLogDate
    FROM
        DeliveryLogs
    GROUP BY
        ShipmentID
)
SELECT
    s.TrackingNumber,
    p.PartnerName,
    s.SenderCity,
    s.DestinationCity,
    s.Status,
    ll.LastLogDate,
    dl.Location         AS LastKnownLocation,
    dl.StatusUpdate     AS LastStatusUpdate
FROM
    Shipments s
    INNER JOIN Partners     p  ON s.PartnerID  = p.PartnerID
    LEFT  JOIN LatestLog    ll ON s.ShipmentID = ll.ShipmentID
    LEFT  JOIN DeliveryLogs dl ON ll.ShipmentID = dl.ShipmentID
                               AND ll.LastLogDate = dl.LogDate
ORDER BY
    ll.LastLogDate DESC;


-- QUERY 7: Zone Analysis — Weight shipped per region

SELECT
    p.Region,
    COUNT(s.ShipmentID)             AS TotalShipments,
    ROUND(SUM(s.Weight_kg), 2)      AS TotalWeight_kg,
    ROUND(AVG(s.Weight_kg), 2)      AS AvgWeight_kg
FROM
    Shipments s
    INNER JOIN Partners p ON s.PartnerID = p.PartnerID
GROUP BY
    p.Region
ORDER BY
    TotalShipments DESC;


-- SECTION 5: BONUS — Indexes & Lost-in-Transit Detection

-- INDEXING SUGGESTIONS
-- Speeds up the most common WHERE/JOIN columns

-- Speed up partner lookups in Shipments
CREATE INDEX idx_shipments_partner
    ON Shipments(PartnerID);

-- Speed up date-range queries (most common filter)
CREATE INDEX idx_shipments_date
    ON Shipments(ShipmentDate);

-- Speed up status-based filtering (Delayed, Lost queries)
CREATE INDEX idx_shipments_status
    ON Shipments(Status);

-- Speed up log lookups by shipment
CREATE INDEX idx_deliverylogs_shipment
    ON DeliveryLogs(ShipmentID);

-- Speed up log date queries (for Lost-in-Transit detection)
CREATE INDEX idx_deliverylogs_date
    ON DeliveryLogs(LogDate);


-- QUERY 8: Lost in Transit Detection
-- "No update for more than 7 days AND not yet delivered"


SELECT
    s.TrackingNumber,
    p.PartnerName,
    s.SenderCity,
    s.DestinationCity,
    s.ShipmentDate,
    s.PromisedDate,
    s.Status,
    MAX(dl.LogDate)                             AS LastUpdateDate,
    DATEDIFF(CURDATE(), MAX(dl.LogDate))        AS DaysSinceLastUpdate
FROM
    Shipments s
    INNER JOIN Partners     p  ON s.PartnerID  = p.PartnerID
    LEFT  JOIN DeliveryLogs dl ON s.ShipmentID = dl.ShipmentID
WHERE
    s.Status NOT IN ('Delivered', 'Returned')
GROUP BY
    s.ShipmentID, s.TrackingNumber, p.PartnerName,
    s.SenderCity, s.DestinationCity,
    s.ShipmentDate, s.PromisedDate, s.Status
HAVING
    -- Flag if last log is > 7 days ago, or no log at all
    (MAX(dl.LogDate) IS NULL)
    OR (DATEDIFF(CURDATE(), MAX(dl.LogDate)) > 7)
ORDER BY
    DaysSinceLastUpdate DESC;




SHOW TABLES;
select * from deliverylogs;


                            -- END OF SQL PROJECT