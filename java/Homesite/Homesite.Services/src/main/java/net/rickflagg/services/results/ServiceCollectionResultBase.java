package net.rickflagg.services.results;

import java.util.ArrayList;

/**
 * Author: Rick Flagg
 * Date: 10/11/14
 * Time: 7:32 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
public class ServiceCollectionResultBase<T> extends ArrayList<T> {

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
