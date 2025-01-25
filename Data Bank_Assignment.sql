create table products
(
	prod_id		varchar(10) primary key,
	prod_name	varchar(100) not null
);

create table Employees
(
	Emp_ID		varchar(10),
	Emp_Name	varchar(100),
	Salary		float,
	gender		varchar(10) check (gender in ('M', 'F')),
	constraint pk_emp primary key (emp_id)
);

create table Customers
(
	Customer_ID		varchar(10),
	First_Name		varchar(40),
	Last_Name		varchar(40),
	Phone			bigint,
	Address			varchar(200),
	dob				date,
	constraint pk_cust primary key(customer_id)
);

create table Accounts
(
	Account_No			bigint primary key,
	Balance				int,
	Account_Status		varchar(10) check (Account_Status in ('Active', 'Inactive', 'Suspended', 'On hold')),
	Date_of_Opening		date
);

create table Transactions
(
	Transaction_ID		int generated always as identity,
	Transaction_Date	date,
	Transaction_amount	float,
	Credit_Debit_flag	varchar(1),
	Account_No			bigint,
	constraint fk_acc foreign key (Account_No) references Accounts(Account_No)
);

create table Customer_Accounts
(
	Customer_ID		varchar(10),
	Account_No		bigint,
	prod_id			varchar(10),
	constraint fk_acc1 foreign key (Customer_ID) references Customers(Customer_ID),
	constraint fk_acc2 foreign key (Account_No) references Accounts(Account_No),
	constraint fk_acc3 foreign key (prod_id) references Products(prod_id)
);


insert into products values ('PRD0001', 'Savings Account');
insert into products (prod_id, prod_name) values ('PRD0002', 'Current Account');
insert into products values ('PRD0003', 'Home Loan');
insert into products values ('PRD0004', 'Personal Loan');

insert into Employees values
	('E1', 'Mohan Kumar', 5000, 'M'),
	('E2', 'James Bond', 6000, 'M'),
	('E3', 'David Smith', 7000, 'M'),
	('E4', 'Alice Mathew', 5000, 'F');

insert into Customers values ('C1', 'Satya', 'Sharma', 9900889911, 'Bangalore', to_date('01-03-1990', 'dd-mm-yyyy'));
insert into Customers values ('C2', 'Jaswinder', 'Singh', 9900889922, 'Mumbai', to_date('024-03-1980', 'dd-mm-yyyy'));
insert into Customers values ('C3', 'Satya', 'Sharma', 9900889933, 'Pune', to_date('11-08-1992', 'dd-mm-yyyy'));
insert into Customers values ('C4', 'Maryam', 'Parveen', 9900889944, 'Delhi', to_date('01-12-1993', 'dd-mm-yyyy'));
insert into Customers values ('C5', 'Steven', 'Smith', null, 'Chennai', to_date('20-12-1994', 'dd-mm-yyyy'));
insert into Customers values ('C6', 'Jason', 'Holder', null, 'Chennai', to_date('01-02-1995', 'dd-mm-yyyy'));

insert into Accounts values (1100444101, 100, 'Active', to_date('01-01-2020','dd-mm-yyyy'));
insert into Accounts values (1100444102, 900, 'Active', to_date('10-01-2020','dd-mm-yyyy'));
insert into Accounts values (1100444103, 500, 'Active', to_date('21-11-2021','dd-mm-yyyy'));
insert into Accounts values (1100444104, 1100, 'Active', to_date('15-10-2022','dd-mm-yyyy'));
insert into Accounts values (1100444105, 2200, 'Active', to_date('10-12-2022','dd-mm-yyyy'));
insert into Accounts values (1100444106, 3300, 'Active', to_date('05-11-2022','dd-mm-yyyy'));

