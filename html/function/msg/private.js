var url = urlObj.msg;
var info = urlObj.url + "/msg/selectByMsgInfo";
var inserUrl = urlObj.url + "/msg/insertTmsg";
var extidUrl = urlObj.url + "/msg/updateByTmsg";
var delUrl = urlObj.url + "/msg/del";
var addUrl = "/function/msg/add.html";
var updateUrl = "/function/msg/update.html";
var importUrl = "/function/msg/import.html";
var infoHtml = "/function/msg/info.html";
var	regionListUrl = urlObj.url + "/region/queryRegionAll";
var statId = "";
var showTd = [
{
	title: "标题", //标题
	field: "TITLE", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	valign: "middle", //垂直
	formatter: function(value, row, index) {
		if(value !=null && value != '' && value != undefined){
			return value.length > 10 ? value.substring(0,10)+"...":value;
		}else{
            return '未设置';
		}
	}
}, {
	title: "所属机构", //标题
	field: "DP_NAME", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	valign: "middle", //垂直
	formatter: function(value, row, index) {
		if(value !=null && value != '' && value != undefined){
			return value;
		}else{
            return '暂无';
		}
	}
}, {
	title: "视频连接", //标题
	align: "center", //水平
	valign: "middle", //垂直
	field: "VIDEO_URL", //键名
	formatter: function(value, row, index) {
		if(value !=null && value != '' && value != undefined){
			return value;
		}else{
            return '未上传';
		}
	}
}, {
	title: "展示时间", //标题
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	field: "SUB_DATE", //键名
	formatter: function(value, row, index){
		if(value !=null && value != '' && value != undefined){
			return value;
		}else{openWrod
            return '未选择时间';
		}
	},
},{
	title: '操作',
	field: 'ID',
	align: 'center',
	valign: "middle", //垂直
	formatter: function(value, row, index) {
	/*	var f = rootButton.add ? '<a href="#" mce_href="#" onclick="sendMsg(\'' + value + '\')">发送</a> ' : ''; // demo*/
		var e = rootButton.update ? '<a href="#" mce_href="#" onclick="initUpdate(\'' + value + '\')" class = "boxTab">编辑</a> ' : '';
		var d = rootButton.deleted ? '<a href="#" mce_href="#" onclick="delDialog(\'' + value + '\')">删除</a> ' : '';
		return e + d == '' ? '无' : e + d;
	}
}];

 		//点击事件
var tbOnclick = function(field, value, row, $element) {
	statId = row.ID; //用户id全局变量
	if(field == "ROLES") {
		updateRole(row.ID,row.USER_NAME);
	}
}

		//修改弹窗
function updateRole(id,value){
	var subJson=urlObj.getJson();
		subJson['USER_ID'] = id;
	var setData = commAjaxPost(userRoleArr, subJson);
	var setArr = [];
	for(x in setData) { //读取遍历
		setArr.push(setData[x].ROLE_ID);
	}
	subJson['ID'] = id;
	var dia =  jDialog.dialog({
          title : "修改->("+value+")->所属",
      	  scrollbar:"no",
		  width : '80%',
		  closeable: false,
          content :getUrl(updateRTD),
          buttons : [
	                  {
	                      type : 'highlight',
	                      text : '修改',
	                      handler:function(button,dialog){
	                      	subJson['ROLE_ID']=$("#country_select4").val();
	                      	var falg=commAjaxPost(extidUrl,subJson); //修改请求
	                      	if(falg.result==1){
	                      		initTable("load");
	                      		alert("修改成功");
	                      	}else{
	                      		alert("修改失败");
	                      	}
                  			dia.close();
	                      }
	                  },
	                  {
	                      type : 'highlight',
	                      text : '取消',
	                      handler:function(button,dialog)
	                      {
	                    	  dia.close();
	                      }
	                  }
	              ]
	});	
	select2Init(id);
	//将遍历的数据加载到下拉框
  	$("#country_select4").val(setArr).trigger("change");   //设置默认值		
}

