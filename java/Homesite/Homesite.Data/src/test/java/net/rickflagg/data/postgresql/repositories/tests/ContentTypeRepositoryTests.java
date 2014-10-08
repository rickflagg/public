package net.rickflagg.data.postgresql.repositories.tests;

import net.rickflagg.data.entities.ContentType;
import net.rickflagg.data.repositories.IContentTypeRepository;
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
 * Date: 10/1/14
 * Time: 4:13 AM
 * To change this template use File | Settings | File Templates.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class ContentTypeRepositoryTests {

    @Autowired
    @Qualifier("contentTypeRepository")
    IContentTypeRepository repo;

    @Test
    public void testRetrieveAll() throws Exception {
        assertTrue(repo.RetrieveAll().size() > 0);
    }

    @Test
    public void testFindByName() throws Exception {
        assertTrue(repo.FindByName("intro").size() == 1);
    }

    @Test
    public void testFindById() throws Exception {
        assertNotNull(repo.FindById(1));
    }

    @Test
    public void testPersistence() throws Exception{

        int recordCount = repo.RetrieveAll().size();

        ContentType entity = new ContentType();

        entity.setActive(true);
        entity.setName("My new Content Type");

        repo.Save(entity);

        assertTrue(entity.getId() != null);
        assertTrue(recordCount < repo.RetrieveAll().size());

        repo.Delete(entity);

        assertTrue(recordCount == repo.RetrieveAll().size());



    }
}
