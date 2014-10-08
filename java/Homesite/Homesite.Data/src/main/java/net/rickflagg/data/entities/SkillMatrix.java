package net.rickflagg.data.entities;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
public class SkillMatrix extends BaseEntity implements IEntity {

    private SkillMatrixCategory skillMatrixCategory;
    private double rating;

    public SkillMatrixCategory getSkillMatrixCategory() {
        return skillMatrixCategory;
    }

    public void setSkillMatrixCategory(SkillMatrixCategory skillMatrixCategory) {
        this.skillMatrixCategory = skillMatrixCategory;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }
}
