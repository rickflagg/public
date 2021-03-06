package net.rickflagg.data.repositories;

import net.rickflagg.data.entities.SkillMatrix;
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
public interface ISkillMatrixRepository {

    public List<SkillMatrix> retrieveAll() throws SQLException, NamingException;
    public void delete(SkillMatrix entity) throws SQLException, NamingException;
    public void save(SkillMatrix entity) throws SQLException, NamingException;
    public List<SkillMatrix> findByName(String name) throws SQLException, NamingException;
    public SkillMatrix findById(int id) throws SQLException, NamingException;
    public List<SkillMatrix> findByCategory(SkillMatrixCategory skillMatrixCategory) throws SQLException, NamingException;

}
