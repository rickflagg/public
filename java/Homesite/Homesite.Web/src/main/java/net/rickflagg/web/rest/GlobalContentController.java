package net.rickflagg.web.rest;

import net.rickflagg.services.GlobalContentService;
import net.rickflagg.services.results.GlobalContentResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
@RestController
@RequestMapping("/rest/globalcontent/")
public class GlobalContentController extends BaseController {

    @Autowired
    GlobalContentService globalContentService;

    @RequestMapping(value = "/all", method = RequestMethod.GET,headers="Accept=application/json")
    public @ResponseBody GlobalContentResult  getGlobalContent(HttpServletRequest request){

        GlobalContentResult result = globalContentService.getGlobalContent(createServiceContextParameter(request, null));

        if(result.isSuccessful() && !result.isError()){
             return result;
        }
        else{
            return null;
        }


    }
}
