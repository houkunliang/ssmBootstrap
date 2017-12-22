var url = urlObj.roleList;
var menuList = urlObj.menuJson;
var roleToRoot = urlObj.url + "/role/queryRoleToMenu";
var extidUrl = urlObj.url + "/role/update";
var subAddurl = urlObj.url + "/role/add";
var addUrl = "/function/role/add.html";
var updateUrl = "/function/role/update.html";
//权限设置
var setRoot = urlObj.url + "/role/setRoot";
var regionList = urlObj.url + "/region/queryRegionAll"
	//获取权限模块
var initMenuAndButtons = urlObj.url + "/menu/MenuAndButtonList";
var insertButtonRole = urlObj.url + "/menu/insertButtonRole";
var deleteButtonRole = urlObj.url + "/menu/deleteButtonRole";
var roleToButtonList = urlObj.url + "/menu/roleToButtonList";
//读取所有的char列表
var upCharHtml = "/function/role/charToRoleAdd.html";
var charList = urlObj.url + "/stats/query";
var roleCharList = urlObj.url + "/stats/queryRoleChar";
var updateRoleToChar = urlObj.url + "/stats/updateRoleStats";

//修改角色对应部门
var updateRTD = "/function/role/updateRTD.html"; //roleToDepartment
var updatertd = urlObj.url + "/role/updateRTD";

var updateLHtml = "/function/role/updateL.html";
// 获取数据字典表的数据，修改角色等级
var dictionaryList = urlObj.dictionaryList;
var updateLevelHtml = "/function/role/updateLevel.html";
var showTd = [{
	title: "角色名称",
	field: "ROLE_NAME",
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	editable: rootButton.update ? true : null
}, {
	title: "是否禁用", //标题
	field: "STATUS", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	/*		            formatter:function(value,row,index){
					         return value==0?'是':'否';  
				        },*/
	formatter: null,
	editable: rootButton.update ? {
		type: "select", //编辑框的类型。支持text|textarea|select|date|checklist等
		source: [{
			value: "0",
			text: "是"
		}, {
			value: "1",
			text: "否"
		}],
		title: "是否禁用",
		disabled: false, //是否禁用编辑
		mode: "popup", //编辑框的模式：支持popup和inline两种模式，默认是popup
		validate: function(value) { //字段验证
			if(!$.trim(value)) {
				return '不能为空';
			}
		}
	} : null,
	formatter: !rootButton.update ? function(value, row, index) {
		return value == 0 ? "是" : "否";
	} : null

}, {
    title: "所属公司", //标题
    field: "PARENT_NAME", //键名
    align: "center", //水平
	valign: "middle", //垂直
    sortable: true,
},{
	title: "所属部门", //标题
	field: "NAME", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	formatter: function(value, row, index) {
//		console.log(row);
			var b = '<a href="#" mce_href="#" onclick="updateRegion2(\'' + row.ROLE_ID + '\',\'' + row.ROLE_NAME + '\',\'' + row.DP_ID + '\')">' + value + '</a>';
			return b;
		}
		/* source: function () {
			                        var result = [];
			                        var json=urlObj.getJson();
									json['TYPE']='1';
			                        $.ajax({
			                            url: selectDepartment,
			                            async: false,
			                            type: "get",
			                            data:"data="+JSON.stringify(json),
			                            success: function (data) {
			                                $.each(data, function (key, value) {
			                                    result.push({ value: value.REGION_ID, text: value.NAME });
			                                });
			                            }
			                        });
			                        console.log(result);
			                        return result;
			                    }     
	                    },*/

}, {
	title: "职位等级", //标题
	field: "LEVE", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	formatter: function(value, row, index) {
		var b = '<a href="#" mce_href="#" onclick="updateLevel(\'' + row.ROLE_ID + '\',\'' + row.ROLE_NAME + '\')">' + value + '</a>';
		return b;
	}
}, {
	align: "center", //水平
	valign: "middle", //垂直
	title: "创建时间", //标题
	field: "CREATED_DT", //键名
	sortable: true,          
	formatter: function(value, row, index) {
		return getDateTostr(value);
	}
}, {
	title: '操作',
	field: 'ROLE_ID',
	align: 'center',
	valign: "middle", //垂直
	formatter: function(value, row, index) {
		var a = rootButton.deleted ? '<a href="#" mce_href="#" onclick="delDialog(\'' + value + '\')">删除</a> ' : '';
		var c = '<a href="#" mce_href="#" onclick="charToRole(\'' + row.ROLE_NAME + '\',\'' + value + '\')">统计</a> ';
		var b = '<a href="#" mce_href="#" onclick="roleToMenu(\'' + row.ROLE_NAME + '\',\'' + value + '\')">授权</a> ';
		var d = '<a href="#" mce_href="#" onclick="projectStatic(\'' + row.ROLE_NAME + '\',\'' + value + '\')">计划</a> ';
		//return  c + d + b + a;
		return  b + a;
	}
}, ];