function select2Init(roleId) {
//	$("#country_select4").val(setArr).trigger("change");   //设置默认值		
	//初始化加载select2插件
	var subJson=urlObj.getJson();
		subJson['USER_ID'] = roleId;
	var initSJSON = commAjaxPost(alldpUrl,subJson);
	if(initSJSON == null || initSJSON == '' || initSJSON == undefined) {
		console.log('检查输入正确的json格式：方法错误！（select2Init）');
		return false;
	} else {
		selectTreeInitDisb(initSJSON,"falg","1",'ID','NAME','#country_select4',0);
	}
	$("#country_select4").select2tree();
}

	//双击事件
var dbclick = function(row, tr) {
	var subJson = urlObj.getJson();
	subJson['ID'] = row.ID;
	var data = commAjaxPost(info,subJson);
	var dia =  jDialog.dialog({
      	  scrollbar:"yes",
		  width : 800,
      	  height : 740,
          content :getUrl(infoHtml)
	});

	initInfo(data);
	if(data[0].VIDEO_URL != undefined && data[0].VIDEO_URL != null && data[0].VIDEO_URL != ''){
		$('#VIDEO_URL_S').html('<video src="'+urlObj.url+data[0].VIDEO_URL+'" height = "100%" controls="controls">您的浏览器不支持 video 标签。</video>');
	}
	if(data[0].COVER_URL != undefined && data[0].COVER_URL != null && data[0].COVER_URL != ''){
		$('#COVER_URL_S').html('<img src="'+urlObj.url+data[0].COVER_URL+'" height = "100%" controls="controls"/>');
	}
}

var ext = function(field, row, value, $el) {
	//注册编辑事件
	if(field == "tb1") {
		alert(JSON.stringify(row));
	}
}
var queryTool;
$(function(){
//	var mesJson={};
//	mesJson['sendType']='userInfos';
//	msgWSK.query(JSON.stringify(mesJson));
//	console.log(msgWSK.userObj);
	initTable('init');
//	myButtonTables(); //按钮组
	hideGoalUpdateTab(); //盒子标题控制
	//刷新按钮触发事件
	jQuery('.fa-refresh').click(function() {
		initTable('load');
		dedaultTime(); //按钮组
		hideGoalUpdateTab(); //盒子标题控制
		var el = jQuery("#box_tab1");
		App.blockUI(el);
		window.setTimeout(function() {
			App.unblockUI(el);
		}, 1000);
		
	});
	//新增box切换事件
	$('#add').click(function(e) {
		e.preventDefault();
		//清空盒子3 以免冲突
		$("#box_tab3").html("");
		$("#box_tab2").html(getUrl(addUrl));
		$(this).tab('show');
		initTable('init');
	});
	//----------------时间查询-----------------------
		tableTools(); //表格工具栏
	var Yesterday = getYesterday();//获取昨天的日期
	var Toady = getToday();//获取今天的日期
	var Monday = getCurrentMonday();//获取本周一
	var Sunday =  getCurrentSunday();//获取本周日
	var MonthFirst = getCurrentMonthFirst();//获取本月第一天
	var MonthLast = getCurrentMonthLast();//获取本月最后一天
	var parm =  "SUB_DATE"; //索引值
	var buttonId = "#box_tab1 #myButton"; //按钮名
//	var buttonParm = "USER_ID"; //按钮索引值
	queryTool = new QueryTool();
	queryTool.init("#mytable-s","#CREATE_DATE_STA","#CREATE_DATE_END");
	queryTool.manyConditions("1990-12-31 00:00:00","2990-12-31 00:00:00",parm,buttonId); //初始化
	$('#CREATE_DATE_STA').focus(function(e){
	  	e.preventDefault();
	  	queryTool.queryDt();
	});
	$('#CREATE_DATE_END').focus(function(e){
	  	e.preventDefault();
	  	queryTool.queryDt();
	});
		//默认时间
	$("#defaultTime").bind("click",function(){
		dedaultTime();
	});
		//默认时间
	function dedaultTime(){
		var sta = "";
		var end = "";
		queryTool.manyConditions("1990-12-31 00:00:00","2990-12-31 00:00:00",parm,buttonId); //初始化
		$(".delayTime").html("");
	}
	//今天筛选
	$("#today").bind("click",function(){
		queryTool.manyConditions(Yesterday,Toady,parm,buttonId);
	});
	//本周筛选
	$("#tWeek").bind("click",function(){
		queryTool.manyConditions(Monday,Sunday,parm,buttonId);
	});
	//本月筛选
	$("#tMonth").bind("click",function(){
		queryTool.manyConditions(MonthFirst,MonthLast,parm,buttonId);
	});
	$(buttonId+" .btn").click(function(){
		var html = $(".delayTime").html();
		var val = $(this).find('input').val();
		if(html.indexOf("今天") != -1){
			queryTool.manyConditions(Yesterday,Toady,parm,buttonId,val);
		}else if(html.indexOf("本周") != -1){
			queryTool.manyConditions(Monday,Sunday,parm,buttonId,val);
		}else if(html.indexOf("本月") != -1){
			queryTool.manyConditions(MonthFirst,MonthLast,parm,buttonId,val);
		}else{
			queryTool.manyConditions("1990-12-31 00:00:00","2990-12-31 00:00:00", parm, buttonId,val); //初始化
		}	
	})
});

