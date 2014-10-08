package net.rickflagg.data.entities;

import net.rickflagg.data.entities.*;

import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
public class Project extends BaseEntity implements IEntity {

    private Client client;
    private LocalDate startDate;
    private LocalDate endDate;
    private String description;
    private DatabasePlatform databasePlatform;
    private SoftwareLifecycle softwareLifecycle;

    private List<Role> roles;
    private List<ProgrammingLanguage> programmingLanguages;
    private List<ProgrammingToolKit> programmingToolKits;
    private List<DesignPattern> designPatterns;

    public Project(){
        this.roles = new ArrayList<Role>();
        this.programmingLanguages = new ArrayList<ProgrammingLanguage>();
        this.programmingToolKits = new ArrayList<ProgrammingToolKit>();
        this.designPatterns = new ArrayList<DesignPattern>();
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public DatabasePlatform getDatabasePlatform() {
        return databasePlatform;
    }

    public void setDatabasePlatform(DatabasePlatform databasePlatform) {
        this.databasePlatform = databasePlatform;
    }

    public SoftwareLifecycle getSoftwareLifecycle() {
        return softwareLifecycle;
    }

    public void setSoftwareLifecycle(SoftwareLifecycle softwareLifecycle) {
        this.softwareLifecycle = softwareLifecycle;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public List<ProgrammingLanguage> getProgrammingLanguages() {
        return programmingLanguages;
    }

    public void setProgrammingLanguages(List<ProgrammingLanguage> programmingLanguages) {
        this.programmingLanguages = programmingLanguages;
    }

    public List<ProgrammingToolKit> getProgrammingToolKits() {
        return programmingToolKits;
    }

    public void setProgrammingToolKits(List<ProgrammingToolKit> programmingToolKits) {
        this.programmingToolKits = programmingToolKits;
    }

    public List<DesignPattern> getDesignPatterns() {
        return designPatterns;
    }

    public void setDesignPatterns(List<DesignPattern> designPatterns) {
        this.designPatterns = designPatterns;
    }

    public String getFormattedProjectTimeSpan(){

        String templateText = "%s %s - %s %s";
        String retval = null;

        String startMonthName = "";
        String endMonthName = "";

        String startYear = "";
        String endYear = "";

        if(this.startDate != null){

            startMonthName = this.startDate.getMonth().getDisplayName(TextStyle.SHORT, Locale.US);
            startYear = String.valueOf(this.startDate.getYear());
        }

        if(this.endDate != null){
            endMonthName = this.endDate.getMonth().getDisplayName(TextStyle.SHORT, Locale.US);
            endYear = String.valueOf(this.endDate.getYear());
        }
        else {
            endMonthName = "Present";
        }

        retval = String.format(templateText, startMonthName, startYear, endMonthName, endYear);

        return retval;

    }

    public String getDelimitedRoles(){
        String retval = null;

        retval = this.roles.stream()
                .map(x -> x.getName())
                .collect(Collectors.joining(", "));

        return retval;
    }

}
