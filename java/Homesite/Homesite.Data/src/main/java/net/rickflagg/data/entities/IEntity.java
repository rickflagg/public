package net.rickflagg.data.entities;

import java.time.LocalDateTime;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 8/10/14
 * Time: 7:23 AM
 * To change this template use File | Settings | File Templates.
 */
public interface IEntity {

    Integer getId();
    void setId(Integer value);

    String getName();
    void setName(String value);

    LocalDateTime getCreatedDate();
    void setCreatedDate(LocalDateTime value);

    LocalDateTime getModifiedDate();
    void setModifiedDate(LocalDateTime value);

    boolean getActive();
    void setActive(boolean value);

    Integer getSortOrder();
    void setSortOrder(Integer value);


    boolean isSorted();

}
