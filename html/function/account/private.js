var url = urlObj.userList;
var testUrl =  urlObj.url + "/user/test";
var extidUrl = urlObj.url + "/user/update";
var delUrl = urlObj.url + "/user/del";
var subAddurl = urlObj.url + "/user/add";
var	alldpUrl = urlObj.url + "/user/queryAllDp";// 查询公司
var addUrl = "/function/account/add.html";
var updateUrl = "/function/account/update.html";
var importUrl = "/function/account/import.html";
var userRoleArr = urlObj.url + "/user/userToRoleInfo"
var recordInfo = "/function/account/recordInfo.html";
var queryInvitation = urlObj.queryInvitationList;
//修改角色所属的部门
var updateRTD="/function/account/updateRTD.html";//roleToDepartment
var statId = "";
var bstpTable = null;//bootstrap句柄
var monitoringTabClass = null; //记录刷新时应该对于的页码对象
var showTd = [{
	title: "头像",
	field: "USER_HEADIMG",
	width: 20, //宽度
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
    formatter: function(value, row, index) {
        if(value == '' || value == null ) {
            return '<img alt="" width="50"src="img/avatars/avatar3.jpg" />';
        } else {
            var url=getImgUrl(urlObj.url + value);
            return '<img alt="" width="50" height="50" src="' + url + '" />';
        }
    }
}, {
	title: "姓名", //标题
	field: "USER_NAME", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	valign: "middle", //垂直
},{
	title: "账号", //标题
	align: "center", //水平
	valign: "middle", //垂直
	field: "USER_ACCOUNT", //键名
}, {
	title: "民族", //标题
	align: "center", //水平
	valign: "middle", //垂直
	field: "USER_NATION", //键名
	formatter: function(value, row, index) {
		if(value !=null && value != '' && value != undefined){
			return value;
		}else{
            return '暂无 ';
		}
	}
}, {
	title: "所属角色", //标题
	align: "center", //水平
	valign: "middle", //垂直
	field: "ROLES", //键名
	formatter: function(value, row, index) {
		if(value !=null && value != '' && value != undefined){
			var arr=value.split(',')
			var text=arr.length>1?arr[0]+'...':arr[0];
			return '<a href="#" mce_href="#">'+text+'</a> ';
		}else{
            return '<a href="#" mce_href="#">未分配</a> '
		}
	}
}, {
	title: "党籍状态", //标题
	align: "center", //水平
	valign: "middle", //垂直
	field: "STATE", //键名
//	formatter: function(value, row, index){
//		console.log(row.ID);
//		
//	},
	editable: rootButton.update ? {
		type: "select", //编辑框的类型。支持text|textarea|select|date|checklist等
		source: [{
			value: "0",
			text: "禁用"
		}, {
			value: "1",
			text: "正常"
		}],
		title: "是否禁用",
		disabled: false, //是否禁用编辑
		mode: "popup", //编辑框的模式：支持popup和inline两种模式，默认是popup
		validate: function(value) { //字段验证
			if(!$.trim(value)) {
				return '状态不能为空!';
			}else{
				var json = urlObj.getJson();
				var extidUrl = urlObj.url + "/user/updateObj";
				json['ID'] = statId;
//				console.log(json.token.ID,statId);
				json['STATE']= value;
				var data = commAjaxPost(extidUrl, json);
				if(data.result==1){
					alert('用户状态修改成功!');
				}else{
					alert('用户状态修改失败!');
				}
			}
		}
	} : null,
	formatter: !rootButton.update ? function(value, row, index) {
		return value == 1? "正常" : "禁用";
	} : null
},{
	title: "人员类别", //标题
	align: "center", //水平
	valign: "middle", //垂直
	field: "IS_SUPER", //键名
	editable: {
		type: "select", //编辑框的类型。支持text|textarea|select|date|checklist等
		source: [{
			value: "2",
			text: "正式党员/管理员"
		}, {
			value: "3",
			text: "正式党员"
		}, {
			value: "4",
			text: "预备党员"
		}],
		title: "是否禁用",
		disabled: false, //是否禁用编辑
		mode: "popup", //编辑框的模式：支持popup和inline两种模式，默认是popup
		validate: function(value) { //字段验证
			if(!$.trim(value)) {
				return '状态不能为空!';
			}else{
				var json = urlObj.getJson();
				var extidUrl = urlObj.url + "/user/updateObj";
				json['ID'] = statId;
				json['IS_SUPER']= value;
				var data = commAjaxPost(extidUrl, json);
				if(data.result==1){
					alert('用户状态修改成功!');
				}else{
					alert('用户状态修改失败!');
				}
			}
		}
	} 
}, {
	title: "性别", //标题
	align: "center", //水平
	valign: "middle", //垂直
	field: "USER_SEX", //键名
	sortable: true,
	formatter: function(value, row, index) {
		if(value == '0' || value == '男') {
			return '男';
		} else {
			return '女';
		}
	}
}, {
	title: "电话号码", //标题
	field: "USER_PHONE", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true
}, /*{
	title: "用户邮箱", //标题
	field: "USER_EMAIL", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true
}, {
	title: "用户住址", //标题
	field: "USER_ADDRESS", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true
}*/{
	title: "生日", //标题
	field: "USER_BIRTHDAY", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true
}, {
	title: "入党日期", //标题
	field: "JOIN_DAY", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true
}, {
	title: "成为正式党员日期", //标题
	field: "REFULAR_DAY", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true
}, {
	title: "创建日期", //标题
	field: "CREATE_DATE", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true
}, {
	title: '在线状态',
	field: 'IS_ONLINE',
	width: 20, //宽度
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	formatter: function(value, row, index) {
		return value == '0' ? "在线" : "离线";
	}
}, {
	title: '操作',
	field: 'ID',
	align: 'center',
	valign: "middle", //垂直
	formatter: function(value, row, index) {
	/*	var f = rootButton.add ? '<a href="#" mce_href="#" onclick="sendMsg(\'' + value + '\')">发送</a> ' : ''; // demo*/
		var e = rootButton.update ? '<a href="#" mce_href="#" onclick="initUpdate(\'' + row.ROLE_ID + '\',\'' + value + '\')" class = "boxTab">编辑</a> ' : '';
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
	var strdata = urlObj.getJson();
	strdata['ID'] = row.ID;
	$.ajax({
		url: urlObj.url + "/user/info",
		type: "POST",
		async: false,
		data: "data=" + JSON.stringify(strdata),
		dataType: "html",
		success: function(html) {
			var dialog = jDialog.dialog({
				title: '用户明细',
				width: 820,
				// height: 400,
				content: html,
				buttons: [{
					type: 'highlight',
					text: '确定',
					handler: function(button, dialog) {
						dialog.close();
					}
				}]
			});
		},
		error: function() {
			alert('Error');
		}
	});
	var roleJson = urlObj.getJson();
	roleJson['USER_ID'] = row.ID;
	var setData = commAjaxPost(userRoleArr, roleJson);
	if(setData != 'list is null') {
		var setArr = "";
		for(x in setData) {
			setArr += "[" + setData[x].ROLE_NAME + "],";
		}
		$("#ROLES").html(setArr.substring(0, setArr.length - 1));
	}
}

var ext = function(field, row, value, $el) {
	//注册编辑事件
	if(field == "tb1") {
		alert(JSON.stringify(row));
	}
}
$(function(){
	initTable('init');
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
		initTable('init');
	});
});

