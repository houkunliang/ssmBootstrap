package com.module.msg.contrller;

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
import com.module.msg.service.MsgService;
import com.module.user.service.UserService;
import com.utils.BaseMsgGetToJson;
import com.utils.JsonUtils;
import com.utils.UnicodeFormatter;


/**
 * 信息发布
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/msg")
public class MsgContrller extends BaseController{
	@Resource(name="msgService")
	private MsgService service;
	
	/**
	 * 列表查询
	 * @param request
	 * @param model
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/queryUserAll",produces = "text/html;charset=UTF-8")
	public String queryUserAll(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  gson.toJson(service.selectByMsg(dataMap));
	}

	/**
	 * 详细
	 * @param request
	 * @param model
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/selectByMsgInfo",produces = "text/html;charset=UTF-8")
	public String selectByMsgInfo(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  gson.toJson(service.selectByMsgInfo(dataMap));
	}

	
	/**
	 * 新增
	 * @param request
	 * @param model
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/insertTmsg",produces = "text/html;charset=UTF-8")
	public String insertTmsg(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		dataMap.put("CONTENT", UnicodeFormatter.parseString(dataMap.get("CONTENT")));
		return  BaseMsgGetToJson.getSuccess(service.insertTmsg(dataMap)+"");
	}
	
	/**
	 * 修改
	 * @param request
	 * @param model
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateByTmsg",produces = "text/html;charset=UTF-8")
	public String updateByTmsg(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		dataMap.put("CONTENT", UnicodeFormatter.parseString(dataMap.get("CONTENT")));
		return  BaseMsgGetToJson.getSuccess(service.updateByTmsg(dataMap)+"");
	}
	
	/**
	 * 删除接口
	 * @param request
	 * @param model
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/del",produces = "text/html;charset=UTF-8")
	public String del(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		dataMap.put("IS_DELETED","Y");
		return  BaseMsgGetToJson.getSuccess(service.updateByTmsg(dataMap)+"");
	}
	
	/**
	 * banner图列表接口
	 * @param request
	 * @param model
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/selectBannerList",produces = "text/html;charset=UTF-8")
	public String selectBannerList(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		List<Map<String,Object>> result = service.selectBannerList(dataMap);
		return  BaseMsgGetToJson.getSuccess(result);
	}
	
	/**
	 * banner图列表接口
	 * @param request
	 * @param model
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateByMsgBanner",produces = "text/html;charset=UTF-8")
	public String updateByMsgBanner(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  BaseMsgGetToJson.getSuccess(service.updateByMsgBanner(dataMap)+"");
	}
	

	
	/**
	 * 新增四个板块
	 * @param request
	 * @param model
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/insertFroDiv",produces = "text/html;charset=UTF-8")
	public String insertFroDiv(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  BaseMsgGetToJson.getSuccess(service.insertFroDiv(dataMap)+"");
	}
	
	/**
	 * 修改四个板块
	 * @param request
	 * @param model
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/updateFroDiv",produces = "text/html;charset=UTF-8")
	public String updateFroDiv(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  BaseMsgGetToJson.getSuccess(service.updateFroDiv(dataMap)+"");
	}
	
	@ResponseBody
	@RequestMapping(value="/selectFroDiv",produces = "text/html;charset=UTF-8")
	public String selectFroDiv(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  gson.toJson(service.selectFroDiv(dataMap));
	}
	
	@ResponseBody
	@RequestMapping(value="/selectMsgToforDiv",produces = "text/html;charset=UTF-8")
	public String selectMsgToforDiv(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return   gson.toJson(service.selectMsgToforDiv(dataMap));
	}
	
	/**
	 * 添加列表
	 * @param request
	 * @param model
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/setMsgs",produces = "text/html;charset=UTF-8")
	public String setTmByQuestion(HttpServletRequest request,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  BaseMsgGetToJson.getSuccess(service.setMsgs(dataMap)+"");
	}
	

}
