	//获取当前系统时间的年月日
function getNowYearMouthDay(){
	var dt = new Date();
	var month = dt.getMonth()+1;
	var day = dt.getDate();
	return dt.getFullYear() + '-' + (month<10 ? '0' : '') + month + '-' + (day<10 ? '0' : '') +day;
}
var getNowYearMouthDay = getNowYearMouthDay(); //获取当前系统时间的年月日
//添加工日日程安排表
 function EmploymentOpinion(){
	var html ="	<!-- CALENDAR 日程表-->";
	    html +="	<div class=\'col-md-6\'>";
	    html +="		<div class=\'box border primary\'>";
	    html +="			<div class=\'box-title\'>";
	    html +="				<h4><i class=\'fa fa-calendar\'></i>部门工作计划安排表</h4>";
	    html +="				<div class=\'tools\'>";
	    html +="					<a href=\'javascript:;\' class=\'reload\'>";
	    html +="						<i class=\'fa fa-refresh\' id=\'EmploymentOpinionCalendarRefresh\'></i>";
	    html +="					</a>";
	    html +="					<a href=\'javascript:;\' class=\'collapse\'>";
	    html +="						<i class=\'fa fa-chevron-up\'></i>";
	    html +="					</a>";
	    html +="				</div>";
	    html +="			</div>";
	    html +="			<div class=\'box-body\'>";
	    html +="				<div class=\'sectionCalendar\'></div>";
	    html +="			</div>";
	    html +="		</div>";
	    html +="	</div>";
		$("#mesgDiv").prepend(html);//加载框架到id为mesgDiv 的容器中
 	$(function(){sectionCalendar();});
 	/*--------------------------------N日程表控件N---Zhou Liujun--------------------------------*/
	//刷新按钮
	$("#EmploymentOpinionCalendarRefresh").click(function() {
			initTaskProgress(); //刷新进度条
			sectionCalendar();
	})
		//日程表控件
	function sectionCalendar() {
		$(".sectionCalendar").html(""); //清空容器，防止冲突
		$(".sectionCalendar").append("<div id='sectionCalendar'></div>");								
		/*-----------初始化日历--------------*/
		var calendar = $('#sectionCalendar').fullCalendar({
			eventSources: [{
						events: getPlanTime() //数据源 json
					}],
	//		header: {
	//				left: 'prev,next today',
	//				center: 'title',
	//				right: 'month,agendaWeek,agendaDay'
	//			},
			monthNames:['01','02', '03', '04', '05', '06', '07','08', '09', '10', '11', '12'],
			dayNamesShort:['星期日', '星期一', '星期二', '星期三','星期四', '星期五', '星期六'],
			titleFormat:'YYYY-MMMM ',// September 2013
			buttonText:{
							prev:     '上月',
							next:     '下月',
							prevYear: '去年',
							nextYear: '明年',
							today:    '今天',
							month:    '月',
							week:     '周',
							day:      '日'
				},
	//		contentHeight:'800px',
			eventLimit: true,
			eventLimitText: '更多...',
			selectable: true,//是否允许用户通过单击或拖动选择日历中的对象，包括天和时间。
			selectHelper: false, //当点击或拖动选择时间时，显示默认加载的提示信息，该属性只在周/天视图里可用。
			// 选择添加日程事件 （点击选择）触发事件
			select: function(start, end, allDay) {
				var dia = jDialog.dialog({
					title: "添加日程",
					scrollbar: "yes",
					width: '35%',
					content: getUrl("/function/workPlan/workPlanInfo.html"),
					buttons: [{
						type: 'highlight',
						text: '确定',
						handler: function(button, dialog) {
							var add = addPlan(formatDates(start['_d']),changeOneDate(formatDates(end['_d'])));
							if(add == true){
								subUpdateDia("添加任务成功");
								sectionCalendar();//调用重新加载数据
								initTaskProgress(); //刷新进度条
								dia.close();
							} else {
								subUpdateDia("添加任务失败");
								return false;
							}
							dia.close();
						}
					}, {
						type: 'highlight',
						text: '关闭',
						handler: function(button, dialog) {
							dia.close();
						}
					}]
				});
				addDate(formatDates(start['_d']),changeOneDate(formatDates(end['_d'])));//添加日期默认时间
			},
			editable: true, //是否允许用户编辑     拖拽
			eventDrop:function(event){		//拖动事件
				if(event.end == null || event.end == undefined || event.end == ""){
					var end = formatDates(event.start['_d']); //如果为全天事件，则结束日期为当天
					var update = updatePlan(event.id,formatDates(event.start['_d']),end);//修改日期
				}else{
					var update = updatePlan(event.id,formatDates(event.start['_d']),changeOneDate(event.end['_d']));//修改日期
				}
				if(update == true) {
					subUpdateDia("任务更新成功");
					sectionCalendar();//调用重新加载数据
					initTaskProgress(); //刷新进度条
				} else {
					subUpdateDia("任务更新失败");
					return false;
				}
			},
			eventResize: function(event) { //拉伸事件
				if(event.end == null || event.end == undefined || event.end == ""){
					var end = formatDates(event.start['_d']); //如果为全天事件，则结束日期为当天
					var update = updatePlan(event.id,formatDates(event.start['_d']),end);//修改日期
				}else{
					var update = updatePlan(event.id,formatDates(event.start['_d']),changeOneDate(event.end['_d']));//修改日期
				}
				if(update == true) {
					subUpdateDia("任务更新成功");
					sectionCalendar();//调用重新加载数据
					initTaskProgress(); //刷新进度条
				} else {
					subUpdateDia("任务更新失败");
					return false;
				}
			},
			eventClick: function(event, element) { //日程点击事件
				var dia = jDialog.dialog({
					title: "编辑日程",
					scrollbar: "yes",
					width: '35%',
					closeable: false,
			        content :getUrl("/function/workPlan/workPlanInfo.html"),
			        buttons : [ {
		                      type : 'highlight',
		                      text : '修改',
		                      handler:function(button,dialog){
		                      	if(event.end == null || event.end == undefined || event.end == ""){
									var end = formatDates(event.start['_d']); //如果为全天事件，则结束日期为当天
									var update = updatePlan(event.id,formatDates(event.start['_d']),end);//修改日期
								}else{
									var update = updatePlan(event.id,formatDates(event.start['_d']),changeOneDate(event.end['_d']));//修改日期
								}
								if(update == true) {
									subUpdateDia("任务更新成功");
									sectionCalendar();//调用重新加载数据
									initTaskProgress(); //刷新进度条
									dia.close();
								} else {
									subUpdateDia("任务更新失败");
									dia.close();
									return false;
								}
								dia.close();
		                      }
		                  },
		                  {
		                      type : 'highlight',
		                      text : '删除',
		                      handler:function(button,dialog){
		                      	  if (confirm("您是否要删除本条记录？")==true){
										    deletePlan(event.id); //删除
											sectionCalendar();//调用重新加载数据
											initTaskProgress(); //刷新进度条
											dia.close();
										}
								  dia.close();
		                      }
		                  },
		                  {
		                      type : 'highlight',
		                      text : '取消',
		                      handler:function(button,dialog){
		                    	  dia.close();
		                      }
		            }]
				});
				var jsons = {};
				var queryPlan = urlObj.url + "/workPlan/queryWorkPlan";
				jsons['WORK_PLAN_ID'] = event.id;
				var data = commAjaxPost(queryPlan, jsons);
				initUpdateFrom(data);
			},
			eventMouseover: function(event, element) { //鼠标滑过事件
				var jsons = {};
				var queryPlan = urlObj.url + "/workPlan/queryWorkPlan";
				jsons['WORK_PLAN_ID'] = event.id;
				var data = commAjaxPost(queryPlan,jsons);
				$(this).attr("title",data[0].CONTENT);//添加提示信息
		    }
		}); 	
		//任务时间长短区别
		$('.fc-more').click(function(){
			$('.fc-more-popover .fc-end').css({width:'80%'});
	
		})
	}
	/*--------------------------------S日程表控件S---Zhou Liujun----------------------------------*/
	// 从后台获取日程计划并返回事件
	function getPlanTime() {
		var strdata = urlObj.getJson();
		strdata['FK_USER_ID'] = strdata.token.ID;
		var queryPlan = urlObj.url + "/workPlan/queryWorkPlan";
		var events = [];
		$.ajax({
			url: queryPlan,
			type: "POST",
			async: false,
			data: "data=" + JSON.stringify(strdata),
			dataType: "json",
			success: function(json) {
				if(json != 'list is null' && json != undefined) {
					$.each(json, function(index) {
							var star_dt = json[index]['PLAN_DT'];
							var star_ends = json[index]['END_DT'];
							if(star_ends >= star_dt){
								//如果结束时间大于开始时间，由于插件问题必须将结束时间+1天
								var star_end = changeOneDate(star_ends,true);
							}
							events.push({
								id: json[index].WORK_PLAN_ID,
								title: json[index].USER_NAME + ":" + json[index].NUMBERS,
								start: star_dt, // will be parsed
								end: star_end,
								color: getRandomColor(),
								textColor:'#000'
							});
					});
				}
			}
		});
		return events;
	}
	/*-------随机颜色生成---------*/
	function getRandomColor() {
		return '#' +
			(function(color) {
				return(color += '0123456789abcdef' [Math.floor(Math.random() * 16)]) &&
					(color.length == 6) ? color : arguments.callee(color);
			})('');
	}
	
		// 删除计划
	function deletePlan (id) {
		var deleteMethod = urlObj.url + "/workPlan/deleteWorkPlan";
		var datas = urlObj.getJson();
		datas['ID'] = id;
		return commAjaxPost(deleteMethod, datas).result == 1 ? subUpdateDia("删除成功") : subUpdateDia("删除失败");
	}
 }
 
