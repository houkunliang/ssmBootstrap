package com.utils;

import java.util.UUID;

public  class idUtil {
	public static String  getID(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
