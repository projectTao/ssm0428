package com.ltt.util;

import java.util.UUID;

/**
 * 字符串工具类
 */
public class StringUtil {


    /**
     * 获取一个UUID
     * @return
     */
    public static String getUUID(){
        UUID uuid = UUID.randomUUID();
        return uuid.toString().replaceAll("-","");
    }
    
    public static String toNull(String obj) {
    	if(obj == null)
    		return null;
    	if(obj != null) {
			if(obj.trim().equals(""))
				return null;
			return obj;
    		 
    	}
    	return null;
    }
}
