package net.rickflagg.data.repositories;

import net.rickflagg.data.entities.SoftwareLifecycle;

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
public interface ISoftwareLifecycleRepository {

        public List<SoftwareLifecycle> retrieveAll() throws SQLException, NamingException;
        public void delete(SoftwareLifecycle entity) throws SQLException, NamingException;
        public void save(SoftwareLifecycle entity) throws SQLException, NamingException;
        public List<SoftwareLifecycle> findByName(String name) throws SQLException, NamingException;
        public SoftwareLifecycle findById(int id) throws SQLException, NamingException;

}
