package net.rickflagg.data.entities;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 9/6/14
 * Time: 5:23 AM
 * To change this template use File | Settings | File Templates.
 */

public class ApplicationLog extends BaseEntity implements IEntity {

    private String browser;
    private String host;
    private String referrer;
    private String remoteAddress;
    private String path;
    private String queryString;
    private String message;
    private String severity;
    private String eventType;
    private String authenticationToken;
    private LocalDateTime eventDate;
    private String applicationName;
    private boolean success;
    private String source;
    private String stackTrace;

    public String getBrowser() {
        return browser;
    }

    public void setBrowser(String browser) {
        this.browser = browser;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getReferrer() {
        return referrer;
    }

    public void setReferrer(String referrer) {
        this.referrer = referrer;
    }

    public String getRemoteAddress() {
        return remoteAddress;
    }

    public void setRemoteAddress(String remoteAddress) {
        this.remoteAddress = remoteAddress;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getQueryString() {
        return queryString;
    }

    public void setQueryString(String queryString) {
        this.queryString = queryString;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSeverity() {
        return severity;
    }

    public void setSeverity(String severity) {
        this.severity = severity;
    }

    public String getEventType() {
        return eventType;
    }

    public void setEventType(String eventType) {
        this.eventType = eventType;
    }

    public String getAuthenticationToken() {
        return authenticationToken;
    }

    public void setAuthenticationToken(String authenticationToken) {
        this.authenticationToken = authenticationToken;
    }

    public LocalDateTime getEventDate() {
        return eventDate;
    }

    public void setEventDate(LocalDateTime eventDate) {
        this.eventDate = eventDate;
    }

    public String getApplicationName() {
        return applicationName;
    }

    public void setApplicationName(String applicationName) {
        this.applicationName = applicationName;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getStackTrace() {
        return stackTrace;
    }

    public void setStackTrace(String stackTrace) {
        this.stackTrace = stackTrace;
    }

    public String getFormattedEventDate(){

        String retval = null;
        DateTimeFormatter format = DateTimeFormatter.ofPattern("MMM d yyyy  hh:mm a");

        if(this.eventDate != null){
            retval = this.eventDate.format(format);
        }

        return retval;


    }

    @Override
    public String toString(){
        StringBuilder sb = new StringBuilder();

        sb.append(String.format("Browser: %s \r\n", browser));
        sb.append(String.format("Host: %s \r\n", host));
        sb.append(String.format("Referrer: %s \r\n", referrer));
        sb.append(String.format("RemoteAddress: %s \r\n", remoteAddress));
        sb.append(String.format("Path: %s \r\n", path));
        sb.append(String.format("QueryString: %s \r\n", queryString));
        sb.append(String.format("Message: %s \r\n", message));
        sb.append(String.format("Severity: %s \r\n", severity));
        sb.append(String.format("EventType: %s \r\n", eventType));
        sb.append(String.format("AuthenticationToken: %s \r\n", authenticationToken));

        if(eventDate != null){
            sb.append(String.format("Event Date: %s \r\n", getFormattedEventDate()));
        } else  {
            sb.append("Event Date: ");
        }

        sb.append(String.format("ApplicationName: %s \r\n", applicationName));
        sb.append(String.format("Success: %s \r\n", success));
        sb.append(String.format("Source: %s \r\n", source));
        sb.append(String.format("StackTrace: %s \r\n", stackTrace));

        return sb.toString();
    }

}
