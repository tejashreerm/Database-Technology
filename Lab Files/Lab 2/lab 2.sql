
#Question 3:

create table jbmanager(
id Int NOT NULL,
Bonus Int DEFAULT 0,
constraint pk_id PRIMARY KEY(id),
constraint fk_manager_employee FOREIGN KEY(id) references jbemployee(id));

insert into jbmanager (id)
select manager from jbemployee where jbemployee.manager is not NULL
union
select manager from jbdept where jbdept.manager is not NULL;

#Yes, the bonus attribute has to be initialized with a value and we have initialized bonus attribute with 0. 
# It can also be set to NULL, but for that we need to first check that the bonus value is null.


#Question 4:

update jbmanager
set bonus = bonus+10000
where id in (select manager from jbdept);

#Question 5:

create table customer (
id INT,
street varchar(120),
name varchar(120),
city INT not NULL,
CONSTRAINT pk_customer PRIMARY KEY(id),
CONSTRAINT fk_city FOREIGN KEY(city) REFERENCES jbcity(id));

create table account(
account_number INT,
balance INT not NULL default 0,
owner INT,
CONSTRAINT pk_account PRIMARY KEY(account_number),
CONSTRAINT fk_owner FOREIGN KEY(owner) REFERENCES customer(id));

create table transaction (
transaction_number INT,
timestamp timestamp not NULL default CURRENT_TIMESTAMP,
amount INT not NULL,
account INT not NULL,
responsible INT not NULL,
CONSTRAINT pk_transaction PRIMARY KEY(transaction_number),
CONSTRAINT fk_account FOREIGN KEY(account) REFERENCES account(account_number),
CONSTRAINT fk_responsible FOREIGN KEY(responsible) REFERENCES jbemployee(id));

create table withdrawal (
id INT,
CONSTRAINT pk_withdrawal PRIMARY KEY(id),
CONSTRAINT fk_transaction FOREIGN KEY(id) REFERENCES transaction(transaction_number));

create table deposit (
id INT,
CONSTRAINT pk_deposit PRIMARY KEY(id),
CONSTRAINT fk_transaction2 FOREIGN KEY(id) REFERENCES transaction(transaction_number));

TRUNCATE jbsale;

ALTER TABLE jbsale DROP FOREIGN KEY fk_sale_debit;

DROP TABLE jbdebit;

create table debit (
id INT,
CONSTRAINT pk_debit PRIMARY KEY(id),
CONSTRAINT fk_transaction3 FOREIGN KEY(id) REFERENCES transaction(transaction_number));

ALTER TABLE jbsale
ADD CONSTRAINT fk_sale_debit FOREIGN KEY(debit) REFERENCES debit(id);
