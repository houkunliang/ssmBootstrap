package com.module.dictionary.service;

import java.util.List;
import java.util.Map;

public interface DictionaryService {

	int addDictionary(Map<String, String> map) throws Exception;

	List<Map<String, String>> findDictionary(Map<String, String> map);
	
	int updateByDictionary(Map<String, String> map);
	
	int deleteByDictionary(Map<String, String> map);
}
