package net.rickflagg.data.postgresql.repositories;

import net.rickflagg.data.entities.ServiceToken;
import net.rickflagg.data.postgresql.PostgresFunction;
import net.rickflagg.data.postgresql.PostgresRefCursor;
import net.rickflagg.data.repositories.IServiceTokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.SQLException;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
@Repository("serviceTokenRepository")
public class ServiceTokenRepository  implements IServiceTokenRepository {

    @Autowired
    private DataSource ds;

    public ServiceTokenRepository()
    {

    }

    @Override
    public ServiceToken findServiceToken(String key1, String key2, String key3, String key4) throws SQLException, NamingException{

        ServiceToken token = null;

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
            "{ ? = call fn_service_token_by_key(?, ?, ?, ?) }"
        );

        function.setStringParameter(2, key1);
        function.setStringParameter(3, key2);
        function.setStringParameter(4, key3);
        function.setStringParameter(5, key4);

        PostgresRefCursor refCursor = function.getRefCursor();

        if(refCursor != null)
        {
            refCursor.next();

            token = BindEntity(refCursor);

        }

        refCursor.dispose();
        function.dispose();


        return token;

    }

    private ServiceToken BindEntity(PostgresRefCursor refCursor) throws SQLException
    {
        ServiceToken entity = null;

        if(refCursor.parseString("key1") != null)
        {
            entity = new ServiceToken();

            refCursor.bindBaseEntity(entity);
            entity.setKey1(refCursor.parseString("key1"));
            entity.setKey2(refCursor.parseString("key2"));
            entity.setKey3(refCursor.parseString("key3"));
            entity.setKey4(refCursor.parseString("key4"));
        }


        return entity;
    }
}
