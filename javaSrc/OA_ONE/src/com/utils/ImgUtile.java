package com.utils;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import com.swetake.util.Qrcode;

public class ImgUtile {
	static int width = 370;
	static int height = 370;
	
	public static int R=255;
	public static int G=95;
	public static int B=95;
	
	
	public static void create_image(String sms_info) throws Exception {
		try {
			Qrcode testQrcode = new Qrcode();
			testQrcode.setQrcodeErrorCorrect('M');
			testQrcode.setQrcodeEncodeMode('B');
			testQrcode.setQrcodeVersion(7);
			String testString = sms_info;
			byte[] d = testString.getBytes("gbk");
			BufferedImage bi = new BufferedImage(width, height,
					BufferedImage.TYPE_INT_RGB);
			Graphics2D g = bi.createGraphics();
			g.setBackground(Color.WHITE);
			g.clearRect(0, 0, width, height);
			g.setColor(Color.BLACK);
			// 限制最大字节数为119
			if (d.length > 0 && d.length < 120) {
				boolean[][] s = testQrcode.calQrcode(d);
				for (int i = 0; i < s.length; i++) {
					for (int j = 0; j < s.length; j++) {
						if (s[j][i]) {
							g.fillRect(j * 8, i * 8, 8, 8);
						}
					}
				}
			}
			g.dispose();
			bi.flush();
//			File f = new File("D:\\worke\\customs\\web\\code_img\\"+sms_info+".jpg");
			File f = new File("D:\\ABS.jpg");
//			File f = new File("/root/java-tomcat/tomcat7.0/webapps/customs/code_img/"+sms_info+".jpg");
			if (!f.exists())
				f.createNewFile();
			ImageIO.write(bi, "jpg", f);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static String create_image(String sms_info,HttpServletResponse response) throws Exception {
		try {
			Qrcode testQrcode = new Qrcode();
			testQrcode.setQrcodeErrorCorrect('M');
			testQrcode.setQrcodeEncodeMode('B');
			testQrcode.setQrcodeVersion(7);
			String testString = "HG"+sms_info;
			byte[] d = testString.getBytes("gbk");
			BufferedImage bi = new BufferedImage(width, height,
					BufferedImage.TYPE_INT_RGB);
			OutputStream os=response.getOutputStream();
			Graphics2D g = bi.createGraphics();
			g.setBackground(Color.WHITE);
			g.clearRect(0, 0, width, height);
			g.setColor(Color.BLACK);
			// 限制最大字节数为119
			if (d.length > 0 && d.length < 120) {
				boolean[][] s = testQrcode.calQrcode(d);
				for (int i = 0; i < s.length; i++) {
					for (int j = 0; j < s.length; j++) {
						if (s[j][i]) {
							g.fillRect(j * 8, i * 8, 8, 8);
						}
					}
				}
			}
			g.dispose();
			bi.flush();
			response.setDateHeader("expries", -1);
			response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Pragma", "no-cache");
			String url="image/"+sms_info;
			response.setContentType(url);
			ImageIO.write(bi, "jpg",os);
			os.flush();
			os.close();
			os=null;
			response.flushBuffer();
			return url;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "is null";
	}
	
	private static Color colorRGB(){
		R+=3;
		G+=3;
		B+=3;
		if(R>=250){
//			R=95;
			setR(95);
		}
		if(G>=250){
//			G=95;
			setG(95);
		}
		if(B>=250){
//			B=95;
			setB(95);
		}
		System.out.println(R+","+G+","+B);
//		int R=255;
//		int G=94;
//		int B=94;
		Color color=new Color(R,G,B);
		return color;
	}
	

	
	public static int getR() {
		return R;
	}

	public static void setR(int r) {
		R = r;
	}

	public static int getG() {
		return G;
	}

	public static void setG(int g) {
		G = g;
	}

	public static int getB() {
		return B;
	}

	public static void setB(int b) {
		B = b;
	}

}

