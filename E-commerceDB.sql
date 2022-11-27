/* Creating an E-Commerce database with tables - supplier,customer,category,product,supplier_pricing,order,rating 
	The code will insert the values and perform queries */

Drop database if exists `Ecommerce_DB`;
Create database Ecommerce_DB;
Use Ecommerce_DB;

/* Create table ---> supplier */
Create table if not exists supplier (SUPP_ID int PRIMARY KEY,
									 SUPP_NAME varchar(50) NOT NULL,
									 SUPP_CITY varchar(50) NOT NULL,
									 SUPP_PHONE varchar(50) NOT NULL);

/* Create table ---> customer */
Create table if not exists customer (CUS_ID int NOT NULL,
									 CUS_NAME varchar(20) NOT NULL,
									 CUS_PHONE varchar(10) NOT NULL,
									 CUS_CITY varchar(30) NOT NULL,
									 CUS_GENDER char,
									 PRIMARY KEY(CUS_ID));

/* Create table ---> category */
Create table if not exists category (CAT_ID int NOT NULL,
									 CAT_NAME varchar(20) NOT NULL,
									 PRIMARY KEY(CAT_ID));

/* Create table ---> product */
Create table if not exists product (PRO_ID int NOT NULL,
									PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
									PRO_DESC VARCHAR(60),
									CAT_ID int NOT NULL,
									PRIMARY KEY (PRO_ID),
									FOREIGN KEY (CAT_ID) references category(CAT_ID));

/* Create table ---> supplier_pricing */
Create table if not exists supplier_pricing (PRICING_ID int NOT NULL,
											 PRO_ID int NOT NULL,
											 SUPP_ID int NOT NULL,
                                             SUPP_PRICE int DEFAULT 0,
											 PRIMARY KEY (PRICING_ID),
											 FOREIGN KEY (PRO_ID) references product(PRO_ID),
											 FOREIGN KEY (SUPP_ID) references supplier(SUPP_ID));

/* Create table ---> order */
Create table if not exists `order` (ORD_ID int NOT NULL,
									ORD_AMOUNT int NOT NULL,
									ORD_DATE date NOT NULL,
									CUS_ID int NOT NULL,
									PRICING_ID int NOT NULL,
									PRIMARY KEY (ORD_ID),
									FOREIGN KEY (CUS_ID) references customer(CUS_ID),
									FOREIGN KEY (PRICING_ID) references supplier_pricing(PRICING_ID));
                    
/* Create table ---> rating */
Create table if not exists rating (RAT_ID int NOT NULL,
								   ORD_ID int NOT NULL,
								   RAT_RATSTARS int NOT NULL,
								   PRIMARY KEY (RAT_ID),
                                   FOREIGN KEY(ORD_ID) references `order`(ORD_ID));

/* Insert values to each table */
/* Supplier Table */
Insert into supplier values (1,"Rajesh Retails","Delhi",'1234567890');
Insert into supplier values (2,"Appario Ltd.","Mumbai",'2589631470');
Insert into supplier values (3,"Knome products","Banglore",'9785462315');
Insert into supplier values (4,"Bansal Retails","Kochi",'8975463285');
Insert into supplier values (5,"Mittal Ltd.","Lucknow",'7898456532');

/* Customer Table */
Insert into customer values (1,"AAKASH",'9999999999',"DELHI","M");
Insert into customer values (2,"AMAN",'9785463215',"NOIDA","M");
Insert into customer values (3,"NEHA",'9999999999',"MUMBAI","F");
Insert into customer values (4,"MEGHA",'9994562399',"KOLKATA","F");
Insert into customer values (5,"PULKIT",'7895999999',"LUCKNOW","M");

/* Category Table */
Insert into category values (1,"BOOKS");
Insert into category values (2,"GAMES");
Insert into category values (3,"GROCERIES");
Insert into category values (4,"ELECTRONICS");
Insert into category values (5,"CLOTHES");

