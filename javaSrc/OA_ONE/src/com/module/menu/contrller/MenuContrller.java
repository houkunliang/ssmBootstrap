package com.module.menu.contrller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.baseHome.BaseController;
import com.module.menu.service.MenuService;
import com.utils.DateUtil;
import com.utils.JsonUtils;
import com.utils.idUtil;



@Controller
@RequestMapping("/menu")
public class MenuContrller extends BaseController{
	@Resource(name="menuService")
	private MenuService service;

	@ResponseBody
	@RequestMapping(value="/MenuAndButtonList",produces = "text/html;charset=UTF-8")
	public String MenuAndButtonList(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(service.MenuAndButtonList(dataMap));
	}
	
	@ResponseBody
	@RequestMapping(value="/buttonSelect",produces = "text/html;charset=UTF-8")
	public String buttonSelect(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(service.buttonSelect(dataMap));
	}
	
	@ResponseBody
	@RequestMapping(value="/roleToButtonList",produces = "text/html;charset=UTF-8")
	public String roleToButtonList(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(service.roleToButtonList(dataMap));
	}

	@ResponseBody
	@RequestMapping(value="/userToRooleButton",produces = "text/html;charset=UTF-8")
	public String userToRooleButton(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		Map<String,String> tokenMap=JsonUtils.jsonToMap(dataMap.get("token"));
		return  JsonUtils.listToJson(service.userToRooleButton(dataMap));
	}
	
	
	@ResponseBody
	@RequestMapping(value="/insertButtonRole",produces = "text/html;charset=UTF-8")
	public String insertButtonRole(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		List<Map<String,String>> list=new ArrayList<Map<String,String>>();
		int falg=0;
		String rootStr=dataMap.get("butRrootArr");
		if(rootStr != null && !rootStr.equals("")){
			list=JsonUtils.jsonToLsitMap(rootStr);
		}
		map.put("ROLE_ID", dataMap.get("roleId"));
		service.deleteButtonRole(map);
		if(isList(list)){
			for(Map<String,String> itro:list){
				falg+=service.insertButtonRole(itro);
			}
		}
		return "{\"result\":\""+falg+"\"}";
	}

	
	@ResponseBody
	@RequestMapping(value="/insertButton",produces = "text/html;charset=UTF-8")
	public String insertButton(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return "{\"result\":\""+service.insertButton(dataMap)+"\"}";
	}
	
	@ResponseBody
	@RequestMapping(value="/updateByButton",produces = "text/html;charset=UTF-8")
	public String updateByButton(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return "{\"result\":\""+service.updateByButton(dataMap)+"\"}";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/queryMenuAll",produces = "text/html;charset=UTF-8")
	public String queryMenuAll(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(service.selectMenuByPrimaryKey(dataMap));
	}
	
	@ResponseBody
	@RequestMapping(value="/queryMenuSelect",produces = "text/html;charset=UTF-8")
	public String queryMenuSelect(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(service.queryMenuSelect(dataMap));
	}
	
	@ResponseBody
	@RequestMapping(value="/add",produces = "text/html;charset=UTF-8")
	public String add(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return "{\"result\":\""+service.insertSelective(dataMap)+"\"}";
	}
	
	@ResponseBody
	@RequestMapping(value="/update",produces = "text/html;charset=UTF-8")
	public String update(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return "{\"result\":\""+service.updateByPrimaryKeySelective(dataMap)+"\"}";
	}
	
	@ResponseBody
	@RequestMapping(value="/logicDel",produces = "text/html;charset=UTF-8")
	public String logicDel(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		dataMap.put("IS_DELETED", "Y");
		return "{\"result\":\""+service.updateByPrimaryKeySelective(dataMap)+"\"}";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/del",produces = "text/html;charset=UTF-8")
	public String del(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return "{\"result\":\""+service.deleteByPrimaryKey(dataMap)+"\"}";
	}
}
