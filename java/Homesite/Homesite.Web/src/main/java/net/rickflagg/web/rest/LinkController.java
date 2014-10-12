package net.rickflagg.web.rest;

import net.rickflagg.data.entities.Link;
import net.rickflagg.services.LinkService;
import net.rickflagg.services.results.LinkCategoryResult;
import net.rickflagg.services.results.LinkResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
@RestController
@RequestMapping("/rest/links/")
public class LinkController extends BaseController{

    @Autowired
    LinkService linkService;

    @RequestMapping(value = "/all", method = RequestMethod.GET,headers="Accept=application/json")
    public @ResponseBody
    Map<String, List<Link>> getAll(HttpServletRequest request){
        LinkResult result = linkService.getAll(createServiceContextParameter(request, null));
        return result.getLinkMap();
    }

    @RequestMapping(value = "/categories", method = RequestMethod.GET,headers="Accept=application/json")
    public @ResponseBody
    List<LinkCategoryResult> getLinksByCategory(HttpServletRequest request){
        List<LinkCategoryResult> result = linkService.getAllLinkCategories(createServiceContextParameter(request, null));
        return result;
    }

}
