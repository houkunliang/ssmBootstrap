package com.module.dictionary.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baseHome.BaseController;
import com.module.dictionary.service.DictionaryService;
import com.utils.JsonUtils;

@Controller
@RequestMapping("/dictionary")
public class DictionaryController extends BaseController {

	@Resource
	DictionaryService dictionaryService;

	@RequestMapping(value = "/addDictionary", produces = "application/json;charset=UTF-8")
	public @ResponseBody
	String addDictionary(HttpServletRequest req, Model Model, String data) throws Exception {
		if (data != null){dataMap = JsonUtils.jsonToMap(data);}
		return "{\"result\":\"" + dictionaryService.addDictionary(dataMap) + "\"}";
	}

	@RequestMapping(value = "/queryDictionary", produces = "text/html;charset=UTF-8")
	public @ResponseBody
	String queryDictionary(HttpServletRequest request, Model model, String data) {
		if (data != null){dataMap = JsonUtils.jsonToMap(data);}
		return JsonUtils.listToJson(dictionaryService.findDictionary(dataMap));
	}

	@RequestMapping(value = "/updateDictionary", produces = "application/json;charset=UTF-8")
	public @ResponseBody
	String updateDictionary(HttpServletRequest req, Model Model, String data) {
		if (data != null)dataMap = JsonUtils.jsonToMap(data);
		return "{\"result\":\"" + dictionaryService.updateByDictionary(dataMap)+ "\"}";
	}

	@RequestMapping(value = "/deleteByDictionary", produces = "application/json;charset=UTF-8")
	public @ResponseBody
	String deleteByDictionary(HttpServletRequest req, Model Model, String data) {
		if (data != null){dataMap = JsonUtils.jsonToMap(data);}
		return "{\"result\":\"" + dictionaryService.deleteByDictionary(dataMap) + "\"}";
	}

}
