package com.utils;

public class CommonUtil {
	
	/**
	 * 英文字母小写转大写
	 * @param s1
	 * @return
	 */
	public static String lowerToUpperCase(String str) {
		StringBuffer s1 = new StringBuffer();
		char c[] = str.toCharArray();
		for (int i = 0; i < str.length(); i++) {
			if (c[i] >= 97) {
				s1.append((c[i] + "").toUpperCase());
			} else {
				s1.append((c[i] + "").toUpperCase());
			}
		}
		return s1.toString();
	}
}
