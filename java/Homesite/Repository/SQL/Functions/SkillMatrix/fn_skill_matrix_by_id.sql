CREATE OR REPLACE FUNCTION fn_skill_matrix_by_id
  (
    IN prmId skill_matrix.id%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT skill_matrix.*
        FROM skill_matrix
        WHERE  skill_matrix.id = $1;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_skill_matrix_by_id(skill_matrix.id%TYPE) OWNER to homesite;