var tbOnclick = function(field, value, row, $element) {
	if(field == "DATE_OF_VISIT") {
		var json = urlObj.getJson();
		json['ID'] = row.ID;
		updateDialogs(json);
	}
}
var ext = function(field, row, oldValue, $el) {
	//注册编辑事件
	if(field == "ROLE_NAME") {
		var json = urlObj.getJson();
		json['ROLE_ID'] = row.ROLE_ID;
		json['ROLE_NAME'] = row.ROLE_NAME;
		updateTb(json);
	} else if(field == "STATUS") {
		var json = urlObj.getJson();
		json['ROLE_ID'] = row.ROLE_ID;
		json['STATUS'] = row.STATUS;
		updateTb(json);
	}
}

// 修改职位等级
function updateLevel(roleId,name){
	var json = urlObj.getJson();
	var dia = jDialog.dialog({
		title: "修改->(" + name + ")的等级->",
		scrollbar: "yes",
		width: 300,
		height: 150,
		closeable: false,
		content: getUrl(updateLevelHtml),
		buttons: [{
			type: 'highlight',
			text: '修改',
			handler: function(button, dialog) {
				if(subUpdate2(roleId) == 1) {
					subUpdateDia("修改成功");
					initTable("load");
					dia.close();
				}
			}
		}, {
			type: 'highlight',
			text: '取消',
			handler: function(button, dialog) {
				dia.close();
			}
		}]
	});
	selectRoleLevelInit(roleId);
}

// 获取数据字典表返回的等级数据
function selectRoleLevelInit(roleId) {
	var json = urlObj.getJson();
	json['TYPE_CODE'] = 'ROLE_LEVEL';
	var initSJSON = commAjaxPost(dictionaryList, json);
	initUpdateFrom(initSJSON);
	if(initSJSON == null || initSJSON == '' || initSJSON == undefined) {
		console.log('检查输入正确的json格式：方法错误！（select2Init）');
		return false;
	} else {
		selectTreeInit(initSJSON,'CODE','NAME','#role_level',null);
	}
	$("#role_level").select2();
}
function updateRegion2(roleId, name, depId) {
	//alert(id);
	var json = urlObj.getJson();
	var dia = jDialog.dialog({
		title: "修改->(" + name + ")->",
		scrollbar: "yes",
		width: '80%',
		closeable: false,
		content: getUrl(updateRTD),
		buttons: [{
			type: 'highlight',
			text: '修改',
			handler: function(button, dialog) {
				if(subUpdate2(roleId) == 1) {
					initTable("load");
					subUpdateDia("修改成功");
					dia.close();
				}
			}
		}, {
			type: 'highlight',
			text: '取消',
			handler: function(button, dialog) {
				dia.close();
			}
		}]
	});
	select2Init(roleId, depId);
}

