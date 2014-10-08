CREATE OR REPLACE FUNCTION fn_skill_matrix_categories_all()
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT skill_matrix_categories.*
        FROM skill_matrix_categories
        WHERE skill_matrix_categories.active = true;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_skill_matrix_categories_all() OWNER to homesite;