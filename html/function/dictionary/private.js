var url = urlObj.dictionaryList;
var subAddurl = urlObj.url + "/dictionary/addDictionary";
var extidUrl = urlObj.url + "/dictionary/updateDictionary";
var delUrl = urlObj.url + "/dictionary/deleteByDictionary";
var addUrl = "/function/dictionary/add.html";
var updateUrl = "/function/dictionary/update.html";

var showTd = [
	/*{
			title: "ID", //标题
			field: "SD_ID", //键名
			align: "center", //水平
			valign: "middle", //垂直
			sortable: true,
			valign: "middle", //垂直
		},*/
	{
		title: "数据类型名字", //标题
		field: "TYPE_NAME", //键名
		align: "center", //水平
		valign: "middle", //垂直
		sortable: true,
		valign: "middle", //垂直
		editable: true
	}, {
		title: "数据类型代码",
		field: "TYPE_CODE",
		width: 20, //宽度
		align: "center", //水平
		valign: "middle", //垂直
		sortable: true,
		editable: true
	}, {
		title: "数据代码", //标题
		align: "center", //水平
		valign: "middle", //垂直
		field: "CODE", //键名
		sortable: true, // 排序
		editable: true
	}, {
		title: "数据名字", //标题
		align: "center", //水平
		valign: "middle", //垂直
		field: "NAME", //键名
		sortable: true,
		editable: true
	}, {
		title: "数据描述", //标题
		align: "center", //水平
		valign: "middle", //垂直
		field: "DESCRIPTION", //键名
		sortable: true,
		editable: true
	}, {
		title: "排序", //标题
		align: "center", //水平
		valign: "middle", //垂直
		field: "ORD_NO", //键名
		sortable: true,
		editable: true
	}, {
		title: "备注", //标题
		align: "center", //水平
		valign: "middle", //垂直
		field: "REMARK", //键名
		sortable: true,
		editable: true
	},
	/*{
		title: "创建时间", //标题
		align: "center", //水平
		valign: "middle", //垂直
		field: "CREATED_DT", //键名
	},*/
	{
		title: '操作',
		field: 'SD_ID',
		align: 'center',
		formatter: function(value, row, index) {
			var e = '<a href="#" mce_href="#" onclick="initUpdate(\'' + value + '\')" class = "boxTab">编辑</a> ';
			var d = '<a href="#" mce_href="#" onclick="delDialog(\'' + value + '\')">删除</a> ';
			return e + d;
		}
	},

];

var tbOnclick = function(field, value, row, $element) {
	if(field == "SD_ID") {
	}
}

function initTable(str) {
	var strdata = urlObj.getJson();
	strdata['NO_IS_SUPER'] = "0";
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
			alert('Error');
		}
	});

}

