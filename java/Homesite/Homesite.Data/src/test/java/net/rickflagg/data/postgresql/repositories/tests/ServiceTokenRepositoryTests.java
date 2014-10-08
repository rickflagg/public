package net.rickflagg.data.postgresql.repositories.tests;

import net.rickflagg.data.postgresql.repositories.ServiceTokenRepository;
import net.rickflagg.data.repositories.IServiceTokenRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestExecutionListeners;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.DependencyInjectionTestExecutionListener;
import org.springframework.test.context.support.DirtiesContextTestExecutionListener;
import org.springframework.test.context.transaction.TransactionalTestExecutionListener;

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
@TestExecutionListeners(listeners = {DependencyInjectionTestExecutionListener.class, DirtiesContextTestExecutionListener.class, TransactionalTestExecutionListener.class})
public class ServiceTokenRepositoryTests  {

    @Autowired
    @Qualifier("serviceTokenRepository")
    IServiceTokenRepository repo;

    @Test
    public void testFindServiceToken() throws Exception {

       assertNotNull(repo.findServiceToken(
                "E0C7BB7A81799CA4CAF450026A272071",
                "1E27F2C6C09AE396BFC80EC7A0DEC28E",
                "9EEF1001686B3DB9F06A508C09C4F3E6",
                "2154C9966EE6F887AD16E956BEABB0E6")
        );

    }
}
