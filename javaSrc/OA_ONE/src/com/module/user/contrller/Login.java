package com.module.user.contrller;

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
import com.module.user.service.UserService;
import com.utils.BaseMsgGetToJson;
import com.utils.JsonUtils;
import com.utils.idUtil;

@Controller
@RequestMapping("/login")
public class Login extends BaseController{
	@Resource(name="userService")
	private UserService userService;
	/**
	 * 登录接口
	 * 
	 * @author hkl
	 * @updateBy hkl
	 * @updateDate 2017-09-02
	 */
	@ResponseBody
	@RequestMapping(value="/login",produces = "text/html;charset=UTF-8")
	public String lock(HttpServletRequest request,Model model,String data,String callbackparam) {
		dataMap=JsonUtils.jsonToMap(data);
		Map<String,String> validateMap=new HashMap<String, String>();
		String result="{\"result\":\"login is null\"}";
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		list=userService.Logins(dataMap);
		if(list != null && list.size() > 0){
			String code=idUtil.getID();
			validateMap.put("USER_ID",list.get(0).get("ID"));
			List<Map<String,String>> valiList=userService.querValidate(validateMap);
			if(valiList !=null && valiList.size()>0){
				if(userService.deleteByValidate(validateMap) > 0){
					map.put("USER_ID", list.get(0).get("ID"));
					map.put("CODE_VALIDATE",code);
					map.put("TOKEN",gson.toJson(list.get(0)));
					userService.insertValidate(map);
				}
			}else{
				map.put("USER_ID", list.get(0).get("ID"));
				map.put("CODE_VALIDATE",code);
				map.put("TOKEN",gson.toJson(list.get(0)));
				userService.insertValidate(map);
			}
			Map<String,String> resultMap=new HashMap<String, String>();
			Map<String,String> listObj = list.get(0);
			listObj.remove("USER_PASS");
			resultMap.putAll(listObj);
			resultMap.put("CODE_VALIDATE",code);
			result="{\"result\":\"1\",\"token\":"+JsonUtils.mapToJson(resultMap)+"}";
		}else{
			result="{\"result\":\"0\"}";
		}
		return  result;
	}
	
	
	/**
	 * 微信号验证用户 返回用户签证 token
	 * @param request
	 * @param model
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/queryByUserObj",produces = "text/html;charset=UTF-8")
	public String queryByUserObj(HttpServletRequest request,Model model,String data) {
		if(dataMap != null)dataMap=JsonUtils.jsonToMap(data);
		List<Map<String,String>> list = userService.queryByUserObj(dataMap);
		if(list != null && list .size() > 0){
			String userId = list.get(0).get("ID");
			if(!userService.queryLogLogin(userId)){
				userService.insertUserLog("0", "当前时间点用户进行了登录",null,"1",userId);
			}
		}
		return  BaseMsgGetToJson.getSuccess(list);
	}
}
