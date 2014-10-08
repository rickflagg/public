package net.rickflagg.data.entities;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 9/29/14
 * Time: 4:37 AM
 * To change this template use File | Settings | File Templates.
 */
public class GlobalContent extends BaseEntity implements  IEntity {

    private String text;
    private ContentType contentType;

    public String ContentText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public ContentType getContentType() {
        return contentType;
    }

    public void setContentType(ContentType contentType) {
        this.contentType = contentType;
    }
}
