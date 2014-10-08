package net.rickflagg.data.postgresql.repositories;

import net.rickflagg.data.entities.SkillMatrixCategory;
import net.rickflagg.data.postgresql.PostgresFunction;
import net.rickflagg.data.postgresql.PostgresRefCursor;
import net.rickflagg.data.repositories.ISkillMatrixCategoryRepository;
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
@Repository("skillMatrixCategoryRepository")
public class SkillMatrixCategoryRepository  implements ISkillMatrixCategoryRepository {

    @Autowired
    private DataSource ds;

    public SkillMatrixCategoryRepository()
    {

    }

    @Override
    public List<SkillMatrixCategory> retrieveAll() throws SQLException, NamingException {

        List<SkillMatrixCategory> retval = new ArrayList<SkillMatrixCategory>();

        PostgresFunction function = new PostgresFunction(ds.getConnection(), "{ ? = call fn_skill_matrix_categories_all() }");

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
    public void delete(SkillMatrixCategory entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(ds.getConnection(),
                "{ call fn_skill_matrix_categories_delete(?) }");

        function.setIntegerParameter(1, entity.getId());

        function.execute();

        function.dispose();


    }

    @Override
    public void save(SkillMatrixCategory entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{? = call fn_skill_matrix_categories_save(?, ?, ?) }"
        );

        function.registerOutputParameter(1, Types.INTEGER);
        function.setIntegerParameter(2, entity.getId());
        function.setStringParameter(3, entity.getName());
        function.setBooleanParameter(4, entity.getActive());

        function.execute();

        entity.setId((Integer)function.getObject(1));

        function.dispose();


    }

    @Override
    public List<SkillMatrixCategory> findByName(String name)throws SQLException, NamingException {

        List<SkillMatrixCategory> retval = new ArrayList<SkillMatrixCategory>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_skill_matrix_categories_by_name(?) }"
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
    public SkillMatrixCategory findById(int id) throws SQLException, NamingException{

        SkillMatrixCategory entity = null;

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_skill_matrix_categories_by_id(?) }"
        );

        function.setIntegerParameter(2, Integer.valueOf(String.valueOf(id)));

        PostgresRefCursor refCursor = function.getRefCursor();

        if (refCursor != null){
            refCursor.next();
            entity = BindEntity(refCursor);
        }

        refCursor.dispose();
        function.dispose();


        return entity;
    }

    private SkillMatrixCategory BindEntity(PostgresRefCursor refCursor) throws SQLException
    {
        SkillMatrixCategory entity = new SkillMatrixCategory();

        refCursor.bindBaseEntity(entity);

        return entity;
    }



}
