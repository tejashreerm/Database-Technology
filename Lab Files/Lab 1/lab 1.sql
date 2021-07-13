/*
Lab 1 report <Tejashree R Mastamardi  tejma768>
             <Vinay Bengaluru Ashwath Narayan Murthy vinbe289>
*/

/* All non code should be within SQL-comments like this */ 


/*
Drop all user created tables that have been created when solving the lab
*/

DROP TABLE IF EXISTS jbemployee CASCADE;
DROP TABLE IF EXISTS jbdept CASCADE;
DROP TABLE IF EXISTS jbstore CASCADE;
DROP TABLE IF EXISTS jbcity CASCADE;
DROP TABLE IF EXISTS jbitem CASCADE;
DROP TABLE IF EXISTS jbdebit CASCADE;
DROP TABLE IF EXISTS jbsale CASCADE;
DROP TABLE IF EXISTS jbsupplier CASCADE;
DROP TABLE IF EXISTS jbparts CASCADE;
DROP TABLE IF EXISTS jbsupply CASCADE;
DROP TABLE IF EXISTS itemj CASCADE;
DROP VIEW IF EXISTS debit_view;
DROP VIEW IF EXISTS debit_view2;

/* Have the source scripts in the file so it is easy to recreate!*/

SOURCE company_schema.sql;
SOURCE company_data.sql;

/*
Question 1: List all employees, i.e. all tuples in the jbemployee relation.
*/

select * 
from jbemployee;

/* 
+------+--------------------+--------+---------+-----------+-----------+
| id   | name               | salary | manager | birthyear | startyear |
+------+--------------------+--------+---------+-----------+-----------+
|   10 | Ross, Stanley      |  15908 |     199 |      1927 |      1945 |
|   11 | Ross, Stuart       |  12067 |    NULL |      1931 |      1932 |
|   13 | Edwards, Peter     |   9000 |     199 |      1928 |      1958 |
|   26 | Thompson, Bob      |  13000 |     199 |      1930 |      1970 |
|   32 | Smythe, Carol      |   9050 |     199 |      1929 |      1967 |
|   33 | Hayes, Evelyn      |  10100 |     199 |      1931 |      1963 |
|   35 | Evans, Michael     |   5000 |      32 |      1952 |      1974 |
|   37 | Raveen, Lemont     |  11985 |      26 |      1950 |      1974 |
|   55 | James, Mary        |  12000 |     199 |      1920 |      1969 |
|   98 | Williams, Judy     |   9000 |     199 |      1935 |      1969 |
|  129 | Thomas, Tom        |  10000 |     199 |      1941 |      1962 |
|  157 | Jones, Tim         |  12000 |     199 |      1940 |      1960 |
|  199 | Bullock, J.D.      |  27000 |    NULL |      1920 |      1920 |
|  215 | Collins, Joanne    |   7000 |      10 |      1950 |      1971 |
|  430 | Brunet, Paul C.    |  17674 |     129 |      1938 |      1959 |
|  843 | Schmidt, Herman    |  11204 |      26 |      1936 |      1956 |
|  994 | Iwano, Masahiro    |  15641 |     129 |      1944 |      1970 |
| 1110 | Smith, Paul        |   6000 |      33 |      1952 |      1973 |
| 1330 | Onstad, Richard    |   8779 |      13 |      1952 |      1971 |
| 1523 | Zugnoni, Arthur A. |  19868 |     129 |      1928 |      1949 |
| 1639 | Choy, Wanda        |  11160 |      55 |      1947 |      1970 |
| 2398 | Wallace, Maggie J. |   7880 |      26 |      1940 |      1959 |
| 4901 | Bailey, Chas M.    |   8377 |      32 |      1956 |      1975 |
| 5119 | Bono, Sonny        |  13621 |      55 |      1939 |      1963 |
| 5219 | Schwarz, Jason B.  |  13374 |      33 |      1944 |      1959 |
+------+--------------------+--------+---------+-----------+-----------+
25 rows in set (0.00 sec)
*/ 

/*
Question 2: List the name of all departments in alphabetical order. Note: by “name” we mean the name attribute for all tuples in the jbdept relation.
*/

select name 
from jbdept
order by name;

