package com.utils;

import com.google.gson.Gson;

public class GOJSON {
	
	private static Gson gson =new Gson();
	
	public static Gson getGson(){
		if(gson == null){
			gson =new Gson();
			return gson;
		}else{
			return gson;
		}
	}
	
}
