package com.module.region.contrller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baseHome.BaseController;
import com.module.region.service.RegionService;
import com.utils.DateUtil;
import com.utils.JsonUtils;

@Controller
@RequestMapping("/region")
public class RegionContrller extends BaseController{
	@Resource(name="regionService")
	private RegionService service;

	@ResponseBody
	@RequestMapping(value="/queryRegionAll",produces = "text/html;charset=UTF-8")
	public String queryRegionAll(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(service.selectByRegion(dataMap));
	}
	
	@ResponseBody
	@RequestMapping(value="/queryRole",produces = "text/html;charset=UTF-8")
	public String queryRole(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(service.queryUser(dataMap));
	}
	@ResponseBody
	@RequestMapping(value="/queryRegionRoleAll",produces = "text/html;charset=UTF-8")
	public String queryRegionRoleAll(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);		
		return  JsonUtils.listToJson(service.queryRegionRoleSelect(dataMap));
	}
	
	@ResponseBody
	@RequestMapping(value="/add",produces = "text/html;charset=UTF-8")
	public String add(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return "{\"result\":\""+service.insertByRegion(dataMap)+"\"}";
	}
	@ResponseBody
	@RequestMapping(value="/update",produces = "text/html;charset=UTF-8")
	public String update(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		//System.out.println(data);
		dataMap.put("UPDATED_DT", DateUtil.SYSDATEFORMATE());
		return "{\"result\":\""+service.updateByRegion(dataMap)+"\"}";
	}
	
	@ResponseBody
	@RequestMapping(value="/del",produces = "text/html;charset=UTF-8")
	public String del(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return "{\"result\":\""+service.deleteByRegion(dataMap)+"\"}";
	}
	
	@ResponseBody
	@RequestMapping(value="/queryMenuSelect",produces = "text/html;charset=UTF-8")
	public String queryMenuSelect(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(service.queryMenuSelect(dataMap));
	}
	@ResponseBody
	@RequestMapping(value="/queryRegionByLogUser",produces = "text/html;charset=UTF-8")
	public String queryRegionByLogUser(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(service.queryRegionByLogUser(dataMap));
	}
}
