package net.rickflagg.data.postgresql.repositories.tests;

import net.rickflagg.data.entities.ContentType;
import net.rickflagg.data.entities.GlobalContent;
import net.rickflagg.data.repositories.IContentTypeRepository;
import net.rickflagg.data.repositories.IGlobalContentRepository;
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
 * Date: 10/2/14
 * Time: 4:18 AM
 * To change this template use File | Settings | File Templates.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class GlobalContentRepositoryTests {

    @Autowired
    @Qualifier("globalContentRepository")
    IGlobalContentRepository repo;

    @Autowired
    @Qualifier("contentTypeRepository")
    IContentTypeRepository contentTypeRepository;


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
    public void testFindByType() throws Exception {
        ContentType contentType = contentTypeRepository.FindById(1);
        assertNotNull(repo.FindByType(contentType));
    }

    @Test
    public void testPersistence() throws Exception{

        int recordCount = repo.RetrieveAll().size();

        ContentType contentType = new ContentType();

        contentType.setName("My new content type");
        contentType.setActive(true);
        contentTypeRepository.Save(contentType);

        GlobalContent entity = new GlobalContent();
        entity.setText("Some content text");
        entity.setContentType(contentType);
        entity.setActive(true);
        entity.setName("My new global content");

        repo.Save(entity);

        assertTrue(entity.getId() != null);
        assertTrue(recordCount < repo.RetrieveAll().size());

        repo.Delete(entity);
        contentTypeRepository.Delete(contentType);

        assertTrue(recordCount == repo.RetrieveAll().size());



    }

}
