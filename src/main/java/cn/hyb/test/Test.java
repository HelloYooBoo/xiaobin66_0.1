package cn.hyb.test;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;


public class Test {
	public static void main(String[] args) {
		Map<String, Integer> nmap=new HashMap<String, Integer>();
		nmap.put("王五", 789);
		nmap.put("张三", 123);
		nmap.put("李四", 456);
		
		List<Map.Entry<String, Integer>> entries = new ArrayList<Map.Entry<String, Integer>>(nmap.entrySet());
        Collections.sort(entries, new Comparator<Map.Entry<String, Integer>>() {
            public int compare(Map.Entry<String, Integer> obj1, Map.Entry<String, Integer> obj2) {
                return obj1.getValue().compareTo(obj2.getValue()) ;
            }
        });
        System.out.println(entries);
        System.out.println(entries.get(0).getKey());
        List<Integer> ymap =new ArrayList<>();
        for (Entry<String, Integer> entry : entries) {
        	System.out.println(entry);
        	ymap.add(entry.getValue());
		}
        System.out.println(ymap);
        
	}
}
