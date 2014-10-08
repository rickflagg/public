package net.rickflagg.data.postgresql.repositories;

import net.rickflagg.data.entities.ContentType;
import net.rickflagg.data.entities.GlobalContent;
import net.rickflagg.data.postgresql.PostgresFunction;
import net.rickflagg.data.postgresql.PostgresRefCursor;
import net.rickflagg.data.repositories.IContentTypeRepository;
import net.rickflagg.data.repositories.IGlobalContentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
 * Time: 4:33 AM
 * To change this template use File | Settings | File Templates.
 */
@Repository("globalContentRepository")
public class GlobalContentRepository implements IGlobalContentRepository {

    @Autowired
    private DataSource ds;

    @Autowired
    @Qualifier("contentTypeRepository")
    private IContentTypeRepository contentTypeRepository;

    @Override
    public List<GlobalContent> RetrieveAll() throws SQLException, NamingException {
        List<GlobalContent> retval = new ArrayList<GlobalContent>();

        PostgresFunction function = new PostgresFunction(ds.getConnection(), "{ ? = call fn_global_content_all() }");

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
    public void Delete(GlobalContent entity) throws SQLException, NamingException {
        PostgresFunction function = new PostgresFunction(ds.getConnection(),
                "{ call fn_global_content_delete(?) }");

        function.setIntegerParameter(1, entity.getId());

        function.execute();

        function.dispose();

    }

    @Override
    public void Save(GlobalContent entity) throws SQLException, NamingException {
        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{? = call fn_global_content_save(?, ?, ?, ?, ?) }"
        );

        function.registerOutputParameter(1, Types.INTEGER);
        function.setIntegerParameter(2, entity.getId());
        function.setStringParameter(3, entity.getName());
        function.setBooleanParameter(4, entity.getActive());
        function.setIntegerParameter(5, entity.getContentType().getId());
        function.setStringParameter(6, entity.ContentText());


        function.execute();

        entity.setId((Integer)function.getObject(1));

        function.dispose();


    }

    @Override
    public List<GlobalContent> FindByName(String name) throws SQLException, NamingException {

        List<GlobalContent> retval = new ArrayList<GlobalContent>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_global_content_by_name(?) }"
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
    public GlobalContent FindById(int id) throws SQLException, NamingException {
        GlobalContent entity = null;

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_global_content_by_id(?) }"
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
    public GlobalContent FindByType(ContentType contentType) throws SQLException, NamingException {

        GlobalContent entity = null;

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_global_content_by_type(?) }"
        );

        function.setIntegerParameter(2,contentType.getId());

        PostgresRefCursor refCursor = function.getRefCursor();

        if (refCursor != null){
            refCursor.next();
            entity = BindEntity(refCursor);
        }

        refCursor.dispose();
        function.dispose();


        return entity;

    }

    private GlobalContent BindEntity(PostgresRefCursor refCursor) throws SQLException, NamingException
    {
        GlobalContent entity = new GlobalContent();

        refCursor.bindBaseEntity(entity);

        entity.setContentType(contentTypeRepository.FindById(refCursor.parseInt("content_type_id")));
        entity.setText(refCursor.parseString("content_text"));

        return entity;
    }


}
