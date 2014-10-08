package net.rickflagg.services.results;

import net.rickflagg.data.entities.Link;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 10/5/14
 * Time: 11:08 AM
 * To change this template use File | Settings | File Templates.
 */
public class LinkResult extends ServiceResultBase {

    private Map<String, List<Link>> linkMap;

    public Map<String, List<Link>> getLinkMap() {
        return linkMap;
    }

    public void setLinkMap(Map<String, List<Link>> linkMap) {
        this.linkMap = linkMap;
    }

    public LinkResult(){
        linkMap = new HashMap<String, List<Link>>();
    }
}
