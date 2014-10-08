package net.rickflagg.services.results;

import net.rickflagg.data.entities.SkillMatrix;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: rflagg
 * Date: 10/4/14
 * Time: 7:57 AM
 * To change this template use File | Settings | File Templates.
 */
public class SkillMatrixResult extends ServiceResultBase {

    private Map<String, List<SkillMatrix>> skillMatrixMap;

    public Map<String, List<SkillMatrix>> getSkillMatrixMap() {
        return skillMatrixMap;
    }

    public void setSkillMatrixMap(Map<String, List<SkillMatrix>> skillMatrixMap) {
        this.skillMatrixMap = skillMatrixMap;
    }

    public SkillMatrixResult(){
        skillMatrixMap = new HashMap<String, List<SkillMatrix>>();
    }
}
