package net.rickflagg.data.postgresql.repositories;

import net.rickflagg.data.entities.SkillMatrix;
import net.rickflagg.data.entities.SkillMatrixCategory;
import net.rickflagg.data.postgresql.PostgresFunction;
import net.rickflagg.data.postgresql.PostgresRefCursor;
import net.rickflagg.data.repositories.ISkillMatrixCategoryRepository;
import net.rickflagg.data.repositories.ISkillMatrixRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
@Repository("skillMatrixRepository")
public class SkillMatrixRepository implements ISkillMatrixRepository {

    @Autowired
    private DataSource ds;

    @Autowired
    private ISkillMatrixCategoryRepository skillMatrixCategoryRepository;

    public SkillMatrixRepository()
    {

    }

    @Override
    public List<SkillMatrix> retrieveAll() throws SQLException, NamingException {

        List<SkillMatrix> retval = new ArrayList<SkillMatrix>();

        PostgresFunction function = new PostgresFunction(ds.getConnection(), "{ ? = call fn_skill_matrix_all() }");

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
    public void delete(SkillMatrix entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(ds.getConnection(),
                "{ call fn_skill_matrix_delete(?) }");

        function.setIntegerParameter(1, entity.getId());

        function.execute();

        function.dispose();

    }

    @Override
    public void save(SkillMatrix entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{? = call fn_skill_matrix_save(?, ?, ?, ?, ?) }"
        );

        function.registerOutputParameter(1, Types.INTEGER);
        function.setIntegerParameter(2, entity.getId());
        function.setStringParameter(3, entity.getName());
        function.setBooleanParameter(4, entity.getActive());
        function.setDoubleParameter(5, entity.getRating());

        if(entity.getSkillMatrixCategory() != null){
            function.setIntegerParameter(6, entity.getSkillMatrixCategory().getId() );
        }else{
            function.setIntegerParameter(6, null);
        }

        function.execute();

        entity.setId((Integer)function.getObject(1));

        function.dispose();


    }

    @Override
    public List<SkillMatrix> findByName(String name)throws SQLException, NamingException {

        List<SkillMatrix> retval = new ArrayList<SkillMatrix>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_skill_matrix_by_name(?) }"
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
    public SkillMatrix findById(int id) throws SQLException, NamingException{

        SkillMatrix entity = null;

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_skill_matrix_by_id(?) }"
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

    @Override
    public List<SkillMatrix> findByCategory(SkillMatrixCategory skillMatrixCategory)throws SQLException, NamingException{

        List<SkillMatrix> retval = new ArrayList<SkillMatrix>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_skill_matrix_by_category(?) }"
        );

        function.setIntegerParameter(2, skillMatrixCategory.getId());

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

    private SkillMatrix BindEntity(PostgresRefCursor refCursor) throws SQLException, NamingException
    {
        SkillMatrix entity = new SkillMatrix();

        refCursor.bindBaseEntity(entity);
        entity.setRating(refCursor.parseDouble("rating"));
        entity.setSkillMatrixCategory(skillMatrixCategoryRepository.findById(refCursor.parseInt("skill_matrix_category_id")));

        return entity;
    }



}
