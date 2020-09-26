declare
  b boolean := true;
begin

  dbms_output.put_line(
    CASE
      WHEN b THEN
        'b is true'
      WHEN NOT b THEN
        'b is false'
      ELSE
        'b is unknown'
    END
  );

end;
