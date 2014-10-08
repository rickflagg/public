CREATE OR REPLACE FUNCTION fn_skill_matrix_by_category
  (
    IN prmId skill_matrix_categories.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT skill_matrix.*
        FROM skill_matrix
        WHERE  skill_matrix.skill_matrix_category_id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_skill_matrix_by_category(skill_matrix.skill_matrix_category_id%TYPE) OWNER to homesite;
