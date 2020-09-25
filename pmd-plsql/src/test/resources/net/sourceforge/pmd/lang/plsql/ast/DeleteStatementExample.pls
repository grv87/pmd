--
-- Deleting Rows: Examples
-- https://docs.oracle.com/en/database/oracle/oracle-database/18/sqlrf/DELETE.html#GUID-156845A5-B626-412B-9F95-8869B988ABD7
--

DECLARE
BEGIN

    DELETE FROM product_descriptions
        WHERE language_id = 'AR';

    DELETE FROM employees
        WHERE job_id = 'SA_REP'
        AND commission_pct < .2;

    DELETE FROM (SELECT * FROM employees)
        WHERE job_id = 'SA_REP'
        AND commission_pct < .2;

    DELETE FROM raises
       WHERE commission_pct > .2
       LOG ERRORS REJECT LIMIT UNLIMITED;

    DELETE FROM table1 t_alias1
       WHERE column in
       (SELECT expr
            FROM table2 t_alias2
            WHERE t_alias1.column = t_alias2.column);

    DELETE FROM hr.locations@remote
        WHERE location_id > 3000;

    DELETE FROM sales PARTITION (sales_q1_1998)
        WHERE amount_sold > 1000;

    DELETE TABLE(SELECT h.people FROM hr_info h
       WHERE h.department_id = 280) p
       WHERE p.salary > 1700;

END;
/
