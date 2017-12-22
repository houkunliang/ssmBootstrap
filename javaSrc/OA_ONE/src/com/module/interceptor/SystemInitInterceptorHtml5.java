package com.module.interceptor;


import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import org.springframework.stereotype.Repository;  
import org.springframework.web.servlet.HandlerInterceptor;  
import org.springframework.web.servlet.ModelAndView;  

import com.google.gson.Gson;
import com.module.user.service.UserService;
import com.utils.JsonUtils;
  
/** 
 *  
 * @author DuZhuo 
 * 登录拦截器 
 */  
@Repository  
public class SystemInitInterceptorHtml5 implements HandlerInterceptor {  
	
	@Resource(name="userService")
	private UserService userService;
	
    @Override  
    public void afterCompletion(HttpServletRequest arg0,  
            HttpServletResponse arg1, Object arg2, Exception arg3)  
            throws Exception {  
          
    }  
  
    @Override  
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,  
            Object arg2, ModelAndView arg3) throws Exception {  
          
    }  
  
    @Override  
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,  
            Object arg2) throws Exception {
    	//拦截参数打印
    	System.out.println("requestPram:"+request.getParameter("data"));
	    Map<String,String> map=byMap(request.getParameter("data"));
	    Map<String,String> vaMap=JsonUtils.jsonToMap(byMap(request.getParameter("data")).get("token"));
	        if(map==null||map.get("token")==null||map.get("token").equals("")){
	    		PrintWriter out = response.getWriter();    
	    	    StringBuilder builder = new StringBuilder();
	            builder.append(callbackJonp(request.getParameter("callbackparam"),"{\"Code\":\"100\",\"CodeMsg\":\"Login information error\"}"));    
	            out.print(builder.toString());    
	            out.close(); 
	            return false;  
	        }else{
	        	//实现类代码业务代码
	        	
	        }
        return true;  
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
	public Map<String, String> byMap(String data){
		Map<String,String> map=new HashMap<String, String>();
		if(data!=null&&!data.equals("")){
			map=JsonUtils.jsonToMap(data);
		}
		return map;
	}
}  