//添加项目进度安排表
function taskManager(){
	$(function(){sectionCalendar()});
	$("#taskManagerCalendarRefresh").click(function() {
		reWorkPoject(); //刷新进度条
		sectionCalendar();
	})
	var	icon = '<span class="glyphicon glyphicon-tint" aria-hidden="true"></span><span class="glyphicon glyphicon-tint" aria-hidden="true"></span>';
	var html ="	<!-- 项目部工作计划管理表-->";
	    html +="	<div class=\'col-md-6\'>";
	    html +="		<div class=\'box border primary\' style='background:#fff;'>";
	    html +="			<div class=\'box-title\'>";
	    html +="				<h4><i class=\'fa fa-calendar\'></i>项目部工作计划管理表</h4>";
	    html +="				<div class=\'tools\'>";
	    html +="					<a href=\'javascript:;\' class=\'reload\'>";
	    html +="						<i class=\'fa fa-refresh\' id=\'taskManagerCalendarRefresh\'></i>";
	    html +="					</a>";
	    html +="					<a href=\'javascript:;\' class=\'collapse\'>";
	    html +="						<i class=\'fa fa-chevron-up\'></i>";
	    html +="					</a>";
	    html +="				</div>";
	    html +="			</div>";
		html +=				'<h5 class="text-center" style="background:#fff;margin-bottom:0;margin-top:8px">';
		html +=					'<font style="background:#5e87b0;border-radius:5px;color:#5e87b0;width:30px;height:20px;margin:0px 5px">'+icon+'</font>>3天';
		html +=					'<font style="background:#a8bc7b;border-radius:5px;color:#a8bc7b;width:30px;height:20px;margin:0px 5px">'+icon+'</font>1~3天';
		html +=					'<font style="background:#fcd76a;border-radius:5px;color:#fcd76a;width:30px;height:20px;margin:0px 5px">'+icon+'</font>&nbsp;1&nbsp;天';
		html +=					'<font style="background:#d9534f;border-radius:5px;color:#d9534f;width:30px;height:20px;margin:0px 5px">'+icon+'</font>超时';
		html +=				'<h5>';
	    html +="			<div class=\'box-body\'>";
	    html +="				<div class=\'sectionCalendarProject\'></div>";
	    html +="			</div>";
	    html +="		</div>";
	    html +="	</div>";
	$("#mesgDiv").prepend(html);//加载框架到id为mesgDiv 的容器中
}
	//日程表控件
 function sectionCalendar(){
	$(".sectionCalendarProject").html(""); //清空容器，防止冲突
	$(".sectionCalendarProject").append("<div id='sectionCalendarProject'></div>");
	var jsonData = getPlanTime();	//获取后台数据
	/*-----------初始化日历--------------*/
	if(ROOT_LEVE !=undefined && ROOT_LEVE == "0x0001"){	//如果为主管，则有操作权限，否则就只有展示而无操作
		var calendar = $('#sectionCalendarProject').fullCalendar({
			eventSources: [{
						events: jsonData //数据源 json
					}],
			monthNames:['01','02', '03', '04', '05', '06', '07','08', '09', '10', '11', '12'],
			dayNamesShort:['星期日', '星期一', '星期二', '星期三','星期四', '星期五', '星期六'],
			titleFormat:'YYYY-MMMM ',// September 2013
			buttonText:{
							prev:     '上月',
							next:     '下月',
							prevYear: '去年',
							nextYear: '明年',
							today:    '今天',
							month:    '月',
							week:     '周',
							day:      '日'
			},
			eventLimit: true,
			eventLimitText: '更多...',
			selectable: true,//是否允许用户通过单击或拖动选择日历中的对象，包括天和时间。
			selectHelper: false, //当点击或拖动选择时间时，显示默认加载的提示信息，该属性只在周/天视图里可用。
			// 选择添加日程事件 （点击选择）触发事件
			select: function(start, end, allDay) {
				var	creadTime = formatDates(start['_d']);
				if(true){
					var dia = jDialog.dialog({
						title: "工作计划",
						scrollbar: "yes",
						width: '700px',
						content: getUrl("/function/workProjectPlan/workPlanSet.html"),
		     			closeable: true, //是否可关闭
						buttons: [{
							type: 'highlight',
							text: '确定',
							handler: function(button, dialog) {
								var add = addPlan();
								if(add == true){
									subUpdateDia("添加任务成功");
									sectionCalendar();//调用重新加载数据
									reWorkPoject();//刷新进度条
									dia.close();
								} else {
									subUpdateDia("添加任务失败");
									return false;
								}
							}
						}, {
							type: 'highlight',
							text: '关闭',
							handler: function(button, dialog) {
								dia.close();
							}
						}]
					});
					addDate(formatDates(start['_d']),changeOneDate(formatDates(end['_d'])));//添加日期默认时间	
				}else{
					alert("创建时间不能小于当前时间！！");
					$('.fc-highlight').removeClass('fc-highlight');
				}
			},
			editable: false, //是否允许用户编辑     拖拽
	//		eventStartEditable:false,
			eventDrop:function(event){		//拖动事件
					var vacattion = Number(event.vacattion);		
				if(event.end == null || event.end == undefined || event.end == ""){
					var day = Number(DateDiff(formatDates(event.start['_d']),changeOneDate(event.end['_d'])));
					var end = formatDates(event.start['_d']); //如果为全天事件，则结束日期为当天
					var update = dropUpdatePlan(event.id,formatDates(event.start['_d']),end,(day-vacattion));//修改日期
				}else{
					var day = Number(DateDiff(formatDates(event.start['_d']),changeOneDate(event.end['_d'])));
					var update = dropUpdatePlan(event.id,formatDates(event.start['_d']),changeOneDate(event.end['_d']),(day-vacattion));//修改日期
				}
				if(update == true) {
					subUpdateDia("任务更新成功");
					sectionCalendar();//调用重新加载数据
					reWorkPoject(); //刷新进度条
				} else {
					subUpdateDia("任务更新失败");
					sectionCalendar();//调用重新加载数据
					return false;
				}
			},
			eventResize: function(event) { //拉伸事件
					var vacattion = Number(event.vacattion);	
				if(event.end == null || event.end == undefined || event.end == ""){
					var day = Number(DateDiff(formatDates(event.start['_d']),changeOneDate(event.end['_d'])));
					var end = formatDates(event.start['_d']); //如果为全天事件，则结束日期为当天
					if(day-vacattion >0){
						var update = dropUpdatePlan(event.id,formatDates(event.start['_d']),end,(day-vacattion));//修改日期
					}else{
						alert("请核对休息日！预估工时不能为0或负数!\n当前休息日为："+vacattion+"天");
					}
				}else{
					var day = Number(DateDiff(formatDates(event.start['_d']),changeOneDate(event.end['_d'])));
					if(day-vacattion >0){
						var update = dropUpdatePlan(event.id,formatDates(event.start['_d']),changeOneDate(event.end['_d']),(day-vacattion));//修改日期	
					}else{
						alert("请核对休息日！预估工时不能为0或负数!\n当前休息日为："+vacattion+"天");
					}
				}
				if(update == true) {
					subUpdateDia("任务更新成功");
					sectionCalendar();//调用重新加载数据
					reWorkPoject(); //刷新进度条
				} else {
					subUpdateDia("任务更新失败");
					sectionCalendar();//调用重新加载数据
					return false;
				}
			},
			eventClick: function(event, element) { //日程点击事件
				var dia = jDialog.dialog({
					title: "编辑任务",
					scrollbar: "yes",
					width: '35%',
			        content :getUrl("/function/workProjectPlan/workPlanUpdate.html"),
	     			closeable: true, //是否可关闭
			        buttons : [ {
		                      type : 'highlight',
		                      text : '修改',
		                      handler:function(button,dialog){
		                      	if(event.end == null || event.end == undefined || event.end == ""){
									var end = formatDates(event.start['_d']); //如果为全天事件，则结束日期为当天
									var update = updatePlan(event.id,formatDates(event.start['_d']),end);//修改日期
								}else{
									var update = updatePlan(event.id,formatDates(event.start['_d']),changeOneDate(event.end['_d']));//修改日期
								}
								if(update == true) {
									subUpdateDia("任务更新成功");
									sectionCalendar();//调用重新加载数据
									reWorkPoject();
									//$("[data-toggle='tooltip']").tooltip(); //title提示插件初始化
									dia.close();
								} else {
									subUpdateDia("任务更新失败");
									return false;
								}
		                      }
		                  }, 
		                  {
		                      type : 'highlight',
		                      text : '删除',
		                      handler:function(button,dialog){
		                      	  if (confirm("您是否要删除本条记录？")==true){
										    deleteTaskPlan(event.id); //删除
											sectionCalendar();//调用重新加载数据
											dia.close();
										}
								  dia.close();
		                      }
		                  },
		                  {
		                      type : 'highlight',
		                      text : '取消',
		                      handler:function(button,dialog){
		                    	  dia.close();
		                      }
		            		}
						]
				});
					var jsons = {};
					var queryPlan = urlObj.url + "/workProjectPlan/selectWorkPlanInfo";
					jsons['TPWP_ID'] = event.id;
					var data = commAjaxPost(queryPlan, jsons);
					initUpdateFrom(data);//初始化表单
					setProjectUserInfo(data);//初始化制作人，协助人，修改人
					addDate(formatDates(event.start['_d']),changeOneDate(event.end['_d']));//添加日期默认时间
					initTimeCont(data);//初始化时间、内容
			},
			eventMouseover: function(event, element) { //鼠标滑过事件
				var jsons = {};
				var queryPlan = urlObj.url + "/workProjectPlan/selectWorkPlanInfo";
				jsons['TPWP_ID'] = event.id;
				var data = commAjaxPost(queryPlan,jsons);
				$(this).attr("title",data[0].CONTENT);//添加提示信息
			}
		}); 
	}else{
		var calendar = $('#sectionCalendarProject').fullCalendar({
			eventSources: [{
						events: jsonData //数据源 json
					}],
			monthNames:['01','02', '03', '04', '05', '06', '07','08', '09', '10', '11', '12'],
			dayNamesShort:['星期日', '星期一', '星期二', '星期三','星期四', '星期五', '星期六'],
			titleFormat:'YYYY-MMMM ',// September 2013
			buttonText:{
							prev:     '上月',
							next:     '下月',
							prevYear: '去年',
							nextYear: '明年',
							today:    '今天',
							month:    '月',
							week:     '周',
							day:      '日'
			},
			eventLimit: true,
			eventLimitText: '更多...',
			editable: false, //是否允许用户编辑     拖拽
			selectable: false,//是否允许用户通过单击或拖动选择日历中的对象，包括天和时间。
			selectHelper: false, //当点击或拖动选择时间时，显示默认加载的提示信息，该属性只在周/天视图里可用。
			eventMouseover: function(event, element) { //鼠标滑过事件
				var jsons = {};
				var queryPlan = urlObj.url + "/workProjectPlan/selectWorkPlanInfo";
				jsons['TPWP_ID'] = event.id;
				var data = commAjaxPost(queryPlan,jsons);
				$(this).attr("title",data[0].CONTENT);//添加提示信息
		    }
		}); 
	}
	 fcCont();
	$('.fc-content').css({'cursor':'pointer'})
		//任务时间长短区别
	$('.fc-more').click(function(){
		$('.fc-more-popover .fc-end').css({width:'80%'});
	});

/*--------------------------------S日程表控件S---Zhou Liujun----------------------------------*/
// 从后台获取日程计划并返回事件
function getPlanTime() {
	var strdata = urlObj.getJson();
	strdata['USER_ID'] = strdata.token.ID;
	strdata['ROLE_ID'] = strdata.token.ROLE_ID;
	strdata['TYPE'] = '0';
	var queryPlan = urlObj.url + "/workProjectPlan/queryWorkPlan";
	var events = [];
	$.ajax({
		url: queryPlan,
		type: "POST",
		async: false,
		data: "data=" + JSON.stringify(strdata),
		dataType: "json",
		success: function (json) {
			if (json != 'list is null' && json != undefined) {
				$.each(json, function (index) {
					var star_dt = json[index]['STAR_DT'];
					var star_ends = json[index]['END_DT'];
					if (star_ends >= star_dt) {
						//如果结束时间大于开始时间，由于插件问题必须将结束时间+1天
						var star_end = changeOneDate(star_ends, true);
					}
					events.push({
						id: json[index].ID,
						//title: "制作内容:"+json[index].USER_NAME + " 描述:" + json[index].CONTENT,
						title: json[index].PJ_CONTENT,
						start: star_dt, // will be parsed
						end: star_end,
						color: setProjectColor(star_ends) + '!important',
						vacattion: json[index].VACATION,
						rootType: json[index].ROOT_TYPE
					});
				});
			}
		}
	});
	return events;
}
//------------任务颜色设定--Zhou Liujun------
	function setProjectColor(star_end){
	    function DateDiff(sDate1,sDate2){    //sDate1和sDate2是2006-12-18格式  
		   var  aDate,  oDate1,  oDate2,  iDays;  
		   aDate  =  sDate1.split("-")  
		   oDate1  =  new  Date(aDate[1]  +  '/'  +  aDate[2]  +  '/'  +  aDate[0])    //转换为12-18-2006格式
		   aDate  =  sDate2.split("-")  
		   oDate2  =  new  Date(aDate[1]  +  '/'  +  aDate[2]  +  '/'  +  aDate[0])
		   iDays  =  parseInt(Math.round(oDate1  -  oDate2)  /  1000  /  60  /  60  /24)    //把相差的毫秒数转换为天数
		   return  iDays;
	   }
	var times =  DateDiff(star_end,getNowYearMouthDay);//计算剩余时间
		if(times > 3){
			return '#5e87b0'; //蓝
		}else if( 1 < times && times <= 3){
			return '#a8bc7b';//绿
		}else if( 0 <= times && times <= 1){
			return '#fcd76a'; //黄
		}else{
			return '#d9534f'; //红
		}
}
		//初始化修改
	function setProjectUserInfo(objArr){
		var appendHtml='';
		if(objArr != undefined && objArr != null && objArr.length > 0){
			var TPU_ID = objArr[0]['TPU_ID'];//project_user_id
			var NUM_VALUE = objArr[0]['NUM_VALUE'];
			var USER_TYPE = objArr[0]['USER_TYPE'];
			var USER_ID = objArr[0]['USER_ID'];
			var USER_NAME = objArr[0]['USER_NAME'];
			var TPU_ID_ARR = TPU_ID.split(',');
			var length = TPU_ID_ARR.length;
			if(length>0){
				var NUM_VALUE_ARR = NUM_VALUE.split(',');
				var USER_TYPE_ARR = USER_TYPE.split(',');
				var USER_ID_ARR = USER_ID.split(',');
				var USER_NAME_ARR = USER_NAME.split(',');			
				for(var i = 0; i < length; i++){
					var proUserId = TPU_ID_ARR[i],numVal = NUM_VALUE_ARR[i] , userType = USER_TYPE_ARR[i], userId= USER_ID_ARR[i],userName = USER_NAME_ARR[i]
					$('#appendTrSelect').append(appendHtmlForProjectUser(proUserId,numVal,userType));
					$($('.USER_IDS')[i]).select2({
						data: select2Tofromatt(RepeTitions(selectJsonSet(false)), 'ID', 'USER_NAME')
					});
					$($('.USER_IDS')[i]).select2();
					$($('.USER_IDS')[i]).val(userId).trigger("change");
				}
			}
		}
	}

	
		//删除 修改人和协助人  前端删除
	function delTesk(obj){
		var num1 = Number($(obj).parent().parent('tr').find('.UP_NUM_VALUE').val());
		var num2 = Number($(obj).parent().parent('tr').find('.NUM_VALUE').val());
		var fkNum = Number($("#FK_USER_VALUE").val());
		var sum = 0;
		if(confirm("您是否要删除这条数据？")){
			if(num1!=undefined && num1 != NaN){		
				sum = num1 + fkNum;	
				$("#FK_USER_VALUE").val(sum);	
			}
			if(num2!=undefined && num2 != NaN){
				sum = num2 + fkNum;
				$("#FK_USER_VALUE").val(sum);	
			}	
			$(obj).parent().parent('tr').remove();
		}
	}
	

	function  DateDiff(sDate1,sDate2){    //sDate1和sDate2是2006-12-18格式
	   var  aDate,  oDate1,  oDate2,  iDays;
	   aDate  =  sDate1.split("-");
	   oDate1  =  new  Date(aDate[1]  +  '/'  +  aDate[2]  +  '/'  +  aDate[0]);    //转换为12-18-2006格式
	   aDate  =  sDate2.split("-");
	   oDate2  =  new  Date(aDate[1]  +  '/'  +  aDate[2]  +  '/'  +  aDate[0]);
	   iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24);    //把相差的毫秒数转换为天数
	   iDays+=1;
	   return  iDays;
	}

	function appendHtmlForProjectUser(proUserId,numVal,userType){
			var html = '<tr class="text-right projectRow">';
		if(userType!=undefined){
			if(userType=='0'){
				html += '<td class="item_title">制作人</td>';
			}else if(userType=='1'){
				html += '<td class="item_title">协助人</td>';
			}else if(userType=='2'){
				html += '<td class="item_title">修改人</td>';
			}
			if(userType=='0'){
				html+='<td style="min-width:206px"><select form_sub="USER_ID" name="FK_USER_ID" class="form-control USER_IDS FK_USER_ID"  style="width: 100%;" onchange="changeTesk();"></td>';
				html+='<td><input form_sub="NUM_VALUE" id="FK_USER_VALUE" class="form-control NUM_VALUE" min="0" type="number" value="'+numVal+'" placeholder="请输入当前人所占的数值" onchange="countsNumVal();" /></td>';
				html += '<td ><span class="glyphicon glyphicon-question-sign" title="更改已有参与人员数值，系统将会自动添加协助人" aria-hidden="true"></span></td>';
			}else if(userType=='1'){
				html+='<td style="min-width:206px"><select form_sub="USER_ID" name="FK_USER_ID" class="form-control USER_IDS FK_USER_ID"  style="width: 100%;" onchange="upUserName();"></td>';
				html+='<td><input form_sub="NUM_VALUE" class="form-control NUM_VALUE"  min="0" type="number" value="'+numVal+'" placeholder="请输入当前人所占的数值"  onchange="countsNumVal();" /></td>';
			}else{
				html+='<td style="min-width:206px"><select form_sub="USER_ID" name="FK_USER_ID" class="form-control USER_IDS UP_USER"  style="width: 100%;"  onchange="upUserName();"></td>';
				html+='<td><input form_sub="NUM_VALUE" class="form-control UP_NUM_VALUE"  min="0" type="number" value="'+numVal+'" placeholder="请输入当前人所占的数值"/></td>';
			}
			
			if(userType=='1'){
				html+='<td><input type="button" class="btn btn-warning" style="display:inline-block" onclick="delTeskAssistAjax(this)" value="删除" /></td>';
			}else if(userType=='2'){
				html+='<td><input type="button" class="btn btn-warning" style="display:inline-block" onclick="delTeskUpdataAjax(this)" value="删除" /></td>';
			}
			html+='<td><input type="button" class="hidden projectId" value="'+proUserId+'"/></td>';
			html+='<td><input type="button" class="hidden OPERATE_TYPE" value="0"/></td>';
		}
		html+='</tr>';
		return html;
	}

	//重复验证
	function RepeTitions(jsonObj){
		var returnObj = [];
		var compare = [];
		$(".projectRow").each(function(index,element){
			var userId = $(element).find('.FK_USER_ID').val();
			var upUserId = $(element).find('.UP_USER').val();
			if(userId!=undefined){
				compare.push(userId);
			}
			if(upUserId!=undefined){
				compare.push(upUserId);
			}
		});
		
		for(x in jsonObj){
			var temp = jsonObj[x];
			var checkId = temp.ID;
			var flg = true;
			for(y in compare){
				var compareId = compare[y];
				if(checkId == compareId){
					flg =false;
				}
			}
			if(flg){
				returnObj.push(temp);
			}
		}
		return returnObj;
	}
	
	//拖动修改事件
	var dropUpdatePlan = function(id, starts, ends,day) {
		var datas = urlObj.getJson();
		var updateWorkPlan = urlObj.url +"/workProjectPlan/updateWorkPlan";
		var startTime = $("#STAR_DT").val();
		var endTime = $("#END_DT").val();
		datas['ID'] = id; 	//工作计划id
		datas['UPDATED_BY'] = datas.token.ID;
		datas['PLAN_DT'] = day;//预估时间
		if(ends == null || ends == undefined || ends == '') {
			ends = starts; //如果为全天事件，则结束日期也为今天
		}
		if(startTime != null && endTime != null && startTime != "" && endTime != "" && startTime != undefined && endTime != undefined){
			datas['STAR_DT'] = startTime;
			datas['END_DT'] = endTime;
		}else{
			datas['STAR_DT'] = starts;
			datas['END_DT'] = ends;
		}
		if(commAjaxPost(updateWorkPlan, datas).result == 1) {
			return true;
		} else {
			return false;
		}
	}

	// 删除进度任务
	var deleteTaskPlan = function(id) {
		var deleteMethod = urlObj.url + "/workProjectPlan/deleteWorkPlan";
		var datas = urlObj.getJson();
		var pjIds = $("#PJ_MNG_IDS").val();
		if(pjIds!=undefined&&pjIds!=""){
			datas['PJ_MNG_ID'] = pjIds;
			datas['ID'] = id;
			return commAjaxPost(deleteMethod, datas).result == 1 ? subUpdateDia("删除成功") : subUpdateDia("删除失败");
		}else{
			subUpdateDia("删除失败");
		}
	}
}

