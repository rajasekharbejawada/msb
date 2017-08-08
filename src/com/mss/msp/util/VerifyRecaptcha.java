package com.mss.msp.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;

import org.json.JSONArray;
import org.json.JSONObject;


public class VerifyRecaptcha
{
	

	public static final String url = "https://www.google.com/recaptcha/api/siteverify";
	public static final String secret = "6LfmzR8UAAAAAFnJnHn-n1WRfvCk1CTiHjAlJ18G";
	private final static String USER_AGENT = "Mozilla/5.0";
	public static boolean verify(String gRecaptchaResponse) throws IOException {
		System.out.println("grecptcha response "+gRecaptchaResponse);
		if (gRecaptchaResponse == null || "".equals(gRecaptchaResponse)) {
			return false;
		}
		
		try{
		URL obj = new URL(url);
		HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
		// add reuqest header
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", USER_AGENT);
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
		String postParams = "secret=" + secret + "&response="
				+ gRecaptchaResponse;
		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(postParams);
		wr.flush();
		wr.close();
		int responseCode = con.getResponseCode();
		System.out.println("Response Code : " + responseCode);
		BufferedReader in = new BufferedReader(new InputStreamReader(
				con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();
		System.out.println(response.toString());
		JSONObject jObject  = new JSONObject(response.toString());
		boolean success=(Boolean)jObject.get("success");
		/*if(!success)
		{
			JSONArray arrJson= jObject.getJSONArray("error-codes");
			String errorCode=arrJson.getString(0);
		System.out.println(errorCode);
		}
		*/
		return success;
		}catch(Exception e){
			System.out.println("In Catch-->"+e.getMessage());
			e.printStackTrace();
		//	return false;
			
		}
		return false;
	}
}
