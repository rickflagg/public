package net.rickflagg.data.postgresql.repositories.tests;

import net.rickflagg.data.entities.ApplicationLog;
import net.rickflagg.data.filters.ApplicationLogFilter;
import net.rickflagg.data.postgresql.repositories.ApplicationLogRepository;
import net.rickflagg.data.repositories.IApplicationLogRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.time.LocalDateTime;

import static org.junit.Assert.*;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 9/6/14
 * Time: 8:21 AM
 * To change this template use File | Settings | File Templates.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class ApplicationLogRepositoryTests {

    @Autowired
    private IApplicationLogRepository applicationLogRepository;

    @Test
    public void testSave() throws Exception {

        int recordCount = applicationLogRepository.Tail().size();

        ApplicationLog log = new ApplicationLog();

        log.setApplicationName("My Test Application");
        log.setSuccess(true);
        log.setPath("/my/path");
        log.setEventDate(LocalDateTime.now());
        log.setAuthenticationToken("my tests toke");
        log.setEventType("tests");
        log.setSeverity("high");
        log.setBrowser("some obscure browser");
        log.setHost("localhost");
        log.setMessage("This is a tests message");
        log.setQueryString("?value=tests");
        log.setReferrer("http://google.com");
        log.setRemoteAddress("192.168.1.1");

        applicationLogRepository.Save(log);

        assertTrue(log.getId() != null);
        assertTrue(recordCount < applicationLogRepository.Tail().size());


    }

    @Test
    public void testSearch() throws Exception {

        ApplicationLogFilter filter = new ApplicationLogFilter();

        filter.setId(1);
        filter.setBrowser("Mozilla/5.0");
        filter.setReferrer("search?hl=en&q=java");
        filter.setRemoteAddress("168.1");
        filter.setPath("links");
        filter.setQueryString("Name=person");
        filter.setMessage("model person");
        filter.setSeverity("low");
        filter.setEventType("Data");
        filter.setAuthenticationToken("home");
        filter.setStartDate(LocalDateTime.now().minusDays(1));
        filter.setEndDate(LocalDateTime.now().plusDays(1));
        filter.setApplicationName("home");
        filter.setSuccess(true);



        assertTrue(applicationLogRepository.Search(filter).size() > 0);


    }

    @Test
    public void testTail() throws Exception {

         assertTrue(applicationLogRepository.Tail().size() > 0);
    }
}
