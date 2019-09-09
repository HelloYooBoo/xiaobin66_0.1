package cn.hyb.test;

import java.util.Random;

public class Test6 {
	public static void main(String[] args) {
		int[] list= {0,1,2,3,4,5,6,7,8,9};
		for (int i = 0; i < list.length; i++) {
			System.out.println(list[i]);
		}
		int tmp=0;
		Random random = new Random();
		for (int i = list.length-1; i >1 ; i--) {
			int r=random.nextInt(i+1);
			tmp=list[r];
			list[r]=list[i];
			list[i]=tmp;
		}
		for (int i = 0; i < list.length; i++) {
			System.out.print(list[i]+"\t");
		}
	}
}
