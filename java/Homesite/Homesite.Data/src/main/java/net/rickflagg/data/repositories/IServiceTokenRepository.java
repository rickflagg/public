package net.rickflagg.data.repositories;

import net.rickflagg.data.entities.ServiceToken;

import javax.naming.NamingException;
import java.sql.SQLException;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
public interface IServiceTokenRepository {

    ServiceToken findServiceToken(String key1,String key2,String key3,String key4 ) throws SQLException, NamingException;

}
