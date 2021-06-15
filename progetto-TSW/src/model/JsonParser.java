package model;

import java.lang.reflect.Type;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class JsonParser 
{
	public static Map<String, Object> fromJson(String s)
	{
		Gson gson = new Gson();
		Type type = new TypeToken<Map<String, Object>>() {}.getType();
		Map<String, Object> m = gson.fromJson(s, type);
		return m;
	}
	
	public static String toJson(Map<String,Object> m)
	{
		Gson gson = new Gson();
		Type type = new TypeToken<Map<String, Object>>() {}.getType();
		return gson.toJson(m, type);
	}
}
