package cn.hyb.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ValidcodeController {

	@RequestMapping("/validcode")
	public void getValidcode(HttpServletRequest req, HttpServletResponse resp) {
		// 把验证码放入到session中
				HttpSession session = req.getSession();
		// 创建一张图片
		// 单位:像素
		BufferedImage image = new BufferedImage(200, 100, BufferedImage.TYPE_INT_RGB);

		// 透明的玻璃
		// 向画板上画内容之前必须先设置画笔.
		Graphics2D gra = image.createGraphics();

		gra.setColor(Color.WHITE);
		// 从哪个坐标开始填充, 后两个参数,矩形区域
		gra.fillRect(0, 0, 200, 100);

		List<Integer> randList = new ArrayList<Integer>();
		Random random = new Random();
		for (int i = 0; i < 4; i++) {
			randList.add(random.nextInt(10));
		}
		// 设置字体
		gra.setFont(new Font("宋体", Font.ITALIC | Font.BOLD, 40));
		Color[] colors = new Color[] { Color.RED, Color.YELLOW, Color.BLUE, Color.GREEN, Color.PINK, Color.GRAY };
		for (int i = 0; i < randList.size(); i++) {
			gra.setColor(colors[random.nextInt(colors.length)]);
			gra.drawString(randList.get(i) + "", i * 40, 70 + (random.nextInt(21) - 10));
		}

		for (int i = 0; i < 2; i++) {
			gra.setColor(colors[random.nextInt(colors.length)]);
			// 画横线
			gra.drawLine(0, random.nextInt(101), 200, random.nextInt(101));
		}

		ServletOutputStream outputStream = null;
		try {
			outputStream = resp.getOutputStream();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		// 工具类
		try {
			ImageIO.write(image, "jpg", outputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		session.setAttribute("code", "" + randList.get(0) + randList.get(1) + randList.get(2) + randList.get(3));
	}
}
