package net.rickflagg.data.entities;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 8/23/14
 * Time: 5:21 PM
 * To change this template use File | Settings | File Templates.
 */
public class Client extends BaseEntity implements IEntity {

    private String referenceUrl;


    public String getReferenceUrl() {
        return referenceUrl;
    }

    public void setReferenceUrl(String referenceUrl) {
        this.referenceUrl = referenceUrl;
    }


}
