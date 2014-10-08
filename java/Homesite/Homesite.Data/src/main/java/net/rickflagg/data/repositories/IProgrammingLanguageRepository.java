package net.rickflagg.data.repositories;

import net.rickflagg.data.entities.ProgrammingLanguage;
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
public interface IProgrammingLanguageRepository {


    public List<ProgrammingLanguage> retrieveAll() throws SQLException, NamingException;
    public void delete(ProgrammingLanguage entity) throws SQLException, NamingException;
    public void save(ProgrammingLanguage entity) throws SQLException, NamingException;
    public List<ProgrammingLanguage> findByName(String name) throws SQLException, NamingException;
    public ProgrammingLanguage findById(int id) throws SQLException, NamingException;
    public List<ProgrammingLanguage> findByProject(Project project) throws SQLException, NamingException;

}
