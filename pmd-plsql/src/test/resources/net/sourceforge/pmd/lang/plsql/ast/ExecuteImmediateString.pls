--
-- BSD-style license; for more info see http://pmd.sourceforge.net/license.html
--

CREATE OR REPLACE PROCEDURE test ( p_num_reg OUT number )
AS
table_name constant varchar2(2000) := 'test_tbl';
BEGIN
        execute immediate 'select count(1) from test_tbl where id =:param' into p_num_reg USING 'P';
        execute immediate 'select count(1) from ' || table_name;
END test;
