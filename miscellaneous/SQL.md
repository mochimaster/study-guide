We can use the word ALL to allow >= or > or < or <=to act over a list. 

For example, you can find the largest country in the world, by population with this query:

```
SELECT name
  FROM world
 WHERE population >= ALL(SELECT population
                           FROM world
                          WHERE population>0)
```


CONCAT allows you to stick two or more strings together.

This operation is concatenation.
```
   CONCAT(s1, s2 ...)   
```

```                
SELECT CONCAT(region,name)
  FROM bbc
```

ROUND(f,p) returns f rounded to p decimal places.

The number of decimal places may be negative, this will round to the nearest 10 (when p is -1) or 100 (when p is -2) or 1000 (when p is -3) etc..
```
ROUND(7253.86, 0)    ->  7254
ROUND(7253.86, 1)    ->  7253.9
ROUND(7253.86,-3)    ->  7000
```


```
SELECT name,
       ROUND(population/1000000,1)
  FROM bbc
```

Stored Procedure Example

The following SQL statement creates a stored procedure named "SelectAllCustomers" that selects all records from the "Customers" table:

Example
```
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City
GO;
```

Execute the stored procedure above as follows:

Example
```
EXEC SelectAllCustomers City="London", PostalCode = "WA1 1ADP";
```

```
SELECT
  CASE
    WHEN
      books.title = 'The Hobbit'
        THEN
          'Middle-earth'
    WHEN
      books.primary_author = 'Tolkien'
        THEN
          'Middle-earth'
    ELSE
      'Earth'
  END AS locale,
  books.*
FROM
  books
  ```

```
IF
  title == 'The Hobbit' OR
  primary_author == 'Tolkien'
THEN
  RETURN 'Middle-earth'
ELSE
  RETURN 'Earth'
END
```

```
-- Create the table.
CREATE TABLE TestTable (cola int, colb char(3));
GO
SET NOCOUNT ON;
GO
-- Declare the variable to be used.
DECLARE @MyCounter int;

-- Initialize the variable.
SET @MyCounter = 0;

-- Test the variable to see if the loop is finished.
WHILE (@MyCounter < 26)
BEGIN;
   -- Insert a row into the table.
   INSERT INTO TestTable VALUES
       -- Use the variable to provide the integer value
       -- for cola. Also use it to generate a unique letter
       -- for each row. Use the ASCII function to get the
       -- integer value of 'a'. Add @MyCounter. Use CHAR to
       -- convert the sum back to the character @MyCounter
       -- characters after 'a'.
       (@MyCounter,
        CHAR( ( @MyCounter + ASCII('a') ) )
       );
   -- Increment the variable to count this iteration
   -- of the loop.
   SET @MyCounter = @MyCounter + 1;
END;
```

```
BEGIN TRANSACTION TransactionWithGos;
GO

SET XACT_ABORT ON; -- Roll back everything if error occurs in script
GO

-- do stuff
GO

COMMIT TRANSACTION TransactionWithGos;
GO

```