function missionPlanMeter(){
	$(function(){sectionCalendarMeter()});
	$("#taskManagerCalendarRefresh").click(function() {
		reWorkPoject(); //刷新进度条
		sectionCalendarMeter();
	})
	var	icon = '<span class="glyphicon glyphicon-tint" aria-hidden="true"></span><span class="glyphicon glyphicon-tint" aria-hidden="true"></span>';
	var html ="	<!-- 添加商务部任务计划发布表控件-->";
	    html +="	<div class=\'col-md-6\'>";
	    html +="		<div class=\'box border primary\'style='background:#fff;'>";
	    html +='			<div class="box-title" >';
	    html +="				<h4><i class=\'fa fa-calendar\'></i>商务部任务计划发布表</h4>";
	    html +="				<div class=\'tools\'>";
	    html +="					<a href=\'javascript:;\' class=\'reload\'>";
	    html +="						<i class=\'fa fa-refresh\' id=\'taskManagerCalendarRefresh\'></i>";
	    html +="					</a>";
	    html +="					<a href=\'javascript:;\' class=\'collapse\'>";
	    html +="						<i class=\'fa fa-chevron-up\'></i>";
	    html +="					</a>";
	    html +="				</div>";
	    html +="			</div>";
		html +=				'<h5 class="text-center" style="background:#fff;margin-bottom:0;margin-top:8px">';
		html +=					'<font style="background:#5e87b0;border-radius:5px;color:#5e87b0;width:30px;height:20px;margin:0px 5px">'+icon+'</font>>3天';
		html +=					'<font style="background:#a8bc7b;border-radius:5px;color:#a8bc7b;width:30px;height:20px;margin:0px 5px">'+icon+'</font>1~3天';
		html +=					'<font style="background:#fcd76a;border-radius:5px;color:#fcd76a;width:30px;height:20px;margin:0px 5px">'+icon+'</font>&nbsp;1&nbsp;天';
		html +=					'<font style="background:#d9534f;border-radius:5px;color:#d9534f;width:30px;height:20px;margin:0px 5px">'+icon+'</font>超时';
		html +=				'<h5>';
	    html +="			<div class=\'box-body\'>";
	    html +="				<div class=\'missionPlanMeter\'></div>";
	    html +="			</div>";
	    html +="		</div>";
	    html +="	</div>";   
	$("#mesgDiv").prepend(html);//加载框架到id为mesgDiv 的容器中
	//日程表控件
function sectionCalendarMeter(){
	$(".missionPlanMeter").html(""); //清空容器，防止冲突
	$(".missionPlanMeter").append("<div id='missionPlanMeter'></div>");	
	var jsonDatas = getPlanTime();//获取数据
	/*-----------初始化日历--------------*/
	var calendar = $('#missionPlanMeter').fullCalendar({
		eventSources: [{
					events: jsonDatas //数据源 json
				}],
//		header: {
//				left: 'prev,next today',
//				center: 'title',
//				right: 'month,agendaWeek,agendaDay'
//			},
		monthNames:['01','02', '03', '04', '05', '06', '07','08', '09', '10', '11', '12'],
		dayNamesShort:['星期日', '星期一', '星期二', '星期三','星期四', '星期五', '星期六'],
		titleFormat:'YYYY-MMMM ',// September 2013
		buttonText:{
						prev:     '上月',
						next:     '下月',
						prevYear: '去年',
						nextYear: '明年',
						today:    '今天',
						month:    '月',
						week:     '周',
						day:      '日'
			},
//		contentHeight:'800px',
		eventLimit: true,
		eventLimitText: '更多...',
		selectable: true,//是否允许用户通过单击或拖动选择日历中的对象，包括天和时间。
		selectHelper: false, //当点击或拖动选择时间时，显示默认加载的提示信息，该属性只在周/天视图里可用。
		// 选择添加日程事件 （点击选择）触发事件
		select: function(start, end, allDay) {
			var	subEnd = changeOneDate(end['_d']);
			if(subEnd >=getNowYearMouthDay){
				var dia = jDialog.dialog({
					title: "任务计划发布",
					scrollbar: "yes",
					width: '700px',
					height:'550px',
					content: getUrl("/function/businessSchedule/add.html"),
	     			closeable: true, //是否可关闭
					buttons: [{
						type: 'highlight',
						text: '确定',
						handler: function(button, dialog) {
							var add = addTask();
							if(add == true){
								subUpdateDia("添加任务成功");
								sectionCalendarMeter();//调用重新加载数据
								reWorkPoject(); //刷新进度条 
								dia.close();
							} else if(add==2 || add =="2"){
								subUpdateDia("该内容已重复");
								return false;
							}else{
								subUpdateDia("添加任务失败");
							}
						}
					}, {
						type: 'highlight',
						text: '关闭',
						handler: function(button, dialog) {
							dia.close();
						}
					}]
				});
				$('#SB_TIME').val(subEnd);//设置提交时间
			}else{
				alert("创建时间不能小于当前时间！！");
				$('.fc-highlight').removeClass('fc-highlight');
			}
		},
		editable: true, //是否允许用户编辑     拖拽
//		eventStartEditable:false,
		eventDrop:function(event){	//拖动事件
			if(jsonDatas != '' && jsonDatas != null){
				for(x in jsonDatas){
					if(jsonDatas[x]['id'] == event.id){
						var jsonDataStartTime = jsonDatas[x]['start'];
					}
				}
			}
			if(event.end == null || event.end == undefined || event.end == ""){
				var end = formatDates(event.start['_d']); //如果为全天事件，则结束日期为当天
				if(end >= jsonDataStartTime){
					var update = dropUpdateTask(event.id,end);//修改日期
				}else{
					alert('提交时间不能小于创建时间！！\n当前创建时间：'+jsonDataStartTime);
				}
			}else{
				var ends = changeOneDate(event.end['_d']);
				if(ends >= jsonDataStartTime){
					var update = dropUpdateTask(event.id,ends);//修改日期
				}else{
					alert('提交时间不能小于创建时间！！\n当前创建时间：'+jsonDataStartTime);
				}
			}
			if(update == true) {
				subUpdateDia("任务更新成功");
				sectionCalendarMeter();//调用重新加载数据
				reWorkPoject(); //刷新进度条 				
			} else {
				subUpdateDia("任务更新失败");
				sectionCalendarMeter();//调用重新加载数据
				return false;
			}
		},
		eventResize: function(event) { //拉伸事件	
			if(event.end == null || event.end == undefined || event.end == ""){
				var end = formatDates(event.start['_d']); //如果为全天事件，则结束日期为当天
				var update = dropUpdateTask(event.id,end);//修改日期
			}else{
				var update = dropUpdateTask(event.id,changeOneDate(event.end['_d']));//修改日期
			}
			if(update == true) {
				subUpdateDia("任务更新成功");
				sectionCalendarMeter();//调用重新加载数据
				initTaskProgress(); //刷新进度条
			} else {
				subUpdateDia("任务更新失败");
				return false;
			}
		},
		eventClick: function(event, element) { //日程点击事件
			var dia = jDialog.dialog({
				title: "编辑任务",
				scrollbar: "yes",
				width: '35%',
				height:'550px',
		        content :getUrl("/function/businessSchedule/update.html"),
     			closeable: true, //是否可关闭
		        buttons : [ {
	                      type : 'highlight',
	                      text : '修改',
	                      handler:function(button,dialog){
							var update = subUpdateTask();//修改日期
							if(update == true) {
								subUpdateDia("任务更新成功");
								sectionCalendarMeter();//调用重新加载数据
								reWorkPoject(); //刷新进度条
								dia.close();
							} else {
								subUpdateDia("任务更新失败");
								return false;
							}
	                      }
	                  }, 
	                  {
	                      type : 'highlight',
	                      text : '删除',
	                      handler:function(button,dialog){
	                      	  if (confirm("您是否要删除本条记录？")==true){
									    delDialog(event.id); //删除
										sectionCalendarMeter();//调用重新加载数据
										dia.close();
									}
							  dia.close();
	                      }
	                  },
	                  {
	                      type : 'highlight',
	                      text : '取消',
	                      handler:function(button,dialog){
	                    	  dia.close();
	                      }

	            		}
					]
			});
			initUpdateTask(event.id); 
			updateTask();
		},
		eventMouseover: function(event, element) { //鼠标滑过事件
			var strdata = urlObj.getJson();
				strdata['ID'] = event.id;
			var findProject = urlObj.url + "/projectManage/queryProject";
			var data = commAjaxPost(findProject,strdata);
			$(this).attr("title",data[0].PJ_DESCRIBE);//添加提示信息
	    }
	}); 
	fcCont();
		//任务时间长短区别
	$('.fc-more').click(function(){
		$('.fc-more-popover .fc-end').css({width:'80%'});
	});
	fcPast();
	$('.fc-prev-button').click(function(){
		//禁止选择
		fcPast();
	})
	$('.fc-next-button').click(function(){
		//禁止选择
		fcPast();
	})
	function fcPast(){
		//禁止选择
		$('.fc-past').css({
			'background': '#f4f4f4',
			'-webkit-touch-callout': 'none',
			'-webkit-user-select': 'none',
			'-khtml-user-select': 'none',
			' -moz-user-select': 'none',
			'-ms-user-select': 'none',
			' user-select': 'none',
			'cursor': 'no-drop'
		});
	}

}

/*--------------------------------S日程表控件S---Zhou Liujun----------------------------------*/
// 从后台获取日程计划并返回事件
function getPlanTime() {
	var strdata = urlObj.getJson();
	strdata['CREATED_BY'] = strdata.token.ID;
	var findProject = urlObj.url + "/projectManage/queryProject";
	var events = [];
	$.ajax({
		url: findProject,
		type: "POST",
		async: false,
		data: "data=" + JSON.stringify(strdata),
		dataType: "json",
		success: function(json) {
			if(json != 'list is null' && json != undefined) {
				$.each(json, function(index) {
						var star_dt = json[index]['CREATED_DT'];
						var star_ends = json[index]['SB_TIME'];
						if(star_ends >= star_dt){
							//如果结束时间大于开始时间，由于插件问题必须将结束时间+1天
							var star_end = changeOneDate(star_ends,true);							
						}else{
							var star_end = changeOneDate(star_ends,true);
						}
						events.push({
							id: json[index].ID,
							//title: "制作内容:"+json[index].USER_NAME + " 描述:" + json[index].CONTENT,
							title:json[index].PJ_CONTENT,
							start: star_dt, // will be parsed
							end: star_end,
							color: setProjectColor(star_end)+'!important',
						});
				});
			}
		}
	});
	return events;
}

//------------任务颜色设定--Zhou Liujun------
function setProjectColor(star_end){
    function DateDiff(sDate1,sDate2){    //sDate1和sDate2是2006-12-18格式  
	   var  aDate,  oDate1,  oDate2,  iDays;  
	   aDate  =  sDate1.split("-")  
	   oDate1  =  new  Date(aDate[1]  +  '/'  +  aDate[2]  +  '/'  +  aDate[0])    //转换为12-18-2006格式
	   aDate  =  sDate2.split("-")  
	   oDate2  =  new  Date(aDate[1]  +  '/'  +  aDate[2]  +  '/'  +  aDate[0])
	   iDays  =  parseInt(Math.round(oDate1  -  oDate2)  /  1000  /  60  /  60  /24)    //把相差的毫秒数转换为天数  
	   return  iDays;  
   }    
	var times =  DateDiff(star_end,getNowYearMouthDay);//计算剩余时间
		if(times > 3){
			return '#5e87b0'; //蓝
		}else if( 1 < times && times <= 3){
			return '#a8bc7b';//绿
		}else if( 0 <= times && times <= 1){
			return '#fcd76a'; //黄
		}else{
			return '#d9534f'; //红
		}
}

	
	

function  DateDiff(sDate1,  sDate2){    //sDate1和sDate2是2006-12-18格式  
   var  aDate,  oDate1,  oDate2,  iDays  
   aDate  =  sDate1.split("-")  
   oDate1  =  new  Date(aDate[1]  +  '/'  +  aDate[2]  +  '/'  +  aDate[0])    //转换为12-18-2006格式
   aDate  =  sDate2.split("-")  
   oDate2  =  new  Date(aDate[1]  +  '/'  +  aDate[2]  +  '/'  +  aDate[0])
   iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24)    //把相差的毫秒数转换为天数  
   iDays+=1;
   return  iDays;
}

