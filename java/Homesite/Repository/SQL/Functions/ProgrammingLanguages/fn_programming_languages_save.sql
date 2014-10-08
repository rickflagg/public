CREATE OR REPLACE FUNCTION fn_programming_languages_save(
  IN programming_languages.id%TYPE, --id
  IN programming_languages.name%TYPE, --name
  IN programming_languages.active%TYPE, -- active
  IN programming_languages.reference_url%TYPE -- reference_url
)
  RETURNS programming_languages.id%TYPE AS
  $BODY$

    DECLARE
        retval int8;
    BEGIN

        IF $1 IS NULL THEN

            INSERT INTO programming_languages
            (
                name,
                active,
                date_created,
                date_modified,
                reference_url
            )
            VALUES
            (
                $2,
                $3,
                current_timestamp,
                current_timestamp,
                $4
            );

            retval := LASTVAL();

        ELSE
            UPDATE programming_languages
                SET
                    name = $2,
                    active = $3,
                    date_modified = current_timestamp,
                    reference_url = $4
            WHERE id = $1;

            retval := $1;

        END IF;



        RETURN retval;

    END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_programming_languages_save
(
  programming_languages.id%TYPE, --id
  programming_languages.name%TYPE, --name
  programming_languages.active%TYPE, -- active
  programming_languages.reference_url%TYPE -- reference_url

)OWNER TO homesite;