function select2Init(roleId, depId) {
	var json = urlObj.getJson();
	json['REGION_ID_RE'] = depId;
	//加载表单基本数据
	var json2 = urlObj.getJson();
	json2['REGION_ID'] = depId;
	var data = commAjaxPost(url, json2);
	//设置表单数据
	//console.log(data);
	initUpdateFrom(data);
	//初始化加载select2插件
	var initSJSON = commAjaxPost(regionList, json);
	if(initSJSON == null || initSJSON == '' || initSJSON == undefined) {
		console.log('检查输入正确的json格式：方法错误！（select2Init）');
		return false;
	} else {
		var menuPid = depId || 0;
		//alert(menuPid);
		selectTreeInit(initSJSON, 'REGION_ID', 'NAME', '#department_select', menuPid);
	}

	$("#department_select").select2tree();
}
/*function subUpdate2(id){
	var subJson = urlObj.getJson();
	subJson
	subJson['ROLE_ID']=id;
	var falg=commAjaxPost(updatertd,subJson);
	console.log(falg);
	if(falg.){
		if(falg==1){
			alert('修改成功！');
		}else{
			alert('修改失败！');
		}
	}
	return falg;
}*/

function subUpdate2(id) {
	var json = urlObj.getJson();
	var reslut = 0;
	json['ROLE_ID'] = id;
	json['REGION_ID'] = $('#department_select').val();
//	alert($("#role_level").val());
	json['LEVEL'] = $("#role_level").val();
	//console.log(json);
	$.ajax({
		url: updatertd,
		type: "post",
		async: false,
		data: "data=" + JSON.stringify(json),
		dataType: "json",
		success: function(json) {
			reslut = 1;
//			alert('修改成功！');
			subUpdateDia("修改成功");
			initTable('load');
		},
		error: function() {
			alert('修改失败！');
		}
	});
	return reslut;
}

$(function() {
	initTable('init');
	//刷新按钮触发事件
	jQuery('.fa-refresh').click(function() {
		initTable('load');
		var el = jQuery("#box_tab1");
		App.blockUI(el);
		window.setTimeout(function() {
			App.unblockUI(el);
		}, 1000);
	});
	//新增box切换事件
	$('#add').click(function(e) {
		e.preventDefault();
		$("#box_tab2").html(getUrl(addUrl));
		$(this).tab('show');
	});
	initThree();

});

function insertRoleProject(roleId){
	var json = urlObj.getJson();
	json['ROLE_ID'] = roleId;
	json['CREATED_BY'] = json.token.ID;
	var falg = commFromAjax(urlObj.url+'/stats/insertRoleProjectStats', json);
	return falg;
}


function projectStatic(name, roleId) {
	var dia = jDialog.dialog({
		title: '给（' + name + '）计划统计权限',
		scrollbar: "yes",
		width: '80%',
		closeable: false,
		content: getUrl(upCharHtml),
		buttons: [{
			type: 'highlight',
			text: '授权',
			handler: function(button, dialog) {
				insertRoleProject(roleId);
				dia.close();
				subUpdateDia("授权成功");
			}
		}, {
			type: 'highlight',
			text: '取消',
			handler: function(button, dialog) {
				dia.close();
			}
		}]
	});
	var listJson = urlObj.getJson();
	var lodingUrl = urlObj.url + "/stats/queryProjectStatc";
	var roleCharListData = commAjaxPost(lodingUrl, listJson)
	var json = urlObj.getJson();
	json['ROLE_ID'] = roleId;
	var setLodingUrl = urlObj.url + "/workProjectPlan/selectProjectStatic";
	var data = commAjaxPost(setLodingUrl, json);
	var arr = [];
	if(data != 'list is null') {
		for(x in data) {
			arr.push(data[x].ID)
		}
	}
	$("#country_select").select2({
		data: select2Tofromatt(roleCharListData, 'ID', 'NAME')
	});
	$("#country_select").val(arr).trigger('change')
}

