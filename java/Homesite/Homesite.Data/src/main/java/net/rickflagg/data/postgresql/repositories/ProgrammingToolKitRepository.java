package net.rickflagg.data.postgresql.repositories;

import net.rickflagg.data.entities.ProgrammingToolKit;
import net.rickflagg.data.entities.Project;
import net.rickflagg.data.postgresql.PostgresFunction;
import net.rickflagg.data.postgresql.PostgresRefCursor;
import net.rickflagg.data.repositories.IProgrammingLanguageRepository;
import net.rickflagg.data.repositories.IProgrammingToolKitRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Types;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
@Repository("programmingToolKitRepository")
public class ProgrammingToolKitRepository implements IProgrammingToolKitRepository {

    @Autowired
    private IProgrammingLanguageRepository programmingLanguageRepository;

    @Autowired
    private DataSource ds;

    public ProgrammingToolKitRepository()
    {

    }

    @Override
    public List<ProgrammingToolKit> retrieveAll() throws SQLException, NamingException {

        List<ProgrammingToolKit> retval = new ArrayList<ProgrammingToolKit>();

        PostgresFunction function = new PostgresFunction(ds.getConnection(), "{ ? = call fn_programming_toolkits_all() }");

        PostgresRefCursor refCursor = function.getRefCursor();

        if(refCursor != null)
        {
            while (refCursor.next())
            {
                ProgrammingToolKit entity = new ProgrammingToolKit();
                retval.add(BindEntity(refCursor));
            }
        }

        refCursor.dispose();
        function.dispose();


        return retval;
    }

    @Override
    public void delete(ProgrammingToolKit entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(ds.getConnection(),
                "{ call fn_programming_toolkits_delete(?) }");

        function.setIntegerParameter(1, entity.getId());

        function.execute();

        function.dispose();

    }

    @Override
    public void save(ProgrammingToolKit entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{? = call fn_programming_toolkits_save(?, ?, ?, ?, ?) }"
        );

        function.registerOutputParameter(1, Types.INTEGER);
        function.setIntegerParameter(2, entity.getId());
        function.setStringParameter(3, entity.getName());
        function.setBooleanParameter(4, entity.getActive());
        function.setStringParameter(5, entity.getReferenceUrl());
        function.setIntegerParameter(6, entity.getProgrammingLanguage().getId());

        function.execute();

        entity.setId((Integer)function.getObject(1));

        function.dispose();


    }

    @Override
    public List<ProgrammingToolKit> findByName(String name)throws SQLException, NamingException {

        List<ProgrammingToolKit> retval = new ArrayList<ProgrammingToolKit>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_programming_toolkits_by_name(?) }"
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
    public ProgrammingToolKit findById(int id) throws SQLException, NamingException{

        ProgrammingToolKit entity = null;

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_programming_toolkits_by_id(?) }"
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
    public List<ProgrammingToolKit> findByProject(Project project) throws SQLException, NamingException {

        List<ProgrammingToolKit> retval = new ArrayList<ProgrammingToolKit>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_programming_toolkits_by_project(?) }"
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

    private ProgrammingToolKit BindEntity(PostgresRefCursor refCursor) throws SQLException,NamingException
    {
        ProgrammingToolKit entity = new ProgrammingToolKit();

        refCursor.bindBaseEntity(entity);
        entity.setReferenceUrl(refCursor.parseString("reference_url"));

        if(refCursor.columnExists("programming_language_id"))
        {
            entity.setProgrammingLanguage(programmingLanguageRepository.findById(refCursor.parseInt("programming_language_id")));
        }

        return entity;
    }

}
