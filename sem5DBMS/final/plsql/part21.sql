SET SERVEROUTPUT ON
DECLARE
c_code branch.code %type ;
c_name branch.name %type ;
c_assets branch.assets %type ;
CURSOR c1
IS SELECT code ,name,assets
FROM branch;
BEGIN
OPEN c1;
LOOP
FETCH c1 INTO c_code, c_name, c_assets;
EXIT WHEN c1 %notfound;
dbms_output.put_line(c_code||'   '||c_name||'    '||c_assets);
END LOOP;
CLOSE c1;
END;
/
