CREATE OR REPLACE FUNCTION fn_application_logs_search
  (
    IN prmId application_logs.id%TYPE,
    IN prmBrowser application_logs.browser%TYPE,
    IN prmHost application_logs.host%TYPE,
    IN prmReferrer application_logs.referrer%TYPE,
    IN prmRemoteAddress application_logs.remote_address%TYPE,
    IN prmPath application_logs.path%TYPE,
    IN prmQueryString application_logs.query_string%TYPE,
    IN prmMessage application_logs.message%TYPE,
    IN prmSeverity application_logs.severity%TYPE,
    IN prmEventType application_logs.event_type%TYPE,
    IN prmAuthenticationToken application_logs.authentication_token%TYPE,
    IN prmStartEventDate application_logs.event_date%TYPE,
    IN prmEndEventDate application_logs.event_date%TYPE,
    IN prmSuccess application_logs.success%TYPE,
    IN prmApplicationName application_logs.application_name%TYPE
  )
  RETURNS REFCURSOR AS
  $BODY$

    DECLARE
        retval REFCURSOR;
    BEGIN

          OPEN retval FOR
          SELECT * FROM application_logs
          WHERE
            application_logs.id = COALESCE($1, application_logs.id)
            AND
            UPPER(application_logs.browser) LIKE COALESCE('%' || UPPER($2) || '%', UPPER(application_logs.browser))
            AND
            UPPER(application_logs.host) LIKE COALESCE('%' || UPPER($3) || '%', UPPER(application_logs.host))
            AND
            UPPER(application_logs.referrer) LIKE COALESCE('%' || UPPER($4) || '%', UPPER(application_logs.referrer))
            AND
            UPPER(application_logs.remote_address) LIKE COALESCE('%' || UPPER($5) || '%', UPPER(application_logs.remote_address))
            AND
            UPPER(application_logs.path) LIKE COALESCE('%' || UPPER($6) || '%', UPPER(application_logs.path))
            AND
            UPPER(application_logs.query_string) LIKE COALESCE('%' || UPPER($7) || '%', UPPER(application_logs.query_string))
            AND
            UPPER(application_logs.message) LIKE COALESCE('%' || UPPER($8) || '%', UPPER(application_logs.message))
            AND
            UPPER(application_logs.severity) LIKE COALESCE('%' || UPPER($9) || '%', UPPER(application_logs.severity))
            AND
            UPPER(application_logs.event_type) LIKE COALESCE('%' || UPPER($10) || '%', UPPER(application_logs.event_type))
            AND
            UPPER(application_logs.authentication_token) LIKE COALESCE('%' || UPPER($11) || '%', UPPER(application_logs.authentication_token))
            AND
            UPPER(application_logs.application_name) LIKE COALESCE('%' || UPPER($15) || '%', UPPER(application_logs.application_name))
            AND
            application_logs.success = COALESCE($14, application_logs.success)
            AND
            application_logs.event_date between COALESCE($12, application_logs.event_date) and COALESCE($13, application_logs.event_date);

            return retval;
    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_application_logs_search
(
application_logs.id%TYPE,
application_logs.browser%TYPE,
application_logs.host%TYPE,
application_logs.referrer%TYPE,
application_logs.remote_address%TYPE,
application_logs.path%TYPE,
application_logs.query_string%TYPE,
application_logs.message%TYPE,
application_logs.severity%TYPE,
application_logs.event_type%TYPE,
application_logs.authentication_token%TYPE,
application_logs.event_date%TYPE,
application_logs.event_date%TYPE,
application_logs.success%TYPE,
application_logs.application_name%TYPE
) OWNER TO homesite;