insert into Transactions values (default,current_date, 200, 'C', 1100444101);
insert into Transactions (Transaction_Date, Transaction_Amount, Credit_Debit_flag, Account_No) values (current_date-1, 100, 'C', 1100444101);
insert into Transactions (Transaction_Date, Transaction_Amount, Credit_Debit_flag, Account_No) values (current_date-1, 50, 'D', 1100444101);
insert into Transactions (Transaction_Date, Transaction_Amount, Credit_Debit_flag, Account_No) values (current_date-1, 100, 'C', 1100444102);
insert into Transactions (Transaction_Date, Transaction_Amount, Credit_Debit_flag, Account_No) values (current_date-2, 200, 'C', 1100444102);
insert into Transactions (Transaction_Date, Transaction_Amount, Credit_Debit_flag, Account_No) values (current_date-2, 100, 'D', 1100444102);
insert into Transactions (Transaction_Date, Transaction_Amount, Credit_Debit_flag, Account_No) values (current_date-3, 100, 'C', 1100444103);
insert into Transactions (Transaction_Date, Transaction_Amount, Credit_Debit_flag, Account_No) values (current_date-4, 200, 'C', 1100444104);
insert into Transactions (Transaction_Date, Transaction_Amount, Credit_Debit_flag, Account_No) values (current_date-5, 100, 'C', 1100444105);
insert into Transactions (Transaction_Date, Transaction_Amount, Credit_Debit_flag, Account_No) values (current_date-5, 200, 'D', 1100444105);

insert into Customer_Accounts values ('C1', 1100444101, 'PRD0001');
insert into Customer_Accounts values ('C1', 1100444102, 'PRD0003');
insert into Customer_Accounts values ('C1', 1100444103, 'PRD0004');
insert into Customer_Accounts values ('C2', 1100444105, 'PRD0002');
insert into Customer_Accounts values ('C3', 1100444106, 'PRD0002');
insert into Customer_Accounts values ('C1', 1100444104, 'PRD0004');
select * from products;
select * from Employees;
select * from Customers;
select * from Accounts;
select * from Transactions;
select * from Customer_Accounts;

1) Fetch the transaction id, date and amount of all debit transactions.

Select transaction_id, transaction_date, transaction_amount
From transactions
where credit_debit_flag = 'D';

2) Fetch male employees who earn more than 5000 salary.

select emp_name from employees
where gender = 'M'
and salary > 5000;

3) Fetch employees whose name starts with J or whose salary is greater than or equal to 7000.

select emp_name from employees 
where emp_name LIKE 'J%'
OR salary >= 7000;

4) Fetch accounts with balance in between 1000 to 3000

select * from Accounts
where balance between 1000 And 3000;

5) Using SQL, find out if a given number is even or odd ? (Given numbers are 432, 77)

select Case
when 432%2 = 0
then 'even' else 'odd'
end even_odd_flag;

select Case
when 77%2 = 0
then 'even' else 'odd'
end even_odd_flag;

6) Find customers who did not provide a phone no.

select first_name, last_name from customers
where phone Is null;

7) Find all the different products purchased by the customers.

select distinct prod_id from Customer_Accounts;

8) Sort all the active accounts based on highest balance and based on the earliest opening date.

select * from Accounts;

select * from accounts
where account_status = 'Active'
order by balance desc,
date_of_opening;

9) Fetch the oldest 5 transaction

select * from transactions
order by transaction_date
limit 5;

10) Find customers who are either from Bangalore/Chennai and 
their phone number is available OR those who were born before 1990.

select * from customers
where address IN('Bangalore','Chennai') And phone Is not null 
oR to_char(dob,'yyyy') < '1990';

11) Find total no of transactions in Feb 2023.

select count(1) from Transactions 
where to_char(transaction_date,'Mon') = 'Feb';

12) How total no of products purchased by customer "Satya Sharma".

select count(1) 
from Customer_Accounts ca 
join customers c on c.customer_id = ca.customer_id
where c.first_name||' '||c.last_name = 'Satya Sharma'

select count(1) from Customer_Accounts ca 
join Customers c ON c.customer_id = ca.customer_id
where c.first_name LIKE 'Satya%' And last_name LIKE '%Sharma'

13) Display the full names of all employees and customers.

select concat(first_name,' ', last_name) as full_name from customers;

14) Categorise accounts based on their balance.
    [Below 1k is Low balance, between 1k to 2k is average balance, above 2k is high balance]

select *,
case
when balance < 1000 then 'low'
when balance between 1000 And 2000 then 'average'
else 'high'
end as balance_status from accounts;
	
15) Find the total balance of all savings account.
select * from products;
select * from Accounts;
select * from Customer_Accounts;

select sum(a.balance) as total_balance from Accounts a
join Customer_Accounts ca ON ca.account_no = a.account_no
join products p ON p.prod_id = ca.prod_id
where p.prod_name = 'Savings Account';

16) Display the total account balance in all the current and savings account.

select sum(a.balance) as total_balance from Accounts a
join Customer_Accounts ca ON ca.account_no = a.account_no
join products p ON p.prod_id = ca.prod_id
where p.prod_name In('Savings Account','Current Account')
group by p.prod_name;

























































