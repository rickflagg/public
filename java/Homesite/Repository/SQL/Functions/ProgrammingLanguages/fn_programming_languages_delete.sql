CREATE OR REPLACE FUNCTION fn_programming_languages_delete
  (
    IN programming_languages.id%TYPE
  )
  RETURNS VOID AS
  $BODY$
    BEGIN

            DELETE
            FROM programming_languages
            WHERE programming_languages.id = $1;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_programming_languages_delete
(
  programming_languages.id%TYPE
) OWNER to homesite;