package net.rickflagg.data.repositories;

import net.rickflagg.data.entities.ProgrammingToolKit;
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
public interface IProgrammingToolKitRepository {

    public List<ProgrammingToolKit> retrieveAll() throws SQLException, NamingException;
    public void delete(ProgrammingToolKit entity) throws SQLException, NamingException;
    public void save(ProgrammingToolKit entity) throws SQLException, NamingException;
    public List<ProgrammingToolKit> findByName(String name) throws SQLException, NamingException;
    public ProgrammingToolKit findById(int id) throws SQLException, NamingException;
    public List<ProgrammingToolKit> findByProject(Project project) throws SQLException, NamingException;

}
