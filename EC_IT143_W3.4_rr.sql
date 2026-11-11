
/*****************************************************************************************************************
Q1: Business User question - Marginal complexity
    Author: Sanele Mbhele
    "Which ten employees have the highest vacation hours available?"
    
    Approach: HumanResources.Employee stores VacationHours for every employee.
              Sort from highest to lowest and keep the top ten.
******************************************************************************************************************/

SELECT TOP (10)
       e.BusinessEntityID,
       e.JobTitle,
       e.VacationHours
  FROM HumanResources.Employee AS e
 ORDER BY e.VacationHours DESC;


/*****************************************************************************************************************
Q2: Business User question - Marginal complexity
    Author: Rony Reyes
    "How many products do we sell in each color?"
    
    Approach: Production.Product has a Color column. FinishedGoodsFlag = 1 means the product is
              sold to customers (0 means it is a component). Products with no color are shown as 'No Color'.
******************************************************************************************************************/

SELECT ISNULL(p.Color, 'No Color') AS Color,
       COUNT(*)                     AS ProductCount
  FROM Production.Product AS p
 WHERE p.FinishedGoodsFlag = 1
 GROUP BY p.Color
 ORDER BY ProductCount DESC;


/*****************************************************************************************************************
Q3: Business User question - Moderate complexity
    Author: Sanele Mbhele
    "I want to know our best customers. Which five customers spent the most money? Show their full names
    and total order amounts from their orders."
    
    Approach: Sum TotalDue from Sales.SalesOrderHeader for each customer, then join Sales.Customer to
              Person.Person to get the names. Only individual customers are included (StoreID IS NULL),
              because store customers are businesses, not people.
******************************************************************************************************************/

SELECT TOP (5)
       p.FirstName,
       p.LastName,
       SUM(soh.TotalDue) AS TotalSpent
  FROM Sales.SalesOrderHeader AS soh
       INNER JOIN Sales.Customer AS c
               ON soh.CustomerID = c.CustomerID
       INNER JOIN Person.Person AS p
               ON c.PersonID = p.BusinessEntityID
 WHERE c.StoreID IS NULL
 GROUP BY c.CustomerID,
          p.FirstName,
          p.LastName
 ORDER BY TotalSpent DESC;


/*****************************************************************************************************************
Q4: Business User question - Moderate complexity
    Author: Tyler Robinson
    "How many sales orders were placed in each sales territory during 2013? Include the territory name
    and total order count."
    
    Approach: Count orders in Sales.SalesOrderHeader for 2013 and join Sales.SalesTerritory for the name.
              The date range (>= Jan 1, 2013 and < Jan 1, 2014) includes every order placed in 2013.
******************************************************************************************************************/

SELECT st.Name                    AS TerritoryName,
       COUNT(soh.SalesOrderID)    AS OrderCount
  FROM Sales.SalesOrderHeader AS soh
       INNER JOIN Sales.SalesTerritory AS st
               ON soh.TerritoryID = st.TerritoryID
 WHERE soh.OrderDate >= '2013-01-01'
   AND soh.OrderDate <  '2014-01-01'
 GROUP BY st.Name
 ORDER BY OrderCount DESC;


/*****************************************************************************************************************
Q5: Business User question - Increased complexity
    Author: Rony Reyes
    "Our CEO noticed that some products never sell. Before our next inventory meeting, I need a list of
    products that have never appeared on any sales order. Please show the product name, product number,
    and list price, and sort them from most to least expensive."
    
    Approach: Use NOT EXISTS to keep only products whose ProductID never appears in
              Sales.SalesOrderDetail, then sort by ListPrice from highest to lowest.
******************************************************************************************************************/

SELECT p.Name          AS ProductName,
       p.ProductNumber,
       p.ListPrice
  FROM Production.Product AS p
 WHERE NOT EXISTS (SELECT 1
                     FROM Sales.SalesOrderDetail AS sod
                    WHERE sod.ProductID = p.ProductID)
 ORDER BY p.ListPrice DESC,
          p.Name;


/*****************************************************************************************************************
Q6: Business User question - Increased complexity
    Author: Younger Gboe
    "Management wants to review the performance of our sales representatives during 2013. Can you identify
    each salesperson who handled orders during that year, the number of orders assigned to them, and the
    total value of those orders? Please arrange the results from the highest to the lowest total order value."
    
    Approach: Orders with a SalesPersonID were handled by a salesperson. Join Sales.SalesPerson to
              Person.Person for the name, count the 2013 orders, and sum TotalDue as the total order value.
******************************************************************************************************************/

SELECT pp.FirstName + ' ' + pp.LastName AS SalesPerson,
       COUNT(soh.SalesOrderID)           AS OrderCount,
       SUM(soh.TotalDue)                 AS TotalOrderValue
  FROM Sales.SalesOrderHeader AS soh
       INNER JOIN Sales.SalesPerson AS sp
               ON soh.SalesPersonID = sp.BusinessEntityID
       INNER JOIN Person.Person AS pp
               ON sp.BusinessEntityID = pp.BusinessEntityID
 WHERE soh.OrderDate >= '2013-01-01'
   AND soh.OrderDate <  '2014-01-01'
 GROUP BY sp.BusinessEntityID,
          pp.FirstName,
          pp.LastName
 ORDER BY TotalOrderValue DESC;


/*****************************************************************************************************************
Q7: Metadata question
    Author: Sanele Mbhele
    "Can you list all tables in AdventureWorks that have a column named ProductID using the
    INFORMATION_SCHEMA.COLUMNS view?"
    
    Approach: INFORMATION_SCHEMA.COLUMNS has one row per column. Filter on COLUMN_NAME = 'ProductID'.
              Note: this view also lists database views that have a ProductID column.
******************************************************************************************************************/

SELECT c.TABLE_SCHEMA,
       c.TABLE_NAME
  FROM INFORMATION_SCHEMA.COLUMNS AS c
 WHERE c.COLUMN_NAME = 'ProductID'
 ORDER BY c.TABLE_SCHEMA,
          c.TABLE_NAME;


/*****************************************************************************************************************
Q8: Metadata question
    Author: Fernando Jesus Gomez Fuentes
    "How many base tables exist in the AdventureWorks database? Use INFORMATION_SCHEMA.TABLES to identify
    and count all tables classified as BASE TABLE."
    
    Approach: INFORMATION_SCHEMA.TABLES lists tables and views. TABLE_TYPE = 'BASE TABLE' keeps only tables.
******************************************************************************************************************/

SELECT COUNT(*) AS BaseTableCount
  FROM INFORMATION_SCHEMA.TABLES AS t
 WHERE t.TABLE_TYPE = 'BASE TABLE';
