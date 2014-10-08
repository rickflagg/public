package net.rickflagg.services.tests;

import net.rickflagg.services.GlobalContentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static junit.framework.Assert.assertNotNull;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class GlobalContentServiceTests extends UnitTestBase {

    @Autowired
    GlobalContentService globalContentService;

    @Test
    public void testGetGlobalContent() throws Exception {
        assertNotNull(globalContentService.getGlobalContent(CreateTestParameter()).getIntroText());
    }
}
