CREATE OR REPLACE FUNCTION fn_skill_matrix_categories_by_id
  (
    IN prmId skill_matrix_categories.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT skill_matrix_categories.*
        FROM skill_matrix_categories
        WHERE  skill_matrix_categories.id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_skill_matrix_categories_by_id(skill_matrix_categories.id%TYPE) OWNER to homesite;
