package com.module.messageNotify.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baseHome.BaseController;
import com.module.messageNotify.service.MessageNotifyService;
import com.utils.JsonUtils;

@Controller
@RequestMapping("/messageNotify")
public class MessageNotifyController extends BaseController {
	@Resource
	MessageNotifyService messageNotifyService;
	
	// 添加消息通知
	/*@RequestMapping(value = "/addMessageNotify", produces = "application/json;charset=UTF-8")
	public @ResponseBody String addMessageNotify(HttpServletRequest req, Model Model, String data) {
		if (data != null){dataMap = JsonUtils.jsonToMap(data);}
		System.out.println("add dataMap=" + dataMap);
		return "{\"result\":\""+ messageNotifyService.insertMessageNotify(dataMap) + "\"}";
	}*/

	// 查询消息通知列表
	@RequestMapping(value = "/queryMessageNotify", produces = "application/json;charset=UTF-8")
	public @ResponseBody String queryMessageNotify(HttpServletRequest req, Model Model, String data) {
		if (data != null)dataMap = JsonUtils.jsonToMap(data);
		return JsonUtils.listToJson(messageNotifyService.selectByMessageNotify(dataMap));
	}
	
	// 修改消息通知列表
	@RequestMapping(value = "/updateMessageNotify", produces = "application/json;charset=UTF-8")
	public @ResponseBody String updateMessageNotify(HttpServletRequest req, Model Model, String data) {
		if (data != null)dataMap = JsonUtils.jsonToMap(data);
		return "{\"result\":\""+ messageNotifyService.updateByMessageNotify(dataMap) + "\"}";
	}	

	// 删除消息通知
	@RequestMapping(value = "/deleteMessageNotify", produces = "application/json;charset=UTF-8")
	public @ResponseBody String deleteMessageNotify(HttpServletRequest req, Model Model, String data) {
		if (data != null)dataMap = JsonUtils.jsonToMap(data);
		return "{\"result\":\""+ messageNotifyService.deleteByMessageNotify(dataMap) + "\"}";
	}
	
	// 查询在线的咨询师
	@RequestMapping(value = "/queryIsComplete", produces = "application/json;charset=UTF-8")
	public @ResponseBody String queryIsComplete(HttpServletRequest req, Model Model, String data) {
		if (data != null)dataMap = JsonUtils.jsonToMap(data);
		return JsonUtils.listToJson(messageNotifyService.selectIsComplete(dataMap));
	}
	
	// 添加消息通知
	@RequestMapping(value = "/sendMessageNotify", produces = "application/json;charset=UTF-8")
	public @ResponseBody String sendMessageNotify(HttpServletRequest req, Model Model, String data) {
		if (data != null){
			dataMap = JsonUtils.jsonToMap(data);
			String str = messageNotifyService.insertMessageNotify(dataMap);
			return "{\"result\":\""+ str + "\"}";
		}
		return null;
	}
	
	// 转分咨询
	@RequestMapping(value = "/forwarConsult", produces = "application/json;charset=UTF-8")
	public @ResponseBody String forwarConsult(HttpServletRequest req, Model Model, String data) {
		if (data != null)dataMap = JsonUtils.jsonToMap(data);
		return "{\"result\":\""+ messageNotifyService.forwardMsg(dataMap) + "\"}";
	}
	
	// 修改全部消息状态
		@RequestMapping(value = "/updateAllMessageNotify", produces = "application/json;charset=UTF-8")
		public @ResponseBody String updateAllMessageNotify(HttpServletRequest req, Model Model, String data) {
			if (data != null)dataMap = JsonUtils.jsonToMap(data);
			return "{\"result\":\""+ messageNotifyService.updateAllMessageNotify(dataMap) + "\"}";
		}	
}
