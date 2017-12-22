package com.module.department.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baseHome.BaseController;
import com.module.department.service.DepartmentService;
import com.utils.JsonUtils;

@Controller
@RequestMapping("/department")
public class DepartmentController extends BaseController{
	@Resource(name="departmentService")
	private DepartmentService service;
	
	@ResponseBody
	@RequestMapping(value="/queryDepartmentAll",produces = "text/html;charset=UTF-8")
	public String queryDepartmentAll(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		//System.out.println(JsonUtils.listToJson(service.selectByDepartment(dataMap)));
		return  JsonUtils.listToJson(service.selectByDepartment(dataMap));
	}
/*	*//**
	 * 查询地区列表
	 * @param request
	 * @param model
	 * @param data
	 * @return
	 *//*
	@ResponseBody
	@RequestMapping(value="/queryRegionSelect",produces = "text/html;charset=UTF-8")
	public String queryRegionSelect(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(service.queryRegionSelect(dataMap));
	}
	@ResponseBody
	@RequestMapping(value="/queryRegionADS",produces = "text/html;charset=UTF-8")
	public String queryRegionADS(HttpServletRequest request,Model model,String data) {
		dataMap.put("ADS", "s");
		System.out.println("=============================="+JsonUtils.listToJson(service.queryRegionSelect(dataMap)));
		return  JsonUtils.listToJson(service.queryRegionSelect(dataMap));
	}*/
	@ResponseBody
	@RequestMapping(value="/add",produces = "text/html;charset=UTF-8")
	public String add(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		//dataMap.put("CREATED_DT", DateUtil.SYSDATEFORMATE());
		//System.out.println(JsonUtils.listToJson(service.insertByDepartment(dataMap)));
		return "{\"result\":\""+service.insertByDepartment(dataMap)+"\"}";
	}
	
	@ResponseBody
	@RequestMapping(value="/update",produces = "text/html;charset=UTF-8")
	public String update(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		//将区域id赋值给当前部门的父ID
		//dataMap.put("PARENT_ID", dataMap.get("REGION_ID"));
		//System.out.println(JsonUtils.listToJson(service.selectByDepartment(dataMap)));
		return "{\"result\":\""+service.updateByDepartment(dataMap)+"\"}";
	}
	
	/*@ResponseBody
	@RequestMapping(value="/logicDel",produces = "text/html;charset=UTF-8")
	public String logicDel(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		dataMap.put("IS_DELETED", "Y");
		return "{\"result\":\""+service.updateByPrimaryKeySelective(dataMap)+"\"}";
	}*/
	
	
	@ResponseBody
	@RequestMapping(value="/del",produces = "text/html;charset=UTF-8")
	public String del(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		//将区域id赋值给当前部门的父ID
		//dataMap.put("PARENT_ID", dataMap.get("REGION_ID"));
		//System.out.println(JsonUtils.listToJson(service.selectByDepartment(dataMap)));
		return "{\"result\":\""+service.deleteByDepartment(dataMap)+"\"}";
	}
	

}
