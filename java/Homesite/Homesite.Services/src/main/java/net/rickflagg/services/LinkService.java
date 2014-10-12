package net.rickflagg.services;

import net.rickflagg.data.entities.Link;
import net.rickflagg.data.entities.LinkCategory;
import net.rickflagg.data.postgresql.repositories.LinkCategoryRepository;
import net.rickflagg.data.postgresql.repositories.LinkRepository;
import net.rickflagg.services.context.IServiceContextParameter;
import net.rickflagg.services.results.LinkCategoryResult;
import net.rickflagg.services.results.LinkResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.naming.NamingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
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

    @Autowired
    private LinkCategoryRepository linkCategoryRepository;

    public LinkResult getAll(IServiceContextParameter prm){

        LinkResult result  = new LinkResult();

        try
        {
            loggingService.logMessage(prm, this.getClass().getName(),
                    "Pulling links");

            List<LinkCategory> linkCategories = linkCategoryRepository.retrieveByLinkCount();

            LinkedHashMap<String, List<Link>> map = new LinkedHashMap<>();

            if(linkCategories != null & linkCategories.size() > 0) {
                for(LinkCategory linkCategory : linkCategories){
                    map.put(linkCategory.getName(), linkRepository.findByCategory(linkCategory));
                }
            }

            result.setLinkMap(map);

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


    public List<LinkCategoryResult> getAllLinkCategories(IServiceContextParameter prm)
    {
         List<LinkCategoryResult> results = new ArrayList<>();

        try
        {
            loggingService.logMessage(prm, this.getClass().getName(),
                    "Pulling links");

            List<LinkCategory> linkCategories = linkCategoryRepository.retrieveByLinkCount();
            int i = 0;

            if(linkCategories != null & linkCategories.size() > 0) {
                for(LinkCategory linkCategory : linkCategories){
                    i++;
                    LinkCategoryResult result = new LinkCategoryResult();
                    result.setId(i);
                    result.setCategoryName(linkCategory.getName());
                    result.setLinks(linkRepository.findByCategory(linkCategory));
                    results.add(result);
                }
            }

        }
        catch (SQLException sex){
            loggingService.logSQLException(prm,sex, this.getClass().getName());
        }
        catch (NamingException nex){
            loggingService.logNamingException(prm, nex, this.getClass().getName());
        }
        catch (Exception ex){
            loggingService.logGeneralException(prm, ex, this.getClass().getName());
        }

         return results;

    }

}