function openWrod(url){
	window.open(urlObj.url+url); 
}

//按钮组
/*function myButtonTables(){
	var arr = $('#mytable-s').bootstrapTable('getOptions').data;
	$("#box_tab1 #myButton .btn").click(function(){
		var val = $(this).find('input').val();
		var rue=[];
		 if(val == "true"){
		 	for(var x in arr){
		 		if(arr[x].IS_ONLINE == '0'){
		 			rue.push(arr[x]);
		 		}
		 	}
		 	$('#mytable-s').bootstrapTable('load', rue);
		 }else if(val == "false"){
		 	for(var y in arr){
		 		if(arr[y].IS_ONLINE =='1'){
		 			rue.push(arr[y]);
		 		}
		 	}
		 	$('#mytable-s').bootstrapTable('load', rue);
		 }else if(val == "default"){
		 	for(var z in arr){
//		 		if(arr[z].IS_ONLINE == '1' || arr[z].IS_ONLINE == "0" ||arr[z].STATE == '1' || arr[z].STATE == '0'){
//		 			rue.push(arr[z]);
//		 		}
		 		rue.push(arr[z]);
		 	}
		 	$('#mytable-s').bootstrapTable('load', rue);
		 }else if(val == "1"){
		 	for(var z in arr){
		 		if(arr[z].STATE == '1'){
		 			rue.push(arr[z]);
		 		}
		 	}
		 	$('#mytable-s').bootstrapTable('load', rue);
		 }else if(val == "0"){
		 	for(var z in arr){
		 		if(arr[z].STATE == '0'){
		 			rue.push(arr[z]);
		 		}
		 	}
		 	$('#mytable-s').bootstrapTable('load', rue);
		 }
		 $(".timeTools .btn-group label").removeClass("active");//重置日期按钮样式
		 queryTool.init("#mytable-s","#INVITATION_TIME_STA","#INVITATION_TIME_END");
		 hideGoalUpdateTab(); //重排表单后调用标签控制
	});
	
}*/
//附加：点击刷新按钮之后 重置按钮组
$(".fa-refresh").click(function(){
	$("#box_tab1 #myButton .btn").removeClass("active");
	$("#box_tab1 #myButton .btn:first-child").addClass("active");
	initTable("load");
});
//删除弹出层
function delDialog(id) {
	var dialog = jDialog.confirm('您确定要删除這条数据吗？', {
		handler: function(button, dialog) {
			var json = urlObj.getJson();
			json['ID'] = id;
			json['IS_DELETED'] = 'Y';
			var data = commAjaxPost(delUrl, json);
			initTable("load");
			dialog.close();
		}
	}, {
		handler: function(button, dialog) {
			dialog.close();
		}
	});
}

