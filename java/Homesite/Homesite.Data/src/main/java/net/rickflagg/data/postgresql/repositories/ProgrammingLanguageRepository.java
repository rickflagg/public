package net.rickflagg.data.postgresql.repositories;

import net.rickflagg.data.entities.Project;
import net.rickflagg.data.postgresql.PostgresFunction;
import net.rickflagg.data.postgresql.PostgresRefCursor;
import net.rickflagg.data.repositories.IProgrammingLanguageRepository;

import net.rickflagg.data.entities.ProgrammingLanguage;
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
@Repository("programmingLanguageRepository")
public class ProgrammingLanguageRepository implements IProgrammingLanguageRepository {

    @Autowired
    DataSource ds;

    public ProgrammingLanguageRepository()
    {

    }

    @Override
    public List<ProgrammingLanguage> retrieveAll() throws SQLException, NamingException {

        List<ProgrammingLanguage> retval = new ArrayList<ProgrammingLanguage>();

        PostgresFunction function = new PostgresFunction(ds.getConnection(), "{ ? = call fn_programming_languages_all() }");

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
    public void delete(ProgrammingLanguage entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(ds.getConnection(),
                "{ call fn_programming_languages_delete(?) }");

        function.setIntegerParameter(1, entity.getId());

        function.execute();

        function.dispose();


    }

    @Override
    public void save(ProgrammingLanguage entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{? = call fn_programming_languages_save(?, ?, ?, ?) }"
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
    public List<ProgrammingLanguage> findByName(String name)throws SQLException, NamingException {

        List<ProgrammingLanguage> retval = new ArrayList<ProgrammingLanguage>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_programming_languages_by_name(?) }"
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
    public ProgrammingLanguage findById(int id) throws SQLException, NamingException{

        ProgrammingLanguage entity = null;

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_programming_languages_by_id(?) }"
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
    public List<ProgrammingLanguage> findByProject(Project project) throws SQLException, NamingException {

        List<ProgrammingLanguage> retval = new ArrayList<ProgrammingLanguage>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_programming_languages_by_project(?) }"
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

    private ProgrammingLanguage BindEntity(PostgresRefCursor refCursor) throws SQLException
    {
        ProgrammingLanguage entity = new ProgrammingLanguage();

        refCursor.bindBaseEntity(entity);
        entity.setReferenceUrl(refCursor.parseString("reference_url"));

        return entity;
    }



}
