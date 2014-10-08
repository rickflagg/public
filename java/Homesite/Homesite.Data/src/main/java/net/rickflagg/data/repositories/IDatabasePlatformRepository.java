package net.rickflagg.data.repositories;

import net.rickflagg.data.entities.DatabasePlatform;

import javax.naming.NamingException;
import java.sql.SQLException;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 8/3/14
 * Time: 9:48 AM
 * To change this template use File | Settings | File Templates.
 */

public interface IDatabasePlatformRepository {

    public List<DatabasePlatform> RetrieveAll() throws SQLException, NamingException;
    public void Delete(DatabasePlatform entity) throws SQLException, NamingException;
    public void Save(DatabasePlatform entity) throws SQLException, NamingException;
    public List<DatabasePlatform> FindByName(String name) throws SQLException, NamingException;
    public DatabasePlatform FindById(int id) throws SQLException, NamingException;

}