var addProMethod = urlObj.url + "/projectManage/addProject";
function addTask(){
	var datas = urlObj.getJson();
	var proDatas = {};
	if(checkRepeats() == false) {
		return;
	} else {
		proDatas['PJ_CONTENT'] = $("#PJ_CONTENT").val();
		proDatas['PJ_NAME_INPUT'] = $("#PJ_NAME_INPUT").val();
		proDatas['PJ_TYPE_INPUT'] = $("#PJ_TYPE_INPUT").val();
		proDatas['SB_TIME'] = $("#SB_TIME").val();
		proDatas['PJ_LEVE'] = $("#PJ_LEVE").val();
		proDatas['PJ_DESCRIBE'] = $("#PJ_DESCRIBE").val();
		proDatas['CREATED_BY'] = datas.token.ID;
		proDatas['PJ_IMG_URL'] = $("#PJ_IMG_URL").val();
		var data = commAjaxPost(addProMethod, proDatas).result;
		if(data == 1) {
			return true;
			initTable('load');
		} else if(data == 2) {
			return 2;
		} else {
			return false;
			subUpdateDia("失败");
		}
	}
}
// 添加验证
function checkRepeats() {
	var flag = false;
	var checkRepeat = urlObj.url + "/projectManage/checkRepeatByContent";
	var content = $('#PJ_CONTENT').val();
	var data = urlObj.getJson();
	data['PJ_NAME_INPUT'] = $("#PJ_NAME_INPUT").val();
	data['PJ_TYPE_INPUT'] = $("#PJ_TYPE_INPUT").val();
	data['PJ_CONTENT'] = $("#PJ_CONTENT").val();
	var result = commAjaxPost(checkRepeat, data).result;
	if($("#PJ_NAME_INPUT").val() == undefined || $("#PJ_NAME_INPUT").val() == null || $("#PJ_NAME_INPUT").val().length == 0) {
		alert("项目名不能为空");
		return flag;
	} else if($("#PJ_TYPE_INPUT").val() == undefined || $("#PJ_TYPE_INPUT").val() == null || $("#PJ_TYPE_INPUT").val().length == 0) {
		alert("类型不能为空");
	} else if($("#PJ_CONTENT").val() == undefined || $("#PJ_CONTENT").val() == null || $("#PJ_CONTENT").val().length == 0) {
		alert("请输入内容");
		return flag;
	} else if(result == 2) {
		alert("该内容已存在");
		return flag;
	} else {
		return flag = true;
	}

}
// 修改验证
function checkRepeats1() {
	var flag = false;
	var checkRepeat = urlObj.url + "/projectManage/checkRepeatByContent";
	var content = $('#PJ_CONTENT').val();
	var data = urlObj.getJson();
	data['PJ_NAME_INPUT'] = $("#PJ_NAME_INPUT").val();
	data['PJ_TYPE_INPUT'] = $("#PJ_TYPE_INPUT").val();
	data['PJ_CONTENT'] = $("#PJ_CONTENT").val();
	var result = commAjaxPost(checkRepeat, data).result;
	if($("#PJ_NAME_INPUT").val() == undefined || $("#PJ_NAME_INPUT").val() == null || $("#PJ_NAME_INPUT").val().length == 0) {
		alert("项目名不能为空");
		return flag;
	} else if($("#PJ_TYPE_INPUT").val() == undefined || $("#PJ_TYPE_INPUT").val() == null || $("#PJ_TYPE_INPUT").val().length == 0) {
		alert("类型不能为空");
	} else if($("#PJ_CONTENT").val() == undefined || $("#PJ_CONTENT").val() == null || $("#PJ_CONTENT").val().length == 0) {
		alert("请输入内容");
		return flag;
	} else{
		return flag = true;
	}
}