/*
+------------------+
| name             |
+------------------+
| Bargain          |
| Book             |
| Candy            |
| Children's       |
| Children's       |
| Furniture        |
| Giftwrap         |
| Jewelry          |
| Junior Miss      |
| Junior's         |
| Linens           |
| Major Appliances |
| Men's            |
| Sportswear       |
| Stationary       |
| Toys             |
| Women's          |
| Women's          |
| Women's          |
+------------------+
19 rows in set (0.01 sec)
*/

/* 
Question 3:What parts are not in store, i.e. qoh = 0? (qoh = Quantity On Hand)
*/

select name
from jbparts
where qoh=0;

/*
+-------------------+
| name              |
+-------------------+
| card reader       |
| card punch        |
| paper tape reader |
| paper tape punch  |
+-------------------+
4 rows in set (0.00 sec)
*/

/*
Question 4:Which employees have a salary between 9000 (included) and 10000 (included)?
*/

select name
from jbemployee
where salary>=9000 and salary<=10000;

/*
+----------------+
| name           |
+----------------+
| Edwards, Peter |
| Smythe, Carol  |
| Williams, Judy |
| Thomas, Tom    |
+----------------+
4 rows in set (0.00 sec)
*/

/*
Question 5:What was the age of each employee when they started working (startyear)?
*/

select name,startyear-birthyear as age
from jbemployee;

/*
+--------------------+------+
| name               | age  |
+--------------------+------+
| Ross, Stanley      |   18 |
| Ross, Stuart       |    1 |
| Edwards, Peter     |   30 |
| Thompson, Bob      |   40 |
| Smythe, Carol      |   38 |
| Hayes, Evelyn      |   32 |
| Evans, Michael     |   22 |
| Raveen, Lemont     |   24 |
| James, Mary        |   49 |
| Williams, Judy     |   34 |
| Thomas, Tom        |   21 |
| Jones, Tim         |   20 |
| Bullock, J.D.      |    0 |
| Collins, Joanne    |   21 |
| Brunet, Paul C.    |   21 |
| Schmidt, Herman    |   20 |
| Iwano, Masahiro    |   26 |
| Smith, Paul        |   21 |
| Onstad, Richard    |   19 |
| Zugnoni, Arthur A. |   21 |
| Choy, Wanda        |   23 |
| Wallace, Maggie J. |   19 |
| Bailey, Chas M.    |   19 |
| Bono, Sonny        |   24 |
| Schwarz, Jason B.  |   15 |
+--------------------+------+
25 rows in set (0.00 sec)
*/

/*
Question 6:Which employees have a last name ending with “son”?
*/

select name
from jbemployee
where name like '%son,%';

/*
+---------------+
| name          |
+---------------+
| Thompson, Bob |
+---------------+
1 row in set (0.00 sec)
*/

/*
Question 7:Which items (note items, not parts) have been delivered by a supplier called
Fisher-Price? Formulate this query using a subquery in the where-clause.
*/

select name
from jbitem
where supplier = (select id from jbsupplier where name='Fisher-Price');

/*
+-----------------+
| name            |
+-----------------+
| Maze            |
| The 'Feel' Book |
| Squeeze Ball    |
+-----------------+
3 rows in set (0.00 sec)
*/

/*
Question 8:Formulate the same query as above, but without a subquery.
*/

select jbitem.name
from jbitem,jbsupplier
where jbitem.supplier=jbsupplier.id
and jbsupplier.name='Fisher-Price';

/*
+-----------------+
| name            |
+-----------------+
| Maze            |
| The 'Feel' Book |
| Squeeze Ball    |
+-----------------+
3 rows in set (0.00 sec)
*/

/*
Question 9:Show all cities that have suppliers located in them. Formulate this query using a
subquery in the where-clause.
*/

select jbcity.name
from jbcity
where jbcity.id in (select jbsupplier.city from jbsupplier);

/*
+----------------+
| name           |
+----------------+
| Amherst        |
| Boston         |
| New York       |
| White Plains   |
| Hickville      |
| Atlanta        |
| Madison        |
| Paxton         |
| Dallas         |
| Denver         |
| Salt Lake City |
| Los Angeles    |
| San Diego      |
| San Francisco  |
| Seattle        |
+----------------+
15 rows in set (0.00 sec)
*/

/*
Question 10:What is the name and color of the parts that are heavier than a card reader?
Formulate this query using a subquery in the where-clause. (The SQL query must
not contain the weight as a constant.)*/

