package com.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/uplodWordUtil")
public class UploadWordUtil extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//上传文件的保存路径  
//    protected String configPath = "uploadFile";  
    protected String configPath = "pictureResources/word";  
    
    protected String _configPath = "\\pictureResources\\word";  
    
    protected String save = "pictureResources/PDF";  
    
    protected String wordSave = "pictureResources/word";  
    
    protected String _save = "\\pictureResources\\PDF";  
    
    protected String dirTemp = "uploadFile/temp";  
      
    protected String dirName = "file";  
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadWordUtil() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//返回文件名称所在位置
		String str="";
		String resuleUrl = this.configPath;
		//文件存放位置
		String savePath ="";
        request.setCharacterEncoding("UTF-8");  
        response.setContentType("text/html; charset=UTF-8");  
        PrintWriter out = response.getWriter();  
        //System.out.println("*****************************************"+request.getParameter("upPath"));
        //文件保存目录路径  
        //String savePath = "E:/";  
//        String savePath = this.getServletContext().getRealPath("/") + configPath;
        if(request.getParameter("upPath")!=null&&!request.getParameter("upPath").equals("")){
        	resuleUrl = request.getParameter("upPath");
        	savePath = this.getServletContext().getRealPath("/") + resuleUrl;
        }else{
        	savePath = this.getServletContext().getRealPath("/") + resuleUrl;
        }
        // 临时文件目录   
        String tempPath = this.getServletContext().getRealPath("/") + dirTemp;  
        
        // 时间
        /**
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");  
        String ymd = sdf.format(new Date());  
        savePath += "/" + ymd + "/"; 
        **/
        
        //System.out.println("------->"+savePath);
        //创建文件夹  
        File dirFile = new File(savePath);  
        if (!dirFile.exists()) {  
            dirFile.mkdirs();  
        }  
          
        /**tempPath += "/" + ymd + "/";  **/
        //创建临时文件夹  
        File dirTempFile = new File(tempPath);  
        if (!dirTempFile.exists()) {  
            dirTempFile.mkdirs();
        }  
          
        DiskFileItemFactory  factory = new DiskFileItemFactory();  
        factory.setSizeThreshold(20 * 1024 * 1024); //设定使用内存超过5M时，将产生临时文件并存储于临时目录中。     
        factory.setRepository(new File(tempPath)); //设定存储临时文件的目录。     
        ServletFileUpload upload = new ServletFileUpload(factory);  
        upload.setHeaderEncoding("UTF-8");  
        try {  
            List items = upload.parseRequest(request);  
            System.out.println("items = " + items);  
            Iterator itr = items.iterator();  
              
            while (itr.hasNext())   
            {  
                FileItem item = (FileItem) itr.next();  
                String fileName = item.getName();  
                long fileSize = item.getSize();  
                if (!item.isFormField()) {  
                    String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();  
                    SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");  
                    String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;  
                    try{  
                        File uploadedFile = new File(savePath, newFileName);  
                        
                        OutputStream os = new FileOutputStream(uploadedFile);  
                        InputStream is = item.getInputStream();  
                        byte buf[] = new byte[1024];//可以修改 1024 以提高读取速度  
                        int length = 0;    
                        while( (length = is.read(buf)) > 0 ){    
                            os.write(buf, 0, length);    
                        }    
                        //关闭流    
                        os.flush();  
                        os.close();    
                        is.close();    
                        System.out.println("上传成功！路径："+savePath+"/"+newFileName);  
//                      out.print(savePath+"/"+newFileName);
                        str+="/"+resuleUrl+"/"+newFileName+",";
                        
                    }catch(Exception e){  
                        e.printStackTrace();  
                    }  
                }else {  
                    String filedName = item.getFieldName();  
                    if(filedName.equals("customData")){
                    	//System.out.println("用户自定义参数===============");
                    	System.out.println("FieldName："+filedName);  
                    	System.out.println(URLDecoder.decode(URLDecoder.decode(item.getString(), "utf-8"), "utf-8"));   
                    }else if(filedName.equals("tailor")){
	                    //System.out.println("裁剪后的参数===============");   
	                    System.out.println("FieldName："+filedName);  
	                    System.out.println(new String(item.getString().getBytes("iso-8859-1"), "utf-8"));  
	                    //获得裁剪部分的坐标和宽高
	                    System.out.println("String："+item.getString()); 
                    }
                }             
            }   
              
        } catch (FileUploadException e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
        System.out.println(str.substring(0, str.length()-1));
//        writer.write("{\"success\":\""+str.substring(0, str.length()-1)+"\"}");
        if(request.getParameter("upType")!=null && !request.getParameter("upType").equals("") && request.getParameter("upType").equals("fileinput")){
        	savePath = this.getServletContext().getRealPath("/") + resuleUrl;
        	Map<String,String> getMap = new HashMap<String, String>();
        	getMap.put("result", "ok");
        	String path =savePath.substring(0,savePath.lastIndexOf("\\"))+_save+"\\"+str.substring(str.lastIndexOf("/")+1, str.lastIndexOf("."))+"."+"html";
        	String add = savePath.substring(0,savePath.lastIndexOf("\\"))+_configPath+"\\"+str.substring(str.lastIndexOf("/")+1, str.length()-1);
        	String hz = str.substring(str.lastIndexOf(".")+1, str.length()-1);
        	System.out.println("path===="+path);
        	System.out.println("add===="+add);
        	System.out.println("hz===="+hz);
        	if(hz.equals("doc") || hz.equals("docx")){
        		getMap.put("path","/"+ save + str.substring(str.lastIndexOf("/"), str.lastIndexOf("."))+"."+"html");
            	getMap.put("pathSave","/"+ wordSave + str.substring(str.lastIndexOf("/"), str.length()-1));
            	if(WordToPDF.wordToHtml(add,path)){
            		out.print(GOJSON.getGson().toJson(getMap));
            	}else{
            		Map<String,String> outMap = new HashMap<String, String>();
            		outMap.put("result", "err");
            		out.print(GOJSON.getGson().toJson(outMap));
            	}
        	}else if(hz.equals("xls") || hz.equals("xlsx")){
               	path =savePath.substring(0,savePath.lastIndexOf("\\"))+_configPath+"\\"+str.substring(str.lastIndexOf("/")+1, str.lastIndexOf("."))+"."+"html";
            	getMap.put("exPath","/"+ _configPath + str.substring(str.lastIndexOf("/"), str.lastIndexOf("."))+"."+"html");
            	getMap.put("exPathSave","/"+ wordSave + str.substring(str.lastIndexOf("/"), str.length()-1));
            	if(WordToPDF.excelToHtml(add,path)){
            		out.print(GOJSON.getGson().toJson(getMap));
            	}else{
            		Map<String,String> outMap = new HashMap<String, String>();
            		outMap.put("result", "err");
            		out.print(GOJSON.getGson().toJson(outMap));
            	}
        	}else if(hz.equals("pdf")){
        		getMap.put("pdfPathSave","/"+ wordSave + str.substring(str.lastIndexOf("/"), str.length()-1));
        		out.print(GOJSON.getGson().toJson(getMap));
        	}

        	
        }else{
        	out.print(str.substring(0, str.length()-1));
        }
        out.flush();  
        out.close(); 
		
	}
}
