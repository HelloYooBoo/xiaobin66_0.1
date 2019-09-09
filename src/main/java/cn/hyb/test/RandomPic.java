package cn.hyb.test;

import java.io.File;
import java.util.UUID;


public class RandomPic {
	public static void main(String[] args) {
		File file=new File("C:\\Users\\15222\\Desktop\\Originalbg");
		File[] files=file.listFiles();
		for (int i = 0; i < files.length; i++) {
			File file1=files[i];
			String name = file1.getName();
			System.out.println(name);
			System.out.println(name.lastIndexOf("."));
			System.out.println(file1.renameTo(new File("C:\\Users\\15222\\Desktop\\Originalbg\\"+UUID.randomUUID()+""+name.substring(name.lastIndexOf(".")))));;
		}
	}
}
