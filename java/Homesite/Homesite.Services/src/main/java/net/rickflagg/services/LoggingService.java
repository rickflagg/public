package net.rickflagg.services;

import net.rickflagg.data.entities.ApplicationLog;
import net.rickflagg.data.repositories.IApplicationLogRepository;
import net.rickflagg.services.context.IServiceContextParameter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.naming.NamingException;
import java.sql.SQLException;
import java.time.LocalDateTime;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
@Service
@Transactional
public class LoggingService {

    @Autowired
    IApplicationLogRepository applicationLogRepository;

    private static final Logger logger = LoggerFactory.getLogger(LoggingService.class);

    public void logMessage(IServiceContextParameter prm,
                           String source, String message){

        ApplicationLog log = createApplicationLogFromContext(prm);

        log.setSuccess(true);
        log.setMessage(message);
        log.setSeverity("Low");
        log.setEventType("System Message");
        log.setSource(source);

        logger.debug(log.toString());

        saveApplicationLog(log);

    }

    public void logSQLException(IServiceContextParameter prm, SQLException sex, String source)
    {
        ApplicationLog log = createApplicationLogFromContext(prm);

        log.setSuccess(false);
        log.setMessage(sex.getMessage());
        log.setSeverity("High");
        log.setEventType("Application SQL Exception");
        log.setSource(source);
        log.setStackTrace(FlattenStackTrace(sex));

        logger.error(log.toString(), sex);

        saveApplicationLog(log);

    }

    public void logNamingException(IServiceContextParameter prm, NamingException nex, String source)
    {
        ApplicationLog log = createApplicationLogFromContext(prm);

        log.setSuccess(false);
        log.setMessage(nex.getMessage());
        log.setSeverity("High");
        log.setEventType("Application Naming Exception");
        log.setSource(source);
        log.setStackTrace(FlattenStackTrace(nex));

        logger.error(log.toString(), nex);

        saveApplicationLog(log);
    }

    public void logGeneralException(IServiceContextParameter prm, Exception ex, String source)
    {
        ApplicationLog log = createApplicationLogFromContext(prm);

        log.setSuccess(false);
        log.setMessage(ex.getMessage());
        log.setSeverity("High");
        log.setEventType("Application Exception");
        log.setSource(source);
        log.setStackTrace(FlattenStackTrace(ex));

        logger.error(log.toString(), ex);

        try{
            applicationLogRepository.Save(log);
        }
        catch (SQLException esex){
            logger.error(String.format("A sql exception occurred while trying to save log: %s", log.toString()),
                    esex);
        }
        catch (NamingException enex){
            logger.error(String.format("A naming exception occurred while trying to save log: %s", log.toString()),
                    enex);

        }
    }

    private ApplicationLog createApplicationLogFromContext(IServiceContextParameter prm) {

        ApplicationLog log = new ApplicationLog();

        log.setAuthenticationToken(prm.getAuthenticationTokenName());
        log.setEventDate(LocalDateTime.now());
        log.setPath(prm.getPath());
        log.setActive(true);
        log.setRemoteAddress(log.getRemoteAddress());
        log.setReferrer(log.getReferrer());
        log.setQueryString(log.getQueryString());
        log.setBrowser(log.getBrowser());
        log.setHost(prm.getHostName());

        return log;

    }

    private String FlattenStackTrace(Exception ex) {
        String result = ex.toString() + "\n";
        StackTraceElement[] trace = ex.getStackTrace();
        for (int i=0;i<trace.length;i++) {
            result += trace[i].toString() + "\n";
        }
        return result;
    }

    private void saveApplicationLog(ApplicationLog log){

        try{
            applicationLogRepository.Save(log);
        }
        catch (SQLException esex){
            logger.error(String.format("A sql exception occurred while trying to save log: %s", log.toString()),
                    esex);
        }
        catch (NamingException enex){
            logger.error(String.format("A naming exception occurred while trying to save log: %s", log.toString()),
                    enex);

        }
    }


}
