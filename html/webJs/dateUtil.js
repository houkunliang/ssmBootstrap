//获取当前时间
function getNowTime(){
	var dt = new Date();
	var month = dt.getMonth()+1;
	var day = dt.getDate();
	var time = dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
	return dt.getFullYear() + '-' + (month<10 ? '0' : '') + month + '-' + (day<10 ? '0' : '') + day + ' ' + time; 
}

// 获取当前年月日时
function getNowTimeToHours(){
	var dt = new Date();
	var month = dt.getMonth()+1;
	var day = dt.getDate();
	var time = dt.getHours()+ ":" + dt.getMinutes();
	return dt.getFullYear() + '-' + (month<10 ? '0' : '') + month + '-' + (day<10 ? '0' : '') + day + ' ' + time; 
}


//获取当前系统时间的月
function getNowMouth(){
	var dt = new Date();
	var month = dt.getMonth()+1;
	return (month<10 ? '0' : '') + month;
}

//获取当前系统时间的年月
function getNowYearMouth(){
	var dt = new Date();
	var month = dt.getMonth()+1;
	return dt.getFullYear() + '-' + (month<10 ? '0' : '') + month; 
}

//获取当前系统时间的年月日
function getNowYearMouthDay(){
	var dt = new Date();
	var month = dt.getMonth()+1;
	var day = dt.getDate();
	return dt.getFullYear() + '-' + (month<10 ? '0' : '') + month + '-' + (day<10 ? '0' : '') +day;
}

//获取昨天的日期
function getYesterday(){
	var dt = new Date();
	var year = dt.getFullYear();
	var month = dt.getMonth()+1;
	var day = dt.getDate();
	return year + '-' + (month<10 ? '0' : '') + month + '-' + (day<10 ? '0' : '') + day + " 00:00:00"; 
}

//获取今天的日期
function getToday(){
	var dt = new Date();
	var year = dt.getFullYear();
	var month = dt.getMonth()+1;
	var day = dt.getDate();
	return year + '-' + (month<10 ? '0' : '') + month + '-' + (day<10 ? '0' : '') + day+ " 23:59:59"; 
}

//获取本周一日期
function getCurrentMonday(){
	var dt = new Date();
	var week = dt.getDay();
	var millisecond = 1000 * 60 * 60 * 24; 
	var minusDay = week != 0 ? week - 1 : 6;
	//本周 周一    
    var monday = new Date(dt.getTime() - (minusDay * millisecond));  
	return monday.getFullYear() + '-' +((monday.getMonth()+1)<10?"0":"")+ (monday.getMonth()+1) + '-' +(monday.getDate()<10?"0":"")+ monday.getDate()+ " 00:00:00"; 
}

//获取本周末日期
function getCurrentSunday(){
	var dt = new Date();
	var week = dt.getDay();
	var millisecond = 1000 * 60 * 60 * 24; 
	var minusDay = week != 0 ? week - 1 : 6;
	//本周 周一    
    var monday = new Date(dt.getTime() - (minusDay * millisecond));  
	//本周 周日    
    var sunday = new Date(monday.getTime() + (6 * millisecond)); 
	return  sunday.getFullYear() + '-' +((sunday.getMonth()+1)<10?"0":"")+ (sunday.getMonth()+1) + '-' +(sunday.getDate()<10?"0":"")+ sunday.getDate()+ " 23:59:59"; 
}

//获取本月一日
function getCurrentMonthFirst(){
	var dt = new Date();
	var currentYear = dt.getFullYear();
	var currentMonth = dt.getMonth();
	var firstDay = new Date(currentYear, currentMonth, 1);
	return firstDay.getFullYear() + '-' + ((firstDay.getMonth()+1)<10?"0":"")+(firstDay.getMonth()+1) + '-' +(firstDay.getDate()<10?"0":"")+ firstDay.getDate()+ " 00:00:00"; 
}

