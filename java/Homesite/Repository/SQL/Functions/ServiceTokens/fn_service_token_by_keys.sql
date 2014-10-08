CREATE OR REPLACE FUNCTION fn_service_token_by_key
  (
    IN prmKey1 service_tokens.key1%TYPE,
    IN prmKey2 service_tokens.key2%TYPE,
    IN prmKey3 service_tokens.key3%TYPE,
    IN prmKey4 service_tokens.key4%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT DISTINCT service_tokens.*
        FROM service_tokens
        WHERE service_tokens.active = true
          AND key1 = $1
          AND key2 = $2
          AND key3 = $3
          AND key4 = $4;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_service_token_by_key
(
  service_tokens.key1%TYPE,
  service_tokens.key2%TYPE,
  service_tokens.key3%TYPE,
  service_tokens.key4%TYPE

) OWNER to homesite;