package net.rickflagg.services;

import net.rickflagg.data.entities.GlobalContent;
import net.rickflagg.data.repositories.IContentTypeRepository;
import net.rickflagg.data.repositories.IGlobalContentRepository;
import net.rickflagg.services.context.IServiceContextParameter;
import net.rickflagg.services.results.GlobalContentResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
@Service
@Transactional
public class GlobalContentService {

    @Autowired
    IGlobalContentRepository globalContentRepository;

    @Autowired
    IContentTypeRepository contentTypeRepository;

    @Autowired
    private LoggingService loggingService;


    public GlobalContentResult getGlobalContent(IServiceContextParameter prm){

       GlobalContentResult result = new GlobalContentResult();

        try
        {
            List<GlobalContent> globalContentList = globalContentRepository.FindByName("Intro");

            if(globalContentList != null && globalContentList.size() > 0){
                result.setIntroText(globalContentList.get(0).ContentText());
                result.setError(false);
                result.setSuccessful(true);
            }
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