//获取本月最后一日
function getCurrentMonthLast(){
	var dt = new Date();
	var currentYear = dt.getFullYear();
	var currentMonth = dt.getMonth();
	var firstDay = new Date(currentYear, currentMonth, 1);
	var millisecond = 1000 * 60 * 60 * 24;
	var nextMonthDayOne = new Date(currentYear, currentMonth + 1, 1);
	var lastDay = new Date(nextMonthDayOne.getTime() - millisecond);  
	return lastDay.getFullYear() + '-' +((lastDay.getMonth()+1)<10?"0":"")+ (lastDay.getMonth()+1) + '-' +(lastDay.getDate()<10?"0":"")+lastDay.getDate()+" 23:59:59"; 
}

//获取当前日期是当前年的第几周
function theWeek() {
    var totalDays = 0;
    now = new Date();
    years = now.getYear()
    if (years < 1000)
        years += 1900
    var days = new Array(12);
    days[0] = 31;
    days[2] = 31;
    days[3] = 30;
    days[4] = 31;
    days[5] = 30;
    days[6] = 31;
    days[7] = 31;
    days[8] = 30;
    days[9] = 31;
    days[10] = 30;
    days[11] = 31;
     
    //判断是否为闰年，针对2月的天数进行计算
    if (Math.round(now.getYear() / 4) == now.getYear() / 4) {
        days[1] = 29
    } else {
        days[1] = 28
    }
 
    if (now.getMonth() == 0) {
        totalDays = totalDays + now.getDate();
    } else {
        var curMonth = now.getMonth();
        for (var count = 1; count <= curMonth; count++) {
            totalDays = totalDays + days[count - 1];
        }
        totalDays = totalDays + now.getDate();
    }
    //得到当前第几周
    var week = Math.ceil(totalDays / 7);
    return week;
}

/*
*本月时间轴的所有月和日
*/
function getCurrentMonth(){
	var dateArrt=[];
	var dt = new Date();
	var currentYear = dt.getFullYear();
	var currentMonth = dt.getMonth();
	var firstDay = new Date(currentYear, currentMonth, 1);
    var allDay = new Date(currentYear, currentMonth+1, 0);
    var daycount = allDay.getDate();
    for(var i = 0;i <daycount;i++){
    	var date = new Date(firstDay.getTime() + (i * 86400000));
    	var month = date.getMonth() + 1;
        var day = date.getDate();
        if(month<10){
            month='0'+month
        }
        if(day<10){
            day='0'+day
        }
        dateArrt.push(month+'-'+day);
    }
	return dateArrt; 
}

/*
*本月时间轴的所有月和日 [[],[]]显示时间和数据对比时间
* CREATED ：侯坤良
*/
function getMonthShowAndSet(){
	var reslueDateObj = [];
	var showDate = [];
	var dateArrt=[];
	var dt = new Date();
	var currentYear = dt.getFullYear();
	var currentMonth = dt.getMonth();
	var firstDay = new Date(currentYear, currentMonth, 1);
    var allDay = new Date(currentYear, currentMonth+1, 0);
    var daycount = allDay.getDate();
    for(var i = 0;i <daycount;i++){
    	var date = new Date(firstDay.getTime() + (i * 86400000));
    	var month = date.getMonth() + 1;
        var day = date.getDate();
        if(month<10){
            month='0'+month
        }
        if(day<10){
            day='0'+day
        }
        showDate.push(day);
        dateArrt.push(month+'-'+day);
    }
    reslueDateObj.push(showDate);
    reslueDateObj.push(dateArrt)
	return reslueDateObj; 
}

/*
*本月时间轴的所有天数
*/
function getCurrentMonthOnlyDay(){
	var dateArrt=[];
	var dt = new Date();
	var currentYear = dt.getFullYear();
	var currentMonth = dt.getMonth();
	var firstDay = new Date(currentYear, currentMonth, 1);
    var allDay = new Date(currentYear, currentMonth+1, 0);
    var daycount = allDay.getDate();
    for(var i = 0;i <daycount;i++){
    	var date = new Date(firstDay.getTime() + (i * 86400000));
    	var month = date.getMonth() + 1;
        var day = date.getDate();
        if(month<10){
            month='0'+month
        }
        if(day<10){
            day='0'+day
        }
        dateArrt.push(day);
    }
	return dateArrt; 
}

