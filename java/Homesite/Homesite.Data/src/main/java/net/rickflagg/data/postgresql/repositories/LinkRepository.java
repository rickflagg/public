package net.rickflagg.data.postgresql.repositories;

import net.rickflagg.data.entities.Link;
import net.rickflagg.data.entities.LinkCategory;
import net.rickflagg.data.postgresql.PostgresFunction;
import net.rickflagg.data.postgresql.PostgresRefCursor;
import net.rickflagg.data.repositories.ILinkCategoryRepository;
import net.rickflagg.data.repositories.ILinkRepository;
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
@Repository("linkRepository")
public class LinkRepository implements ILinkRepository {

    @Autowired
    private DataSource ds;

    @Autowired
    private ILinkCategoryRepository linkCategoryRepository;

    public LinkRepository()
    {

    }

    @Override
    public List<Link> retrieveAll() throws SQLException, NamingException {

        List<Link> retval = new ArrayList<Link>();

        PostgresFunction function = new PostgresFunction(ds.getConnection(), "{ ? = call fn_links_all() }");

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
    public void delete(Link entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(ds.getConnection(),
                "{ call fn_links_delete(?) }");

        function.setIntegerParameter(1, entity.getId());

        function.execute();

        function.dispose();


    }

    @Override
    public void save(Link entity)throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{? = call fn_links_save(?, ?, ?, ?, ?, ?) }"
        );

        function.registerOutputParameter(1, Types.INTEGER);
        function.setIntegerParameter(2, entity.getId());
        function.setStringParameter(3, entity.getName());
        function.setBooleanParameter(4, entity.getActive());
        function.setStringParameter(5, entity.getDescription());
        function.setStringParameter(6, entity.getUrl());
        function.setIntegerParameter(7, entity.getLinkCategory().getId());

        function.execute();

        entity.setId((Integer)function.getObject(1));

        function.dispose();


    }

    @Override
    public List<Link> findByName(String name)throws SQLException, NamingException {

        List<Link> retval = new ArrayList<Link>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_links_by_name(?) }"
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
    public Link findById(int id) throws SQLException, NamingException{

        Link entity = null;

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_links_by_id(?) }"
        );

        function.setIntegerParameter(2, id);

        PostgresRefCursor refCursor = function.getRefCursor();

        if (refCursor != null){
            refCursor.next();
            entity = BindEntity(refCursor);
        }

        return entity;
    }

    @Override
    public List<Link> findByCategory(LinkCategory linkCategory) throws SQLException, NamingException {

        List<Link> retval = new ArrayList<Link>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_links_by_category(?) }"
        );

        function.setIntegerParameter(2, linkCategory.getId());

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

    private Link BindEntity(PostgresRefCursor refCursor) throws SQLException, NamingException
    {
        Link entity = new Link();

        refCursor.bindBaseEntity(entity);
        entity.setDescription(refCursor.parseString("description"));
        entity.setUrl(refCursor.parseString("url"));
        entity.setLinkCategory(linkCategoryRepository.findById(refCursor.parseInteger("link_category_id")));

        return entity;
    }



}
