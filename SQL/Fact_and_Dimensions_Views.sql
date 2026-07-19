create database reporting_project_03
use reporting_project_03

create view vw_Dim_Customers as
select 
    [Customer ID] as CustomerID,
    isnull([Customer Name], 'Unknown') as CustomerName,
    isnull(Segment, 'Unknown') as Segment
from Dim_Customers$;

create or alter view vw_Dim_Geography as
select
    isnull(City, 'Unknown City') as City,
    isnull(State, 'Unknown State') as State,
    isnull(Country, 'Unknown Country') as Country,
    isnull(Market, 'N/A') as Market,
    isnull(Region, 'N/A') as Region,
    cast([Postal Code] as nvarchar(20)) as PostalCode,
    concat(City, ', ', State, ', ', Country) as FullLocation
from Dim_Geography$

create view vw_Dim_Products as
select 
    [Product ID] as ProductID,
    isnull([Product Name], 'Unknown') as ProductName,
    isnull(Category, 'Uncategorized') as Category,
    isnull([Sub Category], 'Uncategorized') as SubCategory,
    concat(Category, ' > ', [Sub Category]) as CategoryHierarchy
from [Dim_Products$];

create view vw_Dim_Shippers as
select distinct
    isnull([Ship Mode], 'Unknown') as ShipMode
from [Fact_Sales$];

create view vw_Fact_Sales as
select 
    [Row ID] as RowID,
    [Order ID] as OrderID,
    cast([Order Date] as date) as OrderDate,
    cast([Ship Date] as date) as ShipDate,
    [Order Priority] as OrderPriority,
    [Ship Mode] as ShipMode,
    [Customer ID] as CustomerID,
    [Product ID] as ProductID,
    isnull(City, 'Unknown City') as City,
    isnull(Sales, 0) as Sales,
    isnull(Quantity, 0) as Quantity,
    isnull(Discount, 0) as Discount,
    isnull(Profit, 0) as Profit,
    isnull([Shipping Cost], 0) as ShippingCost
from [Fact_Sales$];

select 
    s.OrderID,
    g.PostalCode as Dim_PostalCode,
    g.City,
    g.State,
    s.Sales
from vw_Fact_Sales s
left join vw_Dim_Geography g on s.City = g.City;

select 
    c.CustomerName, 
    SUM(s.Sales) as TotalRevenue
from vw_Dim_Customers c
inner join vw_Fact_Sales s on c.CustomerID = s.CustomerID
group by c.CustomerName
having sum(s.Sales) > 5000
order by TotalRevenue desc;

select 
    g.City,
    sum(s.Profit) as TotalProfit
from vw_Fact_Sales s
inner join vw_Dim_Geography g on s.City = g.City
group by g.City
having sum(s.Profit) > 5000
order by TotalProfit desc;