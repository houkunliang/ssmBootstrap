package com.module.user.contrller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.baseHome.BaseController;
import com.module.menu.service.MenuService;
import com.module.user.service.UserService;
import com.utils.BaseMsgGetToJson;
import com.utils.JsonUtils;


/**
 * 用户管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/user")
public class UserContrller extends BaseController{
	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="menuService")
	private MenuService menuService;
	
	
	@ResponseBody
	@RequestMapping(value="/test",produces = "text/html;charset=UTF-8")
	public String test(HttpServletRequest request,String pageSize,String pageNumber,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		System.err.println("pageNumber"+pageNumber);
		return queryAppPages(readyPageRequest(request,pageNumber,pageSize),userService.selectByPrimaryKey(dataMap));
	}
	
	@ResponseBody
	@RequestMapping(value="/queryUserAll",produces = "text/html;charset=UTF-8")
	public String queryUserAll(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(userService.selectByPrimaryKey(dataMap));
	}
	
	@ResponseBody
	@RequestMapping(value="/userRootToMenu",produces = "text/html;charset=UTF-8")
	public String userRootToMenu(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		map.putAll(JsonUtils.jsonToMap(dataMap.get("token")));
		if(map != null){
			if(map.get("IS_SUPER").equals("1")){
				return JsonUtils.listToJson(menuService.selectMenuByPrimaryKey(dataMap));
			}
		}
		return  JsonUtils.listToJson(userService.userRootToMenu(dataMap));
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/userToRoleInfo",produces = "text/html;charset=UTF-8")
	public String userToRoleInfo(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(userService.userToRoleInfo(dataMap));
	}
	
	
	@RequestMapping(value="/info",produces = "text/html;charset=UTF-8")
	public String info(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		model.addAttribute("data",userService.selectByPrimaryKey(dataMap));
		return  "/info/accountInfo.jsp";
	}
	
	@ResponseBody
	@RequestMapping(value="/add",produces = "text/html;charset=UTF-8")
	public String add(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		System.out.println("dataMap##############" + dataMap);
		dataMap.put("USER_NAME", dataMap.get("USER_NAME").replaceAll("\\\\",""));
		return "{\"result\":\""+userService.insertSelective(dataMap)+"\"}";
	}
	
	@ResponseBody
	@RequestMapping(value="/update",produces = "text/html;charset=UTF-8")
	public String update(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		if(isString(dataMap.get("USER_NAME"))){
			dataMap.put("USER_NAME", dataMap.get("USER_NAME").replaceAll("\\\\",""));
		}
		return "{\"result\":\""+userService.updateByPrimaryKeySelective(dataMap)+"\"}";
	}
	
	@ResponseBody
	@RequestMapping(value="/updateObj",produces = "text/html;charset=UTF-8")
	public String updateObj(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return "{\"result\":\""+userService.updateObj(dataMap)+"\"}";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/del",produces = "text/html;charset=UTF-8")
	public String del(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return "{\"result\":\""+userService.deleteByPrimaryKey(dataMap)+"\"}";
	}
	
	@ResponseBody
	@RequestMapping(value="/updateOnline",produces = "text/html;charset=UTF-8")
	public String updateOnline(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return "{\"result\":\""+userService.updateByOnLine(dataMap)+"\"}";
	}
	
	@ResponseBody
	@RequestMapping(value="/queryByOnLine",produces = "text/html;charset=UTF-8")
	public String queryByOnLine(HttpServletRequest request,Model model,String data) {
		if(dataMap != null)dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(userService.queryByNotOnLine(dataMap));
	}
	
	@ResponseBody
	@RequestMapping(value="/queryByOnLine1",produces = "text/html;charset=UTF-8")
	public String queryByOnLine1(HttpServletRequest request,Model model,String data) {
		if(dataMap != null)dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(userService.queryByNotOnLine1(dataMap));
	}
	
	// 根据角色查询菜单栏
	@ResponseBody
	@RequestMapping(value="/switchByMenu",produces = "text/html;charset=UTF-8")
	public String switchByMenu(HttpServletRequest request,Model model,String data) {
		if(dataMap != null)dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(userService.switchByMenu(dataMap));
	}
	// 根据角色查询菜单栏
		@ResponseBody
		@RequestMapping(value="/selectByRegionUser",produces = "text/html;charset=UTF-8")
		public String selectByRegionUser(HttpServletRequest request,Model model,String data) {
			if(dataMap != null)dataMap=JsonUtils.jsonToMap(data);
			return  JsonUtils.listToJson(userService.selectByRegionUser(dataMap));
		}
	
	// 根据角色查询菜单栏
	@ResponseBody
	@RequestMapping(value="/queryAllDp",produces = "text/html;charset=UTF-8")
	public String queryAllDp(HttpServletRequest request,Model model,String data) {
		if(dataMap != null)dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(userService.selectAllDp(dataMap));
	}
	
	// 查询所有咨询师
	@ResponseBody
	@RequestMapping(value="/queryAllConsult",produces = "text/html;charset=UTF-8")
	public String queryAllConsult(HttpServletRequest request,Model model,String data) {
		if(dataMap != null)dataMap=JsonUtils.jsonToMap(data);
		return  JsonUtils.listToJson(userService.selectAllConsult(dataMap));
	}

	/**
	 * 插入节点
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/insertProcessNode",produces = "text/html;charset=UTF-8")
	public String insertProcessNode(HttpServletRequest request,Model model,String data) {
		if(dataMap != null)dataMap=JsonUtils.jsonToMap(data);
		return   "{\"result\":\""+userService.insertProcessNode(dataMap)+"\"}";
	}
	
	/**
	 * 返回预备党员流程情况
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/selectProcessNode",produces = "text/html;charset=UTF-8")
	public String selectProcessNode(HttpServletRequest request,Model model,String data) {
		if(dataMap != null)dataMap=JsonUtils.jsonToMap(data);
		return  BaseMsgGetToJson.getSuccess(userService.selectProcessNode(dataMap));
	}

}
