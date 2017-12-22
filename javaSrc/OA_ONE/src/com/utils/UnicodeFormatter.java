package com.utils;

import java.util.logging.Logger;

public class UnicodeFormatter {  
  
    /** Unicode编码前缀 */  
    private static final String _UNICODE_PREFIX = "\\u";  
  
    /** 十六进制字符 */  
    private static final char[] _HEX_DIGITS = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };  
  
    /** 
     * 将一个byte转成十六进制格式的字符串 
     *  
     * @param b 
     * @return 
     */  
    public static String byteToHex(byte b) {  
        char[] array = { _HEX_DIGITS[(b >> 4) & 0x0f], _HEX_DIGITS[b & 0x0f] };  
  
        return new String(array);  
    }  
  
    /** 
     * 将一个普通字符转为十六进制格式的字符串 
     *  
     * @param c 
     * @return 
     */  
    public static String charToHex(char c) {  
        byte hi = (byte) (c >>> 8);  
        byte lo = (byte) (c & 0xff);  
  
        char[] array = { _HEX_DIGITS[(hi >> 4) & 0x0f], _HEX_DIGITS[hi & 0x0f], _HEX_DIGITS[(lo >> 4) & 0x0f],  
                _HEX_DIGITS[lo & 0x0f] };  
  
        return new String(array);  
    }  
  
    /** 
     * 将Unicode编码的字符串解析成普通格式字符串 
     *  
     * @param hexString 
     * @return 
     */  
    public static String parseString(String hexString) {  
        StringBuilder sb = new StringBuilder();  
  
        char[] array = hexString.toCharArray();  
  
        if ((array.length % 6) != 0) {  
            return hexString;  
        }  
  
        for (int i = 2; i < hexString.length(); i = i + 6) {  
            String s = hexString.substring(i, i + 4);  
  
            try {  
                char c = (char) Integer.parseInt(s, 16);  
  
                sb.append(c);  
            } catch (Exception e) {  
  
                return hexString;  
            }  
        }  
        return sb.toString();  
    }  
  
    /** 
     * 字符数组转为转成Unicode编码的字符串 
     *  
     * @param array 
     * @return 
     */  
    public static String toString(char[] array) {  
        StringBuilder sb = new StringBuilder(array.length * 6);  
  
        char[] hexes = new char[4];  
  
        for (int i = 0; i < array.length; i++) {  
            sb.append(_UNICODE_PREFIX);  
            sb.append(_charToHex(array[i], hexes));  
        }  
  
        return sb.toString();  
    }  
  
    /** 
     * 将字符串转成Unicode编码的字符串 
     *  
     * @param s 
     * @return 
     */  
    public static String toString(String s) {  
        if (s == null) {  
            return null;  
        }  
  
        StringBuilder sb = new StringBuilder(s.length() * 6);  
  
        char[] hexes = new char[4];  
  
        for (int i = 0; i < s.length(); i++) {  
            sb.append(_UNICODE_PREFIX);  
            sb.append(_charToHex(s.charAt(i), hexes));  
        }  
  
        return sb.toString();  
    }  
  
    // char在java中是2个字节。java采用unicode，2个字节（16位）来表示一个字符。  
    private static char[] _charToHex(char c, char[] hexes) {  
        byte hi = (byte) (c >>> 8);  
        byte lo = (byte) (c & 0xff);  
  
        hexes[0] = _HEX_DIGITS[(hi >> 4) & 0x0f];  
        hexes[1] = _HEX_DIGITS[hi & 0x0f];  
        hexes[2] = _HEX_DIGITS[(lo >> 4) & 0x0f];  
        hexes[3] = _HEX_DIGITS[lo & 0x0f];  
  
        return hexes;  
    }  
  
    public static void main(String[] args) {  
        String test = "<a>abc123@汉字αβあにキКЖ÷⑥</a>";  
        String U="\\u003c\\u0070\\u003e\\u003c\\u0069\\u006d\\u0067\\u0020\\u0061\\u006c\\u0074\\u003d\\u0022\\u0022\\u0020\\u0073\\u0072\\u0063\\u003d\\u0022\\u002f\\u0063\\u0072\\u0065\\u0062\\u0061\\u002f\\u0070\\u0069\\u0063\\u0074\\u0075\\u0072\\u0065\\u0052\\u0065\\u0073\\u006f\\u0075\\u0072\\u0063\\u0065\\u0073\\u002f\\u0070\\u0068\\u006f\\u0074\\u006f\\u0073\\u002f\\u0032\\u0030\\u0031\\u0037\\u0030\\u0039\\u0031\\u0033\\u0031\\u0034\\u0034\\u0033\\u0034\\u0031\\u005f\\u0038\\u0037\\u002e\\u006a\\u0070\\u0067\\u0022\\u0020\\u0073\\u0074\\u0079\\u006c\\u0065\\u003d\\u0022\\u0066\\u006c\\u006f\\u0061\\u0074\\u003a\\u006c\\u0065\\u0066\\u0074\\u003b\\u0020\\u0068\\u0065\\u0069\\u0067\\u0068\\u0074\\u003a\\u0031\\u0035\\u0030\\u0070\\u0078\\u003b\\u0020\\u006d\\u0061\\u0072\\u0067\\u0069\\u006e\\u003a\\u0034\\u0070\\u0078\\u0020\\u0038\\u0070\\u0078\\u003b\\u0020\\u0077\\u0069\\u0064\\u0074\\u0068\\u003a\\u0031\\u0035\\u0030\\u0070\\u0078\\u0022\\u0020\\u002f\\u003e\\u003c\\u002f\\u0070\\u003e\\u000a\\u000a\\u003c\\u0070\\u003e\\u611f\\u8c22\\u9a7b\\u6751\\u003c\\u0061\\u0020\\u0068\\u0072\\u0065\\u0066\\u003d\\u0022\\u0068\\u0074\\u0074\\u0070\\u0073\\u003a\\u002f\\u002f\\u0077\\u0077\\u0077\\u002e\\u0064\\u0075\\u0061\\u006e\\u0077\\u0065\\u006e\\u0078\\u0075\\u0065\\u002e\\u0063\\u006f\\u006d\\u002f\\u006a\\u0069\\u006e\\u0067\\u0064\\u0069\\u0061\\u006e\\u002f\\u0073\\u0068\\u0065\\u006e\\u0067\\u0068\\u0075\\u006f\\u002f\\u0022\\u003e\\u751f\\u6d3b\\u003c\\u002f\\u0061\\u003e\\uff0c\\u8ba9\\u6211\\u8d70\\u8fdb\\u4e86\\u516d\\u5927\\u961f\\uff0c\\u8d70\\u8fdb\\u4e86\\u7ef4\\u543e\\u5c14\\u4eba\\u5f53\\u4e2d\\u3002\\u5e94\\u8be5\\u8bf4\\uff0c\\u901a\\u8fc7\\u4e00\\u5e74\\u7684\\u671d\\u5915\\u76f8\\u5904\\uff0c\\u8ba9\\u6211\\u771f\\u6b63\\u5730\\u878d\\u5165\\u5230\\u516d\\u5927\\u961f\\u7684\\u6751\\u6c11\\u5f53\\u4e2d\\u3002\\u867d\\u7136\\uff0c\\u6211\\u73b0\\u5728\\u5df2\\u7ecf\\u56de\\u5230\\u539f\\u6765\\u5355\\u4f4d\\u5de5\\u4f5c\\u4e86\\u3002\\u53ef\\u5f7c\\u6b64\\u7275\\u6302\\u4e4b\\u60c5\\u4e0e\\u65e5\\u4ff1\\u589e\\u3002\\u6211\\u65f6\\u5e38\\u4f1a\\u60f3\\u8d77\\u4ed6\\u4eec\\u3002\\u867d\\u7136\\u4e0d\\u80fd\\u4e00\\u4e00\\u558a\\u51fa\\u4ed6\\u4eec\\u7684\\u540d\\u5b57\\uff0c\\u4f46\\u4ed6\\u4eec\\u7684\\u5bb9\\u8c8c\\u5df2\\u7ecf\\u523b\\u8fdb\\u4e86\\u6211\\u7684\\u8111\\u6d77\\u91cc\\u3002\\u6b63\\u5982\\u4f60\\u544a\\u8bc9\\u6211\\u7684\\uff0c\\u4f60\\u7684\\u7238\\u7238\\u3001\\u5988\\u5988\\u65f6\\u5e38\\u63d0\\u8d77\\u6211\\u3002\\u52aa\\u5c14\\u66fc\\u53e4\\u4e3d\\u7684\\u5df4\\u90ce\\u65f6\\u5e38\\u5bfb\\u627e\\u4ed6\\u7684\\u0026\\u006c\\u0064\\u0071\\u0075\\u006f\\u003b\\u743c\\u8fbe\\u8fbe\\u0026\\u0072\\u0064\\u0071\\u0075\\u006f\\u003b\\uff0c\\u8fd8\\u6709\\u5927\\u5927\\u5c0f\\u5c0f\\u7684\\u4eba\\u4eec\\u5ff5\\u53e8\\u6211\\u7684\\u6d88\\u606f\\u3002\\u77e5\\u9053\\u8fd9\\u4e9b\\u540e\\uff0c\\u4f60\\u77e5\\u9053\\u5417\\u003f\\u6211\\u7684\\u5fc3\\u91cc\\u6709\\u591a\\u9ad8\\u5174\\u5440\\u3002\\u003c\\u002f\\u0070\\u003e\\u000a\\u000a\\u003c\\u0070\\u003e\\u7956\\u5408\\u5566\\uff0c\\u77e5\\u9053\\u8fd9\\u4e2a\\u540d\\u5b57\\uff0c\\u5c31\\u5728\\u6211\\u79bb\\u5f00\\u5927\\u961f\\u7684\\u524d\\u51e0\\u4e2a\\u65e5\\u5b50\\u91cc\\uff0c\\u4f20\\u8fdb\\u4e86\\u6211\\u7684\\u8033\\u6735\\u91cc\\u3002\\u4f60\\u8bf4\\uff0c\\u8ba4\\u8bc6\\u6211\\u662f\\u5728\\u4e00\\u573a\\u0026\\u006c\\u0064\\u0071\\u0075\\u006f\\u003b\\u9ea6\\u897f\\u83b1\\u666e\\u0026\\u0072\\u0064\\u0071\\u0075\\u006f\\u003b\\u4e0a\\uff0c\\u770b\\u5230\\u6211\\u548c\\u6751\\u6c11\\u4e00\\u8d77\\u75af\\u8df3\\uff0c\\u4e00\\u8d77\\u75db\\u996e\\u3002\\u8ba9\\u4f60\\u4e0d\\u53ef\\u601d\\u8bae\\uff0c\\u4e00\\u4e2a\\u6c49\\u65cf\\u4eba\\u002d\\u002d\\u002d\\u8fde\\u4e00\\u53e5\\u7ef4\\u8bed\\u4e0d\\u4f1a\\u8bb2\\u7684\\u6c49\\u65cf\\u4eba\\uff0c\\u600e\\u4e48\\u548c\\u4f60\\u7684\\u7236\\u8001\\u4e61\\u4eb2\\u5982\\u6b64\\u4eb2\\u8fd1\\u5462\\u003f\\u4e0d\\uff0c\\u5b69\\u5b50\\u0021\\u4e0d\\u53ea\\u662f\\u4f60\\u7684\\u7236\\u8001\\u4e61\\u4eb2\\u3002\\u5728\\u6211\\u7684\\u5fc3\\u91cc\\uff0c\\u4ed6\\u4eec\\u5df2\\u7ecf\\u53d8\\u6210\\u4e86\\u6211\\u7684\\u7236\\u8001\\u4e61\\u4eb2\\uff0c\\u6211\\u7684\\u5144\\u5f1f\\u59d0\\u59b9\\u4e86\\u3002\\u600e\\u80fd\\u4e0d\\u548c\\u7766\\u76f8\\u5904\\u5462\\u003f\\u5c31\\u5728\\u4ed6\\u4eec\\u558a\\u6211\\u0026\\u006c\\u0064\\u0071\\u0075\\u006f\\u003b\\u827e\\u4e70\\u63d0\\u6c5f\\u0026\\u0072\\u0064\\u0071\\u0075\\u006f\\u003b\\u7684\\u90a3\\u4e00\\u523b\\uff0c\\u6211\\u628a\\u81ea\\u5df1\\u5df2\\u7ecf\\u5f53\\u6210\\u4e86\\u7ef4\\u543e\\u5c14\\u65cf\\u7684\\u4e00\\u5458\\u3002\\u003c\\u002f\\u0070\\u003e\\u000a\\u000a\\u003c\\u0070\\u003e\\u548c\\u4f60\\u76f8\\u8bc6\\uff0c\\u7b97\\u662f\\u7f18\\u5206\\u3002\\u5c31\\u5728\\u6211\\u79bb\\u5f00\\u7684\\u65e5\\u5b50\\uff0c\\u4f60\\u51fa\\u73b0\\u4e86\\u3002\\u5f97\\u77e5\\u4f60\\u5728\\u4e4c\\u9c81\\u6728\\u9f50\\u4e0a\\u5b66\\u65f6\\uff0c\\u6211\\u5f88\\u656c\\u4f69\\u0021\\u6211\\u5e0c\\u671b\\u6751\\u5b50\\u91cc\\u7684\\u6240\\u6709\\u5df4\\u90ce\\u4eec\\u80fd\\u548c\\u4f60\\u4e00\\u6837\\uff0c\\u53d7\\u5230\\u826f\\u597d\\u7684\\u6559\\u80b2\\uff0c\\u5c06\\u6765\\u6539\\u53d8\\u81ea\\u5df1\\u7684\\u547d\\u8fd0\\u0021\\u8fd9\\u662f\\u6211\\u771f\\u8bda\\u5730\\u795d\\u798f\\u0021\\u003c\\u002f\\u0070\\u003e\\u000a\\u000a\\u003c\\u0070\\u003e\\u4f60\\u8bf7\\u6211\\u548c\\u675c\\u53ef\\u53bb\\u4f60\\u5bb6\\u91cc\\u505a\\u5ba2\\u3002\\u4f60\\u4eb2\\u81ea\\u505a\\u4e86\\u706b\\u9505\\u3002\\u4f60\\u7684\\u7238\\u7238\\u6211\\u662f\\u8ba4\\u8bc6\\u7684\\u3002\\u53ea\\u662f\\uff0c\\u4ed6\\u662f\\u5b97\\u6559\\u4eba\\u58eb\\uff0c\\u6211\\u656c\\u800c\\u8fdc\\u4e4b\\u3002\\u79bb\\u5f00\\u4f60\\u5bb6\\u65f6\\uff0c\\u6211\\u7b2c\\u4e00\\u6b21\\u548c\\u4f60\\u7684\\u7238\\u7238\\u52fe\\u901a\\u4e86\\u4e00\\u56de\\u3002\\u56e0\\u4e3a\\u6709\\u4f60\\u7684\\u7ffb\\u8bd1\\u3002\\u5f53\\u6211\\u8ba9\\u4f60\\u544a\\u8bc9\\u7238\\u7238\\uff0c\\u4e00\\u5b9a\\u8981\\u505a\\u4e00\\u4e2a\\u7231\\u56fd\\u5b97\\u6559\\u4eba\\u58eb\\u65f6\\uff0c\\u4ed6\\u62c9\\u4f4f\\u6211\\u7684\\u624b\\uff0c\\u957f\\u65f6\\u95f4\\u5730\\u7d27\\u63e1\\u7740\\u3002\\u6211\\u548c\\u4f60\\u7238\\u7238\\u7684\\u0026\\u006c\\u0064\\u0071\\u0075\\u006f\\u003b\\u5fc3\\u8def\\u0026\\u0072\\u0064\\u0071\\u0075\\u006f\\u003b\\u5c31\\u8fd9\\u6837\\u88ab\\u6253\\u901a\\u4e86\\u3002\\u003c\\u002f\\u0070\\u003e\\u000a";
        String u = UnicodeFormatter.toString(test);  
        System.out.println(u);  
        System.out.println(UnicodeFormatter.parseString(U));  
        System.out.println(UnicodeFormatter.toString("\n"));  
    }  
  
}