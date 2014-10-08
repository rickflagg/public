package net.rickflagg.data.postgresql.repositories;

import net.rickflagg.data.entities.SoftwareLifecycle;
import net.rickflagg.data.postgresql.PostgresFunction;
import net.rickflagg.data.postgresql.PostgresRefCursor;
import net.rickflagg.data.repositories.ISoftwareLifecycleRepository;
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
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
@Repository("softwareLifecycleRepository")
public class SoftwareLifecycleRepository  implements ISoftwareLifecycleRepository {

    @Autowired
    DataSource ds;

    public SoftwareLifecycleRepository()
    {

    }

    @Override
    public List<SoftwareLifecycle> retrieveAll() throws SQLException, NamingException {

        List<SoftwareLifecycle> retval = new ArrayList<SoftwareLifecycle>();

        PostgresFunction function = new PostgresFunction(ds.getConnection(), "{ ? = call fn_software_lifecycles_all() }");

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
    public void delete(SoftwareLifecycle entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(ds.getConnection(),
                "{ call fn_software_lifecycles_delete(?) }");

        function.setIntegerParameter(1, entity.getId());

        function.execute();

        function.dispose();


    }

    @Override
    public void save(SoftwareLifecycle entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{? = call fn_software_lifecycles_save(?, ?, ?, ?) }"
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
    public List<SoftwareLifecycle> findByName(String name)throws SQLException, NamingException {

        List<SoftwareLifecycle> retval = new ArrayList<SoftwareLifecycle>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_software_lifecycles_by_name(?) }"
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
    public SoftwareLifecycle findById(int id) throws SQLException, NamingException{

        SoftwareLifecycle entity = null;

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_software_lifecycles_by_id(?) }"
        );

        function.setIntegerParameter(2, id);

        PostgresRefCursor refCursor = function.getRefCursor();

        if (refCursor != null){
            refCursor.next();

            entity = BindEntity(refCursor);

        }

        refCursor.dispose();
        function.dispose();


        return entity;
    }

    private SoftwareLifecycle BindEntity(PostgresRefCursor refCursor) throws SQLException
    {
        SoftwareLifecycle entity = new SoftwareLifecycle();

        refCursor.bindBaseEntity(entity);
        entity.setReferenceUrl(refCursor.parseString("reference_url"));

        return entity;
    }

}
