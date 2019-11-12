DECLARE
sum1 Number;
avg1 real;
cnt Number;

BEGIN
cnt:=10;
sum1:=0;
while cnt!=0 loop
sum1 := sum1+cnt;
cnt := cnt-1;
end loop;
avg1 := sum1/10;
dbms_output.put_line(sum1);
dbms_output.put_line(avg1);

END;
/
