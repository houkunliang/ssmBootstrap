var url = urlObj.url + "/bulletin/queryBulletin";
var subAddurl = urlObj.url + "/bulletin/bulletinSave";
var extidUrl = urlObj.url + "/bulletin/upBulletin";
var delUrl = urlObj.url + "/bulletin/deBulletin";
var addUrl = "/function/bulletin/add.html";
var updateUrl = "/function/bulletin/update.html";
//组织结构访问
var alldpUrl = urlObj.url + "/region/queryRegionAll";
//bootstrap对象句柄
var bstpTable = null;
var statId = "";
var showTd = [{
	title: "标题", //标题
	field: "TITLE", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	valign: "middle", //垂直
},{
	title: "消息类型", //标题
	field: "TYPE", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	valign: "middle", //垂直
	formatter: function(value, row, index) {
		if(value == '0'){
			return '消息';
		}else if(value == '1'){
            return '通知';
		}else if(value == '2'){
            return '表彰';
		}else if(value == '3'){
            return '批评';
		}else if(value == '4'){
            return '其他';
		}else{
			return '未知';
		}
	}
},{
	title: "状态", //标题
	field: "STATE", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	valign: "middle", //垂直
	formatter: function(value, row, index) {
		if(value == '0'){
			return '拟稿';
		}else if(value == '1'){
            return '已发布';
		}else{
			return '未知';
		}
	}
},{
	title: "预公布时间", //标题
	field: "SUB_DATE", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	valign: "middle", //垂直
	formatter: function(value, row, index) {
		if(value !=null && value != '' && value != undefined){
			return getDateTostr(value);
		}else{
            return '暂无'
		}
	}
},{
	title: "公布对象", //标题
	field: "BY_DP", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	valign: "middle", //垂直
	formatter: function(value, row, index) {
		if(value !=null && value != '' && value != undefined){
			return value;
		}else{
            return '-'
		}
	}
},{
	title: "公布人", //标题
	align: "center", //水平
	valign: "middle", //垂直
	field: "USER_NAME", //键名
},{
	title: "预览", //标题
	align: "center", //水平
	valign: "middle", //垂直
	field: "openHtml", //键
	formatter: function(value, row, index) {
		return '<a href="#" mce_href="#"  class = "boxTab">点击预览</a> ';
	}
}, {
	title: '操作',
	field: 'ID',
	align: 'center',
	valign: "middle", //垂直
	formatter: function(value, row, index) {
	/*	var f = rootButton.add ? '<a href="#" mce_href="#" onclick="sendMsg(\'' + value + '\')">发送</a> ' : ''; // demo*/
		var e = "";
		var c = "";
		if(row.STATE != '1'){
			e = rootButton.update ? '<a href="#" mce_href="#" onclick="initUpdate(\'' + value + '\',\'' + row.RG_ID + '\')" class = "boxTab">编辑</a> ' : '';
			c = rootButton.update ? '<a href="#" mce_href="#" onclick="isSub(\'' + value + '\')" class = "boxTab">发布</a> ' : '';
		}
		var d = rootButton.deleted ? '<a href="#" mce_href="#" onclick="delDialog(\'' + value + '\')">删除</a> ' : '';
		return e + d + c == '' ? '无' : e + d + c;
	}
}];


//预览方法
var openJson;
 		//点击事件
var tbOnclick = function(field, value, row, $element) {
	if(field == "openHtml"){
		openJson = {};
		var myWindow=window.open('','_blank','width=900px,height=750px')
		var html = getUrl("/function/bulletin/cwbxw.html");
		openJson['title'] = row.TITLE;
		openJson['userName'] = row.USER_NAME;
		openJson['time'] = getDateTostr(row.SUB_DATE);
		openJson['content'] = row.CONTENT;
		if(row.TYPE == '0'){
			openJson['type'] = '消息';
		}else if(row.TYPE == '1'){
            openJson['type'] = '通知';
		}else if(row.TYPE == '2'){
            openJson['type'] = '表彰';
		}else if(row.TYPE == '3'){
            openJson['type'] = '批评';
		}else if(row.TYPE == '4'){
            openJson['type'] = '其他';
		}
		myWindow.document.write(html);
		myWindow.focus();
	}
}

function select2Init(roleId) {
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
}

var ext = function(field, row, value, $el) {
	//注册编辑事件
	if(field == "tb1") {
		alert(JSON.stringify(row));
	}
}
$(function(){
	initTable('init');
	$("#country_select01").select2({'width':'200px'});
	$("#country_STATE").select2({'width':'200px'});
	hideGoalUpdateTab(); //盒子标题控制
	jQuery('.fa-refresh').click(function() {
		initTable('load');
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
	});
	
});

function add() {
	var json = urlObj.getJson();
	json['CONTENT'] = tounicode(editor.getData());
	var falg = commFromAjax(subAddurl, json);
	if(falg) {
		if(falg == 1) {
			alert('保存成功！');
			$("#box_tab2").html(getUrl(addUrl));
			$('#add').tab('show');
			initTable('load');
		} else {
			alert('保存失败！');
		}
	}
}

