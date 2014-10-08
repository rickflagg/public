package net.rickflagg.services;

import net.rickflagg.data.repositories.IProjectRepository;
import net.rickflagg.services.context.IServiceContextParameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import net.rickflagg.services.results.ProjectResult;

import javax.naming.NamingException;
import java.sql.SQLException;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
@Service
@Transactional
public class ProjectService {

    @Autowired
    private LoggingService loggingService;

    @Autowired
    private IProjectRepository projectRepository;

    public ProjectResult getAll(IServiceContextParameter prm){

        ProjectResult result = new ProjectResult();

        try
        {
            loggingService.logMessage(prm, this.getClass().getName(),
                    "Pulling project list");

            result.setProjects(projectRepository.retrieveAll());

            result.setSuccessful(true);
            result.setError(false);

            loggingService.logMessage(prm, this.getClass().getName(),
                    String.format("Pulled %d record(s)", result.getProjects().size()));


        }
        catch (SQLException sex){
            loggingService.logSQLException(prm,sex, this.getClass().getName());
            result.setSuccessful(false);
            result.setError(true);
            result.setErrorMessage(sex.getMessage());
        }
        catch (NamingException nex){
            loggingService.logNamingException(prm, nex, this.getClass().getName());
            result.setSuccessful(false);
            result.setError(true);
            result.setErrorMessage(nex.getMessage());

        }
        catch (Exception ex){
            loggingService.logGeneralException(prm, ex, this.getClass().getName());

            result.setSuccessful(false);
            result.setError(true);
            result.setErrorMessage(ex.getMessage());
        }

        return result;

    }

}