function add() {
	var aount = $("#USER_ACCOUNT").val();
	var phone = $("#USER_PHONE").val();
	var aountJson = urlObj.getJson();
	var phoneJson = urlObj.getJson();
	var falg = false;
	aountJson['USER_ACCOUNT'] = aount;
	phoneJson['USER_PHONE'] = phone;
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
	if(falg) {
		alert('账号重复请重新输入！');
		return false;
	}
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
	if(falg) {
		alert('电话号码重复请重新输入！');
		return false;
	}
	var json = {
		"IS_SUPER": "2"
	};
	var falg = commFromAjax(subAddurl, json);
	if(falg) {
		if(falg == 1) {
			alert('新增成功！');
			$("#box_tab2").html(getUrl(addUrl));
			$('#add').tab('show');
			initTable('load');
		} else {
			alert('新增失败！');
		}
	}
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
		bstpTable = new BstpTable($("#mytable-s"), testUrl, showTd, dbclick, tbOnclick, ext);
	}
	//定义内部data传输格式 此为数据封装格式
	var subData = {
					token:urlObj.getTokenObj(), //用户签证对象
				  }
	var searchArgs={
				data:JSON.stringify(subData),//封装此对象转字符串集
		    }
	if(str == 'init') {
		 bstpTable.inint(searchArgs);
		 $(".search").click(function(){
		 	var subData = {};//数据内部传输格式句柄
		 	var searchArgs = {};//分页对象传输句柄
		 	var USER_NAME = $("input[search='USER_NAME']").val();//获取标签为search为USER_NAME的val
			var USER_ACCOUNT = $("input[search='USER_ACCOUNT']").val();//获取标签为search为的val
			subData.token = urlObj.getTokenObj();//必要签证传输
		 	subData.USER_NAME=USER_NAME;//封装入传输句柄
			subData.USER_ACCOUNT=USER_ACCOUNT;//封装入传输句柄
			searchArgs.data = JSON.stringify(subData);//归类
		    bstpTable.inint(searchArgs)//提交查询
		 })
		 //清空操作
		 $(".clear").click(function(){
		 	var subData = {
					token:urlObj.getTokenObj(), //用户签证对象
				  }
			searchArgs.data =JSON.stringify(subData);
			$("input[search='USER_NAME']").val("");
			$("input[search='USER_ACCOUNT']").val("");
		    bstpTable.inint(searchArgs)
		 })
	} else if(str == 'load') {
		//刷新按钮操作
		$("input[search='USER_NAME']").val("");
		$("input[search='USER_ACCOUNT']").val("");
		//监听刷新前的页码
		bstpTable.load(searchArgs);
	}

}