function charToRole(name, roleId) {
	var dia = jDialog.dialog({
		title: '给（' + name + '）统计权限',
		scrollbar: "yes",
		width: '80%',
		closeable: false,
		content: getUrl(upCharHtml),

		buttons: [{
			type: 'highlight',
			text: '授权',
			handler: function(button, dialog) {
				upRoleToChar(roleId);
				dia.close();
				subUpdateDia("授权成功");
			}
		}, {
			type: 'highlight',
			text: '取消',
			handler: function(button, dialog) {
				dia.close();
			}
		}]
	});
	var listJson = urlObj.getJson();
	var roleCharListData = commAjaxPost(charList, listJson);
	var json = urlObj.getJson();
	json['ROLE_ID'] = roleId;
	var data = commAjaxPost(roleCharList, json);
	var arr = [];
	if(data != 'list is null') {
		for(x in data) {
			arr.push(data[x].ID)
		}
	}
	//$(".js-example-basic-single").select2();
	$("#country_select").select2({
		data: select2Tofromatt(roleCharListData, 'ID', 'NAME')
	});
	$("#country_select").val(arr).trigger('change')
}

		
function upRoleToChar(roleId) {
	var json = urlObj.getJson();
	json['ROLE_ID'] = roleId;
	var falg = commFromAjax(updateRoleToChar, json);
	return falg;
}

//删除弹出层
function delDialog(id) {
	var dialog = jDialog.confirm('您确定要删除這条数据吗？,确定', {
		handler: function(button, dialog) {
			var json = urlObj.getJson();
			json['ROLE_ID'] = id;
			json['IS_DELETED'] = 'Y';
			var data = commAjaxPost(extidUrl, json);
			if(data.result > 0) {
				$('#mytable-s').bootstrapTable('remove', {
					field: 'ROLE_ID',
					values: [id]
				});
			}
			subUpdateDia("删除成功");
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
					main("#mytable-s", json, showTd, null, tbOnclick, ext, null);
				} else if(str == 'load') {
					$('#mytable-s').bootstrapTable('load', json);
				}
			} else {
				main("#mytable-s", [], showTd, null, tbOnclick, ext, null);
			}
		},
		error: function() {
			alert('Error');
		}
	});

}

function initUpdate(id) {
	//清空盒子二 以免冲突
	$("#box_tab2").html("");
	var json = urlObj.getJson();
	json['ID'] = id;
	var data = commAjaxPost(url, json);
	$("#box_tab3").html(getUrl(updateUrl));
	$('#update').tab('show');
	initUpdateFrom(data);
}

//修改TB标签库
function updateTb(json) {
	json['UPDATED_BY'] = json.token.ID;
	var falg = commAjaxPost(extidUrl, json);
}

function subUpdate() {
	var falg = commFromAjax(extidUrl);
	if(falg) {
		if(falg == 1) {
			alert('修改成功！');
		} else {
			alert('修改失败！');
		}
	}
}

//所有权限集合
var menuInitJson;

function initThree() {
	var subJson = urlObj.getJson();
	$.ajax({
		url: initMenuAndButtons,
		type: "POST",
		async: false,
		data: "data=" + JSON.stringify(subJson),
		dataType: "json",
		success: function(json) {
			menuInitJson = json;
			var tree = treeGrid({
				data: json,
				column: {
					text: 'MENU_NAME',
					id: 'MENU_ID',
					pid: 'PARENT_ID',
					state: {
						checked: 'checkedFilter'
					}
				},
				filter: {
					checkedFilter: function(index, node) {
						if(node.isCheck == true) {
							return true;
						} else {
							return false;
						}
					}
				}
			});
		},
		error: function() {
			alert('Error');
		}
	});
	closeZree();
}

