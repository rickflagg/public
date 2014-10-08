CREATE OR REPLACE FUNCTION fn_skill_matrix_categories_save(
  IN skill_matrix_categories.id%TYPE, --id
  IN skill_matrix_categories.name%TYPE, --name
  IN skill_matrix_categories.active%TYPE -- active

)
  RETURNS skill_matrix_categories.id%TYPE AS
  $BODY$

    DECLARE
        retval skill_matrix_categories.id%TYPE;
    BEGIN

        IF $1 IS NULL THEN

            INSERT INTO skill_matrix_categories
            (
                name,
                active,
                date_created,
                date_modified
            )
            VALUES
            (
                $2,
                $3,
                current_timestamp,
                current_timestamp
            );

            retval := LASTVAL();

        ELSE
            UPDATE skill_matrix_categories
                SET
                    name = $2,
                    active = $3,
                    date_modified = current_timestamp
            WHERE id = $1;

            retval := $1;

        END IF;



        RETURN retval;

    END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_skill_matrix_categories_save
(
skill_matrix_categories.id%TYPE, --id
skill_matrix_categories.name%TYPE, --name
skill_matrix_categories.active%TYPE -- active


)OWNER TO homesite;