select name,color
from jbparts
where weight > (select weight from jbparts where name like '%card reader%');

/*
+--------------+--------+
| name         | color  |
+--------------+--------+
| disk drive   | black  |
| tape drive   | black  |
| line printer | yellow |
| card punch   | gray   |
+--------------+--------+
4 rows in set (0.01 sec)
*/

/*
Question 11:Formulate the same query as above, but without a subquery. (The query must not
contain the weight as a constant.)
*/

SELECT a.name as name , a.color as color 
FROM jbparts as a,jbparts as b
WHERE a.weight>b.weight
AND b.name = 'card reader';

/*
+--------------+--------+
| name         | color  |
+--------------+--------+
| disk drive   | black  |
| tape drive   | black  |
| line printer | yellow |
| card punch   | gray   |
+--------------+--------+
4 rows in set (0.00 sec)
*/

/*
Question 12:What is the average weight of black parts?
*/

select avg(weight) as average
from jbparts
where color='black';

/*
+----------+
| average  |
+----------+
| 347.2500 |
+----------+
1 row in set (0.00 sec)
*/

/*
Question 13:What is the total weight of all parts that each supplier in Massachusetts (“Mass”)
has delivered? Retrieve the name and the total weight for each of these suppliers.
Do not forget to take the quantity of delivered parts into account. Note that one
row should be returned for each supplier.
*/

select distinct y.name,sum(weight*quan) as Total_weight                                                                                                             
from jbcity as x join jbsupplier as y on x.id=y.city       
cross join jbsupply as z on y.id=z.supplier
cross join jbparts as p on z.part=p.id                                                                                                                           
where state="Mass" group by y.name; 

/*
+--------------+--------------+
| name         | Total_weight |
+--------------+--------------+
| DEC          |         3120 |
| Fisher-Price |      1135000 |
+--------------+--------------+
2 rows in set (0.00 sec)
*/

/*
Question 14:Create a new relation (a table), with the same attributes as the table items using
the CREATE TABLE syntax where you define every attribute explicitly (i.e. not 
as a copy of another table). Then fill the table with all items that cost less than the
average price for items. Remember to define primary and foreign keys in your
table!
*/

create table itemj(id int primary key,
name varchar(20),
dept int,
price int,
qoh int,
supplier int,
foreign key(id) references jbitem(id));
    
insert into itemj select * from jbitem 
where price < (select avg(price) 
               from jbitem);
    
select * from itemj;

/*
+-----+-----------------+------+-------+------+----------+
| id  | name            | dept | price | qoh  | supplier |
+-----+-----------------+------+-------+------+----------+
|  11 | Wash Cloth      |    1 |    75 |  575 |      213 |
|  19 | Bellbottoms     |   43 |   450 |  600 |       33 |
|  21 | ABC Blocks      |    1 |   198 |  405 |      125 |
|  23 | 1 lb Box        |   10 |   215 |  100 |       42 |
|  25 | 2 lb Box, Mix   |   10 |   450 |   75 |       42 |
|  26 | Earrings        |   14 |  1000 |   20 |      199 |
|  43 | Maze            |   49 |   325 |  200 |       89 |
| 106 | Clock Book      |   49 |   198 |  150 |      125 |
| 107 | The 'Feel' Book |   35 |   225 |  225 |       89 |
| 118 | Towels, Bath    |   26 |   250 | 1000 |      213 |
| 119 | Squeeze Ball    |   49 |   250 |  400 |       89 |
| 120 | Twin Sheet      |   26 |   800 |  750 |      213 |
| 165 | Jean            |   65 |   825 |  500 |       33 |
| 258 | Shirt           |   58 |   650 | 1200 |       33 |
+-----+-----------------+------+-------+------+----------+
14 rows in set (0.00 sec)
*/

/*
Question 15:Create a view that contains the items that cost less than the average price for
items. 
*/

CREATE view jbitem_view as
select *
from jbitem
where price < (select AVG(price)
               from jbitem);
                   
select * from jbitem_view;

