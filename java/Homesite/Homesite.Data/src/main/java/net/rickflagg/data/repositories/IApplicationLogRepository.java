package net.rickflagg.data.repositories;

import net.rickflagg.data.entities.ApplicationLog;
import net.rickflagg.data.filters.ApplicationLogFilter;

import javax.naming.NamingException;
import java.sql.SQLException;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 9/6/14
 * Time: 5:49 AM
 * To change this template use File | Settings | File Templates.
 */
public interface IApplicationLogRepository {

    public void Save(ApplicationLog entity) throws SQLException, NamingException;
    public List<ApplicationLog> Search(ApplicationLogFilter filter) throws SQLException, NamingException;
    public List<ApplicationLog> Tail() throws SQLException, NamingException;



}