var findProject = urlObj.url + "/projectManage/queryProject";
function initUpdateTask(id) {
	//清空盒子二 以免冲突
	var datas = urlObj.getJson();
	$("#box_tab2").html("");
	datas['ID'] = id;
	var data = commAjaxPost(findProject, datas);
	$("#box_tab3").html(getUrl(updateUrl));
	$('#update').tab('show');
	initUpdateFrom(data);
	//$('#PJ_LEVES').val(data[0].NAME).trigger("change");
}
	
function updateTask(){
	//项目名称
	var datas = urlObj.getJson();
	// 对select框里动态显示数据
	var findUrl = urlObj.url + "/projectManage/queryPjName";
	var jsonObj = commAjaxPost(findUrl, datas);
	selectPjName();
	function selectPjName() {
		$("#PJ_NAME").html("");
		$("#PJ_NAME").select2({
			data: select2Tofromatt(jsonObj, 'PJ_NAME', 'PJ_NAME')
		});
		$("#PJ_NAME").select2();
	}

	//项目类型
	var datas = urlObj.getJson();
	// 对select框里动态显示数据
	datas['TYPE_CODE'] = 'PROJECT_TYPE';
	var selectType = urlObj.dictionaryList;
	var jsonObj = commAjaxPost(selectType, datas);
	selectJsonObj();
	function selectJsonObj() {
		$("#PJ_TYPES").html("");
		$("#PJ_TYPES").select2({
			data: select2Tofromatt(jsonObj, 'NAME', 'NAME')
		});
		$("#PJ_TYPES").select2();
	}

	//作品等级
	var datas = urlObj.getJson();
	// 对select框里动态显示数据
	datas['TYPE_CODE'] = 'PROJECT_LEVEL';
	var selectTypeCode = urlObj.dictionaryList;
	var jsonObj = commAjaxPost(selectTypeCode, datas);
	$("#PJ_LEVES").select2({
		data: select2Tofromatt(jsonObj, 'CODE', 'NAME')
	});
	$("#PJ_LEVES").select2();
	$('#ssi-upload').ssi_uploader({
		url: urlObj.uplod,
		maxFileSize: 2,
		allowed: ['jpg', 'gif', 'txt', 'png', 'pdf'],
		data: {
			"upPath": "pictureResources/photos"
		},
		onEachUpload: function(fileInfo) {
			var img = $("#PJ_IMG_URL").val();
			$("#PJ_IMG_URL").val(fileInfo.msg);
		}
	});
}
	
