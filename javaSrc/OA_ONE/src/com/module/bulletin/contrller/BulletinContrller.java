package com.module.bulletin.contrller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.baseHome.BaseController;
import com.module.bulletin.service.BulletinService;
import com.utils.BaseMsgGetToJson;
import com.utils.JsonUtils;
import com.utils.UnicodeFormatter;


/**
 * 用户管理
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/bulletin")
public class BulletinContrller extends BaseController{
	@Resource(name="bulletinService")
	private BulletinService service;
	
	@ResponseBody
	@RequestMapping(value="/queryBulletin",produces = "text/html;charset=UTF-8")
	public String test(HttpServletRequest request,String pageSize,String pageNumber,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  queryAppPages(readyPageRequest(request,pageNumber,pageSize),service.selectByPrimaryKey(dataMap));
	}

	
	/**
	 * 新增公告
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/bulletinSave",produces = "text/html;charset=UTF-8")
	public String bulletinSave(String data) {
		dataMap=JsonUtils.jsonToMap(data);
		if(dataMap.get("CONTENT") != null && !("").equals(dataMap.get("CONTENT"))){
			dataMap.put("CONTENT", UnicodeFormatter.parseString(dataMap.get("CONTENT")));
		}
		return  BaseMsgGetToJson.getResult(service.insertBulletin(dataMap)+"");
	}

	/**
	 * 修改公告
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/upBulletin",produces = "text/html;charset=UTF-8")
	public String upBulletin(String data) {
		dataMap=JsonUtils.jsonToMap(data);
		if(dataMap.get("CONTENT") != null && !("").equals(dataMap.get("CONTENT"))){
			dataMap.put("CONTENT", UnicodeFormatter.parseString(dataMap.get("CONTENT")));
		}
		return  BaseMsgGetToJson.getResult(service.updateByBulletin(dataMap)+"");
	}

	/**
	 * 删除公告
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deBulletin",produces = "text/html;charset=UTF-8")
	public String deBulletin(String data) {
		dataMap=JsonUtils.jsonToMap(data);
		dataMap.put("IS_DELETED", "Y");
		return  BaseMsgGetToJson.getResult(service.updateByBulletin(dataMap)+"");
	}
	
	/**
	 * 查询刊物
	 * @param request
	 * @param pageSize
	 * @param pageNumber
	 * @param model
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/queryPublication",produces = "text/html;charset=UTF-8")
	public String queryPublication(HttpServletRequest request,String pageSize,String pageNumber,Model model,String data) {
		dataMap=JsonUtils.jsonToMap(data);
		return  queryAppPages(readyPageRequest(request,pageNumber,pageSize),service.selectByPublication(dataMap));
	}

	
	/**
	 * 新增刊物
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/publicationSave",produces = "text/html;charset=UTF-8")
	public String publicationSave(String data) {
		dataMap=JsonUtils.jsonToMap(data);
		if(dataMap.get("CONTENT") != null && !("").equals(dataMap.get("CONTENT"))){
			dataMap.put("CONTENT", UnicodeFormatter.parseString(dataMap.get("CONTENT")));
		}
		if(dataMap.get("DESCRIPTION") != null && !("").equals(dataMap.get("DESCRIPTION"))){
			dataMap.put("DESCRIPTION", UnicodeFormatter.parseString(dataMap.get("DESCRIPTION")));
		}
		return  BaseMsgGetToJson.getResult(service.insertByPublication(dataMap)+"");
	}

	/**
	 * 修改修改
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/upPublication",produces = "text/html;charset=UTF-8")
	public String upPublication(String data) {
		dataMap=JsonUtils.jsonToMap(data);
		if(dataMap.get("CONTENT") != null && !("").equals(dataMap.get("CONTENT"))){
			dataMap.put("CONTENT", UnicodeFormatter.parseString(dataMap.get("CONTENT")));
		}
		if(dataMap.get("DESCRIPTION") != null && !("").equals(dataMap.get("DESCRIPTION"))){
			dataMap.put("DESCRIPTION", UnicodeFormatter.parseString(dataMap.get("DESCRIPTION")));
		}
		return  BaseMsgGetToJson.getResult(service.updateByPublication(dataMap)+"");
	}

	/**
	 * 删除刊物
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/dePublication",produces = "text/html;charset=UTF-8")
	public String dePublication(String data) {
		dataMap=JsonUtils.jsonToMap(data);
		dataMap.put("IS_DELETED", "Y");
		return  BaseMsgGetToJson.getResult(service.updateByPublication(dataMap)+"");
	}
}
