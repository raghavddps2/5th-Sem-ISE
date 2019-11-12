DECLARE
num1 Number;

BEGIN
num1 := &Number1;
if (num1 > 0) 
then
	dbms_output.put_line('Positive');
elsif(num1 < 0)
then
	dbms_output.put_line('Negative');
else
	dbms_output.put_line('Zero');
end if;

END;
/
