package cn.hyb.test;

public class Test4 {
	public static void main(String[] args) {
		Pojo pojo = new Pojo();
		pojo.t=9;
		in(pojo);
		System.out.println("??"+pojo.t);
		
	}
	
	public static void in(Pojo p) {
		p.t=0;
	}
	public static class Pojo{
		int t;
	}
}


