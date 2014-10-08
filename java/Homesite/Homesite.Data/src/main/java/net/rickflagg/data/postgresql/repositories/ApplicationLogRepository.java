package net.rickflagg.data.postgresql.repositories;

import net.rickflagg.data.entities.ApplicationLog;
import net.rickflagg.data.filters.ApplicationLogFilter;
import net.rickflagg.data.postgresql.PostgresFunction;
import net.rickflagg.data.postgresql.PostgresRefCursor;
import net.rickflagg.data.repositories.IApplicationLogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 9/6/14
 * Time: 5:52 AM
 * To change this template use File | Settings | File Templates.
 */

@Repository("applicationLogRepository")
@Transactional
public class ApplicationLogRepository implements IApplicationLogRepository {

    @Autowired
    private DataSource ds;

    public ApplicationLogRepository(){

    }

    @Override
    public void Save(ApplicationLog entity) throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{? = call fn_application_logs_save(?, ?, ?, ?,?, ?, ?, ?,?, ?, ?, ?,?,?, ?, ?) }"
        );

        function.registerOutputParameter(1, Types.INTEGER);

        function.setIntegerParameter(2, entity.getId());
        function.setStringParameter(3, entity.getBrowser());
        function.setStringParameter(4, entity.getHost());
        function.setStringParameter(5, entity.getReferrer());
        function.setStringParameter(6, entity.getRemoteAddress());
        function.setStringParameter(7, entity.getPath());
        function.setStringParameter(8, entity.getQueryString());
        function.setStringParameter(9, entity.getMessage());
        function.setStringParameter(10, entity.getSeverity());
        function.setStringParameter(11, entity.getEventType());
        function.setStringParameter(12, entity.getAuthenticationToken());
        function.setTimestampParameter(13, entity.getEventDate());
        function.setBooleanParameter(14, entity.isSuccess());
        function.setStringParameter(15, entity.getApplicationName());
        function.setStringParameter(16, entity.getSource());
        function.setStringParameter(17, entity.getStackTrace());

        function.execute();

        entity.setId((Integer)function.getObject(1));

        function.dispose();

    }

    @Override
    public List<ApplicationLog> Search(ApplicationLogFilter filter) throws SQLException, NamingException {

        List<ApplicationLog> retval = new ArrayList<ApplicationLog>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{? = call fn_application_logs_search(?, ?, ?, ?, ?,?, ?, ?, ?,?, ?, ?, ?,?, ?) }"
        );

        function.setIntegerParameter(2, filter.getId());
        function.setStringParameter(3, filter.getBrowser());
        function.setStringParameter(4, filter.getHost());
        function.setStringParameter(5, filter.getReferrer());
        function.setStringParameter(6, filter.getRemoteAddress());
        function.setStringParameter(7, filter.getPath());
        function.setStringParameter(8, filter.getQueryString());
        function.setStringParameter(9, filter.getMessage());
        function.setStringParameter(10, filter.getSeverity());
        function.setStringParameter(11, filter.getEventType());
        function.setStringParameter(12, filter.getAuthenticationToken());
        function.setTimestampParameter(13, filter.getStartDate());
        function.setTimestampParameter(14, filter.getEndDate());
        function.setBooleanParameter(15, filter.isSuccess());
        function.setStringParameter(16, filter.getApplicationName());

        PostgresRefCursor refCursor = function.getRefCursor();

        if (refCursor != null){

            while(refCursor.next())
            {
                retval.add(BindEntity(refCursor));
            }
        }

        refCursor.dispose();
        function.dispose();

        return retval;


    }

    @Override
    public List<ApplicationLog> Tail() throws SQLException, NamingException {
        List<ApplicationLog> retval = new ArrayList<ApplicationLog>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_application_logs_tail() }"
        );

        PostgresRefCursor refCursor = function.getRefCursor();

        if(refCursor != null)
        {
            while (refCursor.next())
            {
                retval.add(BindEntity(refCursor));
            }
        }

        refCursor.dispose();
        function.dispose();

        return retval;

    }

    private ApplicationLog BindEntity(PostgresRefCursor refCursor) throws SQLException
    {
        ApplicationLog entity = new ApplicationLog();

        refCursor.bindBaseEntity(entity);

        entity.setBrowser(refCursor.parseString("browser"));
        entity.setHost(refCursor.parseString("host"));
        entity.setReferrer(refCursor.parseString("referrer"));
        entity.setRemoteAddress(refCursor.parseString("remote_address"));
        entity.setPath(refCursor.parseString("path"));
        entity.setQueryString(refCursor.parseString("query_string"));
        entity.setMessage(refCursor.parseString("message"));
        entity.setSeverity(refCursor.parseString("severity"));
        entity.setEventType(refCursor.parseString("event_type"));
        entity.setAuthenticationToken(refCursor.parseString("authentication_token"));
        entity.setEventDate(refCursor.parseDateTime("event_date"));
        entity.setSuccess(refCursor.parseBoolean("success"));
        entity.setApplicationName(refCursor.parseString("application_name"));
        entity.setSource(refCursor.parseString("source"));
        entity.setStackTrace(refCursor.parseString("stack_trace"));


        return entity;

    }


}
