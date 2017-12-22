function ECharUtil(){
	this.lineOption ={
	    title: {
	        text: '',
	        subtext: ''
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['意向','预约','来访'],
	    },
	    toolbox: {
	        show: true,
            right:'4%',
	        feature: {
	            magicType: {show: true, type: ['stack', 'tiled']},
	            saveAsImage: {show: true}
	        }
	    },
	    grid: {
			left: '1%',
			right: '2%',
			bottom: '0%',
			containLabel: true
		},
	    xAxis: {
	        type: 'category',
	        boundaryGap: false,
	        data: ['周一','周二','周三','周四','周五','周六','周日'],
            axisLabel: {
                interval:'auto',
                rotate: 0,
                show:'0',
            }
	    },
	    yAxis: {
	        type: 'value'
	    },
	    series: [{
	        name: '意向',
	        type: 'line',
	        smooth: true,
	        data: [10, 12, 21, 54, 260, 830, 710]
	    },
	    {
	        name: '预约',
	        type: 'line',
	        smooth: true,
	        data: [30, 182, 434, 791, 390, 30, 10]
	    },
	    {
	        name: '来访',
	        type: 'line',
	        smooth: true,
	        data: [1320, 1132, 601, 234, 120, 90, 20]
	    }]
	};

	this.shadowOption ={
	    title: {
	        text: '',
	        subtext: ''
	    },
	    tooltip: {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    legend: {
	        data:['意向','预约','来访'],
	    },
	    toolbox: {
	        show: true,
			right:'4%',
	        feature: {
	            magicType: {show: true, type: ['stack', 'tiled']},
	            saveAsImage: {show: true}
	        }
	    },
        grid: {
			left: '0%',
			right: '0%',
			bottom: '0%',
			containLabel: true
		},
	    xAxis: {
	        type: 'category',
	        boundaryGap: true,
	        data: ['周一','周二','周三','周四','周五','周六','周日'],
            axisLabel: {
                interval:'0',
                rotate: 0,
            }
        },
	    yAxis: {
	        type: 'value'
	    },
	    series: [{
	        name: '意向',
	        type: 'bar',
	        smooth: true,
	        barGap:'1',
	        data: [10, 12, 21, 54, 260, 830, 710]
	    },
	    {
	        name: '预约',
	        type: 'bar',
	        barGap:'1',
	        data: [30, 182, 434, 791, 390, 30, 10]
	    },
	    {
	        name: '来访',
	        type: 'bar',
	        barGap:'1',
	        data: [1320, 1132, 601, 234, 120, 90, 20]
	    }]
	};

	this.lineEchar=function(obj,type){
		if(type == undefined ||  type == null || type == ''){
			var myChart = echarts.init(document.getElementById(obj));
			myChart.setOption(this.lineOption);
		}else if(type == 'common'){
			var myChart = echarts.init(obj);
			myChart.setOption(this.lineOption);
		}
		return myChart;
	}

	this.shadowEchar=function(obj,type){
		//console.log(document.getElementById(id));
		if(type == undefined ||  type == null || type == ''){
			var myChart = echarts.init(document.getElementById(obj));
			myChart.setOption(this.shadowOption);
		}else if(type == 'common'){
			var myChart = echarts.init(obj);
			myChart.setOption(this.shadowOption);
		}
		return myChart;
	}
}
var eCharUtil=new ECharUtil();

function CharRoot(){
	this.line=false;
	this.column=false;
	this.cake=false;
	this.leftCharts=false;

    this.lode=function(){
	    this.line=false;
		this.column=false;
		this.cake=false;
		this.leftCharts=false;
    }

    this.setRootAll=function(){
	    this.line=true;
		this.column=true;
		this.cake=true;
		this.leftCharts=true;
    }

    this.setUserRootChar=function(arr){
    	if(arr != null && arr!='' && arr != undefined){
    		for(var i=0;i<arr.length;i++){
    			if(arr[i].TYPE=='line'){
    				this.line=true;
    			}else if(arr[i].TYPE=='column'){
    				this.column=true;
    			}else if(arr[i].TYPE=='cake'){
    				this.cake=true;
    			}else if(arr[i].TYPE=='leftCharts'){
    				this.leftCharts=true;
    			}
    		}
    	}
    }

    this.filterDom=function(){
    	var lines=this.line;
		var columns=this.column;
		var cakes=this.cake;
		var leftChartss=this.leftCharts;
    	$("[rootChar]").each(function () {
			var str=$(this).attr("rootChar");
			if(!lines){
				if(str == 'line'){
					$(this).remove();
				}
			}
			if(!columns){
				if(str == 'column'){
					$(this).remove();
				}
			}
			if(!cakes){
				if(str == 'cake'){
					$(this).remove();
				}
			}
			if(!leftChartss){
				if(str == 'leftCharts'){
					$(this).remove();
				}
			}
		});
    }
}

var charRoot=new CharRoot();

//时间轴:月展示
function dateArrtDelay(){
    var dateArrt=[];
    
    for(var i=30;i>=0;i--){
        if(i == 0){
            var date = new Date();
        }else{
            var date = new Date(new Date().getTime() - i*86400000);
        }
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var day = date.getDate();
//      console.log(day);
        if(month<10){
            month='0'+month
        }
        if(day<10){
            day='0'+day
        }
        var dateStr=( day);
        dateArrt.push(dateStr);
    }
    return dateArrt;
}
//console.log(dateArrtDelay());
//时间轴:周显示
function dateArrDelay(){
	var dateArr=[];
	for(var i=6;i>=0;i--){
		if(i == 0){
			var date = new Date();
		}else{
			var date = new Date(new Date().getTime() - i*86400000);
		}
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		if(month<10){
			month='0'+month
		}
		if(day<10){
			day='0'+day
		}
		var dateStr=(month + '-' + day);
		dateArr.push(dateStr);
	}
	return dateArr;
}

//标题
function Title(){
	var dateArrt=[];
    for(var i=30;i>=0;i--){
        if(i == 0){
            var date = new Date();
        }else{
            var date = new Date(new Date().getTime() - i*86400000);
        }
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var day = date.getDate();
        if(month<10){
            month='0'+month
        }
        if(day<10){
            day='0'+day
        }
    }
    var dateStr=(year+'年'+month+'月');
        dateArrt.push(dateStr);
    return dateArrt;
}

//标题
function TitleYears(){
	var dateArrt=[];
    for(var i=30;i>=0;i--){
        if(i == 0){
            var date = new Date();
        }else{
            var date = new Date(new Date().getTime() - i*86400000);
        }
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var day = date.getDate();
        if(month<10){
            month='0'+month
        }
        if(day<10){
            day='0'+day
        }
    }
    var dateStr=(year+"年");
        dateArrt.push(dateStr);
    return dateArrt;
}

/*
*本月时间轴的所有周 [[],[]]显示时间和数据对比时间
* CREATED ：侯坤良
*/
function getWeekDate(){
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

//调用方案CREATED ：侯坤良
//var hklDateWeek=new dateWeekHkl();
//hklDateWeek.setDate(hklDateWeek.addDate(hklDateWeek.currentFirstDate,-7));
function dateWeekHkl(){     
  this.clen = 7;
  this.currentFirstDate;
  this.formatDate = function(date){  
    var month = (date.getMonth()+1);
    var day = date.getDate();
	if(month<10){
		month="0"+month;
	}
	if(day<10){
		day="0"+day;
	}
	return month+"-"+day;
  };
  this.addDate= function(date,n){    
    date.setDate(date.getDate()+n);
    return date;
  };
  this.setDate = function(date){       
    var week = date.getDay()-1;
    date = this.addDate(date,week*-1);
    this.currentFirstDate = new Date(date);
    var arr = [];
    for(var i = 0;i<this.clen;i++){
    	if(i<7){
    		arr.push(this.formatDate(i==0 ? date : this.addDate(date,1)));
    	}
    }
    return arr;     
  };
  this.setDate(new Date());
}
//var hklDateWeek=new dateWeekHkl();

function dateMonthHkl(){ 
  this.DayNumOfMonth=function(Year,Month){
	    Month--;
	    var d = new Date(Year,Month,1);
	    d.setDate(d.getDate()+32-d.getDate());
	    return (32-d.getDate());
  }

  this.getDateMoneth=function(years,months){
  	 var reArr=[];
  	 var showArr=[];
  	 var dateArrt=[];
  	 var date=new Date;
	 var year=date.getFullYear(); 
	 var month=date.getMonth()+1;
	 month =(month<10 ? "0"+month:month); 
	 var mydate = (year.toString()+month.toString());
	 var datLength=this.DayNumOfMonth(years,months);
	 for(var i=0;i<datLength;i++){
	 	if((i+1)<10){
	 		showArr.push("0"+(i+1))
	 		dateArrt.push(months+"-0"+(i+1));
	 	}else{
	 		showArr.push((i+1)+"")
	 		dateArrt.push(months+"-"+(i+1)+"");
	 	}
	 }
	 reArr.push(showArr);
	 reArr.push(dateArrt);
	 return reArr;
  }
}
var hklDateMonth = new dateMonthHkl();