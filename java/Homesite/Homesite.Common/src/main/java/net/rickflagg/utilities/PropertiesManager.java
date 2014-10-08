package net.rickflagg.utilities;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Author: Rick Flagg
 * Date: 10/7/14
 * Time: 4:26 AM
 * Email: rick.flagg@gmail.com
 * Website: rickflagg.net
 */
public class PropertiesManager {

    private String propertiesFilename;
    private Properties properties;

    public PropertiesManager(String propertiesFile) throws IOException
    {
       this.propertiesFilename = propertiesFile;
       this.initialize();
    }

    private void initialize() throws IOException
    {
        properties = new Properties();
        properties.load(PropertiesManager.class.getClassLoader().getResourceAsStream(propertiesFilename));
    }

    public String getStringProperty(Object key) {
        return properties.get(key).toString();
    }
}
