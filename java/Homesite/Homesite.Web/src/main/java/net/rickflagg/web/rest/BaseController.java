package net.rickflagg.web.rest;

import net.rickflagg.data.entities.ServiceToken;
import net.rickflagg.services.context.IServiceContextParameter;

import javax.servlet.http.HttpServletRequest;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
public class BaseController {

    protected IServiceContextParameter createServiceContextParameter(
            HttpServletRequest request,
            ServiceToken token
    ){

        IServiceContextParameter prm = new ServiceRequestContextParameter();

        prm.setHostName(request.getServerName());
        prm.setRemoteAddress(request.getRemoteAddr());
        prm.setReferrer(request.getHeader("referer"));
        prm.setQueryString(request.getQueryString());
        prm.setApplicationName("rickflagg.net");
        prm.setPath(request.getPathInfo());

        if(token != null){
            prm.setAuthenticationTokenName(token.getName());
        }

        return prm;
    }

}
