package net.rickflagg.services.context;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
public interface IServiceContextParameter {

    String getAuthenticationTokenName();
    String getHostName();
    String getReferrer();
    String getRemoteAddress();
    String getPath();
    String getQueryString();
    String getApplicationName();

    void setAuthenticationTokenName(String value);
    void setHostName(String value);
    void setReferrer(String value);
    void setRemoteAddress(String value);
    void setPath(String value);
    void setQueryString(String value);
    void setApplicationName(String value);





}
