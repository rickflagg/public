package net.rickflagg.data.postgresql.repositories.tests;

import net.rickflagg.data.entities.SoftwareLifecycle;
import net.rickflagg.data.repositories.ISoftwareLifecycleRepository;
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

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 8/20/14
 * Time: 4:34 AM
 * To change this template use File | Settings | File Templates.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
@TestExecutionListeners(listeners = {DependencyInjectionTestExecutionListener.class, DirtiesContextTestExecutionListener.class, TransactionalTestExecutionListener.class})
public class SoftwareLifecycleRepositoryTests  {

    @Autowired
    @Qualifier("softwareLifecycleRepository")
    ISoftwareLifecycleRepository repo;

    @Test
    public void testRetrieveAll() throws Exception {

        assertTrue(repo.retrieveAll().size() > 0);
    }

    @Test
    public void testFindByName() throws Exception {

        assertTrue(repo.findByName("agile-scrum").size() == 1);
    }

    @Test
    public void testFindById() throws Exception {

        assertNotNull(repo.findById(1));
    }

    @Test
    public void testPersistence() throws Exception{

        int recordCount = repo.retrieveAll().size();

        SoftwareLifecycle entity = new SoftwareLifecycle();


        entity.setActive(true);
        entity.setName("My Software Lifecycle");

        repo.save(entity);

        assertTrue(entity.getId() != null);
        assertTrue(recordCount < repo.retrieveAll().size());

        repo.delete(entity);

        assertTrue(recordCount == repo.retrieveAll().size());

    }

}
