package net.rickflagg.data.postgresql.repositories;

import net.rickflagg.data.entities.ContentType;
import net.rickflagg.data.postgresql.PostgresFunction;
import net.rickflagg.data.postgresql.PostgresRefCursor;
import net.rickflagg.data.repositories.IContentTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 10/1/14
 * Time: 4:05 AM
 * To change this template use File | Settings | File Templates.
 */
@Repository("contentTypeRepository")
public class ContentTypeRepository implements IContentTypeRepository{

    @Autowired
    private DataSource ds;

    @Override
    public List<ContentType> RetrieveAll() throws SQLException, NamingException {

        List<ContentType> retval = new ArrayList<ContentType>();

        PostgresFunction function = new PostgresFunction(ds.getConnection(), "{ ? = call fn_content_types_all() }");

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
    public void Delete(ContentType entity) throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(ds.getConnection(),
                "{ call fn_content_types_delete(?) }");

        function.setIntegerParameter(1, entity.getId());

        function.execute();

        function.dispose();

    }

    @Override
    public void Save(ContentType entity) throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{? = call fn_content_types_save(?, ?, ?) }"
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
    public List<ContentType> FindByName(String name) throws SQLException, NamingException {

        List<ContentType> retval = new ArrayList<ContentType>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_content_types_by_name(?) }"
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
    public ContentType FindById(int id) throws SQLException, NamingException {
        ContentType entity = null;

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_content_types_by_id(?) }"
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

    private ContentType BindEntity(PostgresRefCursor refCursor) throws SQLException
    {
        ContentType entity = new ContentType();

        refCursor.bindBaseEntity(entity);

        return entity;
    }

}
