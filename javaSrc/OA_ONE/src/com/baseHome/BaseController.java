package com.baseHome;

import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import com.entity.MapEntity;
import com.google.gson.Gson;
import com.utils.GOJSON;
import com.utils.JsonUtils;

/**
 * extends MultiActionController BaseController paramMap
 */
/**
 * @author Administrator
 *
 */
public class BaseController {
	/**
	 * 分页对象
	 */
	protected List<Map<String,String>> pageList = new ArrayList<Map<String,String>>();
	
	/**
	 * 通用对象
	 */
	protected List<Map<String,String>> resultList = new ArrayList<Map<String,String>>();
	
	/**
	 * map数据对象
	 */
	protected Map<String,String> map = new HashMap<String,String>();
	/**
	 * dataMap数据传输对象
	 */
	protected Map<String,String> dataMap = new HashMap<String,String>();
	
	/**
	 * gojson对象
	 */
	protected Gson gson=new Gson();
	
	public String pageNumber;
	
	public String pageSize;
	

	
	/**
	 * form表单提交分页结构
	 */
	protected boolean readyPage(){
		boolean flag=true;
		if("".equals(pageNumber)&&pageNumber!=null&&"".equals(pageSize)&&pageSize!=null){
			PageHelper.startPage(Integer.valueOf(pageNumber),Integer.valueOf(pageSize));
		}else{
			PageHelper.startPage(1,10);
		}
		return flag;
	}
	
	/**
	 * 对象格式返回
	 * @param request
	 * @param list
	 * @return
	 */
/*	protected List<Map<String,Object>> queryAppPages(HttpServletRequest request,List list){
		PageHelper.endPage();
		return list;
	}*/
	
	/**
	 * string对象返回
	 * @param request
	 * @param list
	 * @return
	 */
	protected String queryAppPages(HttpServletRequest request,List list){
		long toal = PageHelper.endPage().getTotal();
		Map<String,Object> rMap=new HashMap<String, Object>();
		rMap.put("total", toal);
		rMap.put("rows", list);
		return GOJSON.getGson().toJson(rMap);
	}
	
	/**
	 * 分页结构抽象化
	 */
	protected List queryPages(boolean flag,List list){
		if(flag){
			pageList.clear();
			Map<String,String> rmap=new HashMap<String, String>();
			rmap.putAll(PageHelper.endPage().pageToMap());
			pageList.add(rmap);
//			pageList.putAll(PageHelper.endPage().pageToMap());
		}
		return list;
	}
	/**
	 * 重构
	 * @return
	 */
	protected List<Map<String,String>> queryPages(HttpServletRequest request,List<Map<String,String>> list){
		pageList.clear();
//		pageList.putAll(PageHelper.endPage().pageToMap());
		Map<String,String> rmap=new HashMap<String, String>();
		rmap.putAll(PageHelper.endPage().pageToMap());
		pageList.add(rmap);
		request.setAttribute("pageList", pageList);
		return list;
	}
	/**
	 * 地址栏提交分页结构
	 */
	protected HttpServletRequest readyPageRequest(HttpServletRequest request,String pageNumber,String pageSize){
		String number=pageNumber;
		String size=pageSize;
		if(number != null && !("").equals(number) && String.valueOf(size) != null && !("").equals(size)){
			PageHelper.startPage(Integer.valueOf(number),Integer.valueOf(size));
		}else{
			PageHelper.startPage(1,10);
		}
		
		return request;
	}

	/**
	 * 地址栏提交分页结构
	 */
//	protected HttpServletRequest readyPageRequest(HttpServletRequest request,String pageNumber){
//		String number=pageNumber;
////		String size=request.getParameter("pageSize");
//		String size="10";
//		if(number!=null&&!"".equals(number)){
////			PageHelper.startPage(Integer.valueOf(number),Integer.valueOf(size));
//			PageHelper.startPage(Integer.valueOf(number),10);
//		}else{
//			PageHelper.startPage(1,10);
//		}
//		return request;
//	}

	/**
	 * java反射机制
	 * @return
	 */
	protected  String getClassMethod(Object object,String str,String parm) throws Exception{
//		  object.getClass().getMethod(str, new Class[]{String.class}).invoke(object, new Object[]{}); 
		  String  result=null;
		  Class clz =object.getClass();
		  //重新实例这个方法
//		  Object obj = clz.newInstance();
		  //获取方法  
		  if(parm!=null&&!parm.equals("")){
			  //调用方法  
			 result =(String)object.getClass().getMethod(str,String.class).invoke(object,parm); 
		  }else{
			  result =(String)object.getClass().getMethod(str).invoke(object); 
		  }
		  return result;
	}

	public List<Map<String, String>> getPageList() {
		return pageList;
	}

	public void setPageList(List<Map<String, String>> pageList) {
		this.pageList = pageList;
	}

	public String getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(String pageNumber) {
		this.pageNumber = pageNumber;
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public String callbackJonp(String callbackparam,String json){
		String str="";
		if(callbackparam!=null){
			str=callbackparam+"("+json+")";
		}else{
			str=json;
		}
		return str;
	}
	
	public String SYSDATE(){
		Format format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(new Date());
	}
	
	
	/**
	 * 字符串json转MAP过滤
	 */
	public MapEntity byMap(MapEntity entity,String data){
		if(data!=null){
			entity.setMap(JsonUtils.jsonToMap(data));
		}
		return entity;
	}
	
	public Map<String,String> AppMap(Map<String,String> entityMap,String key,String value){
		Map<String,String> maps=entityMap;
		maps.put(key, value);
		return maps;
	}
	
	public String arryToStringSqlIn(String[] strAr){
		StringBuffer sb= new StringBuffer();
		for(int i=0;i<strAr.length;i++){
			sb.append("\'"+strAr[i]+"\',");
		}
		String str = sb.toString();
		return "("+str.substring(0,str.length()-1)+")";
	}
	
	public String jsonToSqlIn(String json){
		StringBuffer objStr=new StringBuffer();
		List<Map<String,String>> list=JsonUtils.jsonToLsitMap(json);
		if(list!=null&&list.size()>0){
			for(Map<String,String> itro:list){
				objStr.append("\'"+itro.get("props_id")+"\',");
			}
		}else{
			return null;
		}
		String str = objStr.toString();
		return str.substring(0,str.length()-1);
	}
	
	protected boolean isString(String str){
		if(str != null && !str.equals("")){
			return true;
		}
		return false;
	}
	
	protected boolean isList(List list){
		if(list != null && list.size()>0){
			return true;
		}
		return false;
	}
	//通用分页写法
	//List list=queryPages(readyPageRequest(request),**);
	
}