function addSub() {
	var json = urlObj.getJson();
	json['CONTENT'] = tounicode(editor.getData());
	json['STATE'] = '1';
	var falg = commFromAjax(subAddurl, json);
	if(falg) {
		if(falg == 1) {
			alert('发布成功！');
			$("#box_tab2").html(getUrl(addUrl));
			$('#add').tab('show');
			initTable('load');
		} else {
			alert('发布失败！');
		}
	}
}


//附加：点击刷新按钮之后 重置按钮组
$(".fa-refresh").click(function(){
	$("#box_tab1 #myButton .btn").removeClass("active");
	$("#box_tab1 #myButton .btn:first-child").addClass("active");
});


//删除弹出层
function delDialog(id) {
	var dialog = jDialog.confirm('您确定要删除這条数据吗？', {
		handler: function(button, dialog) {
			var json = urlObj.getJson();
			json['ID'] = id;
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
	if(bstpTable == undefined || bstpTable == null){
		bstpTable = new BstpTable($("#mytable-s"), url, showTd, dbclick, tbOnclick, ext);
	}
	//定义内部data传输格式 此为数据封装格式
	var subData = {
					token:urlObj.getTokenObj(), //用户签证对象
				  }
	var searchArgs={
				data:JSON.stringify(subData)//封装此对象转字符串集
		    }
	if(str == 'init') {
		 bstpTable.inint(searchArgs);
		 $(".search").click(function(){
		 	var subData = {};//数据内部传输格式句柄
		 	var searchArgs = {};//分页对象传输句柄
		 	var TITLE = $("input[search='TITLE']").val();//获取标签为search为USER_NAME的val
		 	var TYPE = $("#country_select01").val();
		 	var STATE = $("#country_STATE").val();
			subData.token = urlObj.getTokenObj();//必要签证传输
		 	subData.TITLE=TITLE;//封装入传输句柄
		 	subData.TYPE=TYPE;
		 	subData.STATE=STATE;
			searchArgs.data = JSON.stringify(subData);//归类
		    bstpTable.inint(searchArgs)//提交查询
		 })
		 //清空操作
		 $(".clear").click(function(){
		 	var subData = {
					token:urlObj.getTokenObj(), //用户签证对象
				  }
			searchArgs.data =JSON.stringify(subData);
			clearInput();
		    bstpTable.inint(searchArgs)
		 })
	} else if(str == 'load') {
		//刷新按钮操作
		clearInput();
		bstpTable.load(searchArgs);
	}
}

function clearInput(){
	$("input[search='TITLE']").val("");
	$("#country_select01").val("").trigger("change");
	$("#country_STATE").val("").trigger("change");
}



function initUpdate(id,RG_ID) {
//	console.log(id);
	//清空盒子二 以免冲突
	$("#box_tab2").html("");
	var json = urlObj.getJson();
	json['ID'] = id;
	var data = commAjaxPost(url, json);
	$("#box_tab3").html(getUrl(updateUrl));
	$('#update').tab('show');
	data = data.rows;
	initUpdateFrom(data);
	//设置ck编辑器
	if(data[0].CONTENT != undefined && data[0].CONTENT != null && data[0].CONTENT != ''){
		editor.setData(data[0].CONTENT);
	}

	if(data[0].TYPE != undefined && data[0].TYPE != null && data[0].TYPE != ''){
		$("#country_select11").val(data[0].TYPE).trigger("change");
	}
	var subJson=urlObj.getJson();
	var initSJSON = commAjaxPost(alldpUrl,subJson);
	if(initSJSON == null || initSJSON == '' || initSJSON == undefined) {
		console.log('检查输入正确的json格式：方法错误！（select2Init）');
		return false;
	} else {
		selectTreeInit(initSJSON, 'REGION_ID', 'NAME', '#country_selectDP', RG_ID);
	}
	$("#country_selectDP").select2tree();
}




function subUpdate() {
	var json = urlObj.getJson();
	json['CONTENT'] = tounicode(editor.getData());
	var falg = commFromAjax(extidUrl, json);
	if(falg) {
		if(falg == 1) {
			alert('修改成功！');
			initTable('load');
		} else {
			alert('修改失败！');
		}
	}
}

function subUpdateSb() {
	var json = urlObj.getJson();
	json['CONTENT'] = tounicode(editor.getData());
	var falg = commFromAjax(extidUrl, json);
	if(falg) {
		if(falg == 1) {
			alert('发布成功！');
			initTable('load');
		} else {
			alert('发布失败！');
		}
	}
}

function isSub(id) {
	var json = urlObj.getJson();
	json['ID'] = id;
	json['STATE'] = '1';
	var falg = commFromAjax(extidUrl, json);
	if(falg) {
		if(falg == 1) {
			alert('发布成功！');
			initTable('load');
		} else {
			alert('发布失败！');
		}
	}
}

