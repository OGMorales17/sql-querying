-- Comments in SQL Start with dash-dash --
14:09:50 OrlandoG-MackBook-Pro ~/documents/springb/springboard_projects/sql-querying $ psql products_db
psql (13.3)
Type "help" for help.

products_db=# \dt
             List of relations
 Schema |   Name   | Type  |     Owner      
--------+----------+-------+----------------
 public | products | table | orlandomorales
(1 row)

products_db=# \d products
                                     Table "public.products"
     Column      |       Type       | Collation | Nullable |               Default                
-----------------+------------------+-----------+----------+--------------------------------------
 id              | integer          |           | not null | nextval('products_id_seq'::regclass)
 name            | text             |           | not null | 
 price           | double precision |           |          | 
 can_be_returned | boolean          |           | not null | 
Indexes:
    "products_pkey" PRIMARY KEY, btree (id)
Check constraints:
    "products_price_check" CHECK (price > 0::double precision)

-- Add a product to the table with the name of “chair”, price of 44.00, and can_be_returned of false. --
products_db=# INSERT INTO products
products_db-# name, price, can_be_returned
products_db-# VALUES 
products_db-# 'chair', 44.oo, 'f';
ERROR:  syntax error at or near "name"
LINE 2: name, price, can_be_returned
        ^
products_db=# INSERT INTO products(name, price, can_be_returned)
products_db-# VALUES ('chair', 44.00, 'f');
INSERT 0 1

-- Add a product to the table with the name of “stool”, price of 25.99, and can_be_returned of true. --
products_db=# INSERT INTO products (name, price, can_be_returned)
products_db-# VALUES ('stool', 25.99, 'f');
INSERT 0 1

-- Add a product to the table with the name of “table”, price of 124.00, and can_be_returned of false. --
products_db=# INSERT INTO products (name, price, can_be_returned)
products_db-# VALUES ('table', 124.00, 'f');
INSERT 0 1

-- Display all of the rows and columns in the table. --
products_db=# SELECT * FROM products;
 id | name  | price | can_be_returned 
----+-------+-------+-----------------
  1 | chair |    44 | f
  2 | stool | 25.99 | f
  3 | table |   124 | f
(3 rows)

--- Display all of the names of the products. --
products_db=# SELECT name FROM products;
 name  
-------
 chair
 stool
 table
(3 rows)

--- Display all of the names and prices of the products. --
products_db=# SELECT name, price FROM products;
 name  | price 
-------+-------
 chair |    44
 stool | 25.99
 table |   124
(3 rows)

--- Add a new product - make up whatever you would like! --
products_db=# INSERT INTO products (name, price, can_be_returned)                                                                  VALUES ('bicycle', 324.00, 't');
INSERT 0 1

--- Display only the products that can_be_returned. --
products_db=# SELECT * FROM products WHERE can_be_returned = 't'; -- Same result -- 
products_db=# SELECT * FROM products WHERE can_be_returned;
 id |  name   | price | can_be_returned 
----+---------+-------+-----------------
  4 | bicycle |   324 | t
(1 row)

--- Display only the products that have a price less than 44.00. --
products_db=# SELECT * FROM products WHERE price < 44;
 id | name  | price | can_be_returned 
----+-------+-------+-----------------
  2 | stool | 25.99 | f
(1 row)

--- Display only the products that have a price in between 22.50 and 99.99. --
products_db=# SELECT * FROM products WHERE price > 22.50 AND price < 99.99;
 id | name  | price | can_be_returned 
----+-------+-------+-----------------
  1 | chair |    44 | f
  2 | stool | 25.99 | f
(2 rows)

products_db=# SELECT * FROM products WHERE price BETWEEN 22.50 AND 99.99;
 id | name  | price | can_be_returned 
----+-------+-------+-----------------
  1 | chair |    44 | f
  2 | stool | 25.99 | f
(2 rows)

--- There’s a sale going on: Everything is $20 off! Update the database accordingly. --
products_db=# UPDATE products SET price = price - 20;
UPDATE 4

--- Because of the sale, everything that costs less than $25 has sold out. Remove all products whose price meets this criteria. --
products_db=# DELETE FROM products WHERE price < 25;
DELETE 2

--- And now the sale is over. For the remaining products, increase their price by $20. --
products_db=# UPDATE products SET price = price + 20;
UPDATE 2

--- There is a new company policy: everything is returnable. Update the database accordingly. --
products_db=# UPDATE products SET can_be_returned = 't';
UPDATE 2

-- Final products left on the table --
products_db=# SELECT * FROM products;                                                                                               id |  name   | price | can_be_returned 
----+---------+-------+-----------------
  3 | table   |   124 | t
  4 | bicycle |   324 | t
(2 rows)
