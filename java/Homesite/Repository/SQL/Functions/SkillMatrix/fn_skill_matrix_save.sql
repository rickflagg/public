CREATE OR REPLACE FUNCTION fn_skill_matrix_save(
  IN skill_matrix.id%TYPE, --id
  IN skill_matrix.name%TYPE, --name
  IN skill_matrix.active%TYPE, -- active
  IN skill_matrix.rating%TYPE, -- rating
  IN skill_matrix.skill_matrix_category_id%TYPE -- Category
)
  RETURNS skill_matrix.id%TYPE AS
  $BODY$

    DECLARE
        retval skill_matrix.id%TYPE;
    BEGIN

        IF $1 IS NULL THEN

            INSERT INTO skill_matrix
            (
                name,
                active,
                date_created,
                date_modified,
                rating,
                skill_matrix_category_id
            )
            VALUES
            (
                $2,
                $3,
                current_timestamp,
                current_timestamp,
                $4,
                $5
            );

            retval := LASTVAL();

        ELSE
            UPDATE roles
                SET
                    name = $2,
                    active = $3,
                    date_modified = current_timestamp,
                    rating = $4,
                    skill_matrix_categories_id_seq = $5
            WHERE id = $1;

            retval := $1;

        END IF;



        RETURN retval;

    END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_skill_matrix_save
(
skill_matrix.id%TYPE, --id
skill_matrix.name%TYPE, --name
skill_matrix.active%TYPE, -- active
skill_matrix.rating%TYPE, -- rating
skill_matrix.skill_matrix_category_id%TYPE -- Category
)OWNER TO homesite;
