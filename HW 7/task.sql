-- 1
CREATE VIEW samsBills (name, bill_date, cust_name, bill_total) AS
SELECT CONCAT(S.first_name, ' ', S.surname), B.bill_date, B.cust_name, B.bill_total
FROM restStaff S
INNER JOIN restBill B ON S.staff_no = B.waiter_no
WHERE S.first_name = 'Sam' AND S.surname = 'Pitt';
-- 2
SELECT * FROM samsBills WHERE bill_total > 400;
-- 3
CREATE VIEW roomTotals AS
SELECT R.room_name, SUM(B.bill_total) AS total_sum
FROM restRoom_management R
INNER JOIN restRest_table T ON R.room_name = T.room_name
INNER JOIN restBill B ON T.table_no = B.table_no
GROUP BY R.room_name;
-- 4
CREATE VIEW teamTotals AS
SELECT CONCAT(H.first_name,' ' ,H.surname) AS headwaiter_name, SUM(B.bill_total) AS total_sum
FROM restStaff H 
INNER JOIN restStaff S ON S.headwaiter = H.staff_no
INNER JOIN restBill B ON S.staff_no = B.waiter_no
GROUP BY headwaiter_name
ORDER BY total_sum DESC;