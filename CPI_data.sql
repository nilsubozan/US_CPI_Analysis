CREATE DATABASE INFLATION

SELECT * FROM INFLATION..Food_Beverage_CPI

--Unpivoting Months and adding category column 'Food and Beverage'

SELECT 
    Year, 
    Month, 
    CPI_Value,
    'Food and Beverage' AS category
INTO 
    INFLATION..Unpivoted_Food_Beverage_CPI
FROM 
    INFLATION..Food_Beverage_CPI
UNPIVOT (
    CPI_Value FOR Month IN (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)
) AS UnpivotedCPI;

SELECT * FROM Unpivoted_Food_Beverage_CPI


SELECT * FROM Food_Beverage_CPI

--Unpivoting Months and adding category column 'Food_at_Home'


SELECT 
    Year, 
    Month, 
    CPI_Value,
    'Food at Home' AS category
INTO 
    INFLATION..Unpivoted_Food_at_Home
FROM 
    INFLATION..Food_at_Home
UNPIVOT (
    CPI_Value FOR Month IN (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)
) AS UnpivotedCPI;


--Unpivoting Months and adding category column 'Food_Away_from_Home'
SELECT 
    Year, 
    Month, 
    CPI_Value,
    'Food Away From Home' AS category
INTO 
    INFLATION..Unpivoted_Food_Away_from_Home
FROM 
    INFLATION..Food_Away_from_Home
UNPIVOT (
    CPI_Value FOR Month IN (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)
) AS UnpivotedCPI;

SELECT * FROM Unpivoted_Food_Away_from_Home

--Unpivoting Months and adding category column 'Energy'
SELECT 
    Year, 
    Month, 
    CPI_Value,
    'Energy' AS category
INTO 
    INFLATION..Unpivoted_Energy
FROM 
    INFLATION..Energy
UNPIVOT (
    CPI_Value FOR Month IN (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)
) AS UnpivotedCPI;

SELECT * FROM Unpivoted_Energy

--Unpivoting Months and adding category column 'Gasoline'
SELECT 
    Year, 
    Month, 
    CPI_Value,
    'Gasoline' AS category
INTO 
    INFLATION..Unpivoted_Gasoline
FROM 
    INFLATION..Gasoline
UNPIVOT (
    CPI_Value FOR Month IN (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)
) AS UnpivotedCPI;

SELECT * FROM Unpivoted_Gasoline

--Unpivoting Months and adding category column 'Housing'
SELECT 
    Year, 
    Month, 
    CPI_Value,
    'Housing' AS category
INTO 
    INFLATION..Unpivoted_Housing
FROM 
    INFLATION..Housing
UNPIVOT (
    CPI_Value FOR Month IN (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)
) AS UnpivotedCPI;

SELECT * FROM Unpivoted_Housing

--Unpivoting Months and adding category column 'Shelter'
SELECT 
    Year, 
    Month, 
    CPI_Value,
    'Shelter' AS category
INTO 
    INFLATION..Unpivoted_Shelter
FROM 
    INFLATION..Shelter
UNPIVOT (
    CPI_Value FOR Month IN (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)
) AS UnpivotedCPI;

SELECT * FROM Unpivoted_Shelter

--Unpivoting Months and adding category column 'Medical_Care'
SELECT 
    Year, 
    Month, 
    CPI_Value,
    'Medical Care' AS category
INTO 
    INFLATION..Unpivoted_Medical_Care
FROM 
    INFLATION..Medical_Care
UNPIVOT (
    CPI_Value FOR Month IN (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)
) AS UnpivotedCPI;

SELECT * FROM Unpivoted_Medical_Care

--Unpivoting Months and adding category column 'Presciption Drugs'
SELECT 
    Year, 
    Month, 
    CPI_Value,
    'Prescription Drugs' AS category
INTO 
    INFLATION..Unpivoted_Presc_Drugs
FROM 
    INFLATION..Presc_Drugs
UNPIVOT (
    CPI_Value FOR Month IN (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)
) AS UnpivotedCPI;

SELECT * FROM Unpivoted_Presc_Drugs

--Unpivoting Months and adding category column 'New_Vehicles'
SELECT 
    Year, 
    Month, 
    CPI_Value,
    'New Vehicles' AS category
INTO 
    INFLATION..Unpivoted_New_Vehicles
FROM 
    INFLATION..New_Vehicles
UNPIVOT (
    CPI_Value FOR Month IN (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)
) AS UnpivotedCPI;

SELECT * FROM Unpivoted_New_Vehicles

--Unpivoting Months and adding category column 'Transportation'
SELECT 
    Year, 
    Month, 
    CPI_Value,
    'Transportation' AS category
INTO 
    INFLATION..Unpivoted_Transportation
FROM 
    INFLATION..Transportation
UNPIVOT (
    CPI_Value FOR Month IN (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)
) AS UnpivotedCPI;

SELECT * FROM Unpivoted_Transportation

--Unpivoting Months and adding category column 'Used_Cars_and_Trucks'
SELECT 
    Year, 
    Month, 
    CPI_Value,
    'Used Cars and Trucks' AS category
INTO 
    INFLATION..Unpivoted_Used_Cars_and_Trucks
FROM 
    INFLATION..Used_Cars_and_Trucks
UNPIVOT (
    CPI_Value FOR Month IN (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec)
) AS UnpivotedCPI;

SELECT * FROM Unpivoted_Used_Cars_and_Trucks


--UNION ALL 

-- Combining and storing into a new table 'Consolidated_CPI'

SELECT Year, Month, CPI_Value, Category 
INTO INFLATION..Consolidated_CPI
FROM INFLATION..Unpivoted_Food_Beverage_CPI
UNION ALL
SELECT Year, Month, CPI_Value, Category FROM INFLATION..Unpivoted_Food_at_Home
UNION ALL
SELECT Year, Month, CPI_Value, Category FROM INFLATION..Unpivoted_Food_Away_from_Home
UNION ALL
SELECT Year, Month, CPI_Value, Category FROM INFLATION..Unpivoted_Energy
UNION ALL
SELECT Year, Month, CPI_Value, Category FROM INFLATION..Unpivoted_Gasoline
UNION ALL
SELECT Year, Month, CPI_Value, Category FROM INFLATION..Unpivoted_Housing
UNION ALL
SELECT Year, Month, CPI_Value, Category FROM INFLATION..Unpivoted_Shelter
UNION ALL
SELECT Year, Month, CPI_Value, Category FROM INFLATION..Unpivoted_Medical_Care
UNION ALL
SELECT Year, Month, CPI_Value, Category FROM INFLATION..Unpivoted_Presc_Drugs
UNION ALL
SELECT Year, Month, CPI_Value, Category FROM INFLATION..Unpivoted_New_Vehicles
UNION ALL
SELECT Year, Month, CPI_Value, Category FROM INFLATION..Unpivoted_Transportation
UNION ALL
SELECT Year, Month, CPI_Value, Category FROM INFLATION..Unpivoted_Used_Cars_and_Trucks;

SELECT * FROM Consolidated_CPI




