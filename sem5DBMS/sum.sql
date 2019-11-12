DECLARE 
	num1 Number;
	num2 Number;
	res Number;

BEGIN
	num1 := &Number1;
	num2 := &Number2;
	res := num1+num2;
	dbms_output.put_line('The sum is : '||res);

END;
/

