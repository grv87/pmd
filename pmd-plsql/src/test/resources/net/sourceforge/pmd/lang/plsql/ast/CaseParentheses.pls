declare
  c varchar2(255) := '123';
begin

  dbms_output.put_line(
    CASE (c)
      WHEN '123' THEN
        '456'
      WHEN '789' THEN
        '987'
    END
  );

end;
