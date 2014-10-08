package net.rickflagg.web.rest;

import net.rickflagg.services.context.IServiceContextParameter;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
public class ServiceRequestContextParameter implements IServiceContextParameter {

    private String authenticationTokenName;
    private String host;
    private String referrer;
    private String remoteAddress;
    private String path;
    private String queryString;
    private String applicationName;


    @Override
    public String getAuthenticationTokenName() {
        return authenticationTokenName;
    }

    @Override
    public String getHostName() {
        return host;
    }

    @Override
    public String getReferrer() {
        return referrer;
    }

    @Override
    public String getRemoteAddress() {
        return remoteAddress;
    }

    @Override
    public String getPath() {
        return path;
    }

    @Override
    public String getQueryString() {
        return queryString;
    }

    @Override
    public String getApplicationName() {
        return applicationName;
    }

    @Override
    public void setAuthenticationTokenName(String value) {
        authenticationTokenName = value;
    }

    @Override
    public void setHostName(String value) {
        host = value;
    }

    @Override
    public void setReferrer(String value) {
        referrer = value;
    }

    @Override
    public void setRemoteAddress(String value) {
        remoteAddress = value;
    }

    @Override
    public void setPath(String value) {
        path = value;
    }

    @Override
    public void setQueryString(String value) {
        queryString = value;
    }

    @Override
    public void setApplicationName(String value) {
        applicationName = value;
    }
}
