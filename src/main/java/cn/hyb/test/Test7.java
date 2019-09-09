package cn.hyb.test;

import java.io.File;
import java.io.IOException;

import net.coobird.thumbnailator.Thumbnails;

public class Test7 {
	public static void main(String[] args) {
		
		File srcfile = new File("C:\\Users\\15222\\Desktop\\压缩测试\\5.jpg"); 
        File distfile = new File("C:\\Users\\15222\\Desktop\\压缩测试\\3.jpg");
		try {
			Thumbnails.of(srcfile).size(1000, 1000).toFile(srcfile);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		File srcfile = new File("C:\\Users\\15222\\Desktop\\压缩测试\\5.jpg"); 
//		File distfile = new File("C:\\Users\\15222\\Desktop\\压缩测试\\3.jpg");
//		try {
//			Thumbnails.of(srcfile).size(2000, 2000).toFile(srcfile);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}
}
