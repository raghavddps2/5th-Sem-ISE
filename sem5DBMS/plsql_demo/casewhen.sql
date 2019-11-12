DECLARE
num1 Number;
num2 Number;

BEGIN
num1 := &Number1;
num2 := mod(num1,2);
case num2 
when 0
then dbms_output.put_line('Even');
else dbms_output.put_line('Odd');
end case;

END;
/
