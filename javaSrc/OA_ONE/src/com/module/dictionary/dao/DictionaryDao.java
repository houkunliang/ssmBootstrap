package com.module.dictionary.dao;

import java.util.List;
import java.util.Map;

public interface DictionaryDao {

	int insertDictionary(Map<String, String> map);

	List<Map<String, String>> selectByDictionary(Map<String, String> map);
	
	int updateByDictionary(Map<String, String> map);
	
	int deleteByDictionary(Map<String, String> map);
	
	List<Map<String, String>> selectByCondition(Map<String, String> map);
}
