package net.rickflagg.data.entities;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */

public class ServiceToken extends BaseEntity implements IEntity {

    private String key1;
    private String key2;
    private String key3;
    private String key4;


    public String getKey1() {
        return key1;
    }

    public void setKey1(String key1) {
        this.key1 = key1;
    }

    public String getKey2() {
        return key2;
    }

    public void setKey2(String key2) {
        this.key2 = key2;
    }

    public String getKey3() {
        return key3;
    }

    public void setKey3(String key3) {
        this.key3 = key3;
    }

    public String getKey4() {
        return key4;
    }

    public void setKey4(String key4) {
        this.key4 = key4;
    }


    public boolean hasKeys(){
        return ( (this.key1 != null) && (this.key2 != null)
                && (this.key3 != null) && (this.key4 != null)
        );
    }

}
