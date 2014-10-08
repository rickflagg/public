package net.rickflagg.data.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 8/10/14
 * Time: 7:36 AM
 * To change this template use File | Settings | File Templates.
 */
public class BaseEntity implements IEntity {

    private Integer id = null;
    private String name;
    private LocalDateTime createdDate;
    private LocalDateTime modifiedDate;
    private boolean active;
    private Integer sorted = null;

    public Integer getId(){return id;}
    public void setId(Integer value) {id = value;}

    public String getName(){return name;}
    public void setName(String value) {name = value;}

    public LocalDateTime getCreatedDate(){return createdDate;}
    public void setCreatedDate(LocalDateTime value) {createdDate = value;}

    public LocalDateTime getModifiedDate(){return createdDate;}
    public void setModifiedDate(LocalDateTime value) {createdDate = value;}

    public boolean getActive(){return active;}
    public void setActive(boolean value) {active = value;}

    public Integer getSortOrder(){return sorted;}
    public void setSortOrder(Integer value){sorted = value;}

    public boolean isSorted(){

        boolean retval = false;

        if(this.sorted != null){
            retval = sorted > -1;
        }

        return retval;
    }

}
