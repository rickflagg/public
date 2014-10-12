package net.rickflagg.data.repositories;

import net.rickflagg.data.entities.LinkCategory;

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
public interface ILinkCategoryRepository {


    public List<LinkCategory> retrieveAll() throws SQLException, NamingException;
    public void delete(LinkCategory entity) throws SQLException, NamingException;
    public void save(LinkCategory entity) throws SQLException, NamingException;
    public List<LinkCategory> findByName(String name) throws SQLException, NamingException;
    public LinkCategory findById(int id) throws SQLException, NamingException;
    public List<LinkCategory> retrieveByLinkCount() throws SQLException, NamingException;

}
