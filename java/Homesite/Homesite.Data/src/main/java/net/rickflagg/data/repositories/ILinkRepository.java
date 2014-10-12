package net.rickflagg.data.repositories;

import net.rickflagg.data.entities.Link;
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
public interface ILinkRepository {

    public List<Link> retrieveAll() throws SQLException, NamingException;
    public void delete(Link entity) throws SQLException, NamingException;
    public void save(Link entity) throws SQLException, NamingException;
    public List<Link> findByName(String name) throws SQLException, NamingException;
    public Link findById(int id) throws SQLException, NamingException;
    public List<Link> findByCategory(LinkCategory linkCategory) throws SQLException, NamingException;

}