/*
+-----+-----------------+------+-------+------+----------+
| id  | name            | dept | price | qoh  | supplier |
+-----+-----------------+------+-------+------+----------+
|  11 | Wash Cloth      |    1 |    75 |  575 |      213 |
|  19 | Bellbottoms     |   43 |   450 |  600 |       33 |
|  21 | ABC Blocks      |    1 |   198 |  405 |      125 |
|  23 | 1 lb Box        |   10 |   215 |  100 |       42 |
|  25 | 2 lb Box, Mix   |   10 |   450 |   75 |       42 |
|  26 | Earrings        |   14 |  1000 |   20 |      199 |
|  43 | Maze            |   49 |   325 |  200 |       89 |
| 106 | Clock Book      |   49 |   198 |  150 |      125 |
| 107 | The 'Feel' Book |   35 |   225 |  225 |       89 |
| 118 | Towels, Bath    |   26 |   250 | 1000 |      213 |
| 119 | Squeeze Ball    |   49 |   250 |  400 |       89 |
| 120 | Twin Sheet      |   26 |   800 |  750 |      213 |
| 165 | Jean            |   65 |   825 |  500 |       33 |
| 258 | Shirt           |   58 |   650 | 1200 |       33 |
+-----+-----------------+------+-------+------+----------+
14 rows in set (0.00 sec)
*/

/*
Question 16:What is the difference between a table and a view? One is static and the other is
dynamic. Which is which and what do we mean by static respectively dynamic?
*/

/*
 Tables are the data structures that contain the actual data in the form of entries (or values) in tuples against attributes. 
Table is static since the changes made to the table must be saved if we want the changes to be reflected when we access the tables later.
 View is a virtual table which does not contain the actual data but just the copy of a table, whose content is defined by the query 
provided by the user. It is dynamic meaning that it always reflects the latest updated table.
*/

/*
Question 17:Create a view, using only the implicit join notation, i.e. only use where statements
but no inner join, right join or left join statements, that calculates the total cost of
each debit, by considering price and quantity of each bought item. (To be used for
charging customer accounts). The view should contain the sale identifier (debit)
and total cost.
*/

create view debit_view as
select jbsale.debit, sum((jbsale.quantity)*jbitem.price) as Total_Cost 
from jbitem, jbsale 
where jbitem.id=jbsale.item
group by jbsale.debit;

select * from debit_view;

/*
+--------+------------+
| debit  | Total_Cost |
+--------+------------+
| 100581 |       2050 |
| 100582 |       1000 |
| 100586 |      13446 |
| 100592 |        650 |
| 100593 |        430 |
| 100594 |       3295 |
+--------+------------+
6 rows in set (0.00 sec)
*/

/*
Question 18:Do the same as in (17), using only the explicit join notation, i.e. using only left,
right or inner joins but no where statement. Motivate why you use the join you do
(left, right or inner), and why this is the correct one (unlike the others).
*/

create view debit_view2 as
select jbsale.debit, sum((jbsale.quantity)*jbitem.price) as Total_Cost 
from jbsale 
inner join jbitem on jbsale.item=jbitem.id
group by jbsale.debit;

select * from debit_view2;

/*
+--------+------------+
| debit  | Total_Cost |
+--------+------------+
| 100581 |       2050 |
| 100582 |       1000 |
| 100586 |      13446 |
| 100592 |        650 |
| 100593 |        430 |
| 100594 |       3295 |
+--------+------------+
6 rows in set (0.00 sec)
*/

/*
 We have used inner join as INNER JOIN only shows records common between both the tables 
but if we had used left join we would have got all the records from the left table along 
with matching records from the right table. And similarly on using right join we would get 
all records from the right table plus matching records from left table. 
 The reason for performing inner join is, the items can be sold only for those items that are 
present in the items list. Therefore performing left join or right join would not be appropriate.
*/

/*
Question 19: Oh no! An earthquake!
(a) Remove all suppliers in Los Angeles from the table jbsupplier. This will not
work right away (you will receive error code 23000) which you will have to
solve by deleting some other related tuples. However, do not delete more
tuples from other tables than necessary and do not change the structure of the
tables, i.e. do not remove foreign keys. Also, remember that you are only
allowed to use “Los Angeles” as a constant in your queries, not “199” or
“900”
*/

/*
delete jbsupplier.* 
from jbsupplier,jbcity
where jbsupplier.city=jbcity.id
and jbcity.name='Los Angeles';
*/

SET FOREIGN_KEY_CHECKS=0;

delete jbitem.*,jbsupplier.* 
from jbsupplier 
join jbcity  on jbsupplier.city=jbcity.id 
join jbitem  on jbitem.supplier=jbsupplier.id  
where jbcity.name='Los Angeles';
      
