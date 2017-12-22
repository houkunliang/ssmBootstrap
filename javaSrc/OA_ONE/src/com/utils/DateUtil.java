package com.utils;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DateFormat;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class DateUtil {

	public static String SYSDATE(String str) {
		Format format = new SimpleDateFormat(str);
		String st = format.format(new Date());
		return st;
	}

	public static String SYSDATEFORMATE() {
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);// time就是当前时间
		time = date2TimeStamp(time, "yyyy-MM-dd HH:mm:ss");
		return time;
	}

	/**
	 * 转换日期格式
	 * 
	 * @param String
	 *            ,String
	 * @return
	 */
	public static String date2TimeStamp(String date_str, String format) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			return String.valueOf(sdf.parse(date_str).getTime() / 1000);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	// 返回当前天时间范围
	public static String getDateTo(String type, int day) {
		// 当前时间的前一个星期 开始时间
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		// c.add(Calendar.DAY_OF_MONTH, -6);
		c.add(Calendar.DAY_OF_MONTH, day);
		String start = "";
		if (type.equals("start")) {
			start = format.format(c.getTime()) + " 00:00:00";
		} else if (type.equals("end")) {
			start = format.format(c.getTime()) + " 23:58:00";
		} else {
			start = format.format(c.getTime());
		}
		return start;
	}

	// 返回当前是星期几
	public static String getWeekOfDate(Date dt) {
		String[] weekDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
		Calendar cal = Calendar.getInstance();
		cal.setTime(dt);
		int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
		if (w < 0)
			w = 0;
		return weekDays[w];
	}

	// 根据时间格式返回时间date
	public static Date getStrToDate(String str) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = null;
		try {
			date = sdf.parse(str);
		} catch (Exception e) {
			e.printStackTrace();

		}
		return date;
	}

	public static boolean checkDate(String str) {
		boolean bl = true;
		SimpleDateFormat format = new SimpleDateFormat();
		try {
			// 设置lenient为false.
			// 否则SimpleDateFormat会比较宽松地验证日期，比如2007/02/29会被接受，并转换成2007/03/01
			format.setLenient(false);
			format.parse(str);
		} catch (Exception e) {
			// e.printStackTrace();
			bl = false;
		}
		return bl;
	}

	public static String forMatTime() {
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		return sdf.format(dt);
	}

	// 字符串转日期
	public static Date stringToDate(String string, String forMat) {
		DateFormat fmt = new SimpleDateFormat(forMat);
		Date date;
		try {
			date = fmt.parse(string);
			return date;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 计算两个日期之间有多少个周末周六
	 * 
	 * @param smdate
	 *            较小的时间
	 * @param bdate
	 *            较大的时间
	 * @return 相差天数
	 * @throws ParseException
	 */
	 @SuppressWarnings("unchecked")
	public static BigDecimal getSundayNum(String startDate, String endDate, String format) {
	        List yearMonthDayList = new ArrayList();
	        Date start = null, stop = null;
	        try {
	            start = new SimpleDateFormat(format).parse(startDate);
	            stop = new SimpleDateFormat(format).parse(endDate);
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
	        if (start.after(stop)) {
	            Date tmp = start;
	            start = stop;
	            stop = tmp;
	        }
	        //将起止时间中的所有时间加到List中
	        Calendar calendarTemp = Calendar.getInstance();
	        calendarTemp.setTime(start);
	        while (calendarTemp.getTime().getTime() <= stop.getTime()) {
	            yearMonthDayList.add(new SimpleDateFormat(format)
	            .format(calendarTemp.getTime()));
	            calendarTemp.add(Calendar.DAY_OF_YEAR, 1);
	        }
	        Collections.sort(yearMonthDayList);
	        int num=0;//周六，周日的总天数
	        int size=yearMonthDayList.size();
	        int week=0;
	        for (int i = 0; i < size; i++) {
	            String day=(String)yearMonthDayList.get(i);
	           // System.out.println(day);
	            week=getWeek(day, format);
	            if (week==6||week==0) {//周六，周日
	                num++;
	            }
	        }
	        return BigDecimal.valueOf(num);
	    }
	 
	 public static int getWeek(String date, String format) {
	        Calendar calendarTemp = Calendar.getInstance();
	        try {
	            calendarTemp.setTime(new SimpleDateFormat(format).parse(date));
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
	        int i = calendarTemp.get(Calendar.DAY_OF_WEEK);
	        int value=i-1;//0-星期日
	        //        System.out.println(value);
	        return value;
	    }


    
    public static void main(String[] args) throws ParseException {  
        // TODO Auto-generated method stub  
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");  
       Date d1=sdf.parse("2017-05-25 09:53");  
        Date d2=sdf.parse("2017-05-27 09:54");
        String str1="2017-06-02 17:49";
        String str2="2017-06-03 17:49";
       // Date d1=sdf.parse(str1.toString().split(" ")[0]+" 12:00");
      //  Date d2=sdf.parse(str1);
        
//        String str1="2017-05-22 09:30";
//        String str2="2017-05-26 17:00"; 
//        str1="2017-05-22 09:30";
//        str2="2017-05-22 12:50"; 
       // String str1="2017-05-26 18:53";
     //   String str2="2017-05-29 23:53"; 
//        String str1="2012-09-07 16:30";
//        String str2="2012-09-09 10:30";
        //System.out.println(daysBetween(str1,str2));
        System.out.println(date2TimeStamp(str1, "yyyy-MM-dd HH:mm"));
    }
    
    /**
     * 判断两个日期的大小
     * @param dt1
     * @param dt2
     * @return
     */
    public static boolean compareDate(Date dt1,Date dt2){
        if (dt1.getTime() > dt2.getTime()) {
        	//第一个大于第二个的情况小返回false
            return false;
        } else if (dt1.getTime() < dt2.getTime()) {
        	//第一个小于第二个的情况小返回ture
            return true;
        } else {//相等
            return false;
        }
}
    
    /**  
     * 计算两个日期之间相差的天数  
     * 规则: 一天算 8小时 转换成 1.0 天 
     * @param smdate 较小的时间 
     * @param bdate  较大的时间 
     * @return 你不管
     * @throws ParseException  
     */        
    public static BigDecimal daysBetween(String smdate,String bdate) throws ParseException    
    {    
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
        Date faOf1=sdf.parse(smdate);  
        Date faOf2=sdf.parse(bdate);
        Date d1=sdf.parse(smdate);  
        Date d2=sdf.parse(bdate);
        d1=sdf.parse(sdf.format(d1));  
        d2=sdf.parse(sdf.format(d2));  
        Calendar cal = Calendar.getInstance();    
        cal.setTime(d1);    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(d2);    
        long time2 = cal.getTimeInMillis();     
		BigDecimal js = new BigDecimal(1);
		BigDecimal a = new BigDecimal((time2-time1));
		BigDecimal b = new BigDecimal((1000*Math.pow(60, 2)));
		//扣除开始和结尾的天数再算中间差,再扣除的中差时间的休息小时
		BigDecimal J = ((a.divide(b,2,RoundingMode.HALF_UP).subtract(start(smdate))).subtract(endDate(bdate))).divide(BigDecimal.valueOf(24),1,RoundingMode.HALF_UP);
		BigDecimal workTime = startOne(smdate).add(endDateTow(bdate)).add(J.multiply(BigDecimal.valueOf(8)));
		BigDecimal reTime = js.divide(BigDecimal.valueOf(8),3,RoundingMode.HALF_UP).multiply(workTime);
		reTime =reTime.setScale(1, BigDecimal.ROUND_HALF_UP);
	    return reTime;                   
    }   
    
    /**
     * 算开始时间距离凌晨 12点的 所有时间 （小时）
     * @param smdate
     * @return BIGBANG
     * @throws ParseException
     */
    public static BigDecimal start(String smdate) throws ParseException    
    {    
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");  
        Date d1=sdf.parse(smdate);  
        Date d2=sdf.parse(smdate.split(" ")[0]+" 23:59");
        d1=sdf.parse(sdf.format(d1));  
        d2=sdf.parse(sdf.format(d2));  
        Calendar cal = Calendar.getInstance();    
        cal.setTime(d1);    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(d2);    
        long time2 = cal.getTimeInMillis();
	    BigDecimal a = new BigDecimal((time2-time1));
	    BigDecimal b = new BigDecimal((1000*Math.pow(60, 2)));
	    a=a.divide(b,2,RoundingMode.HALF_UP);
	    //System.err.println(a);
       return a;           
    }   
    
    /**
     * 算凌晨 12点的小时数 距离 结束时间点的 所有时间（小时）
     * @param smdate
     * @return BIGBANG
     * @throws ParseException
     */
    public static BigDecimal endDate(String smdate) throws ParseException    
    {    
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");  
        Date d1=sdf.parse(smdate.split(" ")[0]+" 00:01");  
        Date d2=sdf.parse(smdate);
        d1=sdf.parse(sdf.format(d1));  
        d2=sdf.parse(sdf.format(d2));  
        Calendar cal = Calendar.getInstance();    
        cal.setTime(d1);    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(d2);    
        long time2 = cal.getTimeInMillis();
	    BigDecimal a = new BigDecimal((time2-time1));
	    BigDecimal b = new BigDecimal((1000*Math.pow(60, 2)));
	    a=a.divide(b,2,RoundingMode.HALF_UP);
       return a;           
    } 
    
    /**
     * 算出开始时间的工作时间
     * @param smdate
     * @return BIGBANG
     * @throws ParseException
     */
    public static BigDecimal startOne(String smdate) throws ParseException    
    {    
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");  
        Date d1=sdf.parse(smdate);  
        Date d2=sdf.parse(smdate.split(" ")[0]+" 18:30");
        d1=sdf.parse(sdf.format(d1));  
        d2=sdf.parse(sdf.format(d2));  
        Calendar cal = Calendar.getInstance();    
        cal.setTime(d1);    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(d2);    
        long time2 = cal.getTimeInMillis();
	    BigDecimal a = new BigDecimal((time2-time1));
	    BigDecimal b = new BigDecimal((1000*Math.pow(60, 2)));
	    a=a.divide(b,3,RoundingMode.HALF_UP);
	    boolean one = a.compareTo(BigDecimal.valueOf(6.45)) == 0;
	    boolean two = a.compareTo(BigDecimal.valueOf(6.45)) == 1;
	    boolean five = a.compareTo(BigDecimal.valueOf(5.45)) == 1;
	    boolean seex = a.compareTo(BigDecimal.valueOf(6.45)) == -1;
	    if(!two){
	    	if(five && seex){
	    		a = BigDecimal.valueOf(5.45);
	    	}
	    }else if(one){
	    	a = BigDecimal.valueOf(5.5);
	    }else{
	    	 a = a.subtract(BigDecimal.valueOf(1));
	    }
	    boolean three = a.compareTo(BigDecimal.valueOf(8.0)) == 0;
	    boolean four = a.compareTo(BigDecimal.valueOf(8.0)) == 1;
	    a = three || four ? BigDecimal.valueOf(8) : a;
       return a;           
    }   
    
    /**
     * 算出结束时间的工作时间
     * @param smdate
     * @return BIGBANG
     * @throws ParseException
     */
    public static BigDecimal endDateTow(String smdate) throws ParseException    
    {    
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");  
        Date d1=sdf.parse(smdate.split(" ")[0]+" 09:30");  
        Date d2=sdf.parse(smdate);
        d1=sdf.parse(sdf.format(d1));  
        d2=sdf.parse(sdf.format(d2));  
        Calendar cal = Calendar.getInstance();    
        cal.setTime(d1);    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(d2);    
        long time2 = cal.getTimeInMillis();
	    BigDecimal a = new BigDecimal((time2-time1));
	    BigDecimal b = new BigDecimal((1000*Math.pow(60, 2)));
	    a=a.divide(b,3,RoundingMode.HALF_UP);
	    boolean one = a.compareTo(BigDecimal.valueOf(3.45)) == 0;
	    boolean two = a.compareTo(BigDecimal.valueOf(3.45)) == 1;
	    boolean five = a.compareTo(BigDecimal.valueOf(2.45)) == 1;
	    boolean seex = a.compareTo(BigDecimal.valueOf(3.45)) == -1;
	    if(!two){
	    	if(five && seex){
	    		a = BigDecimal.valueOf(2.45);
	    	}
	    }else if(one){
	    	a = BigDecimal.valueOf(2.45);
	    }else{
	    	 a = a.subtract(BigDecimal.valueOf(1));
	    }
	    boolean three = a.compareTo(BigDecimal.valueOf(8.0)) == 0;
	    boolean four = a.compareTo(BigDecimal.valueOf(8.0)) == 1;
	    a = three || four ? BigDecimal.valueOf(8) : a;
       return a;           
    } 

}
