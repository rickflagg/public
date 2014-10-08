package net.rickflagg.data.repositories;

import net.rickflagg.data.entities.DesignPattern;
import net.rickflagg.data.entities.Project;

import javax.naming.NamingException;
import java.sql.SQLException;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 8/24/14
 * Time: 8:26 AM
 * To change this template use File | Settings | File Templates.
 */
public interface IDesignPatternRepository {

    public List<DesignPattern> RetrieveAll() throws SQLException, NamingException;
    public void Delete(DesignPattern entity) throws SQLException, NamingException;
    public void Save(DesignPattern entity) throws SQLException, NamingException;
    public List<DesignPattern> FindByName(String name) throws SQLException, NamingException;
    public DesignPattern FindById(int id) throws SQLException, NamingException;
    public List<DesignPattern> FindByProject (Project project) throws SQLException, NamingException;

}