SET FOREIGN_KEY_CHECKS=1;

select * from jbsupplier;
    
/*
+-----+--------------+------+
| id  | name         | city |
+-----+--------------+------+
|   5 | Amdahl       |  921 |
|  15 | White Stag   |  106 |
|  20 | Wormley      |  118 |
|  33 | Levi-Strauss |  941 |
|  42 | Whitman's    |  802 |
|  62 | Data General |  303 |
|  67 | Edger        |  841 |
|  89 | Fisher-Price |   21 |
| 122 | White Paper  |  981 |
| 125 | Playskool    |  752 |
| 213 | Cannon       |  303 |
| 241 | IBM          |  100 |
| 440 | Spooley      |  609 |
| 475 | DEC          |   10 |
| 999 | A E Neumann  |  537 |
+-----+--------------+------+
15 rows in set (0.00 sec)
*/

/*
Question 19(b) Explain what you did and why.
*/

/*
As the supplier id for Los Angeles is associated with the jbitem table and 
in order to delete the id from jbsupplier table the associated records in the items table 
needs to be deleted first and only then we will be able to delete all the suppliers in Los Angeles 
from the jbsupplier table. And for that we first set the foreign key constrain to 0 and then performed 
the delete  operation and rolled back the foreign key constraint to 1.
*/

/*
Question 20:An employee has tried to find out which suppliers that have delivered items that
have been sold. He has created a view and a query that shows the number of items
sold from a supplier.
mysql> CREATE VIEW jbsale_supply(supplier, item, quantity) AS
 -> SELECT jbsupplier.name, jbitem.name, jbsale.quantity
 -> FROM jbsupplier, jbitem, jbsale
 -> WHERE jbsupplier.id = jbitem.supplier
 -> AND jbsale.item = jbitem.id;
Query OK, 0 rows affected (0.01 sec)
mysql> SELECT supplier, sum(quantity) AS sum FROM jbsale_supply
 -> GROUP BY supplier;
+--------------+---------------+
| supplier     | sum(quantity) |
+--------------+---------------+
| Cannon       |             6 |
| Levi-Strauss |             1 |
| Playskool    |             2 |
| White Stag   |             4 |
| Whitman's    |             2 |
+--------------+---------------+
5 rows in set (0.00 sec)
The employee would also like include the suppliers which has delivered some
items, although for whom no items have been sold so far. In other words he wants
to list all suppliers, which has supplied any item, as well as the number of these 
items that have been sold. Help him! Drop and redefine jbsale_supply to
consider suppliers that have delivered items that have never been sold as well.
Hint: The above definition of jbsale_supply uses an (implicit) inner join that
removes suppliers that have not had any of their delivered items sold.
*/

create view jbsale_supply as 
select jbsupplier.name as Supplier,
jbitem.name as item,case when jbsale.quantity is null then '0' else 
jbsale.quantity end as quantity_sold  
from jbsupplier  
join jbitem  on jbsupplier.id=jbitem.supplier 
left join jbsale  on jbitem.id =jbsale.item;

select * from jbsale_supply;

/*
+--------------+-----------------+---------------+
| Supplier     | item            | quantity_sold |
+--------------+-----------------+---------------+
| Cannon       | Wash Cloth      | 0             |
| Levi-Strauss | Bellbottoms     | 0             |
| Playskool    | ABC Blocks      | 0             |
| Whitman's    | 1 lb Box        | 2             |
| Whitman's    | 2 lb Box, Mix   | 0             |
| Koret        | Earrings        | 1             |
| Fisher-Price | Maze            | 0             |
| White Stag   | Jacket          | 1             |
| White Stag   | Slacks          | 0             |
| Playskool    | Clock Book      | 2             |
| Fisher-Price | The 'Feel' Book | 0             |
| Koret        | Gold Ring       | 0             |
| Cannon       | Towels, Bath    | 5             |
| Fisher-Price | Squeeze Ball    | 0             |
| Cannon       | Twin Sheet      | 1             |
| Cannon       | Queen Sheet     | 0             |
| White Stag   | Ski Jumpsuit    | 3             |
| Levi-Strauss | Jean            | 0             |
| Levi-Strauss | Shirt           | 1             |
| Levi-Strauss | Boy's Jean Suit | 0             |
+--------------+-----------------+---------------+
20 rows in set (0.00 sec)
*/
