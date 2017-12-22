package com.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

@WebServlet("/ckCopyImg")
public class CkCopyImg extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//上传文件的保存路径  
//    protected String configPath = "uploadFile";  
    protected String configPath = "pictureResources/photos";  
  
    protected String dirTemp = "uploadFile/temp";  
      
    protected String dirName = "file";  
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CkCopyImg() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	public String LoadImageToServer(String filePath,String serverPath) throws Exception { 

	    String resultPath = "";          //上传后图片所在的路径 
	    FileOutputStream out = null;     //文件输出流 
	    try {                               //验证图片上传的格式是否正确 
	     File f = new File(filePath); 
	        if (!f.isFile()) { 
	        throw new Exception(" 不是图片文件!"); 
	    } 
	     if (f != null && f.exists()) {          //这里的ImageIO属于java工厂类，在工厂类class里面，调用的System.gc()，频繁调用会造成dump，需要考虑优化 
	        BufferedImage image = ImageIO.read(f); // 读入文件 
	        if (image != null) { 
	        BufferedImage tag = new BufferedImage(image.getWidth(), image.getHeight(), BufferedImage.TYPE_INT_RGB);  //构造一个类型为预定义图像类型之一的 BufferedImage 
	           tag.getGraphics().drawImage(image, 0, 0, image.getWidth(), image.getHeight(), null);                     //绘制所需要尺寸大小的图片 
	        /* 
	         * 以下生成图片上传后在服务器上的新路径 
	         */ 
	        int lastLength = filePath.lastIndexOf("."); 
	        Date date = new Date(System.currentTimeMillis()); 
	        String strDate = new SimpleDateFormat("yyyyMMddhhmmss").format(date); 
	        int random = (int)(Math.random()*99); 
	        String imageName = strDate+random;                          //以系统时间来随机的创建图片文件名 
	        String fileType = filePath.substring(lastLength);              //获取上传图片的类型 
	        resultPath = serverPath+"site"+imageName+fileType; 
	        resultPath = serverPath+"/"+imageName+fileType;
	        /* 
	         * 进行图片的绘制 
	         */ 
	        out = new FileOutputStream(resultPath); 
	        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out); 
	        JPEGEncodeParam param = 
	        encoder.getDefaultJPEGEncodeParam(tag); 
	        param.setQuality(0.95f, true); //95%图像       
	        param.setDensityUnit(1);                //像素尺寸单位.像素/英寸     
	        param.setXDensity(300);                  //水平分辨率       
	        param.setYDensity(300);                 //垂直分辨率 
	        encoder.setJPEGEncodeParam(param); 
	        encoder.encode(tag); 
	        tag = null; 
	      } 
	     } 

	     f = null; 

	    } catch (Exception ex) { 
	     ex.printStackTrace(); 
	    } finally { 
	     out.close(); 
	     out = null; 
	    } 
	    System.out.println("====================================================="+resultPath);
	    return resultPath; 
	} 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//返回文件名称所在位置
		String str=request.getParameter("files");
		String[] strArr = str.split(",");
        request.setCharacterEncoding("UTF-8");  
        response.setContentType("text/html; charset=UTF-8");  
        PrintWriter out = response.getWriter();  
        String getPath = "";
        if(strArr != null && strArr.length > 0){
        	for(int i = 0 ;i<=strArr.length;i++){
        		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+strArr[i]);
        		try {
					getPath+=request.getContextPath()+LoadImageToServer(strArr[i],this.configPath)+",";
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        	}
        }
        if(getPath != null && !getPath.equals("")){
        	getPath = getPath.substring(0, getPath.length()-1);
        }
        
        System.out.println(getPath);
//        writer.write("{\"success\":\""+str.substring(0, str.length()-1)+"\"}");
        out.print(getPath);
        out.flush();  
        out.close(); 
		
	}
}
	

