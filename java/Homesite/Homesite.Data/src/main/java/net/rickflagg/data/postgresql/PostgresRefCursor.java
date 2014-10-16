package net.rickflagg.data.postgresql;

import net.rickflagg.data.entities.IEntity;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
public class PostgresRefCursor {

    private ResultSet rs;

    public PostgresRefCursor(ResultSet resultSet)
    {
       rs = resultSet;
    }

    public boolean next() throws SQLException
    {
        boolean retval = false;

        if(rs != null){
            retval = rs.next();
        }

        return retval;
    }

    public void bindBaseEntity(IEntity entity) throws SQLException {

        entity.setId(parseInt("id"));
        entity.setName(parseString("name"));
        entity.setActive(parseBoolean("active"));
        entity.setCreatedDate(parseDateTime("date_created"));
        entity.setModifiedDate(parseDateTime("date_modified"));

    }

    public boolean columnExists(String column) {
        boolean retval = false;

        try
        {
            Object eval = rs.getObject(column);
            retval = true;
        }
        catch(SQLException ex){}

        return retval;

    }

    public LocalDateTime parseDateTime(String column) throws SQLException {

        LocalDateTime retval = null;

        if(columnExists(column) && rs.getTimestamp(column) != null)
        {
            retval = rs.getTimestamp(column).toLocalDateTime();
        }

        return retval;

    }


    public String parseString(String column) throws SQLException {

        String retval = null;

        if(columnExists(column))
        {
            retval = rs.getString(column);
        }

        return retval;
    }

    public Long parseLong(String column) throws SQLException {
        Long retval = null;

        if(columnExists(column))
        {
            if(rs.getLong("id") != 0)
            {
                retval = rs.getLong("id");
            }
        }

        return retval;
    }

    public Boolean parseBoolean(String column) throws SQLException {
        Boolean retval = false;

        if(columnExists(column))
        {
            if(rs.getObject(column) != null)
            {
                retval = rs.getBoolean(column);
            }
        }

        return retval;
    }

    public int parseInt(String column) throws SQLException {
        int retval = -1;

        if(columnExists(column))
        {
            if(rs.getObject(column) != null)
            {
                retval = rs.getInt(column);
            }
        }

        return retval;
    }

    public Integer parseInteger(String column) throws SQLException {

        Integer retval = null;

        if(columnExists(column))
        {
            if(rs.getObject(column) != null)
            {
                retval = rs.getInt(column);
            }
        }

        return retval;

    }

    public Double parseDouble(String column) throws SQLException{

        Double retval = null;

        if(columnExists(column))
        {
            if(rs.getObject(column) != null)
            {
                retval = rs.getDouble(column);
            }
        }

        return retval;
    }

    public void dispose() throws SQLException{
        if(rs != null){
            rs.close();
        }
    }

}
