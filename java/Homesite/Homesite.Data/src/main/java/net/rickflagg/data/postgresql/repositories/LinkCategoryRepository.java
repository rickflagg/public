package net.rickflagg.data.postgresql.repositories;

import net.rickflagg.data.entities.LinkCategory;
import net.rickflagg.data.postgresql.PostgresFunction;
import net.rickflagg.data.postgresql.PostgresRefCursor;
import net.rickflagg.data.repositories.ILinkCategoryRepository;
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
@Repository("linkCategoryRepository")
public class LinkCategoryRepository implements ILinkCategoryRepository {

    @Autowired
    private DataSource ds;

    public LinkCategoryRepository()
    {

    }

    @Override
    public List<LinkCategory> retrieveAll() throws SQLException, NamingException {

        List<LinkCategory> retval = new ArrayList<LinkCategory>();

        PostgresFunction function = new PostgresFunction(ds.getConnection(), "{ ? = call fn_link_categories_all() }");

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
    public void delete(LinkCategory entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(ds.getConnection(),
                "{ call fn_link_categories_delete(?) }");

        function.setIntegerParameter(1, entity.getId());

        function.execute();

        function.dispose();


    }

    @Override
    public void save(LinkCategory entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{? = call fn_link_categories_save(?, ?, ?) }"
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
    public List<LinkCategory> findByName(String name)throws SQLException, NamingException {

        List<LinkCategory> retval = new ArrayList<LinkCategory>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_link_categories_by_name(?) }"
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
    public LinkCategory findById(int id) throws SQLException, NamingException{

        LinkCategory entity = null;

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_link_categories_by_id(?) }"
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

    private LinkCategory BindEntity(PostgresRefCursor refCursor) throws SQLException
    {
        LinkCategory entity = new LinkCategory();

        refCursor.bindBaseEntity(entity);

        return entity;
    }



}
