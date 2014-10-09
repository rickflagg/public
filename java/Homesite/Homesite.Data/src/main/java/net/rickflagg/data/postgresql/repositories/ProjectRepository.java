package net.rickflagg.data.postgresql.repositories;

import net.rickflagg.data.entities.*;
import net.rickflagg.data.postgresql.PostgresFunction;
import net.rickflagg.data.postgresql.PostgresRefCursor;
import net.rickflagg.data.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
@Repository("projectRepository")
public class ProjectRepository implements IProjectRepository {

    @Autowired
    private DataSource ds;
    @Autowired
    private IDatabasePlatformRepository databasePlatformRepository;
    @Autowired
    private ISoftwareLifecycleRepository softwareLifecycleRepository;
    @Autowired
    private IRoleRepository roleRepository;
    @Autowired
    private IProgrammingLanguageRepository programmingLanguageRepository;
    @Autowired
    private IDesignPatternRepository designPatternRepository;
    @Autowired
    private IProgrammingToolKitRepository programmingToolKitRepository;
    @Autowired
    private IClientRepository clientRepository;

    public ProjectRepository()
    {

    }

    @Override
    public List<Project> retrieveAll() throws SQLException, NamingException {

        List<Project> retval = new ArrayList<Project>();

        PostgresFunction function = new PostgresFunction(ds.getConnection(), "{ ? = call fn_projects_all() }");

        PostgresRefCursor refCursor = function.getRefCursor();

        if(refCursor != null)
        {
            while (refCursor.next())
            {
                retval.add(BindEntity(refCursor));
            }
        }

        refCursor.dispose();
        function.dispose();


        return retval;

    }

    @Override
    public void delete(Project entity) throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(ds.getConnection(),
                "{ call fn_projects_delete(?) }");

        function.setIntegerParameter(1, entity.getId());

        function.execute();

