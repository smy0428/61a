.read data.sql

-- QUESTIONS --



-------------------------------------------------------------------------
------------------------ Give Interest- ---------------------------------
-------------------------------------------------------------------------

update accounts set amount = amount * 0.02 + amount;


create table give_interest_result as select * from accounts; -- just for tests

-------------------------------------------------------------------------
------------------------ Split Accounts ---------------------------------
-------------------------------------------------------------------------


CREATE TABLE temp(name, account);
INSERT INTO temp SELECT name || "'s Checking account", amount * 0.5 FROM accounts;
INSERT INTO temp SELECT name || "'s Savings account", amount * 0.5 FROM accounts;

DROP TABLE accounts;
CREATE TABLE accounts AS SELECT * FROM temp;

create table split_account_results as select * from accounts; -- just for tests

-------------------------------------------------------------------------
-------------------------------- Whoops ---------------------------------
-------------------------------------------------------------------------

DROP TABLE accounts;


CREATE TABLE average_prices AS
  SELECT category as category, AVG(MSRP) as average_price from products group by category;

CREATE TABLE lowest_prices AS
  SELECT store, item, min(price) from inventory group by item;

CREATE TABLE shopping_list AS
  SELECT name, store from lowest_prices, products where name = item
  group by category having min(MSRP / rating);



CREATE TABLE total_bandwidth AS
  SELECT sum(a.Mbs) from stores as a, shopping_list as b where a.store = b.store;
