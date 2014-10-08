package net.rickflagg.services.tests;

import net.rickflagg.data.entities.ServiceToken;
import net.rickflagg.data.postgresql.repositories.ApplicationLogRepository;
import net.rickflagg.services.ApplicationTokenService;
import net.rickflagg.services.results.ServiceTokenResult;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import static org.junit.Assert.*;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class ApplicationTokenServiceTests extends UnitTestBase {

    @Autowired
    ApplicationTokenService tokenService;

    @Test
    public void testCreateToken() throws Exception {

         String key1 = "abc123";
         String key2 = "def456";
         String key3 = "ghi789";
         String key4 = "jkl012";

         ServiceTokenResult result = tokenService.createToken(
                 super.CreateTestParameter() ,key1, key2, key3, key4);

         assertTrue(result.isSuccessful());
         assertFalse(result.getServiceToken() == null);

         key1 = "dfl;kd;lkfsdl;";
         key2 = "dsfdfdflkf40ewor";
         key3 = "ortdfjmsdfkasdf";
         key4 ="56456erwerdfgvkm,";

        result = tokenService.createToken(
                super.CreateTestParameter() ,key1, key2, key3, key4);

        assertFalse(result.isSuccessful());
        assertTrue(result.getServiceToken() == null);

    }

    @Test
    public void validateToken() throws Exception {

        ServiceToken token = new ServiceToken();

        token.setKey1("E0C7BB7A81799CA4CAF450026A272071");
        token.setKey2("1E27F2C6C09AE396BFC80EC7A0DEC28E");
        token.setKey3("9EEF1001686B3DB9F06A508C09C4F3E6");
        token.setKey4("2154C9966EE6F887AD16E956BEABB0E6");

        ServiceTokenResult result = tokenService.validateToken(CreateTestParameter(),token);

        assertTrue(result.isSuccessful());
        assertTrue(result.getServiceToken() != null);
        assertFalse(result.isError());

        token = new ServiceToken();

        token.setKey1("E0C6BB7A81799CA4CBF450026A272071");
        token.setKey2("1E29F2C6C09AE396BFC80ED7A0DEC88E");
        token.setKey3("9EEF1001686B3DF9F06A501C09C4F4E6");
        token.setKey4("8164C9966EE6F987AD16E956HEACB0E6");

        result = tokenService.validateToken(CreateTestParameter(),token);


        assertFalse(result.isSuccessful());
        assertTrue(result.getServiceToken() == null);
        assertFalse(result.isError());






    }

}
