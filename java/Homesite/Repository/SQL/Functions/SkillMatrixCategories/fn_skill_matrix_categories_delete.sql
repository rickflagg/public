CREATE OR REPLACE FUNCTION fn_skill_matrix_categories_delete
  (
    IN skill_matrix_categories.id%TYPE
  )
  RETURNS VOID AS
  $BODY$
    BEGIN

            DELETE
            FROM skill_matrix_categories
            WHERE skill_matrix_categories.id = $1;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_skill_matrix_categories_delete
(
skill_matrix_categories.id%TYPE
) OWNER to homesite;