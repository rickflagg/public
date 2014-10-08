package net.rickflagg.services.tests;

import net.rickflagg.services.context.IServiceContextParameter;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
public class UnitTestBase {

    protected IServiceContextParameter CreateTestParameter(){

        IServiceContextParameter prm = new UnitTestServiceContextParameter();

        prm.setPath("/rest/projects/all");
        prm.setApplicationName("Homesite");
        prm.setHostName("localhost");
        prm.setQueryString("?token=sometoken");
        prm.setReferrer("http://google.com");
        prm.setRemoteAddress("192.168.1.1");

        return prm;


    }

}
