package net.rickflagg.data.postgresql.repositories;

import net.rickflagg.data.entities.DatabasePlatform;
import net.rickflagg.data.postgresql.PostgresFunction;
import net.rickflagg.data.postgresql.PostgresRefCursor;
import net.rickflagg.data.repositories.IDatabasePlatformRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 8/6/14
 * Time: 3:13 AM
 * To change this template use File | Settings | File Templates.
 */
@Repository("databasePlatformRepository")
@Transactional
public class DatabasePlatformRepository implements IDatabasePlatformRepository{

    @Autowired
    private DataSource ds;

    public DatabasePlatformRepository()
    {

    }

    @Override
    public List<DatabasePlatform> RetrieveAll() throws SQLException, NamingException {

        List<DatabasePlatform> retval = new ArrayList<DatabasePlatform>();

        PostgresFunction function = new PostgresFunction(ds.getConnection(), "{ ? = call fn_database_platforms_all() }");

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

    @Override
    public void Delete(DatabasePlatform entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(ds.getConnection(),
                "{ call fn_database_platforms_delete(?) }");

        function.setIntegerParameter(1, entity.getId());

        function.execute();

        function.dispose();

    }

    @Override
    public void Save(DatabasePlatform entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{? = call fn_database_platforms_save(?, ?, ?, ?, ?) }"
        );

        function.registerOutputParameter(1, Types.INTEGER);
        function.setIntegerParameter(2, entity.getId());
        function.setStringParameter(3, entity.getName());
        function.setBooleanParameter(4, entity.getActive());
        function.setIntegerParameter(5, entity.getSortOrder());
        function.setStringParameter(6, entity.getReferenceUrl());

        function.execute();

        entity.setId((Integer)function.getObject(1));

        function.dispose();


    }

    @Override
    public List<DatabasePlatform> FindByName(String name)throws SQLException, NamingException {

        List<DatabasePlatform> retval = new ArrayList<DatabasePlatform>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_database_platforms_by_name(?) }"
        );

        function.setStringParameter(2, name);

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
    public DatabasePlatform FindById(int id) throws SQLException, NamingException{

        DatabasePlatform entity = null;

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_database_platforms_by_id(?) }"
        );

        function.setIntegerParameter(2,id);

        PostgresRefCursor refCursor = function.getRefCursor();

        if (refCursor != null){
            refCursor.next();
            entity = BindEntity(refCursor);
        }

        refCursor.dispose();
        function.dispose();


        return entity;
    }

    private DatabasePlatform BindEntity(PostgresRefCursor refCursor) throws SQLException
    {
        DatabasePlatform entity = new DatabasePlatform();

        refCursor.bindBaseEntity(entity);
        entity.setReferenceUrl(refCursor.parseString("reference_url"));

        return entity;
    }



}
