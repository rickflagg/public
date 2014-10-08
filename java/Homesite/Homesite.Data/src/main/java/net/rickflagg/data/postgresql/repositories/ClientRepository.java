package net.rickflagg.data.postgresql.repositories;

import net.rickflagg.data.entities.Client;
import net.rickflagg.data.postgresql.PostgresFunction;
import net.rickflagg.data.postgresql.PostgresRefCursor;
import net.rickflagg.data.repositories.IClientRepository;
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
 * Date: 8/23/14
 * Time: 5:23 PM
 * To change this template use File | Settings | File Templates.
 */
@Repository("clientRepository")
@Transactional
public class ClientRepository implements IClientRepository {

    @Autowired
    private DataSource ds;

    public ClientRepository()
    {

    }

    @Override
    public List<Client> RetrieveAll() throws SQLException, NamingException {

        List<Client> retval = new ArrayList<Client>();

        PostgresFunction function = new PostgresFunction(ds.getConnection(), "{ ? = call fn_clients_all() }");

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
    public void Delete(Client entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(ds.getConnection(),
                "{ call fn_clients_delete(?) }");

        function.setIntegerParameter(1, entity.getId());

        function.execute();

        function.dispose();


    }

    @Override
    public void Save(Client entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{? = call fn_clients_save(?, ?, ?, ?) }"
        );

        function.registerOutputParameter(1, Types.INTEGER);
        function.setIntegerParameter(2, entity.getId());
        function.setStringParameter(3, entity.getName());
        function.setBooleanParameter(4, entity.getActive());
        function.setStringParameter(5, entity.getReferenceUrl());

        function.execute();

        entity.setId((Integer)function.getObject(1));

        function.dispose();


    }

    @Override
    public List<Client> FindByName(String name)throws SQLException, NamingException {

        List<Client> retval = new ArrayList<Client>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_clients_by_name(?) }"
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
    public Client FindById(int id) throws SQLException, NamingException{

        Client entity = null;

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_clients_by_id(?) }"
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

    private Client BindEntity(PostgresRefCursor refCursor) throws SQLException
    {
        Client entity = new Client();

        refCursor.bindBaseEntity(entity);
        entity.setReferenceUrl(refCursor.parseString("reference_url"));

        return entity;
    }

}