/******查询用户当前权限******/
function roleToMenu(name, roleId) {
	var json = urlObj.getJson();
	json['ROLE_ID'] = roleId;
	var resuleRoleMenu = commAjaxPost(roleToRoot, json);
	var resuleRoleButMenu = commAjaxPost(roleToButtonList, json);
	var obj = $('#tree').treeview('getSelected', 1);
	var tree = treeGrid({
		data: menuInitJson,
		column: {
			text: 'MENU_NAME',
			id: 'MENU_ID',
			pid: 'PARENT_ID',
			state: {
				checked: 'checkedFilter'
			}
		},
		filter: {
			checkedFilter: function(index, node) {
				var falg = false;
				for(var i = 0; i < resuleRoleMenu.length; i++) {
					if(resuleRoleMenu[i].MENU_ID == node.MENU_ID) {
						falg = true;
					}
				}
				for(var c = 0; c < resuleRoleButMenu.length; c++) {
					if(resuleRoleButMenu[c].MENU_ID == node.MENU_ID) {
						falg = true;
					}
				}

				return falg;
			}
		},
		onNodeSelected: function(event, node) {

		}
	});
//		str = '<h2 class="tab-h2"><i class="fa fa-warning fa-fw"></i>对->（<font color="red">' + name + '</font>）权限操作</h2>'
//		str += '</br></br></br><div style=" width100px;border:1px dashed #000;padding-top:20px;padding-right:20px;padding-bottom:20px;padding-left:20px;">';
//		str += '<p>&nbsp;&nbsp;&nbsp;&nbsp;权限区域会展示的所有菜单模块菜单下面会有模块对应的操作权限，点击授权情况会展示当前角色所拥有的权限，勾选或者反选对应的权限进行授权操作。每个角色有对应的权限，合理分配权限以及用户给到对应的权限。</p>'
//		str += '</div></br>'          
//	var str = '<span id="rootName" class="pull-left"  style="font-size: 16px;padding: 6px 0px;"></span>';	
	var	str = '<input type="button" style="right:0px" onclick="openZree()" class="btn btn-default" value="展开"/>&nbsp;';
		str += '<input type="button" style="right:0px" onclick="closeZree()" class="btn btn-default" value="收缩"/>&nbsp;';
		str += '<input type="button" style="right:0px" onclick="putRole(\'' + name + '\',\'' + roleId + '\')" class="btn btn-default" value="授权"/>';
	$('#rootOpt').html(str); //添加授权按钮
	var	rstr = '对->【<font color="red">' + name + '</font>】权限操作';		
	$('#rootName').html(rstr); //授权角色指示
	$("#helpCont").hide();//隐藏说明
	$("#tree").fadeIn(300); //显示树形菜单
}

function openZree() {
	$('#tree').treeview('expandAll', {
		silent: true
	});
	//$('#tree').treeview('expandAll', { levels: 2, silent: true });
}

function closeZree() {
	$('#tree').treeview('collapseAll',   { 
		silent:  true 
	});
}

/******对当前用户授权******/
function putRole(name, roleId) {
	var rootArr = $('#tree').treeview('getChecked');
	var subAddRoot = [];
	var buttonRoot = [];
	var subJson = urlObj.getJson();
	if(rootArr.length >= 0) {
		for(x in rootArr) {
			if(rootArr[x].CODE != null && rootArr[x].CODE != '' && rootArr[x].CODE != undefined) {
				buttonRoot.push({
					BUTTON_ID: rootArr[x].MENU_ID,
					ROLE_ID: roleId
				});
			} else {
				subAddRoot.push({
					MENU_ID: rootArr[x].MENU_ID,
					ROLE_ID: roleId
				});
			}
		}
		subJson['rootArr'] = subAddRoot;
		subJson['roleId'] = roleId;
		var rusleJson = commAjaxPost(setRoot, subJson);
		var subButJson = urlObj.getJson();
		subJson['butRrootArr'] = buttonRoot;
		subJson['roleId'] = roleId;
		var rusleButton = commAjaxPost(insertButtonRole, subJson);
		if(rusleJson.result > 0) {
			var dia = jDialog.dialog({
				title: "成功",
				//scrollbar: "yes",
				width: 250,
				height: 100,
				content: '对->[<font color="red">' + name + '</font>]授权成功',
				buttons: [{
					type: 'highlight',
					text: '确认',
					handler: function(button, dialog) {
						dia.close();
					}
				}]
			});
		}
	}
}