/*
*获取本周所有日期
*/
function getCurrentWeek(){
	var dateArr=[];
	var dt = new Date();
	var week = dt.getDay();
	var millisecond = 1000 * 60 * 60 * 24; 
	var minusDay = week != 0 ? week - 1 : 6;

    var monday = new Date(dt.getTime() - (minusDay * millisecond));  
    for(var i = 0;i < 7;i++){
    	var date = new Date(monday.getTime() + (i * millisecond));
    	var month = date.getMonth() + 1;
        var day = date.getDate();
        if(month<10){
            month='0'+month
        }
        if(day<10){
            day='0'+day
        }
        dateArr.push(month+'-'+day);
    }
	return dateArr; 
}

// 中国标准时间转yyyy-MM-dd
function formatTen(num) { 
	return num > 9 ? (num + "") : ("0" + num); 
} 

function formatDates(date) { 
	var year = date.getFullYear(); 
	var month = date.getMonth() + 1; 
	var day = date.getDate(); 
	var hour = date.getHours(); 
	var minute = date.getMinutes(); 
	var second = date.getSeconds(); 
	return year + "-" + formatTen(month) + "-" + formatTen(day); 
} 

/*
*js固定将日期增加一天  或减少一天
* operation 为true时 则为增加一天 默认为减少一天 
* 调用方法changeOneDate('2017-01-30',operation);
*/  
function changeOneDate(dateValue,operation) {  
	var dt = new Date(dateValue);
	dt = dt.valueOf();
	if(operation == true){
		dt = dt + 24 * 60 * 60 * 1000;
	}else{
		dt = dt - 24 * 60 * 60 * 1000;
	}
	dt = new Date(dt);
	var month = dt.getMonth()+1;
	var day = dt.getDate();
	return dt.getFullYear() + '-' + (month<10 ? '0' : '') + month + '-' + (day<10 ? '0' : '') + day;
} 

// 求时间段间隔天数
function  DateDiff(sDate1,  sDate2){    //sDate1和sDate2是2006-12-18格式  
	if(sDate1 == undefined || sDate1 == null || sDate1 == ''){
   		return null;
   }
   if(sDate2 == undefined || sDate2 == null || sDate2 == ''){
   		return null;
   }
   var  aDate,  oDate1,  oDate2,  iDays  
   aDate  =  sDate1.split("-")  
   oDate1  =  new  Date(aDate[1]  +  '/'  +  aDate[2]  +  '/'  +  aDate[0])    //转换为12-18-2006格式  
   aDate  =  sDate2.split("-")  
   oDate2  =  new  Date(aDate[1]  +  '/'  +  aDate[2]  +  '/'  +  aDate[0])  
   iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24)    //把相差的毫秒数转换为天数  
   iDays = iDays==0?1:iDays;
   return  iDays;
}

// 求两个年月日的时间差
function  timeDifference(sDate1,sDate2){    //sDate1和sDate2是2006-12-18格式  
	if(sDate1 == undefined || sDate1 == null || sDate1 == ''){
   		return 0;
   }
   if(sDate2 == undefined || sDate2 == null || sDate2 == ''){
   		return 0;
   }
   var  aDate,oDate1,oDate2; 
   aDate  =  sDate1.split("-")  
   oDate1  =  new  Date(aDate[1]  +  '/'  +  aDate[2]  +  '/'  +  aDate[0])    //转换为12-18-2006格式  
   aDate  =  sDate2.split("-")  
   oDate2  =  new  Date(aDate[1]  +  '/'  +  aDate[2]  +  '/'  +  aDate[0])  
   return  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24);
}
