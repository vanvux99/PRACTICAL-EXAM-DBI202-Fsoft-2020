USE PE_DBI202_Sp2020;
GO

--1, 
SELECT DISTINCT
       a.CUST_ID,
       c.ADDRESS,
       c.CITY,
       c.CUST_TYPE_CD,
       c.POSTAL_CODE,
       c.STATE
FROM dbo.ACCOUNT a
    INNER JOIN dbo.CUSTOMER c
        ON c.CUST_ID = a.CUST_ID
WHERE c.CUST_TYPE_CD = 'I';
GO

--2, 
SELECT COUNT(c.CUST_ID) Total
FROM dbo.CUSTOMER c
    INNER JOIN dbo.BUSINESS b
        ON b.CUST_ID = c.CUST_ID;
GO

--3, 
SELECT *
FROM dbo.ACCOUNT
WHERE AVAIL_BALANCE != PENDING_BALANCE;
GO

--4, 
SELECT c.CUST_ID,
       c.CUST_TYPE_CD,
       (CASE
            WHEN i.FIRST_NAME IS NOT NULL THEN
                CONCAT(i.FIRST_NAME, i.LAST_NAME)
            WHEN b.NAME IS NOT NULL THEN
                b.NAME
        END
       ) name
FROM dbo.CUSTOMER c
    FULL JOIN dbo.INDIVIDUAL i
        ON i.CUST_ID = c.CUST_ID
    FULL JOIN dbo.BUSINESS b
        ON b.CUST_ID = c.CUST_ID;
GO

--5, 
SELECT e.EMP_ID,
       CONCAT(e.FIRST_NAME, e.LAST_NAME) name,
       COUNT(a.OPEN_EMP_ID) number
FROM dbo.EMPLOYEE e
    FULL JOIN dbo.ACCOUNT a
        ON a.OPEN_EMP_ID = e.EMP_ID
GROUP BY e.EMP_ID,
         e.FIRST_NAME,
         e.LAST_NAME;
GO

--6, List all account which have one Customer
SELECT c.CUST_ID
FROM dbo.ACCOUNT a
    INNER JOIN dbo.CUSTOMER c
        ON c.CUST_ID = a.CUST_ID
GROUP BY c.CUST_ID
HAVING (COUNT(c.CUST_ID) = 1);
GO