/* Product Table */
Insert into product values (1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
Insert into product values (2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
Insert into product values (3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
Insert into product values (4,"OATS","Highly Nutritious from Nestle",3);
Insert into product values (5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
Insert into product values (6,"MILK","1L Toned MIlk",3);
Insert into product values (7,"Boat Earphones","1.5Meter long Dolby Atmos",4);
Insert into product values (8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
Insert into product values (9,"Project IGI","compatible with windows 7 and above",2);
Insert into product values (10,"Hoodie","Black GUCCI for 13 yrs and above",5);
Insert into product values (11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
Insert into product values (12,"Train Your Brain","By Shireen Stephen",1);

/* Supplier Pricing Table */
Insert into supplier_pricing values (1,1,2,1500);
Insert into supplier_pricing values (2,3,5,30000);
Insert into supplier_pricing values (3,5,1,3000);
Insert into supplier_pricing values (4,2,3,2500);
Insert into supplier_pricing values (5,4,1,1000);

/* Order Table */
Insert into `order` values(101,1500,'2021-10-06',2,1);
Insert into `order` values(102,1000,'2021-10-12',3,5);
Insert into `order` values(103,30000,'2021-09-16',5,2);
Insert into `order` values(104,1500,'2021-10-05',1,1);
Insert into `order` values(105,3000,'2021-08-16',4,3);
Insert into `order` values(106,1450,'2021-08-18',1,5);
Insert into `order` values(107,789,'2021-09-01',3,2);
Insert into `order` values(108,780,'2021-09-07',5,1); 
Insert into `order` values(109,3000,'2021-00-10',5,3);
Insert into `order` values(110,2500,'2021-09-10',2,4);
Insert into `order` values(111,1000,'2021-09-15',4,5);
Insert into `order` values(112,789,'2021-09-16',4,1);
Insert into `order` values(113,31000,'2021-09-16',1,4);
Insert into `order` values(114,1000,'2021-09-16',3,5);
Insert into `order` values(115,3000,'2021-09-16',5,3);
Insert into `order` values(116,99,'2021-09-17',2,4);

/* Rating  Table */
Insert into rating values(1,101,4);
Insert into rating values(2,102,3);
Insert into rating values(3,103,1);
Insert into rating values(4,104,2);
Insert into rating values(5,105,4);
Insert into rating values(6,106,3);
Insert into rating values(7,107,4);
Insert into rating values(8,108,5); 
Insert into rating values(9,109,3);
Insert into rating values(10,110,5);
Insert into rating values(11,111,3);
Insert into rating values(12,112,4);
Insert into rating values(13,113,2);
Insert into rating values(14,114,1);
Insert into rating values(15,115,1);
Insert into rating values(16,116,0);

/*	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000 */
Select CUS_GENDER as Gender, count(CUS_ID) as No_Of_Customers from customer
where CUS_ID in (Select CUS_ID from `order` where ORD_AMOUNT >=3000)
Group by CUS_GENDER;

/* Display all the orders along with product name ordered by a customer having Customer_Id=2 */
Select `order`.*,product.pro_name,product.pro_id from `order`, supplier_pricing,product
Where `order`.cus_id = 2 and `order`.pricing_id=supplier_pricing.pricing_id and supplier_pricing.pro_id = product.pro_id;

/* Display the Supplier details who can supply more than one product */
Select * from supplier Where (Select supp_id from supplier_pricing Group by supp_id Having count(PRO_ID)>1);

/*	Find the least expensive product from each category and print the table with category id, name, product name and price of the product */
Select category.cat_id,category.cat_name,pro_name, min(t3.min_price) as Min_Price from category inner join
(Select product.cat_id,product.pro_name,t2.* from product inner join
(Select pro_id, min(supp_price) as Min_Price from supplier_pricing Group by pro_id)
as t2 Where t2.pro_id = product.pro_id)
as t3 Where t3.cat_id = category.cat_id Group by t3.cat_id;

/* Display the Id and Name of the Product ordered after “2021-10-05” */
Select PRO_ID,PRO_NAME from product Where pro_id in
(Select pro_id from supplier_pricing Where PRICING_ID in
(Select pricing_id from `order` Where ord_date > '2021-10-05'));

/* Display customer name and gender whose names start or end with character 'A' */
Select CUS_NAME, CUS_GENDER from customer where 
CUS_NAME like 'A%' or CUS_NAME like '%A';

/* Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service”. */
DELIMITER &&
Create Procedure proc()
Begin
Select report.supp_id,report.supp_name,report.Rating,
Case
When report.Rating = 5 Then 'Excellent Service'
When report.Rating > 4 Then 'Good Service'
When report.Rating > 2 Then 'Average Service'
Else 'Poor Service'
End As Type_of_Service from
(Select final.supp_id,supplier.supp_name,final.Rating from 
(Select test2.supp_id,sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Rating from 
(Select supplier_pricing.supp_id,test.ORD_ID,test.RAT_RATSTARS from supplier_pricing inner join
(Select `order`.pricing_id,rating.ORD_ID,rating.RAT_RATSTARS from `order` inner join rating on rating.ord_id = `order`.ord_id) as test
on test.pricing_id = supplier_pricing.pricing_id)
as test2 Group by supplier_pricing.supp_id)
as final inner join supplier where final.supp_id = supplier.supp_id) as report;
End &&
DELIMITER ;
call proc();