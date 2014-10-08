package net.rickflagg.data.postgresql.repositories.tests;

import net.rickflagg.data.entities.DatabasePlatform;
import net.rickflagg.data.postgresql.repositories.DatabasePlatformRepository;
import net.rickflagg.data.repositories.IDatabasePlatformRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.time.LocalDateTime;

import static org.junit.Assert.*;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 8/10/14
 * Time: 12:01 PM
 * To change this template use File | Settings | File Templates.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class DatabasePlatformRepositoryTests {

    @Autowired
    @Qualifier("databasePlatformRepository")
    IDatabasePlatformRepository repo;

    @Test
    public void testRetrieveAll() throws Exception {

        assertTrue(repo.RetrieveAll().size() > 0);

    }

    @Test
    public void testFindByName() throws Exception{

         assertTrue(repo.FindByName("post").size() == 1);

    }

    @Test
    public void testFindById() throws Exception{

        assertNotNull(repo.FindById(1));
    }

    @Test
    public void testPersistence() throws Exception{

        int recordCount = repo.RetrieveAll().size();

        DatabasePlatform entity = new DatabasePlatform();

        entity.setReferenceUrl("http://google.com");
        entity.setActive(true);
        entity.setName("My Database Platform");

        repo.Save(entity);

        assertTrue(entity.getId() != null);
        assertTrue(recordCount < repo.RetrieveAll().size());

        repo.Delete(entity);

        assertTrue(recordCount == repo.RetrieveAll().size());


    }


}
