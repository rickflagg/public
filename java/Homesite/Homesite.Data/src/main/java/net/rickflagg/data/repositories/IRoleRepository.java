package net.rickflagg.data.repositories;

import net.rickflagg.data.entities.Role;
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
public interface IRoleRepository {

    public List<Role> retrieveAll() throws SQLException, NamingException;
    public void delete(Role entity) throws SQLException, NamingException;
    public void save(Role entity) throws SQLException, NamingException;
    public List<Role> findByName(String name) throws SQLException, NamingException;
    public Role findById(int id) throws SQLException, NamingException;
    public List<Role> findByProject(Project project) throws SQLException, NamingException;

}
