package net.rickflagg.data.postgresql.repositories.tests;

import net.rickflagg.data.entities.*;
import net.rickflagg.data.repositories.*;
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

import java.time.LocalDate;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertNull;

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
public class ProjectRepositoryTests  {

    @Autowired
    @Qualifier("databasePlatformRepository")
    IDatabasePlatformRepository databasePlatformRepository;

    @Autowired
    @Qualifier("softwareLifecycleRepository")
    ISoftwareLifecycleRepository softwareLifecycleRepository;

    @Autowired
    @Qualifier("roleRepository")
    IRoleRepository roleRepository;

    @Autowired
    @Qualifier("programmingLanguageRepository")
    IProgrammingLanguageRepository programmingLanguageRepository;

    @Autowired
    @Qualifier("designPatternRepository")
    IDesignPatternRepository designPatternRepository;

    @Autowired
    @Qualifier("programmingToolKitRepository")
    IProgrammingToolKitRepository programmingToolKitRepository;

    @Autowired
    @Qualifier("clientRepository")
    IClientRepository clientRepository;

    @Autowired
    @Qualifier("projectRepository")
    IProjectRepository repo;



    @Test
    public void testRetrieveAll() throws Exception {
       assertTrue(repo.retrieveAll().size() > 0);
    }

    @Test
    public void testFindByName() throws Exception {
       assertTrue(repo.findByName("im").size() > 0);
    }

    @Test
    public void testFindById() throws Exception {
        assertNotNull(repo.findById(1));
    }


    @Test
    public void testPersistence() throws Exception
    {

        Project project = new Project();

        project.setName("My Test Project");
        project.setDescription("This is a tests project for a unit tests");
        project.setStartDate(LocalDate.now());
        project.setActive(true);

        project.setDatabasePlatform(databasePlatformRepository.FindById(1));
        project.setClient(clientRepository.FindById(1));

        project.getRoles().add(roleRepository.findById(1));
        project.getRoles().add(roleRepository.findById(2));

        project.getDesignPatterns().add(designPatternRepository.FindById(1));
        project.getDesignPatterns().add(designPatternRepository.FindById(2));

        project.getProgrammingLanguages().add(programmingLanguageRepository.findById(1));
        project.getProgrammingLanguages().add(programmingLanguageRepository.findById(2));

        project.getProgrammingToolKits().add(programmingToolKitRepository.findById(1));
        project.getProgrammingToolKits().add(programmingToolKitRepository.findById(2));

        //Add a new Role
        Role newRole = new Role();
        newRole.setActive(true);
        newRole.setName("New fantastic Role");
        project.getRoles().add(newRole);

        //Add a new Design Pattern
        DesignPattern newDesignPattern = new DesignPattern();
        newDesignPattern.setActive(true);
        newDesignPattern.setName("My awesome design pattern");
        project.getDesignPatterns().add(newDesignPattern);

        //Add a new Programming Language
        ProgrammingLanguage newProgrammingLanguage = new ProgrammingLanguage();
        newProgrammingLanguage.setActive(true);
        newProgrammingLanguage.setName("My kickass programming language");
        project.getProgrammingLanguages().add(newProgrammingLanguage);

        //Add a new programming toolkit
        ProgrammingToolKit newProgrammingToolkit = new ProgrammingToolKit();
        newProgrammingToolkit.setActive(true);
        newProgrammingToolkit.setProgrammingLanguage(newProgrammingLanguage);
        newProgrammingToolkit.setName("My cool toolkit");
        project.getProgrammingToolKits().add(newProgrammingToolkit);


        repo.save(project);

        assertNotNull(project.getId());

        project = repo.findById(project.getId());

        assertNotNull(project.getClient());
        assertNotNull(project.getDatabasePlatform());
        assertTrue(project.getRoles().size() == 3);
        assertTrue(project.getDesignPatterns().size() == 3);
        assertTrue(project.getProgrammingLanguages().size() == 3);
        assertTrue(project.getProgrammingToolKits().size() == 3);

        repo.delete(project);

        assertTrue(repo.findByName("My Test Project").size() == 0);

    }

}
