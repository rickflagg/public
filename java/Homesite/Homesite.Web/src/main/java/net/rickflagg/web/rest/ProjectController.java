package net.rickflagg.web.rest;

import net.rickflagg.services.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import net.rickflagg.data.entities.Project;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
@RestController
@RequestMapping("/rest/projects/")
public class ProjectController extends BaseController {

    @Autowired
    ProjectService projectService;

    @RequestMapping(value = "/all", method = RequestMethod.GET,headers="Accept=application/json")
    public @ResponseBody List<Project> getAll(HttpServletRequest request){
        return projectService.getAll(
                super.createServiceContextParameter(request, null)
        ).getProjects();
    }

}
