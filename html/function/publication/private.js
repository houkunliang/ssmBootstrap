var url = urlObj.url + "/bulletin/queryPublication";
var subAddurl = urlObj.url + "/bulletin/publicationSave";
var extidUrl = urlObj.url + "/bulletin/upPublication";
var delUrl = urlObj.url + "/bulletin/dePublication";
var addUrl = "/function/publication/add.html";
var updateUrl = "/function/publication/update.html";
//bootstrap对象句柄
var bstpTable = null;
var statId = "";
var showTd = [
{
	title: "刊物封面", //标题
	field: "COVER_IMG", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	valign: "middle",
    formatter: function(value, row, index) {
        if(value == '' || value == null ) {
            return '暂无';
        } else {
            return '<img alt="" width="50" height="50" src="' + (urlObj.url+value) + '" />';
        }
    }
}, {
	title: "刊物名称", //标题
	align: "center", //水平
	valign: "middle", //垂直
	field: "NAME", //键名
	formatter: function(value, row, index) {
		if(value !=null && value != '' && value != undefined){
			return value;
		}else{
            return '暂无';
		}
	}
},{
	title: "文件类型", //标题
	field: "FILE_TYPE", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	valign: "middle", //垂直
	formatter: function(value, row, index) {
		if(value == '0'){
			return 'word';
		}else if(value == '1'){
            return 'excel';
		}else if(value == '2'){
            return 'pdf';
		}else{
			return '未知';
		}
	}
},{
	title: "刊物类型", //标题
	field: "TYPE", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	valign: "middle", //垂直
	formatter: function(value, row, index) {
		if(value == '0'){
			return '文章';
		}else if(value == '1'){
            return '咨询';
		}else if(value == '2'){
            return '书';
		}else if(value == '3'){
            return '报';
		}else if(value == '4'){
            return '杂志';
		}else{
			return '未知';
		}
	}
},{
	title: "刊物周期", //标题
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	field: "CYCLE", //键名
	formatter: function(value, row, index) {
		if(value == '0'){
			return '日刊';
		}else if(value == '1'){
            return '周刊';
		}else if(value == '2'){
            return '月刊';
		}else if(value == '3'){
            return '年刊';
		}else{
			return '未知';
		}
	}
}, {
	title: "发行人", //标题
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	field: "USER_NAME", //键名
}, {
	title: "附件预览", //标题
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	field: "ATTACHMENT_OPEN", //键名
	formatter: function(value, row, index) {
		return '<a href="#" mce_href="#" class = "boxTab">附件预览</a> ';
	}

},{
	title: "附件下载", //标题
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	field: "ATTACHMENT_XZ", //键名
	formatter: function(value, row, index) {
		return '<a href="#" mce_href="#" class = "boxTab">点击下载</a> ';
	}

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
	if(field == "ATTACHMENT_OPEN") {
		if(row.FILE_TYPE == '0'){
			var myWindow=window.open('','_blank','width=750px,height=1344px')
			var html = row.CONTENT;
			myWindow.document.write(html);
			myWindow.focus();
		}else if(row.FILE_TYPE == '1'){
			var str = row.ATTACHMENT_URL;
			var openHtml = str.substring(0,(str.lastIndexOf('.')+1))+"html";
			window.open(urlObj.url+openHtml)
		}else if(row.FILE_TYPE == '2'){
            var str = row.ATTACHMENT_URL;
            window.open(urlObj.url+str)
		}
	}else if (field == "ATTACHMENT_XZ") {
		window.open(urlObj.url+row.ATTACHMENT_URL)
	}
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

$(function(){
	$("#country_selectiKW").select2({'width':'200px'});
	$("#country_selectiFJ").select2({'width':'200px'});
	initTable('init');
	hideGoalUpdateTab(); //盒子标题控制
	//刷新按钮触发事件
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
		initTable('init');
	});

});

function openWrod(url){
	window.open(urlObj.url+url); 
}


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
		 	var NAME = $("input[search='NAME']").val();//获取标签为search为USER_NAME的val
		 	var TYPE = $("#country_selectiKW").val();
		 	var FILE_TYPE = $("#country_selectiWJ").val();
			subData.token = urlObj.getTokenObj();//必要签证传输
		 	subData.NAME=NAME;//封装入传输句柄
		 	subData.TYPE=TYPE;
		 	subData.FILE_TYPE = FILE_TYPE;
			searchArgs.data = JSON.stringify(subData);//归类
		    bstpTable.inint(searchArgs)//提交查询
		 })
		 //清空操作
		 $(".clear").click(function(){
		 	var subData = {
					token:urlObj.getTokenObj(), //用户签证对象
				  }
			searchArgs.data =JSON.stringify(subData);
			$("input[search='NAME']").val("");
			$("#country_selectiKW").val("").trigger("change");
			$("#country_selectiWJ").val("").trigger("change");
		    bstpTable.inint(searchArgs)
		 })
	} else if(str == 'load') {
		//刷新按钮操作
		$("input[search='NAME']").val("");
		$("#country_selectiKW").val("").trigger("change");
		$("#country_selectiWJ").val("").trigger("change");
		bstpTable.load(searchArgs);
	}

}

var UP_COVER_URL;

var ATTACHMENT_URL;

function initUpdate(id) {
//	console.log(id);
	//清空盒子二 以免冲突
	$("#box_tab2").html("");
	var subJson = urlObj.getJson();
	subJson['ID'] = id;
	var data = commAjaxPost(url,subJson);
	data = data.rows;

	if(data[0].COVER_IMG != undefined && data[0].COVER_IMG != null && data[0].COVER_IMG != ''){
		UP_COVER_URL = data[0].COVER_IMG;
	}else{
		upVideoUrl = null;
	}
	

	if(data[0].ATTACHMENT_URL != undefined && data[0].ATTACHMENT_URL != null && data[0].ATTACHMENT_URL != ''){
		ATTACHMENT_URL = data[0].ATTACHMENT_URL;
	}else{
		ATTACHMENT_URL = null;
	}

	$("#box_tab3").html(getUrl(updateUrl));
	$('#update').tab('show');
	initUpdateFrom(data);
	//设置ck编辑器
	if(data[0].CONTENT != undefined && data[0].CONTENT != null && data[0].CONTENT != ''){
		editor.setData(data[0].CONTENT);
	}
	//设置ck编辑器
	if(data[0].DESCRIPTION != undefined && data[0].DESCRIPTION != null && data[0].DESCRIPTION != ''){
		editor1.setData(data[0].DESCRIPTION);
	}

	if(data[0].TYPE != undefined && data[0].TYPE != null && data[0].TYPE != ''){
		$("#country_type").val(data[0].TYPE).trigger("change");
	}

	if(data[0].CYCLE != undefined && data[0].CYCLE != null && data[0].CYCLE != ''){
		$("#country_zq").val(data[0].CYCLE).trigger("change");
	}
	initBuuton();

}


function initBuuton(){
	var arr = $("#ATTACHMENT_URL").val().split('.');
	var hz = arr[(arr.length-1)];
	if(hz == 'xls' || hz == 'xlsx'){
		$("#hidBt").show("slow");
	}else if(hz == 'pdf'){
		$("#PDFBt").show("slow");
	}
}

function subUpdate() {
	var subJson = urlObj.getJson();
	subJson['CONTENT'] = tounicode(editor.getData());  
	subJson['DESCRIPTION'] = tounicode(editor1.getData());  
	var falg = commFromAjax(extidUrl, subJson);
	if(falg == 1) {
		alert('修改成功！');
		initTable('load');
	} else {
		alert('修改失败！');
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
