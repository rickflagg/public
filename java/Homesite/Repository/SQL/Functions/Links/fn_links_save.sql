CREATE OR REPLACE FUNCTION fn_links_save(
  IN links.id%TYPE, --id
  IN links.name%TYPE, --name
  IN links.active%TYPE, -- active
  IN links.description%TYPE, --description
  IN links.url%TYPE, -- url
  IN links.link_category_id%TYPE -- link category
)
  RETURNS links.id%TYPE AS
  $BODY$

    DECLARE
        retval int8;
    BEGIN

        IF $1 IS NULL THEN

            INSERT INTO links
            (
                name,
                active,
                date_created,
                date_modified,
                description,
                url,
                link_category_id
            )
            VALUES
            (
                $2,
                $3,
                current_timestamp,
                current_timestamp,
                $4,
                $5,
                $6
            );

            retval := LASTVAL();

        ELSE
            UPDATE links
                SET
                    name = $2,
                    active = $3,
                    date_modified = current_timestamp,
                    description = $4,
                    url = $5,
                    link_category_id = $6
            WHERE id = $1;

            retval := $1;

        END IF;

        RETURN retval;

    END;
$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_links_save
(
link_categories.id%TYPE, --id
link_categories.name%TYPE, --name
link_categories.active%TYPE, -- active
links.description%TYPE, --description
links.url%TYPE, -- url
links.link_category_id%TYPE -- link category
)
OWNER TO homesite;