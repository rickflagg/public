CREATE OR REPLACE FUNCTION fn_programming_toolkits_delete
  (
    IN programming_toolkits.id%TYPE
  )
  RETURNS VOID AS
  $BODY$
    BEGIN

            DELETE
            FROM programming_toolkits
            WHERE programming_toolkits.id = $1;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_programming_languages_delete
(
programming_toolkits.id%TYPE
) OWNER to homesite;