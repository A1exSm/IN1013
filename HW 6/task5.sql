-- 1
SELECT CONCAT(S.first_name, ' ', S.surname) AS Name, B.bill_date, COUNT(B.bill_no)
FROM restStaff S
INNER JOIN restBill B ON S.staff_no = B.waiter_no
GROUP BY S.staff_no, B.bill_date
HAVING COUNT(B.bill_no) >= 2;
-- 2
SELECT room_name, COUNT(table_no) AS number_of_tables
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;
-- 3
SELECT T.room_name, COUNT(B.bill_no)
FROM restRest_table T
INNER JOIN restBill B ON B.table_no = T.table_no
GROUP BY T.room_name;
-- 4
SELECT H.first_name,H.surname, SUM(B.bill_total) 
FROM restStaff H 
INNER JOIN restStaff S ON S.headwaiter = H.staff_no
INNER JOIN restBill B ON S.staff_no = B.waiter_no
WHERE H.headwaiter IS NULL
GROUP BY H.first_name, H.surname
ORDER BY SUM(B.bill_total) DESC;
-- 5
SELECT cust_name, AVG(bill_total)
FROM restBill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;
-- 6
SELECT S.first_name, S.surname, COUNT(B.bill_no)
FROM restStaff S
INNER JOIN restBill B ON S.staff_no = B.waiter_no
GROUP BY S.first_name, S.surname
HAVING COUNT(B.bill_no) > 2;