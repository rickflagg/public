package net.rickflagg.data.repositories;

import net.rickflagg.data.entities.Project;

import javax.naming.NamingException;
import java.sql.SQLException;
import java.util.List;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
public interface IProjectRepository {

    public List<Project> retrieveAll() throws SQLException, NamingException;
    public void delete(Project entity) throws SQLException, NamingException;
    public void save(Project entity) throws SQLException, NamingException;
    public List<Project> findByName(String name) throws SQLException, NamingException;
    public Project findById(int id) throws SQLException, NamingException;


}
