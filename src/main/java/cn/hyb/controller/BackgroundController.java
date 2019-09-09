package cn.hyb.controller;

import java.io.File;
import java.net.URL;
import java.util.Random;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BackgroundController {
	
	@Value("${ftpclient.headpicPath}")
	private String headpicPath;
	@Value("${ftpclient.headpicUrl}")
	private String headpicUrl;
	
	@RequestMapping("/img/random/hpic")
	@ResponseBody
	public String randomHeadPic() {
		try {
			String PATH = Thread.currentThread().getContextClassLoader().getResource("").getPath();
			File filed = new File(headpicPath);
			File[] files=filed.listFiles();
			return headpicUrl+files[new Random().nextInt(files.length)].getName();
		} catch (Exception e) {
			return "/img/h1.jpg";
		}
	}
}
