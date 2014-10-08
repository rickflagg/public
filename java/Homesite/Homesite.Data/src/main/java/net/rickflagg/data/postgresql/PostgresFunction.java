package net.rickflagg.data.postgresql;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.temporal.ChronoField;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
public class PostgresFunction {

    private Connection cn;
    private String functionSignature;
    CallableStatement func;

    public PostgresFunction(Connection connection, String signature) throws SQLException
    {
       this.cn = connection;
       this.functionSignature = signature;
       this.initialize();
    }

    private void initialize() throws SQLException
    {
        func = cn.prepareCall(functionSignature);
    }

    public PostgresRefCursor getRefCursor() throws SQLException
    {
        PostgresRefCursor rs;

        cn.setAutoCommit(false);

        func.registerOutParameter(1, Types.OTHER);

        func.execute();

        rs = new PostgresRefCursor((ResultSet)func.getObject(1));


        return rs;
    }

    public void execute() throws SQLException
    {
        func.execute();
    }

    public void setStringParameter(int index, String value) throws SQLException
    {
        if(value != null)
        {
            func.setString(index,value);
        }else{
            func.setNull(index, Types.VARCHAR);
        }
    }

    public void setBooleanParameter(int index, Boolean value) throws SQLException
    {
        if(value != null){
            func.setBoolean(index, value);
        }
        else {
            func.setNull(index, Types.BOOLEAN);
        }
    }


    public void setTimestampParameter(int index, LocalDateTime value) throws SQLException
    {
       if(value != null){
           //func.setTimestamp(index, new Timestamp(value.get(ChronoField.MILLI_OF_SECOND)));
           func.setTimestamp(index, Timestamp.valueOf(value));
       }
       else{
           func.setNull(index, Types.TIMESTAMP);
       }
    }

    public void setIntegerParameter(int index, Integer value) throws SQLException
    {
        if(value != null){
            func.setInt(index, value);
        }
        else
        {
            func.setNull(index, Types.INTEGER);
        }
    }

    public void setDoubleParameter(int index, Double value) throws SQLException
    {
        if(value != null){
            func.setDouble(index, value);
        }
        else {
            func.setNull(index, Types.NUMERIC);
        }

    }

    public Object getObject(int index) throws SQLException
    {
        return func.getObject(index);
    }

    public void registerOutputParameter(int index, int type) throws SQLException
    {
        func.registerOutParameter(index, type);
    }

    public void dispose() throws SQLException{

        if(this.cn != null && !this.cn.isClosed()){
            this.cn.close();
        }

    }


}
