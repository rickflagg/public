package net.rickflagg.services.results;

import net.rickflagg.data.entities.Project;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 9/16/14
 * Time: 4:02 PM
 * To change this template use File | Settings | File Templates.
 */
public class ProjectResult extends ServiceResultBase {

    private List<Project> projects;


    public ProjectResult(){
        projects = new ArrayList<Project>();
    }

    public List<Project> getProjects() {
        return projects;
    }

    public void setProjects(List<Project> projects) {
        this.projects = projects;
    }
}
