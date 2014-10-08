package net.rickflagg.data.entities;

import java.time.LocalDate;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 8/3/14
 * Time: 8:34 AM
 * To change this template use File | Settings | File Templates.
 */


public class DatabasePlatform extends BaseEntity implements IEntity{


    private String referenceUrl;

    public String getReferenceUrl(){return referenceUrl;}
    public void setReferenceUrl(String value) {referenceUrl = value;}


}
