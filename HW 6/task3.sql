-- 1
SELECT first_name FROM restStaff WHERE staff_no IN (SELECT waiter_no FROM restBill WHERE cust_name = "Tanya Singh");
-- 2
SELECT room_date FROM restRoom_management WHERE room_date >= 160200 AND room_date < 160300 AND room_name = 'Green' AND headwaiter IN (SELECT staff_no FROM restStaff WHERE first_name = 'Charles');
-- 3
SELECT first_name, surname FROM restStaff WHERE headwaiter IN (SELECT headwaiter FROM restStaff WHERE first_name = 'Zoe' AND surname = 'Ball');
-- 4
SELECT T1.cust_name AS "customer name", T1.bill_total AS "amount spent", T2.first_name FROM restBill T1 INNER JOIN restStaff T2 ON T1.waiter_no = T2.staff_no ORDER BY T1.bill_total DESC;
-- 5
SELECT first_name, surname FROM restStaff WHERE staff_no IN (SELECT waiter_no FROM restBill WHERE bill_no IN (00014, 00017)); 
-- 6
SELECT first_name, surname FROM restStaff WHERE staff_no = (SELECT headwaiter FROM restRoom_management WHERE room_name = 'Blue' AND room_date = 160312) OR headwaiter = (SELECT headwaiter FROM restRoom_management WHERE room_name = 'Blue' AND room_date = 160312);