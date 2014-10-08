package net.rickflagg.data.repositories;

import net.rickflagg.data.entities.ContentType;
import net.rickflagg.data.entities.GlobalContent;

import javax.naming.NamingException;
import java.sql.SQLException;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 10/1/14
 * Time: 3:48 AM
 * To change this template use File | Settings | File Templates.
 */
public interface IGlobalContentRepository {

    public List<GlobalContent> RetrieveAll() throws SQLException, NamingException;
    public void Delete(GlobalContent entity) throws SQLException, NamingException;
    public void Save(GlobalContent entity) throws SQLException, NamingException;
    public List<GlobalContent> FindByName(String name) throws SQLException, NamingException;
    public GlobalContent FindById(int id) throws SQLException, NamingException;
    public GlobalContent FindByType(ContentType contentType) throws SQLException, NamingException;

}
