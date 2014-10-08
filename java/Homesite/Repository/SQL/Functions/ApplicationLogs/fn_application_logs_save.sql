CREATE OR REPLACE FUNCTION fn_application_logs_save
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
    IN prmEventDate application_logs.event_date%TYPE,
    IN prmSuccess application_logs.success%TYPE,
    IN prmApplicationName application_logs.application_name%TYPE,
    IN prmSource application_logs.source%TYPE,
    IN prmStackTrace application_logs.stack_trace%TYPE
  )
  RETURNS application_logs.id%TYPE AS
  $BODY$
    DECLARE
        retval application_logs.id%TYPE;
    BEGIN
        IF $1 IS NULL THEN

            INSERT INTO application_logs
            (
                browser,
                host,
                referrer,
                remote_address,
                path,
                query_string,
                message,
                severity,
                event_type,
                authentication_token,
                event_date,
                success,
                application_name,
                source,
                stack_trace
            )
            VALUES
            (
                $2,
                $3,
                $4,
                $5,
                $6,
                $7,
                $8,
                $9,
                $10,
                $11,
                $12,
                $13,
                $14,
                $15,
                $16
            );

             retval := LASTVAL();

        ELSE

            UPDATE application_logs
            SET
                browser = $2,
                host = $3,
                referrer = $4,
                remote_address = $5,
                path = $6,
                query_string = $7,
                message = $8,
                severity = $9,
                event_type = $10,
                authentication_token = $11,
                event_date = $12,
                success = $13,
                application_name = $14,
                source = $15,
                stack_trace = $16;

            retval := $1;

        END IF;

        RETURN retval;

    END;

$BODY$ LANGUAGE plpgsql;

ALTER FUNCTION fn_application_logs_save
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
application_logs.success%TYPE,
application_logs.application_name%TYPE,
application_logs.source%TYPE,
application_logs.stack_trace%TYPE
) OWNER TO homesite;
