--
-- BSD-style license; for more info see http://pmd.sourceforge.net/license.html
--

BEGIN
FOR someone IN (
WITH e AS (
    SELECT * FROM employees
)
SELECT * FROM e
WHERE employee_id < 120
ORDER BY employee_id
)
LOOP
DBMS_OUTPUT.PUT_LINE('First name = ' || someone.first_name ||
', Last name = ' || someone.last_name);
END LOOP;
END;
/
