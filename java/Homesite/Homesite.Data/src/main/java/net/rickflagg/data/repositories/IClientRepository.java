package net.rickflagg.data.repositories;

import net.rickflagg.data.entities.Client;

import javax.naming.NamingException;
import java.sql.SQLException;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 8/23/14
 * Time: 5:21 PM
 * To change this template use File | Settings | File Templates.
 */
public interface IClientRepository {

    public List<Client> RetrieveAll() throws SQLException, NamingException;
    public void Delete(Client entity) throws SQLException, NamingException;
    public void Save(Client entity) throws SQLException, NamingException;
    public List<Client> FindByName(String name) throws SQLException, NamingException;
    public Client FindById(int id) throws SQLException, NamingException;

}
