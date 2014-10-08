package net.rickflagg.data.repositories;

import net.rickflagg.data.entities.ContentType;

import javax.naming.NamingException;
import java.sql.SQLException;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 10/1/14
 * Time: 3:47 AM
 * To change this template use File | Settings | File Templates.
 */
public interface IContentTypeRepository {

    public List<ContentType> RetrieveAll() throws SQLException, NamingException;
    public void Delete(ContentType entity) throws SQLException, NamingException;
    public void Save(ContentType entity) throws SQLException, NamingException;
    public List<ContentType> FindByName(String name) throws SQLException, NamingException;
    public ContentType FindById(int id) throws SQLException, NamingException;


}
