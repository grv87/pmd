--
-- See https://docs.oracle.com/database/121/SQLRF/statements_9015.htm#i2145081
--
BEGIN

  INSERT ALL
      INTO sales (prod_id, cust_id, time_id, amount)
      VALUES (product_id, customer_id, weekly_start_date, sales_sun)
      INTO sales (prod_id, cust_id, time_id, amount)
      VALUES (product_id, customer_id, weekly_start_date+1, sales_mon)
      INTO sales (prod_id, cust_id, time_id, amount)
      VALUES (product_id, customer_id, weekly_start_date+2, sales_tue)
      INTO sales (prod_id, cust_id, time_id, amount)
      VALUES (product_id, customer_id, weekly_start_date+3, sales_wed)
      INTO sales (prod_id, cust_id, time_id, amount)
      VALUES (product_id, customer_id, weekly_start_date+4, sales_thu)
      INTO sales (prod_id, cust_id, time_id, amount)
      VALUES (product_id, customer_id, weekly_start_date+5, sales_fri)
      INTO sales (prod_id, cust_id, time_id, amount)
      VALUES (product_id, customer_id, weekly_start_date+6, sales_sat)
   SELECT product_id, customer_id, weekly_start_date, sales_sun,
      sales_mon, sales_tue, sales_wed, sales_thu, sales_fri, sales_sat
      FROM sales_input_table;

  INSERT ALL
     WHEN order_total <= 100000 THEN
        INTO small_orders
     WHEN order_total > 1000000 AND order_total <= 200000 THEN
        INTO medium_orders
     WHEN order_total > 200000 THEN
        INTO large_orders
     SELECT order_id, order_total, sales_rep_id, customer_id
        FROM orders;

  INSERT ALL
     WHEN order_total <= 100000 THEN
        INTO small_orders
     WHEN order_total > 100000 AND order_total <= 200000 THEN
        INTO medium_orders
     ELSE
        INTO large_orders
     SELECT order_id, order_total, sales_rep_id, customer_id
        FROM orders;

  INSERT ALL
     WHEN ottl <= 100000 THEN
        INTO small_orders
           VALUES(oid, ottl, sid, cid)
     WHEN ottl > 100000 and ottl <= 200000 THEN
        INTO medium_orders
           VALUES(oid, ottl, sid, cid)
     WHEN ottl > 200000 THEN
        into large_orders
           VALUES(oid, ottl, sid, cid)
     WHEN ottl > 290000 THEN
        INTO special_orders
     SELECT o.order_id oid, o.customer_id cid, o.order_total ottl,
        o.sales_rep_id sid, c.credit_limit cl, c.cust_email cem
        FROM orders o, customers c
        WHERE o.customer_id = c.customer_id;

  INSERT FIRST
     WHEN ottl <= 100000 THEN
        INTO small_orders
           VALUES(oid, ottl, sid, cid)
     WHEN ottl > 100000 and ottl <= 200000 THEN
        INTO medium_orders
           VALUES(oid, ottl, sid, cid)
     WHEN ottl > 290000 THEN
        INTO special_orders
     WHEN ottl > 200000 THEN
        INTO large_orders
           VALUES(oid, ottl, sid, cid)
     SELECT o.order_id oid, o.customer_id cid, o.order_total ottl,
        o.sales_rep_id sid, c.credit_limit cl, c.cust_email cem
        FROM orders o, customers c
        WHERE o.customer_id = c.customer_id;

END;
/
