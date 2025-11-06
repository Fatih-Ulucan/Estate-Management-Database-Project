--WHERE
--1- Show all active listings
SELECT *
FROM LISTING
WHERE IS_ACTIVE = 1;

--2- Show all properties in Warsaw
SELECT *
FROM PROPERTIES
WHERE CITY = 'Warsaw';

--3- Show properties bigger than 100 square meters
SELECT *
FROM PROPERTIES
WHERE TO_NUMBER(SIZE_SQM) > 100;

--4- Show only properties listed for rent
SELECT *
FROM LISTING
WHERE TYPE = 'Rent';

--5- Show all inquiries with pending status
SELECT *
FROM INQUIRY
WHERE STATUS = 'Pending';

--JOIN
--1- Show listing details with property address
SELECT L.ID, P.ADRESS, L.PRICE
FROM LISTING L
JOIN PROPERTIES P ON L.PROPERTIES_ID = P.ID;

--2- Show users and their inquiries
SELECT U.FIRST_NAME, U.LAST_NAME, I.STATUS
FROM INQUIRY I
JOIN "USER" U ON I.USER_ID = U.ID;

--3- Show agents with listings they manage
SELECT A.FIRST_NAME, L.TYPE
FROM AGENT_ASSIGNMENTS AA
JOIN AGENTS A ON AA.AGENTS_ID = A.ID
JOIN LISTING L ON AA.LISTING_ID = L.ID;

--4- Show viewings with the user who requested them
SELECT V.SCHEDULED_DATE, U.FIRST_NAME
FROM VIEWING V
JOIN INQUIRY I ON V.INQUIRY_ID = I.ID
JOIN "USER" U ON I.USER_ID = U.ID;

--5- Show contract payments and contract type
SELECT P.AMOUNT, C.TYPE
FROM PAYMENT P
JOIN CONTRACT C ON P.CONTRACT_ID = C.ID;

--GROUP BY
--1- Count how many properties are in each city
SELECT CITY, COUNT(*) AS PROPERTY_COUNT
FROM PROPERTIES
GROUP BY CITY;

--2- Count how many users there are for each type
SELECT TYPE, COUNT(*) AS USER_COUNT
FROM "USER"
GROUP BY TYPE;

--3- Count how many listings each agent has
SELECT AGENTS_ID, COUNT(*) AS LISTING_COUNT
FROM AGENT_ASSIGNMENTS
GROUP BY AGENTS_ID;

--4- Show total area per property type
SELECT TYPE, SUM(TO_NUMBER(SIZE_SQM)) AS TOTAL_AREA
FROM PROPERTIES
GROUP BY TYPE;

--5- Show the max listing price for each property
SELECT PROPERTIES_ID, MAX(PRICE) AS MAX_PRICE
FROM LISTING
GROUP BY PROPERTIES_ID;

--SUBQUERY
--1- Show the most expensive listing
SELECT * FROM LISTING
WHERE PRICE = (SELECT MAX(PRICE) FROM LISTING);

--2- Show addresses of properties that have a balcony
SELECT ADRESS
FROM PROPERTIES
WHERE ID IN (
  SELECT PROPERTIES_ID
  FROM PROPERTY_AMENITIES
  WHERE AMENITITY_ID = (
    SELECT ID FROM AMENITITY WHERE NAME = 'Balcony'
  )
);

--3- Show each inquiry with the price of the listing (correlated subquery)
SELECT I.ID, I.USER_ID,
  (SELECT PRICE FROM LISTING L WHERE L.ID = I.LISTING_ID) AS LISTING_PRICE
FROM INQUIRY I;
