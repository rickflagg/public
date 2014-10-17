CREATE OR REPLACE FUNCTION fn_decrypt_value(piv_string in varchar2)
return varchar2
is 
   v_string VARCHAR2(200);
   piv_key varchar2(100) := '8bytekey';
begin 
  v_string := dbms_obfuscation_toolkit.desdecrypt(input_string=>piv_string,key_string=>piv_key);
  return rtrim(v_string,chr(0));
end;