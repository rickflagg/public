package net.rickflagg.services.results;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 10/2/14
 * Time: 4:38 AM
 * To change this template use File | Settings | File Templates.
 */
public class GlobalContentResult extends ServiceResultBase {

    private String intoText;

    public String getIntroText() {
        return intoText;
    }

    public void setIntroText(String intoText) {
        this.intoText = intoText;
    }
}
