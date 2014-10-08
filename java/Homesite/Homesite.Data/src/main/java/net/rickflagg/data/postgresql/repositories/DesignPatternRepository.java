package net.rickflagg.data.postgresql.repositories;

import net.rickflagg.data.entities.DesignPattern;
import net.rickflagg.data.entities.Project;
import net.rickflagg.data.postgresql.PostgresFunction;
import net.rickflagg.data.postgresql.PostgresRefCursor;
import net.rickflagg.data.repositories.IDesignPatternRepository;
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
 * Date: 8/24/14
 * Time: 8:27 AM
 * To change this template use File | Settings | File Templates.
 */
@Repository("designPatternRepository")
@Transactional
public class DesignPatternRepository implements IDesignPatternRepository {

    @Autowired
    private DataSource ds;

    public DesignPatternRepository()
    {

    }

    @Override
    public List<DesignPattern> RetrieveAll() throws SQLException, NamingException {

        List<DesignPattern> retval = new ArrayList<DesignPattern>();

        PostgresFunction function = new PostgresFunction(ds.getConnection(), "{ ? = call fn_design_patterns_all() }");

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
    public void Delete(DesignPattern entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(ds.getConnection(),
                "{ call fn_design_patterns_delete(?) }");

        function.setIntegerParameter(1, entity.getId());

        function.execute();

        function.dispose();

    }

    @Override
    public void Save(DesignPattern entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{? = call fn_design_patterns_save(?, ?, ?, ?) }"
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
    public List<DesignPattern> FindByName(String name)throws SQLException, NamingException {

        List<DesignPattern> retval = new ArrayList<DesignPattern>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_design_patterns_by_name(?) }"
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
    public DesignPattern FindById(int id) throws SQLException, NamingException{

        DesignPattern entity = null;

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_design_patterns_by_id(?) }"
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

    @Override
    public List<DesignPattern> FindByProject(Project project) throws SQLException, NamingException {

        List<DesignPattern> retval = new ArrayList<DesignPattern>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_design_patterns_by_project(?) }"
        );

        function.setIntegerParameter(2,project.getId());

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

    private DesignPattern BindEntity(PostgresRefCursor refCursor) throws SQLException
    {
        DesignPattern entity = new DesignPattern();

        refCursor.bindBaseEntity(entity);
        entity.setReferenceUrl(refCursor.parseString("reference_url"));

        return entity;
    }


}
