package net.rickflagg.web.rest;

import net.rickflagg.data.entities.SkillMatrix;
import net.rickflagg.services.SkillMatrixService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
@RestController
@RequestMapping("/rest/skills/")
public class SkillMatrixController extends BaseController {

    @Autowired
    SkillMatrixService skillMatrixService;

    @RequestMapping(value = "/all", method = RequestMethod.GET,headers="Accept=application/json")
    public @ResponseBody
    Map<String, List<SkillMatrix>> getAll(HttpServletRequest request){
        return skillMatrixService.getAll(
                super.createServiceContextParameter(request, null)
        ).getSkillMatrixMap();
    }


}
