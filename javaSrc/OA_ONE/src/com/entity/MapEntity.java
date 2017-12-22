package com.entity;

import java.util.HashMap;
import java.util.Map;

public class MapEntity {
	
	public Map<String,String> bymap=new HashMap<String, String>();
	
	private Map<String,String> map=new HashMap<String, String>();

	public Map<String, String> getMap() {
		return map;
	}

	public void setMap(Map<String, String> map) {
		this.map = map;
	}
	
}
