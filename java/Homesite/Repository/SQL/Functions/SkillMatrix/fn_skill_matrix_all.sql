CREATE OR REPLACE FUNCTION fn_skill_matrix_all()
  RETURNS REFCURSOR AS
  $BODY$
    DECLARE
        cur REFCURSOR;
    BEGIN
        OPEN cur FOR
        SELECT skill_matrix.*
        FROM skill_matrix
        WHERE skill_matrix.active = true;

        RETURN cur;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_skill_matrix_all() OWNER to homesite;