var dbclick = function(row, tr) {
	var strdata = urlObj.getJson();
	strdata['SD_ID'] = row.SD_ID;
	$.ajax({
		url: urlObj.url ,//+ "/user/info",
		type: "POST",
		async: false,
		data: "data=" + JSON.stringify(strdata),
		dataType: "html",
		success: function(html) {
			var dialog = jDialog.dialog({
				title: '',
				width: 820,
				height: 380,
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
}

var tbOnclick = function(field, value, row, $element) {
	if(field == "TYPE_CODE") {
	}
}

var ext = function(field, row, oldValue, $el) {
	//注册编辑事件
	var json = urlObj.getJson();
	json['SD_ID'] = row.SD_ID;
	if(field == "TYPE_CODE") {
		json['TYPE_CODE'] = row.TYPE_CODE;
	} else if(field == "TYPE_NAME") {
		json['TYPE_NAME'] = row.TYPE_NAME;
	} else if(field == "CODE") {
		json['CODE'] = row.CODE;
	} else if(field == "NAME") {
		json['NAME'] = row.NAME;
	} else if(field == "DESCRIPTION") {
		json['DESCRIPTION'] = row.DESCRIPTION;
	} else if(field == "REMARK") {
		json['REMARK'] = row.REMARK;
	} else if(field == "ORD_NO") {
		json['ORD_NO'] = row.ORD_NO;
	}
		if(commAjaxPost(extidUrl, json).result == 1) {
		} else {
			alert('数据已存在！');
		}
}

$(function() {
	initTable('init');
	hideGoalUpdateTab(); //盒子标题控制
	//刷新按钮触发事件
	jQuery('.fa-refresh').click(function() {
		initTable('load');
		var el = jQuery("#box_tab1");
		App.blockUI(el);
		window.setTimeout(function() {
			App.unblockUI(el);
		}, 1000);
	});
});

//新增box切换事件
$('#add').click(function(e) {
	e.preventDefault();
	//清空盒子3 以免冲突
	$("#box_tab3").html("");
	$("#box_tab2").html(getUrl(addUrl));
	$(this).tab('show');
});

/*$('#update').click(function(e) {
	e.preventDefault();
	$("#box_tab3").html(getUrl(updateUrl));
	$(this).tab('show');
});*/

// 添加字典信息
function add() {
	var typeCode = $("#TYPE_CODE").val();
	var typeName = $("#TYPE_NAME").val();
	var code = $("#CODE").val();
	var name = $("#NAME").val();
	var description = $("#DESCRIPTION").val();
	var ordNo = $("#ORD_NO").val();
	var remark = $("#REMARK").val();

	var typeCodeJson = urlObj.getJson();
	var typeNameJson = urlObj.getJson();
	var codeJson = urlObj.getJson();
	var nameJson = urlObj.getJson();
	var descriptionJson = urlObj.getJson();
	var ordNoJson = urlObj.getJson();
	var remarkJson = urlObj.getJson();
	var falg = false;
	typeCodeJson['TYPE_CODE'] = typeCode;
	typeNameJson['TYPE_NAME'] = typeName;
	codeJson['CODE'] = code;
	nameJson['NAME'] = name;
	descriptionJson['DESCRIPTION'] = description;
	ordNoJson['ORD_NO'] = ordNo;
	remarkJson['REMARK'] = remark;
	var falg = commFromAjax(subAddurl);
	if(falg) {
		if(falg == 1) {
			alert('新增成功！');
			$("#box_tab2").html(getUrl(addUrl));
			$('#add').tab('show');
		} else {
			alert('新增失败！');
		}
	}
}

function initUpdate(id) {
	//清空盒子二 以免冲突
	$("#box_tab2").html("");
	var json = urlObj.getJson();
	json['SD_ID'] = id;
	var data = commAjaxPost(url, json);
	$("#box_tab3").html(getUrl(updateUrl));
	$('#update').tab('show');
	initUpdateFrom(data);

	//$("#country_select2").select2('val', roleId);
	//$("#country_select3").select2('val', data[0].STATE);
}

function subUpdate() {
	var id = $("#SD_ID").val();
	var typeCode = $("#TYPE_CODE").val();
	var typeName = $("#TYPE_NAME").val();
	var code = $("#CODE").val();
	var name = $("#NAME").val();
	var description = $("#DESCRIPTION").val();
	var ordNo = $("#ORD_NO").val();
	var remark = $("#REMARK").val();

	var idJson = urlObj.getJson();
	var typeCodeJson = urlObj.getJson();
	var typeNameJson = urlObj.getJson();
	var codeJson = urlObj.getJson();
	var nameJson = urlObj.getJson();
	var descriptionJson = urlObj.getJson();
	var ordNoJson = urlObj.getJson();
	var remarkJson = urlObj.getJson();
	var falg = false;
	idJson['SD_ID'] = id;
	typeCodeJson['TYPE_CODE'] = typeCode;
	typeNameJson['TYPE_NAME'] = typeName;
	codeJson['CODE'] = code;
	nameJson['NAME'] = name;
	descriptionJson['DESCRIPTION'] = description;
	ordNoJson['ORD_NO'] = ordNo;
	remarkJson['REMARK'] = remark;

	/*if(initName != name) {
		$.ajax({
			url: url,
			type: "post",
			async: false,
			data: "data=" + JSON.stringify(nameJson),
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
	if(initAge != age) {
		$.ajax({
			url: url,
			type: "post",
			async: false,
			data: "data=" + JSON.stringify(ageJson),
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
	}*/

	var falg = commFromAjax(extidUrl);
	if(falg) {
		if(falg == 1) {
			alert('修改成功！');
		} else {
			alert('修改失败！');
		}
	}
}

function subDel() {
	var id = $("#sd_id").val();
	var idJson = urlObj.getJson();
	var falg = false;
	idJson['sd_id'] = id;
	$.ajax({
		url: url,
		type: "post",
		async: false,
		data: "data=" + JSON.stringify(idJson),
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
	var falg = commFromAjax(delUrl).result;
	if(falg) {
		if(falg == 1) {
			alert('删除成功！');
		} else {
			alert('删除失败！');
		}
	}
}

//删除弹出层
function delDialog(id) {
	var dialog = jDialog.confirm('您确定要删除這条数据吗？,确定', {
		handler: function(button, dialog) {
			var json = urlObj.getJson();
			json['SD_ID'] = id;
			//json['IS_DELETED']='Y';
			var data = commAjaxPost(delUrl, json);
			//if(data.result>0){
			//	$('#mytable-s').bootstrapTable('remove', {field:'t_id',values:[id]});
			//}
			initTable("load");
			dialog.close();
		}
	}, {
		handler: function(button, dialog) {
			dialog.close();
		}
	});
}