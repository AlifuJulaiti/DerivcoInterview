package utilities;

import org.junit.Assert;

public class assertutil extends apiutil {
	
	public static void apiStausCode(int statusCode) {
		Assert.assertEquals(statusCode, response.getStatusCode());
	}

	public static void assertNull(String str) throws Exception {
		Assert.assertNull(getResponseBodyJson(str));
	}

	public static void assertEquals(String str, String str2) throws Exception {
		Assert.assertEquals(null, getResponseBodyJson(str), str);
	}
}
