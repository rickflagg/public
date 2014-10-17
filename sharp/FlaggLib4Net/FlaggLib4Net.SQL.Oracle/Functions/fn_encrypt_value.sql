CREATE OR REPLACE FUNCTION fn_encrypt_value(piv_string in varchar2)
return varchar2
is 
   v_string VARCHAR2(200) := piv_string;
   piv_key varchar2(100) := '8bytekey';
begin
  if mod(length(v_string),8) != 0
  then
    v_string := v_string||lpad(chr(0),8-mod(length(v_string),8),chr(0));
  end if;
  return dbms_obfuscation_toolkit.desencrypt(input_string=>v_string,key_string=>piv_key);
end;