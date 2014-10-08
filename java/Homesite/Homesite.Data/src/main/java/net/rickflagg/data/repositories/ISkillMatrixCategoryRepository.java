package net.rickflagg.data.repositories;

import net.rickflagg.data.entities.SkillMatrixCategory;

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
public interface ISkillMatrixCategoryRepository {

    public List<SkillMatrixCategory> retrieveAll() throws SQLException, NamingException;
    public void delete(SkillMatrixCategory entity) throws SQLException, NamingException;
    public void save(SkillMatrixCategory entity) throws SQLException, NamingException;
    public List<SkillMatrixCategory> findByName(String name) throws SQLException, NamingException;
    public SkillMatrixCategory findById(int id) throws SQLException, NamingException;

}
