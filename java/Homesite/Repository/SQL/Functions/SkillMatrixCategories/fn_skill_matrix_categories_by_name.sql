CREATE OR REPLACE FUNCTION fn_skill_matrix_categories_by_name
  (
    IN prmName skill_matrix_categories.name%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT skill_matrix_categories.*
        FROM skill_matrix_categories
        WHERE UPPER(skill_matrix_categories.name) Like '%' || UPPER($1) || '%';

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_skill_matrix_categories_by_name(skill_matrix_categories.name%TYPE) OWNER to homesite;
