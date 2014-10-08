CREATE OR REPLACE FUNCTION fn_skill_matrix_by_name
  (
    IN prmName skill_matrix.name%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT skill_matrix.*
        FROM skill_matrix
        WHERE UPPER(skill_matrix.name) Like '%' || UPPER($1) || '%';

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_skill_matrix_by_name(skill_matrix.name%TYPE) OWNER to homesite;
