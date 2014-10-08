package net.rickflagg.data.postgresql.repositories.tests;

import net.rickflagg.data.entities.DesignPattern;
import net.rickflagg.data.postgresql.repositories.DesignPatternRepository;
import net.rickflagg.data.entities.Project;
import net.rickflagg.data.repositories.IDesignPatternRepository;
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
 * Date: 8/24/14
 * Time: 11:11 AM
 * To change this template use File | Settings | File Templates.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
@TestExecutionListeners(listeners = {DependencyInjectionTestExecutionListener.class, DirtiesContextTestExecutionListener.class, TransactionalTestExecutionListener.class})
public class DesignPatternRepositoryTests {

    @Autowired
    @Qualifier("designPatternRepository")
    IDesignPatternRepository repo;

    @Test
    public void testRetrieveAll() throws Exception {

        assertTrue(repo.RetrieveAll().size() > 0);
    }

    @Test
    public void testFindByName() throws Exception {

        assertTrue(repo.FindByName("mvc").size() == 1);
    }

    @Test
    public void testFindById() throws Exception {

        assertNotNull(repo.FindById(1));

    }

    @Test
    public void testFindByProject() throws Exception{

        Project project = new Project();

        project.setId(1);

        assertTrue(repo.FindByProject(project).size() > 0);
    }

    @Test
    public void testPersistence() throws Exception{

        int recordCount = repo.RetrieveAll().size();

        DesignPattern entity = new DesignPattern();

        entity.setReferenceUrl("http://google.com");
        entity.setActive(true);
        entity.setName("My Design Pattern");

        repo.Save(entity);

        assertTrue(entity.getId() != null);
        assertTrue(recordCount < repo.RetrieveAll().size());

        repo.Delete(entity);

        assertTrue(recordCount == repo.RetrieveAll().size());

    }

}
