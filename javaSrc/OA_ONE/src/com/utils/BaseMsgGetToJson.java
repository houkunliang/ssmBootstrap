package com.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BaseMsgGetToJson {
	
	/**
	 * 验证成功，返回json格式
	 * @param dataList
	 * @return
	 */
	public static String getSuccess(String str){
		Map<String,Object> getMap=new HashMap<String,Object>();
		getMap.put("Code","0");
		getMap.put("result",str);
		return GOJSON.getGson().toJson(getMap);
	}

	/**
	 * 错误统一标示，返回 json 格式
	 * @return
	 */
	public static String getError(){
		Map<String,Object> getMap=new HashMap<String,Object>();
		getMap.put("Code","100");
		getMap.put("result","失败!");
		return GOJSON.getGson().toJson(getMap);
	}
	
	public static String getError(String str){
		Map<String,Object> getMap=new HashMap<String,Object>();
		getMap.put("Code","100");
		getMap.put("result",str);
		return GOJSON.getGson().toJson(getMap);
	}
	
	
	/**
	 * 验证成功，返回json格式
	 * @param dataList
	 * @return
	 */
	public static String getSuccess(){
		Map<String,Object> getMap=new HashMap<String,Object>();
		getMap.put("Code","0");
		getMap.put("result","成功!");
		return GOJSON.getGson().toJson(getMap);
	}
	
	
	
	public static String getSuccess(List dataList){
		Map<String,Object> getMap=new HashMap<String,Object>();
		getMap.put("Code","0");
		getMap.put("result","Success");
		if(dataList != null && dataList.size() > 0){
			getMap.put("DataList",dataList);
		}else{
			getMap.put("DataList",new ArrayList<>());
		}
		return GOJSON.getGson().toJson(getMap);
	}
	

	
	public static String getSuccess(Integer code,String codeMsg,List dataList){
		Map<String,Object> getMap=new HashMap<String,Object>();
		getMap.put("Code",code);
		getMap.put("result",codeMsg);
		if(dataList != null && dataList.size() > 0){
			getMap.put("DataList",dataList);
		}
		return GOJSON.getGson().toJson(getMap);
	}

	/**
	 * 新增修改返回方式
	 * @param dataList
	 * @return
	 */
	public static String getResult(String str){
		Map<String,Object> getMap=new HashMap<String,Object>();
		getMap.put("result",str);
		return GOJSON.getGson().toJson(getMap);
	}
}
