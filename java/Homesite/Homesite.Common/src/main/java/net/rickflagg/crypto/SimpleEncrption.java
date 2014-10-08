package net.rickflagg.crypto;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: ${TIME}
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
import java.io.IOException;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import net.rickflagg.utilities.PropertiesManager;

public class SimpleEncrption {

    public static String encrypt(String cryptoKey, String seed, String cleartext) throws Exception {
        byte[] rawKey = getRawKey(seed.getBytes());
        byte[] result = encrypt(rawKey, cleartext.getBytes());
        return toHex(cryptoKey, result);
    }

    public static String decrypt(String cryptoKey, String seed, String encrypted) throws Exception {
        byte[] rawKey = getRawKey(seed.getBytes());
        byte[] enc = toByte(encrypted);
        byte[] result = decrypt(rawKey, enc);
        return new String(result);
    }

    private static byte[] getRawKey(byte[] seed) throws Exception {
        KeyGenerator kgen = KeyGenerator.getInstance("AES");
        SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
        sr.setSeed(seed);
        kgen.init(128, sr); // 192 and 256 bits may not be available
        SecretKey skey = kgen.generateKey();
        byte[] raw = skey.getEncoded();
        return raw;
    }


    private static byte[] encrypt(byte[] raw, byte[] clear) throws Exception {
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
        byte[] encrypted = cipher.doFinal(clear);
        return encrypted;
    }

    private static byte[] decrypt(byte[] raw, byte[] encrypted) throws Exception {
        SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.DECRYPT_MODE, skeySpec);
        byte[] decrypted = cipher.doFinal(encrypted);
        return decrypted;
    }

    public static String toHex(String cryptoKey, String txt) throws IOException{
        return toHex( cryptoKey,txt.getBytes());
    }
    public static String fromHex(String hex) {
        return new String(toByte(hex));
    }

    public static byte[] toByte(String hexString) {
        int len = hexString.length()/2;
        byte[] result = new byte[len];
        for (int i = 0; i < len; i++)
            result[i] = Integer.valueOf(hexString.substring(2*i, 2*i+2), 16).byteValue();
        return result;
    }

    public static String toHex(String cryptoKey, byte[] buf) throws IOException{
        if (buf == null)
            return "";
        StringBuffer result = new StringBuffer(2*buf.length);
        for (int i = 0; i < buf.length; i++) {
            appendHex(cryptoKey,result, buf[i]);
        }
        return result.toString();
    }

    private static void appendHex(String cryptoKey, StringBuffer sb, byte b) throws IOException{
        sb.append(cryptoKey.charAt((b >> 4) & 0x0f)).append(cryptoKey.charAt(b & 0x0f));
    }

    /*
    private static void appendHex(StringBuffer sb, byte b) throws IOException{
        sb.append(SimpleEncrption.getCryptoString().charAt((b >> 4) & 0x0f)).append(SimpleEncrption.getCryptoString().charAt(b & 0x0f));
    }
    */

    /*
    private static String getCryptoString() throws IOException{
        return  new PropertiesManager("application.properties").getStringProperty("crypto.key");
    }
    */

}