        function.dispose();


    }

    @Override
    public void save(Project entity) throws SQLException, NamingException {

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{? = call fn_projects_save(?, ?, ?, ?, ?, ?,?, ?, ?, ?) }"
        );

        function.registerOutputParameter(1, Types.INTEGER);
        function.setIntegerParameter(2, entity.getId());
        function.setStringParameter(3, entity.getName());
        function.setBooleanParameter(4, entity.getActive());

        if(entity.getClient() != null){
            function.setIntegerParameter(5, entity.getClient().getId());
        }
        else{
            function.setIntegerParameter(5, null);
        }

        if(entity.getStartDate() != null){
            function.setTimestampParameter(6, entity.getStartDate().atStartOfDay());
        }
        else{
            function.setTimestampParameter(6, null);
        }

        if(entity.getEndDate() != null){
            function.setTimestampParameter(7, entity.getEndDate().atStartOfDay());
        }
        else {
            function.setTimestampParameter(7, null);
        }

        function.setStringParameter(8, entity.getDescription());

        if(entity.getDatabasePlatform() != null){
            function.setIntegerParameter(9, entity.getDatabasePlatform().getId());
        }
        else{
            function.setIntegerParameter(9, null);
        }

        if(entity.getSoftwareLifecycle() != null){
            function.setIntegerParameter(10, entity.getSoftwareLifecycle().getId());
        }
        else{
            function.setIntegerParameter(10, null);
        }

        function.setStringParameter(11, entity.getGitUrl());

        function.execute();

        entity.setId((Integer)function.getObject(1));

        SaveDesignPatterns(entity);
        SaveRoles(entity);
        SaveProgrammingLanguages(entity);
        SaveProgrammingToolkits(entity);

        function.dispose();


    }

    private void SaveDesignPatterns(Project project) throws SQLException, NamingException{

        if(project.getDesignPatterns() != null && project.getDesignPatterns().size() > 0){
            for(DesignPattern entity : project.getDesignPatterns()){

                if(entity.getId() != null){
                    entity = designPatternRepository.FindById(entity.getId());
                }
                else {
                    designPatternRepository.Save(entity);
                }

                PostgresFunction function = new PostgresFunction(
                        ds.getConnection(),
                        "{call fn_projects_associate_design_pattern(?, ?) }"
                );

                function.setIntegerParameter(1, project.getId());
                function.setIntegerParameter(2, entity.getId());

                function.execute();

                function.dispose();

            }
        }

    }

    private void SaveRoles(Project project) throws SQLException, NamingException{

        if(project.getRoles() != null && project.getRoles().size() > 0){
            for(Role entity : project.getRoles()){

                if(entity.getId() != null){
                    entity = roleRepository.findById(entity.getId());
                }
                else {
                    roleRepository.save(entity);
                }

                PostgresFunction function = new PostgresFunction(
                        ds.getConnection(),
                        "{call fn_projects_associate_role(?, ?) }"
                );

                function.setIntegerParameter(1, project.getId());
                function.setIntegerParameter(2, entity.getId());

                function.execute();

                function.dispose();

            }
        }

    }

    private void SaveProgrammingLanguages(Project project) throws SQLException, NamingException{

        if(project.getProgrammingLanguages() != null && project.getProgrammingLanguages().size() > 0){
            for(ProgrammingLanguage entity : project.getProgrammingLanguages()){

                if(entity.getId() != null){
                    entity = programmingLanguageRepository.findById(entity.getId());
                }
                else {
                    programmingLanguageRepository.save(entity);
                }

                PostgresFunction function = new PostgresFunction(
                        ds.getConnection(),
                        "{call fn_projects_associate_programming_language(?, ?) }"
                );

                function.setIntegerParameter(1, project.getId());
                function.setIntegerParameter(2, entity.getId());

                function.execute();

                function.dispose();

            }
        }

    }

    private void SaveProgrammingToolkits(Project project) throws SQLException, NamingException{

        if(project.getProgrammingToolKits() != null && project.getProgrammingToolKits().size() > 0){
            for(ProgrammingToolKit entity : project.getProgrammingToolKits()){

                if(entity.getId() != null){
                    entity = programmingToolKitRepository.findById(entity.getId());
                }
                else {
                    programmingToolKitRepository.save(entity);
                }

                PostgresFunction function = new PostgresFunction(
                        ds.getConnection(),
                        "{call fn_projects_associate_programming_toolkit(?, ?) }"
                );

                function.setIntegerParameter(1, project.getId());
                function.setIntegerParameter(2, entity.getId());

                function.execute();

                function.dispose();

            }
        }

    }


    @Override
    public List<Project> findByName(String name) throws SQLException, NamingException {
        List<Project> retval = new ArrayList<Project>();

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_projects_by_name(?) }"
        );

        function.setStringParameter(2, name);

        PostgresRefCursor refCursor = function.getRefCursor();

        if (refCursor != null){

            while(refCursor.next())
            {
                retval.add(BindEntity(refCursor));
            }
        }

        refCursor.dispose();
        function.dispose();


        return retval;

    }

    @Override
    public Project findById(int id) throws SQLException, NamingException {

        Project entity = null;

        PostgresFunction function = new PostgresFunction(
                ds.getConnection(),
                "{ ? = call fn_projects_by_id(?) }"
        );

        function.setIntegerParameter(2, Integer.valueOf(String.valueOf(id)));

        PostgresRefCursor refCursor = function.getRefCursor();

        if (refCursor != null){
            refCursor.next();
            entity = BindEntity(refCursor);
        }

        refCursor.dispose();
        function.dispose();


        return entity;

    }

    private Project BindEntity(PostgresRefCursor refCursor) throws SQLException, NamingException
    {
        Project entity = new Project();

        refCursor.bindBaseEntity(entity);

        if(refCursor.parseDateTime("start_date") != null){
            entity.setStartDate(refCursor.parseDateTime("start_date").toLocalDate());
        }

        if(refCursor.parseDateTime("end_date") != null){
            entity.setEndDate(refCursor.parseDateTime("end_date").toLocalDate());
        }
        entity.setDescription(refCursor.parseString("description"));

        entity.setClient(this.clientRepository.FindById(refCursor.parseInt("client_id")));
        entity.setDatabasePlatform(this.databasePlatformRepository.FindById(refCursor.parseInt("database_platform_id")));
        entity.setSoftwareLifecycle(this.softwareLifecycleRepository.findById(refCursor.parseInt("software_lifecycle_id")));
        entity.setRoles(this.roleRepository.findByProject(entity));
        entity.setProgrammingLanguages(this.programmingLanguageRepository.findByProject(entity));
        entity.setDesignPatterns(this.designPatternRepository.FindByProject(entity));
        entity.setProgrammingToolKits(this.programmingToolKitRepository.findByProject(entity));
        entity.setGitUrl(refCursor.parseString("git_url"));

        return entity;

    }

}
