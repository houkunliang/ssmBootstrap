package com.module.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.utils.BaseMsgGetToJson;

public class MappingException implements HandlerExceptionResolver{
	private static Logger log = LoggerFactory.getLogger(MappingException.class);  
	 
	@Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,  Exception ex) {    
        ModelAndView mv = new ModelAndView();
        try {
			getWiter(response,BaseMsgGetToJson.getError(ex.getMessage()));
		} catch (IOException e) {
			e.printStackTrace();
		}
        log.debug(ex.getMessage(), ex);
        return mv;  
	} 
	
    private void getWiter(HttpServletResponse response,String getMsg) throws IOException{
    	response.setCharacterEncoding("utf-8");
    	response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();    
	    StringBuilder builder = new StringBuilder();
        builder.append(getMsg);    
        out.print(builder.toString());
        out.close(); 
    }
}