package utilities;

import static io.restassured.RestAssured.given;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import io.restassured.response.Response;

public class apiutil extends BaseClass {

	public static Response response; 
	public static String jsonString;

	
	public static String callApi(String input) {
		response = 
		
		given().when() .get(getPropertyString("uri") + "/api/json/v1/1/search.php?s="+input).then().statusCode(200).log().body()
		.extract().response();
		
	  jsonString = response.asString();
	 
	 return jsonString;
	}
	
	
	public static String getResponseBody() {
		return jsonString;
	}
	
	
	public static Object getResponseBodyJson(String param) throws Exception {

		JSONParser Jparse = new JSONParser();
		Object obj = Jparse.parse(jsonString);
		JSONObject job = (JSONObject)obj;

		return job.get(param);
	
	}
	
	public static void getResponseBodyJsonArray(String arrayParam, String param) throws Exception {
		
		JSONArray arr = (JSONArray)getResponseBodyJson(arrayParam);
		
		for(int i = 0; i<arr.size(); i++) {
			
			JSONObject object = (JSONObject)arr.get(i);
			String value = (String)object.get(param);
			System.out.println(param+ " is " + value);
			
		}
		
	}
	
	public static Object getResponseBodyJsonArray(String arrayParam, int index, String param) throws Exception {
		
		JSONArray arr = (JSONArray)getResponseBodyJson(arrayParam);
		JSONObject object = (JSONObject) arr.get(index);
		
		return object.get(param);

	}

	
}
