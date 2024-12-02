-- 1
SELECT cust_name FROM restBill WHERE bill_total > 450 AND waiter_no IN (SELECT staff_no FROM restStaff WHERE headwaiter IN (SELECT staff_no FROM restStaff WHERE first_name = 'Charles'));
-- 2
SELECT first_name, surname FROM restStaff WHERE staff_no IN (SELECT headwaiter FROM restStaff WHERE staff_no IN (SELECT waiter_no FROM restBill WHERE cust_name LIKE 'Nerida%' AND bill_date = 160111));
-- 3
SELECT cust_name, MIN(bill_total) FROM restBill GROUP BY cust_name;
-- 4
SELECT first_name, surname FROM restStaff WHERE staff_no NOT IN (SELECT waiter_no FROM restBill);
-- 5
SELECT Bill.cust_name, Staff.first_name, Staff.surname, Room.room_name FROM restBill Bill INNER JOIN restRest_table ON Bill.table_no = restRest_table.table_no INNER JOIN restRoom_management Room ON restRest_table.room_name = Room.room_name AND Bill.bill_date = Room.room_date INNER JOIN restStaff Staff ON Room.headwaiter = Staff.staff_no WHERE bill_total = (SELECT MAX(bill_total) FROM restBill);