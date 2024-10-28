-- 1
SELECT SUM(bill_total) AS Income FROM restbill;
-- 3
SELECT SUM(bill_total) AS 'Feb Income' FROM restbill WHERE bill_date >= 160200 AND bill_date < 160300;
-- 3
SELECT AVG(bill_total) FROM restbill WHERE table_no = 2;
-- 4
SELECT MIN(no_of_seats) AS Min, MAX(no_of_seats) AS Max, AVG(no_of_seats) AS Avg FROM restRest_table WHERE room_name = "Blue";
-- 5
SELECT COUNT(DISTINCT table_no) FROM restbill WHERE waiter_no IN (002, 004);