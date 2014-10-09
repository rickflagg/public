CREATE OR REPLACE FUNCTION fn_projects_save(
  IN projects.id%TYPE, --id
  IN projects.name%TYPE, --name
  IN projects.active%TYPE, -- active
  IN projects.client_id%TYPE,
  IN projects.start_date%TYPE,
  IN projects.end_date%TYPE,
  IN projects.description%TYPE,
  IN projects.database_platform_id%TYPE,
  IN projects.software_lifecycle_id%TYPE,
  IN projects.git_url%TYPE


)
  RETURNS projects.id%TYPE AS
  $BODY$

    DECLARE
        retval projects.id%TYPE;
    BEGIN

        IF $1 IS NULL THEN

            INSERT INTO projects
            (
                name,
                active,
                date_created,
                date_modified,
                client_id,
                start_date,
                end_date,
                description,
                database_platform_id,
                software_lifecycle_id,
                git_url
            )
            VALUES
            (
                $2,
                $3,
                current_timestamp,
                current_timestamp,
                $4,
                $5,
                $6,
                $7,
                $8,
                $9,
                $10
            );

            retval := LASTVAL();

        ELSE
            UPDATE projects
                SET
                    name = $2,
                    active = $3,
                    date_modified = current_timestamp,
                    client_id = $4,
                    start_date = $5,
                    end_date = $6,
                    description = $7,
                    database_platform_id = $8,
                    software_lifecycle_id = $9,
                    git_url = $10
            WHERE id = $1;

            retval := $1;

        END IF;



        RETURN retval;

    END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_projects_save
(
  projects.id%TYPE, --id
  projects.name%TYPE, --name
  projects.active%TYPE, -- active
  projects.client_id%TYPE,
  projects.start_date%TYPE,
  projects.end_date%TYPE,
  projects.description%TYPE,
  projects.database_platform_id%TYPE,
  projects.software_lifecycle_id%TYPE,
  projects.git_url%TYPE
)OWNER TO homesite;
