package stepDefinitions;



import io.cucumber.java.en.*;
import junit.framework.Assert;
import utilities.apiutil;
import utilities.assertutil;
public class Steps extends apiutil {



	@When("User search for cocktail input {string}")
	public void user_search_for_cocktail_input(String drink) {
		callApi(drink);
	}
	
	@When("User search for ingredient input {string}")
	public void user_search_for_ingredient_input(String ingredient) {
		callApi(ingredient);
	}
	
	@Then("User should be able to search for cocktail status code {string}")
	public void user_should_be_able_to_search_for_cocktail(String statusCode) {
		int statusCodeInt = Integer.parseInt(statusCode);
	    assertutil.apiStausCode(statusCodeInt);
	}
	
	@Then("User should be able to search for ingredient status code {string}")
	public void user_should_be_able_to_search_for_ingredient_status_code(String statusCode) {
		int statusCodeInt = Integer.parseInt(statusCode);
	    assertutil.apiStausCode(statusCodeInt);
	}

	@Then("{string} searched should return null")
	public void earched_should_return_null(String str) throws Exception {
	    assertutil.assertNull(str);
	}
	
	@Then("Two searches should be the same {string} {string}")
	public void two_searches_should_be_the_same(String drink, String Drink) {
	    Assert.assertEquals(callApi(drink), callApi(Drink));
	}

	@Then("{string} response should contain {string} that is {string}")
	public void response_should_contain_that_is(String index,String param, String type) throws Exception {
		int Index = Integer.parseInt(index);
		getResponseBodyJsonArray("drinks", Index, "strDrink").getClass().equals(type);
	}
	
	@Then("If {string} returns no {string} should return null")
	public void if_returns_no_should_return_null(String string, String string2) throws Exception {
	    if(getResponseBodyJson(string) == "Yes") {
	    	assertutil.assertNull(string2);
	    }
	}
	
	@Then("If {string} returns yes {string} should return {string}")
	public void if_returns_yes_should_return(String string, String string2, String string3) throws Exception {
	    if(getResponseBodyJson(string) == "Yes") {
	    	Assert.assertEquals(getResponseBodyJson(string2), string3);
	    }
	}
	
	@Then("{string} should return all related drinks {string}")
	public void should_return_all_related_drinks(String string, String string2) throws Exception {
		getResponseBodyJsonArray(string, string2);
	}
















}