function initTable(str) {
	var strdata = urlObj.getJson();
	$.ajax({
		url: url,
		type: "POST",
		async: false,
		data: "data=" + JSON.stringify(strdata),
		dataType: "json",
		success: function(json) {
			if(json != 'list is null') {
				if(str == 'init') {
					main("#mytable-s", json, showTd, dbclick, tbOnclick, ext, null);
				} else if(str == 'load') {
					$('#mytable-s').bootstrapTable('load', json);
				}
			} else {
				main("#mytable-s", [], showTd, null, tbOnclick, ext, null);
			}
		},
		error: function() {
			alert('数据连接异常');
		}
	});

}

var upVideoUrl = '';

var UP_COVER_URL;

function initUpdate(id) {
//	console.log(id);
	//清空盒子二 以免冲突
	$("#box_tab2").html("");
	var subJson = urlObj.getJson();
	subJson['ID'] = id;
	var data = commAjaxPost(info,subJson);

	if(data[0].VIDEO_URL != undefined && data[0].VIDEO_URL != null && data[0].VIDEO_URL != ''){
		upVideoUrl = data[0].VIDEO_URL;
	}else{
		upVideoUrl = null;
	}
	

	if(data[0].COVER_URL != undefined && data[0].COVER_URL != null && data[0].COVER_URL != ''){
		UP_COVER_URL = data[0].COVER_URL;
	}else{
		UP_COVER_URL = null;
	}

	$("#box_tab3").html(getUrl(updateUrl));
	$('#update').tab('show');
	initUpdateFrom(data);
	//设置ck编辑器
	if(data[0].CONTENT != undefined && data[0].CONTENT != null && data[0].CONTENT != ''){
		editor.setData(data[0].CONTENT);
	}

	if(data[0].DP_ID != undefined && data[0].DP_ID != null && data[0].DP_ID != ''){
		$("#country_select4").val(data[0].DP_ID).trigger("change");
	}

}



function subUpdate() {
	var initAount = $("#USER_ACCOUNT2").val();
	var initPhone = $("#USER_PHONE2").val();
	var aount = $("#USER_ACCOUNT").val();
	var phone = $("#USER_PHONE").val();
	var aountJson = urlObj.getJson();
	var phoneJson = urlObj.getJson();
	var falg = false;
	aountJson['USER_ACCOUNT'] = aount;
	phoneJson['USER_PHONE'] = phone;
	if(initAount != aount) {
		$.ajax({
			url: url,
			type: "post",
			async: false,
			data: "data=" + JSON.stringify(aountJson),
			dataType: "json",
			success: function(json) {
				if(json != 'list is null') {
					falg = true;
				}
			},
			error: function() {
				alert('数据请求失败，请检查网络！')
			}
		});
	}
	if(falg) {
		alert('账号重复请重新输入！');
		return false;
	}
	if(initPhone != phone) {
		$.ajax({
			url: url,
			type: "post",
			async: false,
			data: "data=" + JSON.stringify(phoneJson),
			dataType: "json",
			success: function(json) {
				if(json != 'list is null') {
					falg = true;
				}
			},
			error: function() {
				alert('数据请求失败，请检查网络！')
			}
		});
	}
	if(falg) {
		alert('电话号码重复请重新输入！');
		return false;
	}
	
	var falg = commFromAjax(extidUrl);
	if(falg) {
		if(falg == 1) {
			alert('修改成功！');
			initTable("load");
			$("[href='#box_tab1']").tab('show');
		} else {
			alert('修改失败！');
		}
	}
}

function openImportDialog(){
	var dia =  jDialog.dialog({
	      	  scrollbar:"yes",
			  width : 700,
	      	  height : 740,
	          content :getUrl(importUrl)
	});
}
