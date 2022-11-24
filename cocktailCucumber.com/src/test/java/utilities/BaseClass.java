package utilities;

import java.io.FileInputStream;
import java.nio.charset.Charset;
import java.util.Properties;

import org.json.simple.JSONObject;

public class BaseClass {

	private static Properties Configfile;

	static {
		try {
			String path = "src/test/resources/propertiesFolder/config.properties";
			FileInputStream input = new FileInputStream(path);

			Configfile = new Properties();
			Configfile.load(input);

			input.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static String getPropertyString(String key) {

		return Configfile.getProperty(key);
	}

		  
}


