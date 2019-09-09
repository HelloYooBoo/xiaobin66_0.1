package cn.hyb.test;

import java.util.Date;

public class Test5 {
	public static void main(String[] args) {
		System.out.println(new Date(1566691981000l));
		System.out.println(new Date().getTime());
		System.out.println(Integer.parseInt(String.valueOf(new Date().getTime())));
	}
}