function initUpdate(roleId, id) {
//	console.log(id);
	//清空盒子二 以免冲突
	$("#box_tab2").html("");
	var json = urlObj.getJson();
	json['ID'] = id;
	var data = commAjaxPost(url, json);
	$("#box_tab3").html(getUrl(updateUrl));
	$('#update').tab('show');
	initUpdateFrom(data);
	var setSubJson = urlObj.getJson();
	setSubJson['USER_ID'] = id;
	var setData = commAjaxPost(userRoleArr, setSubJson);
	var userSexJson = urlObj.getJson();
	var setArr = [];
	for(x in setData) {
		setArr.push(setData[x].ROLE_ID)
	}
		select2Init41(roleId);
	//将遍历的数据加载到下拉框
  	$("#country_select41").val(setArr).trigger("change");   //设置默认值		
//	$("#country_select2").val(setArr).trigger('change');
	$("#country_select3").select2('val', data[0].STATE);
	$("#user_type_role").select2('val', data[0].IS_SUPER);
}


	//多级列表树下拉框
function select2Init41(roleId) {
//	$("#country_select4").val(setArr).trigger("change");   //设置默认值		
	//初始化加载select2插件
	var subJson=urlObj.getJson();
		subJson['USER_ID'] = roleId;
	var initSJSON = commAjaxPost(alldpUrl,subJson);
	if(initSJSON == null || initSJSON == '' || initSJSON == undefined) {
		console.log('检查输入正确的json格式：方法错误！（select2Init）');
		return false;
	} else {
		selectTreeInitDisb(initSJSON,"falg","1",'ID','NAME','#country_select41',0);
	}
	$("#country_select41").select2tree();
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
