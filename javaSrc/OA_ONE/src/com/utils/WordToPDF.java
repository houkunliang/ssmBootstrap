package com.utils;

import java.io.File;

import com.jacob.activeX.ActiveXComponent;  
import com.jacob.com.Dispatch;  
import com.jacob.com.Variant;  

public class WordToPDF {
	
	static final int wdFormatPDF = 17;// PDF 格式  
	static final int WORD_HTML = 8;    
    static final int WORD_TXT = 7;  
    static final int EXCEL_HTML = 44;     
	 
    public static void main(String[] args) {  
       // System.out.println(WordToPDF.wordToPdf("E:/html5.docx","E:/html5.jpg"));
        System.out.println(WordToPDF.wordToHtml("E:/html5.docx","E:/html5.html"));
    }  
    /**  
     * word转pdf  
     * @param fromAddress 待转文件地址  
     * @param toAddress 新文件地址  
     */  
    public static boolean wordToPdf(String fromAddress,String toAddress){  
        ActiveXComponent ax = null;  
        try {  
            long startTime = System.currentTimeMillis();  
            /*  
             * 创建不同的控件调用不同的值  
             * Word——Word.Application  
             * Excel——Excel.Application  
             * Powerpoint——Powerpoint.Application  
             * Outlook——Outlook.Application  
             * */  
            ax = new ActiveXComponent("Word.Application");  
            /*设置打开word文档不可见*/  
            ax.setProperty("Visible", false);  
            //获取Word文档中所有内容  
            Dispatch docs = ax.getProperty("Documents").toDispatch();  
            //打开word文档，并设置word为不可编辑和不需确认  
            Dispatch doc = Dispatch.call(docs,  
                    "Open",   
                    fromAddress,// FileName  
                    false,// ConfirmConversions  
                    true // ReadOnly  
                    ).toDispatch();  
              
            File tofile = new File(toAddress);  
            if (tofile.exists()) {  
                tofile.delete();  
            }  
            //word文件另存为pdf文件  
            Dispatch.call(doc,//  
                    "SaveAs", //  
                    toAddress, // FileName  
                    wdFormatPDF);  
            //关闭word文档  
            Dispatch.call(doc, "Close", false);  
            long endTime = System.currentTimeMillis();  
            System.out.println("转化完成,总共耗时" + (endTime - startTime) + "ms。");  
            return true;
        } catch (Exception e) {  
            System.out.println("========Error:文档转换失败：" + e.getMessage());  
            return false;
        } finally {  
            if (ax != null)  
                ax.invoke("Quit", new Variant[]{});  
        } 
    }  
    
    /**
     * word 转html
     * @param inPath
     * @param toPath
     * @return
     */
    public static boolean wordToHtml (String inPath,String toPath) {   
        
        //启动word    
        ActiveXComponent axc = new ActiveXComponent("Word.Application");    
        boolean flag = false;    
        try {  
        //后台执行，不显示word界面  
        axc.setProperty("Visible",new Variant(false));    
               
        Dispatch docs = axc.getProperty("Documents").toDispatch();    
               
        //打开word文档    
        Dispatch doc = Dispatch.invoke(docs,"Open",Dispatch.Method,  
                new Object[]{inPath,new Variant(false),   
                new Variant(true)},new int[1]).toDispatch();  
          
        //作为html保存到文件    
        Dispatch.invoke(doc, "SaveAs", Dispatch.Method, new Object[] {  
        toPath, new Variant(10) }, new int[1]);     //这里的new Variant(10)中的初始化值是10，而不是8  
        Variant f = new Variant(false);    
        Dispatch.call(doc, "Close", f);    
        flag = true;    
        return flag;    
              
        } catch (Exception e) {    
        e.printStackTrace();    
        return flag;    
        } finally{    
        axc.invoke("Quit", new Variant[] {});    
        }  
    } 
    
    /**   
     * EXCEL转HTML   
     * @param xlsfile EXCEL文件全路径   
     * @param htmlfile 转换后HTML存放路径   
     */    
    public static boolean excelToHtml(String xlsfile, String htmlfile)     
    {     
        // 启动excel  
        ActiveXComponent app = new ActiveXComponent("Excel.Application");      
        boolean flag = false;
        try    
        {     
            //设置excel不可见  
           app.setProperty("Visible", new Variant(false));     
          Dispatch excels = app.getProperty("Workbooks").toDispatch();    
            //打开excel文件  
            Dispatch excel = Dispatch.invoke(     
                    excels,     
                    "Open",     
                    Dispatch.Method,     
                    new Object[] { xlsfile, new Variant(false),     
                            new Variant(true) }, new int[1]).toDispatch();     
          //作为html格式保存到临时文件  
            Dispatch.invoke(excel, "SaveAs", Dispatch.Method, new Object[] {     
                    htmlfile, new Variant(EXCEL_HTML) }, new int[1]);     
          Variant f = new Variant(false);     
          Dispatch.call(excel, "Close", f);     
          flag = true;    
          return flag; 
        }     
        catch (Exception e)     
        {     
            e.printStackTrace();  
            return flag;
        }     
        finally    
        {     
            app.invoke("Quit", new Variant[] {});     
        }     
    } 

}
