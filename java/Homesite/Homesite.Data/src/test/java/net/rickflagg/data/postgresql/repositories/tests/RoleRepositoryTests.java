package net.rickflagg.data.postgresql.repositories.tests;

import net.rickflagg.data.entities.Role;
import net.rickflagg.data.entities.Project;
import net.rickflagg.data.repositories.IRoleRepository;
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
import static org.junit.Assert.assertThat;
import static org.junit.Assert.assertTrue;

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
public class RoleRepositoryTests  {

    @Autowired
    @Qualifier("roleRepository")
    IRoleRepository repo;

    @Test
    public void testRetrieveAll() throws Exception {

        assertTrue(repo.retrieveAll().size() > 0);

    }

    @Test
    public void testFindByName() throws Exception {

        assertTrue(repo.findByName("project").size() == 1);
    }

    @Test
    public void testFindById() throws Exception {

        assertNotNull(repo.findById(1));
    }

    @Test
    public void testFindByProject() throws Exception {
        ;
        Project project = new Project();
        project.setId(1);
        assertTrue(repo.findByProject(project).size() > 0);
    }


    @Test
    public void testPersistence() throws Exception{

        int recordCount = repo.retrieveAll().size();

        Role entity = new Role();


        entity.setActive(true);
        entity.setName("My Role");

        repo.save(entity);

        assertTrue(entity.getId() != null);
        assertTrue(recordCount < repo.retrieveAll().size());

        repo.delete(entity);

        assertTrue(recordCount == repo.retrieveAll().size());

    }


}
