package net.rickflagg.crypto.tests;

import net.rickflagg.crypto.SimpleEncrption;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import net.rickflagg.utilities.PropertiesManager;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */

public class SimpleEncrptionTest {
    @Test
    public void testEncrypt() throws Exception {

        String originalText = "This is my Original String";
        String encrytpedText = SimpleEncrption.encrypt(getCryptoKey(), this.getCryptoSeed(),originalText);
        assertThat(originalText, not(encrytpedText));


    }

    @Test
    public void testDecrypt() throws Exception {
        String originalText = "This is my Original String";
        String encrytpedText = SimpleEncrption.encrypt(getCryptoKey(), this.getCryptoSeed(),originalText);
        String decryptedText = SimpleEncrption.decrypt(getCryptoKey(), this.getCryptoSeed(), encrytpedText);

        assertThat(encrytpedText, not(originalText));
        assertThat(decryptedText, is(originalText));

    }

    @Test
    public void testCryptoOutput() throws Exception{

        System.out.println("Key1: " + SimpleEncrption.encrypt(this.getCryptoKey(), this.getCryptoSeed(), "abc123"));
        System.out.println("Key2: " + SimpleEncrption.encrypt(this.getCryptoKey(),this.getCryptoSeed(), "def456"));
        System.out.println("Key3: " + SimpleEncrption.encrypt(this.getCryptoKey(),this.getCryptoSeed(), "ghi789"));
        System.out.println("Key4: " + SimpleEncrption.encrypt(this.getCryptoKey(),this.getCryptoSeed(), "jkl012"));


    }

    private String getCryptoSeed() throws Exception
    {
         return new PropertiesManager("application.properties").getStringProperty("crypto.seed");
    }

    private String getCryptoKey() throws Exception
    {
        return new PropertiesManager("application.properties").getStringProperty("crypto.key");
    }
}
