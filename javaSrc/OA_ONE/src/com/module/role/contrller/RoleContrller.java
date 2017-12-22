package com.module.role.contrller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.baseHome.BaseController;
import com.module.role.service.RoleService;
import com.utils.DateUtil;
import com.utils.JsonUtils;
import com.utils.idUtil;



@Controller
@RequestMapping("/role")
public class RoleContrller extends BaseController{
	@Resource(name="roleService")
	private RoleService service;

	@ResponseBody
	@RequestMapping(value="/queryRoleAll",produces = "text/html;charset=UTF-8")
	public String queryUserAll(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(service.selectByRole(dataMap));
	}
	
	
	@ResponseBody
	@RequestMapping(value="/queryRoleToMenu",produces = "text/html;charset=UTF-8")
	public String queryRoleToMenu(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(service.selectByRoleToMenu(dataMap));
	}
	
	@ResponseBody
	@RequestMapping(value="/add",produces = "text/html;charset=UTF-8")
	public String add(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		dataMap.put("ROLE_ID", idUtil.getID());
		dataMap.put("CREATED_DT",DateUtil.SYSDATEFORMATE());
		return "{\"result\":\""+ service.insertByRole(dataMap) +"\"}";
	}
	
	@ResponseBody
	@RequestMapping(value="/setRoot",produces = "text/html;charset=UTF-8")
	public String setRoot(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		List<Map<String,String>> list=new ArrayList<Map<String,String>>();
		int falg=0;
		String rootStr=dataMap.get("rootArr");
		if(rootStr != null && !rootStr.equals("")){
			list=JsonUtils.jsonToLsitMap(rootStr);
		}
		map.put("ROLE_ID", dataMap.get("roleId"));
		service.deleteByRoleOpt(map);
		if(isList(list)){
			for(Map<String,String> itro:list){
				falg+=service.insertByRoleOpt(itro);
			}
		}
		return "{\"result\":\""+falg+"\"}";
	}
	
	@ResponseBody
	@RequestMapping(value="/update",produces = "text/html;charset=UTF-8")
	public String update(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		//删除中间表
		/*if(dataMap.containsKey("IS_DELETED")){
			if(dataMap.get("IS_DELETED").equals("Y")){
			service.deleteRRTable(dataMap);
			}
		}*/
		return "{\"result\":\""+service.updateByRole(dataMap)+"\"}";
	}
	@ResponseBody
	@RequestMapping(value="/updateRTD",produces = "text/html;charset=UTF-8")
	public String updateRTD(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		//System.out.println(dataMap);
		return "{\"result\":\""+service.updateRTD(dataMap)+"\"}";
	}
	
	@ResponseBody
	@RequestMapping(value="/del",produces = "text/html;charset=UTF-8")
	public String del(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		System.out.println(dataMap);
		return "{\"result\":\""+service.deleteByRole(dataMap)+"\"}";
	}
	
}
