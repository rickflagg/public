CREATE OR REPLACE FUNCTION fn_skill_matrix_delete
  (
    IN skill_matrix.id%TYPE
  )
  RETURNS VOID AS
  $BODY$
    BEGIN

            DELETE
            FROM skill_matrix
            WHERE skill_matrix.id = $1;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_skill_matrix_delete
(
skill_matrix.id%TYPE
) OWNER to homesite;