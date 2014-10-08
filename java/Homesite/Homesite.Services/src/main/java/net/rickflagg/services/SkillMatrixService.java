package net.rickflagg.services;

import net.rickflagg.data.entities.SkillMatrix;
import net.rickflagg.data.postgresql.repositories.SkillMatrixRepository;
import net.rickflagg.services.context.IServiceContextParameter;
import net.rickflagg.services.results.SkillMatrixResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.naming.NamingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
@Service
@Transactional
public class SkillMatrixService {


    @Autowired
    private LoggingService loggingService;

    @Autowired
    private SkillMatrixRepository skillMatrixRepository;

    public SkillMatrixResult getAll(IServiceContextParameter prm){

        SkillMatrixResult result  = new SkillMatrixResult();

        try
        {
            loggingService.logMessage(prm, this.getClass().getName(),
                    "Pulling skill matrix");

            List<SkillMatrix> matrices = skillMatrixRepository.retrieveAll();

            if(matrices != null && matrices.size() > 0)
            {
                for(SkillMatrix skillMatrix : matrices){
                    if(result.getSkillMatrixMap().containsKey(skillMatrix.getSkillMatrixCategory().getName())){
                        result.getSkillMatrixMap().get(skillMatrix.getSkillMatrixCategory().getName()).add(skillMatrix);
                    }
                    else{

                        List<SkillMatrix> newMatrices = new ArrayList<SkillMatrix>();

                        newMatrices.add(skillMatrix);

                        result.getSkillMatrixMap()
                                .put(
                                        skillMatrix.getSkillMatrixCategory().getName(),
                                        newMatrices
                                );
                    }
                }
            }

        }
        catch (SQLException sex){
            loggingService.logSQLException(prm,sex, this.getClass().getName());
            result.setSuccessful(false);
            result.setError(true);
            result.setErrorMessage(sex.getMessage());
        }
        catch (NamingException nex){
            loggingService.logNamingException(prm, nex, this.getClass().getName());
            result.setSuccessful(false);
            result.setError(true);
            result.setErrorMessage(nex.getMessage());
        }
        catch (Exception ex){
            loggingService.logGeneralException(prm, ex, this.getClass().getName());

            result.setSuccessful(false);
            result.setError(true);
            result.setErrorMessage(ex.getMessage());
        }

        return result;
    }


}
