CREATE OR REPLACE FUNCTION fn_database_platforms_delete
  (
    IN database_platforms.id%TYPE
  )
RETURNS VOID AS
$BODY$
    BEGIN

            DELETE
            FROM database_platforms
            WHERE database_platforms.id = $1;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_database_platforms_delete
(
  database_platforms.id%TYPE
) OWNER to homesite;