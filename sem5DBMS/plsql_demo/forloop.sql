DECLARE
sum1 Number;
avg1 real;
cnt Number;

BEGIN
sum1:=0;
for cnt in 1..10 loop
sum1 := sum1+cnt;
end loop;
avg1 := sum1/10;
dbms_output.put_line(sum1);
dbms_output.put_line(avg1);

END;
/