//修改项目
function subUpdateTask() {
	var exitsProMethod = urlObj.url + "/projectManage/updateProject";
	var datas = urlObj.getJson();
	var updateDatas = {};
	if(checkRepeats1() == false) {
		return;
	} else {
		updateDatas['ID'] = $("#ID").val();
		updateDatas['PJ_NAME_INPUT'] = $("#PJ_NAME_INPUT").val();
		updateDatas['PJ_CONTENT'] = $("#PJ_CONTENT").val();
		updateDatas['SB_TIME'] = $("#SB_TIME").val();
		updateDatas['PJ_TYPE_INPUT'] = $("#PJ_TYPE_INPUT").val();
		updateDatas['PJ_LEVE'] = $("#PJ_LEVES").val();
		updateDatas['UPDATED_BY'] = datas.token.ID;
		updateDatas['PJ_DESCRIBE'] = $("#PJ_DESCRIBE").val();
		if(commAjaxPost(exitsProMethod, updateDatas).result > 0) {
			return true;
			initTable('load', datas);
		} else {
			return false;
		}
	}
}

	//拖动修改事件
	var dropUpdateTask = function(ids,ends) {
		var updateTimeUrl = urlObj.url + "/projectManage/updateTime";
		var datas = urlObj.getJson();
		var updateDatas = {};
			updateDatas['ID'] = ids;
			updateDatas['SB_TIME'] = ends;
			if(commAjaxPost(updateTimeUrl, updateDatas).result > 0) {
				initTable('load', datas);
				return true;
			} else {
				return false;
			}
	}

	// 删除进度
	function delDialog(id) {
		var datas = urlObj.getJson();
		var deleteProMethod = urlObj.url + "/projectManage/deleteProject";
		datas['ID'] = id;
		if(commAjaxPost(deleteProMethod, datas).result == 1) {
			initTable("load", datas);
			return true;
		} else {
			return false;
		}
	}
}

	function fcCont(){
		$(".fc-event-container").mouseover(function () {
			var tex = $(this).text();
			$(".fc-event-container").each(function (index,element) {
				var texT = $(element).text()
				if(tex == texT){
					$(element).css("opacity","0.8")
				}
			});
		}).mouseout(function () {
			var tex = $(this).text();
			$(".fc-event-container").each(function (index,element) {
				var texT = $(element).text()
				if(tex == texT){
					$(element).css("opacity","1")
				}
			});
		});
	}