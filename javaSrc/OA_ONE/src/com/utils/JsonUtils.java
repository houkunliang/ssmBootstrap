package com.utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@SuppressWarnings("unchecked")
public class JsonUtils {
	
	/**
	 * 把list转换成json
	 * @param List
	 * @return String
	 */
	public static String listToJson(List list) {
		String result_msg="\"list is null\"";
		Map<String,String> map = new HashMap<String,String>();
		Map<String,String> putMap = new HashMap<String,String>();
		if(list!=null&&list.size()>0){
			JSONArray jsonarry = new JSONArray();
		    try {
		    	for(int j=0;j<list.size();j++){
		    		putMap.clear();
					map=(HashMap<String,String>)list.get(j);
					JSONObject object = new JSONObject(); 
					Set  set=map.entrySet();  
			        Iterator   iterator=set.iterator();  
			        while (iterator.hasNext()) {  
			            Map.Entry  mapentry = (Map.Entry) iterator.next();  
//			            System.out.println(mapentry.getKey()+"/"+ mapentry.getValue());  
			            putMap.put(mapentry.getKey()+"", mapentry.getValue()+"");
			          }
					object=JSONObject.fromObject(putMap);
					jsonarry.add(object);
		    	}
		    	return jsonarry.toString();
			} catch (Exception e) {
				result_msg=e.toString();
			}
		}
		map.put("result", result_msg);   
//		map.put("result_msg", result_msg); 
		return result_msg;
	}
	
	/**
	 * 把Map转换成json
	 * @param List
	 * @return String
	 */
	public static String mapToJson(Map map) {
		Map<String,String> putMap = new HashMap<String,String>();
		Set  set=map.entrySet();  
        Iterator   iterator=set.iterator();  
        while (iterator.hasNext()) {  
            Map.Entry  mapentry = (Map.Entry) iterator.next();  
            putMap.put(mapentry.getKey()+"", mapentry.getValue()+"");
          }
		JSONObject object = new JSONObject();
		object = JSONObject.fromObject(putMap);
		return  object.toString();  
	}
	
	/**
	 * 把Map转换成json
	 * @param List
	 * @return String
	 */
	public static String mapJsonToJson(Map map) {
		Map putMap = new HashMap();
		Set  set=map.entrySet();  
        Iterator iterator=set.iterator();  
        while (iterator.hasNext()) {  
            Map.Entry  mapentry = (Map.Entry) iterator.next();  
            if(mapentry.getKey()!=null&&mapentry.getKey().equals("propsAll")){
            	 putMap.put(mapentry.getKey()+"",JSONArray.fromObject(mapentry.getValue()));
            }else if(mapentry.getKey()!=null&&mapentry.getKey().equals("bind_data")){
            	if(mapentry.getValue()!=null&&!mapentry.getValue().equals("")){
            		 putMap.put(mapentry.getKey()+"",JSONArray.fromObject(mapentry.getValue()));
            	}
             }else if(mapentry.getKey()!=null&&mapentry.getKey().equals("auditPerson")){
             	if(mapentry.getValue()!=null&&!mapentry.getValue().equals("")){
           		 putMap.put(mapentry.getKey()+"",JSONArray.fromObject(mapentry.getValue()));
           	}
            }else{
            	putMap.put(mapentry.getKey()+"", mapentry.getValue()+"");
            }
          }
		JSONObject object = new JSONObject();
		object = JSONObject.fromObject(putMap);
		return  object.toString();  
	}

	
	/** 
    * 将json格式的字符串解析成Map对象 <li> 
    * json格式：{"name":"admin","retries":"3fff","testname":"ddd","testretries":"fffffffff"} 
    */  
	public static HashMap<String, String> jsonToMap(Object object){  
	       HashMap<String, String> data = new HashMap<String, String>();  
	       // 将json字符串转换成jsonObject  
	       JSONObject jsonObject = JSONObject.fromObject(object);  
	       Iterator it = jsonObject.keys();  
	       // 遍历jsonObject数据，添加到Map对象  
	       while (it.hasNext())  
	       {  
	           String key = String.valueOf(it.next());  
	           String value = (Object) jsonObject.get(key)+"";  
	           if(value != null && !("").equals(value)){
	        	   data.put(key, value);  
	           }
	       }  
	       return data;  
	 }
	
	  /** 
	    * 将json格式的字符串解析成List<Map<String,String>>对象 <li> 
	    * json格式：[{"name":"admin","retries":"3fff"},{"name":"admin","retries":"3fff"},{"name":"admin","retries":"3fff"}]
	    */  
		public static List<Map<String, String>> jsonToLsitMap(Object object){  
		       HashMap<String, String> data = null;  
		       List<Map<String, String>> resuleList=new ArrayList<Map<String,String>>();
		       // 将json字符串转换成数组
		       JSONArray jsonarry =JSONArray.fromObject(object);
		       Object[] array=jsonarry.toArray();
		       if(array!=null){
		    	   if(array.length!=0){
		    		   for(int i=0;i<array.length;i++){
				    	   data = new HashMap<String, String>();  
				    	   JSONObject jsonObject = JSONObject.fromObject(array[i]);
				    	   Iterator it = jsonObject.keys();  
					       // 遍历jsonObject数据，添加到Map对象  
					       while (it.hasNext())  
					       {  
					           String key = String.valueOf(it.next());  
					           String value = (Object) jsonObject.get(key)+"";  
					           data.put(key, value);  
					       }
					       resuleList.add(data);
				       }
		    	   }
		       }
		       return resuleList;  
		 }
		
		public static String treeListToJson(List<Map<String,String>> treeList,String keyId,String keyName){
			//拼装json的过程
			List list = new ArrayList();
			for (Map<String,String> temp : treeList) {
				String id = temp.get(keyId);
				String name = temp.get(keyName);
				String pId = temp.get("PARENT_ID");
				Map map = new HashMap();
				map.put("id", id);
				map.put("name", name);
				map.put("pId", pId);
				if("0".equals(pId)){
					map.put("open", true);
				}
				if(pId==null || "".equals(pId)){
					map.put("pId", "0");
					map.put("open", true);
				}
				//如果是编辑页面则判断是否有传入问题id，获取问题节点，使其被选中状态
				list.add(map);
			}
			JSONArray array = JSONArray.fromObject(list);
			System.out.println("show========"+array.toString());
			return array.toString();
		}
		
}
