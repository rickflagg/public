package net.rickflagg.services.results;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 9/13/14
 * Time: 8:59 AM
 * To change this template use File | Settings | File Templates.
 */
public class ServiceResultBase {

    private boolean successful;
    private boolean error;
    private String errorMessage;

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public boolean isError() {
        return error;
    }

    public void setError(boolean error) {
        this.error = error;
    }

    public boolean isSuccessful() {
        return successful;
    }

    public void setSuccessful(boolean successful) {
        this.successful = successful;
    }




}
