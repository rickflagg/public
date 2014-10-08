package net.rickflagg.data.postgresql.repositories.tests;

import net.rickflagg.data.entities.Client;
import net.rickflagg.data.postgresql.repositories.ClientRepository;
import net.rickflagg.data.repositories.IClientRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 8/24/14
 * Time: 3:24 AM
 * To change this template use File | Settings | File Templates.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class ClientRepositoryTests {

    @Autowired
    @Qualifier("clientRepository")
    IClientRepository repo;

    @Test
    public void testRetrieveAll() throws Exception {
        assertTrue(repo.RetrieveAll().size() > 0);
    }

    @Test
    public void testFindByName() throws Exception {
        assertTrue(repo.FindByName("U.S Census Bureau").size() == 1);
    }

    @Test
    public void testFindById() throws Exception {
        assertNotNull(repo.FindById(1));
    }

    @Test
    public void testPersistance() throws Exception{

        int recordCount = repo.RetrieveAll().size();

        Client entity = new Client();

        entity.setReferenceUrl("http://google.com");
        entity.setActive(true);
        entity.setName("My Client");

        repo.Save(entity);

        assertTrue(entity.getId() != null);
        assertTrue(recordCount < repo.RetrieveAll().size());

        repo.Delete(entity);

        assertTrue(recordCount == repo.RetrieveAll().size());


    }
}
