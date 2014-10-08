package net.rickflagg.services;

import net.rickflagg.crypto.SimpleEncrption;
import net.rickflagg.data.entities.ServiceToken;
import net.rickflagg.data.repositories.IServiceTokenRepository;
import net.rickflagg.services.context.IServiceContextParameter;
import net.rickflagg.services.results.ServiceTokenResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.naming.NamingException;
import java.sql.SQLException;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
@Service("applicationTokenService")
@Transactional
public class ApplicationTokenService {

    @Value("${crypto.key}")
    private String cryptoKey;

    @Value("${crypto.seed}")
    private String cryptoSeed;


    @Autowired
    private LoggingService loggingService;

    @Autowired
    private IServiceTokenRepository serviceTokenRepository;

    @Autowired
    private Environment environment;


    public ServiceTokenResult validateToken(IServiceContextParameter prm, ServiceToken token){

        ServiceTokenResult result = new ServiceTokenResult();

        loggingService.logMessage(prm, this.getClass().getName(),
                String.format("Attempting to validate token from keys: %s %s %s %s",
                        token.getKey1(), token.getKey2(), token.getKey3(), token.getKey4()));

        try {

            ServiceToken evalToken = serviceTokenRepository.findServiceToken(token.getKey1(),
                    token.getKey2(), token.getKey3(), token.getKey4());

            if(evalToken != null && evalToken.hasKeys()){

                loggingService.logMessage(prm, this.getClass().getName(),
                        String.format("Found token: %s", evalToken.getName()));


                result.setServiceToken(evalToken);
                result.setSuccessful(true);
                result.setError(false);
            }
            else {

                loggingService.logMessage(prm, this.getClass().getName(),
                        String.format("Could not find token for keys: %s %s %s %s",
                                token.getKey1(), token.getKey2(),
                                token.getKey3(), token.getKey4()));


                result.setServiceToken(null);
                result.setSuccessful(false);
                result.setError(false);

            }

        }
        catch (SQLException sex){
            loggingService.logSQLException(prm,sex, this.getClass().getName());
            result.setError(true);
            result.setErrorMessage(sex.getMessage());
        }
        catch (NamingException nex){
            loggingService.logNamingException(prm, nex, this.getClass().getName());
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

    public ServiceTokenResult createToken(IServiceContextParameter prm, String key1,
                                 String key2, String key3, String key4){

         ServiceTokenResult result = new ServiceTokenResult();



         loggingService.logMessage(prm, this.getClass().getName(),
                 String.format("Attempting to create token from keys: %s %s %s %s", key1, key2, key3, key4));


        try
         {
            String encryptedKey1 = SimpleEncrption.encrypt(cryptoKey, cryptoSeed, key1);
            String encryptedKey2 = SimpleEncrption.encrypt(cryptoKey, cryptoSeed, key2);
            String encryptedKey3 = SimpleEncrption.encrypt(cryptoKey, cryptoSeed, key3);
            String encryptedKey4 = SimpleEncrption.encrypt(cryptoKey, cryptoSeed, key4);

             loggingService.logMessage(prm, this.getClass().getName(),
                     String.format("Attempting to find token from encrypted keys: %s %s %s %s",
                             encryptedKey1, encryptedKey2, encryptedKey3, encryptedKey4));

            ServiceToken token = serviceTokenRepository.findServiceToken(encryptedKey1, encryptedKey2,
                    encryptedKey3, encryptedKey4);


            if(token != null){

                loggingService.logMessage(prm, this.getClass().getName(),
                        String.format("Found token: %s", token.getName()));


                result.setServiceToken(token);
                result.setSuccessful(true);
            }
            else{

                loggingService.logMessage(prm, this.getClass().getName(),
                        String.format("Could not find token for keys: %s %s %s %s",
                                encryptedKey1, encryptedKey2, encryptedKey3, encryptedKey4));


                result.setSuccessful(false);
                result.setServiceToken(null);
            }

         }
         catch (SQLException sex){
            loggingService.logSQLException(prm,sex, this.getClass().getName());
            result.setError(true);
            result.setErrorMessage(sex.getMessage());
         }
        catch (NamingException nex){
            loggingService.logNamingException(prm, nex, this.getClass().getName());
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
