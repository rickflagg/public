package net.rickflagg.services.results;

import net.rickflagg.data.entities.Link;

import java.util.ArrayList;
import java.util.List;

/**
 * Author: Rick Flagg
 * Date: 10/11/14
 * Time: 5:09 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
public class LinkCategoryResult extends ServiceResultBase {

    private String categoryName;
    private List<Link> links;
    private int id;

    public LinkCategoryResult(){
       this.links = new ArrayList<>();
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getLinkCount() {
        return this.links.size();
    }

    public List<Link> getLinks() {
        return links;
    }

    public void setLinks(List<Link> links) {
        this.links = links;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
