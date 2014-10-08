package net.rickflagg.services;

import net.rickflagg.data.entities.Link;
import net.rickflagg.data.postgresql.repositories.LinkRepository;
import net.rickflagg.services.context.IServiceContextParameter;
import net.rickflagg.services.results.LinkResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.naming.NamingException;
import java.sql.SQLException;
import java.util.ArrayList;
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
public class LinkService  {

    @Autowired
    private LoggingService loggingService;

    @Autowired
    private LinkRepository linkRepository;

    public LinkResult getAll(IServiceContextParameter prm){

        LinkResult result  = new LinkResult();

        try
        {
            loggingService.logMessage(prm, this.getClass().getName(),
                    "Pulling links");

            List<Link> links = linkRepository.retrieveAll();

            if(links != null && links.size() > 0)
            {
                for(Link link : links){
                    if(result.getLinkMap().containsKey(link.getLinkCategory().getName())){
                        result.getLinkMap().get(link.getLinkCategory().getName()).add(link);
                    }
                    else{

                        List<Link> newLink = new ArrayList<Link>();

                        newLink.add(link);

                        result.getLinkMap()
                                .put(
                                        link.getLinkCategory().getName(),
                                        newLink
                                );
                    }
                }
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
