package net.rickflagg.services.results;

import net.rickflagg.data.entities.ServiceToken;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 9/13/14
 * Time: 7:43 AM
 * To change this template use File | Settings | File Templates.
 */
public class ServiceTokenResult extends ServiceResultBase {

    private ServiceToken serviceToken;

    public ServiceToken getServiceToken() {
        return serviceToken;
    }

    public void setServiceToken(ServiceToken serviceToken) {
        this.serviceToken = serviceToken;
    }
}
