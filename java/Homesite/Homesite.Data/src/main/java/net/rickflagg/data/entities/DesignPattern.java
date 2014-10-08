package net.rickflagg.data.entities;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 8/24/14
 * Time: 8:25 AM
 * To change this template use File | Settings | File Templates.
 */
public class DesignPattern extends BaseEntity implements IEntity {

    private String referenceUrl;

    public String getReferenceUrl() {
        return referenceUrl;
    }

    public void setReferenceUrl(String referenceUrl) {
        this.referenceUrl = referenceUrl;
    }
}
