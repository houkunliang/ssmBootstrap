var url = urlObj.messageNotifyList;
var msgAdd = urlObj.url + "/messageNotify/addMessageNotify";
var extidUrl = urlObj.url + "/messageNotify/updateMessageNotify";
var delUrl = urlObj.url + "/messageNotify/deleteMessageNotify";
var messageInfo = "/function/messageNotify/messageInfo.html";

var addUrl = "/function/messageNotify/add.html";
var showTd = [{
	title: "标题", //标题
	field: "MSG_TITLE", //键名
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	width: 200, //宽度
	valign: "middle" //垂直
}, {
	title: "消息类型",
	field: "MSG_TYPE",
	width: 20, //宽度
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true
	/*formatter: function(value, row, index) {
		if (value == 0) {
			return "系统";
		}
		if (value == 1) {
			return "通知";
		}
		if (value == 2) {
			return "公告";
		}
	}*/
}, {
	title: "消息内容",
	field: "MSG_BODY",
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true
}, {
	title: "创建时间", //标题
	field: "CREATED_DT", //键名    
	align: "center", //水平
	valign: "middle", //垂直
	width: 250, //宽度
	formatter: function(value, row, index) {
		return getDateTostr(value);
	},
	sortable: true
}, {
	title: "消息状态",
	field: "MSG_STATUS",
	width: 20, //宽度
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	formatter: function(value, row, index) {
		return value == 'YES' ? "已读" : "未读";
	}
}, {
	title: "完成状态",
	field: "IS_COMPLETE",
	width: 20, //宽度
	align: "center", //水平
	valign: "middle", //垂直
	sortable: true,
	formatter: function(value, row, index) {
		return value == '0' ? "<span>完成</span>" : "<span style=\"color: red;\">未完成</span>";
	}
}, {
	title: '操作',
	field: 'MSG_ID',
	align: 'center',
	formatter: function(value, row, index) {
		var f = '<a href="#" mce_href="#" onclick="isComplete(\'' + value + '\')">完成</a> '
		var e = '<a href="#" mce_href="#" onclick="queryInfo(\'' + value + '\')">详情</a> ';
		var d = '<a href="#" mce_href="#" onclick="delDialog(\'' + value + '\')">删除</a> ';
		return f + e + d;
	}
}];

$(function() {
	updateAllMsg();
	initTable('init');
	jQuery('.fa-refresh').click(function() {
		initTable('init');
		var el = jQuery("#box_tab1");
		App.blockUI(el);
		window.setTimeout(function() {
			App.unblockUI(el);
		}, 1000);
	});
});

function initTable(str) {
	var strdata = urlObj.getJson();
	strdata['FK_USER_ID'] = strdata.token.ID;
	$.ajax({
		url: url,
		type: "POST",
		async: false,
		data: "data=" + JSON.stringify(strdata),
		dataType: "json",
		success: function(json) {
			if(json != 'list is null') {
				if(str == 'init') {
					main("#mytable-s", json, showTd, dbclick, tbOnclick, null, null);
				} else if(str == 'load') {
					$('#mytable-s').bootstrapTable('load', json);
				}
			} else {
				main("#mytable-s", [], showTd, null, tbOnclick, null, null);
			}
		},
		error: function() {
			alert('Error');
		}
	});
}

var dbclick = function(row, tr) {
	var strdata = urlObj.getJson();
	strdata['FK_USER_ID'] = strdata.token.ID;
	$.ajax({
		url: urlObj.url,// + "/user/info",
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
var tbOnclick = function(field, value, row, $element) {}

$('#add').click(function(e) {
	e.preventDefault();
	//清空盒子3 以免冲突
	//$("#box_tab3").html("");
	$("#box_tab2").html(getUrl(addUrl));
	$(this).tab('show');
});

// 删除消息
function delDialog(msgId) {
	var dialog = jDialog.confirm('您确定要删除這条数据吗？', {
		handler: function(button, dialog) {
			var json = urlObj.getJson();
			json['MSG_ID'] = msgId;
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
// 查看详情
function queryInfo(msgId) {
	var dia = jDialog.dialog({
		title: "详情",
		scrollbar: "yes",
		width: '80%',
		content: getUrl(messageInfo),
		buttons: [{
			type: 'highlight',
			text: '关闭',
			handler: function(button, dialog) {
				dia.close();
			}
		}]
	});
	var jsons = urlObj.getJson();
	jsons['MSG_ID'] = msgId;
	jsons['MSG_STATUS'] = 'YES';
	commAjaxPost(extidUrl, jsons);
	var data = commAjaxPost(url, jsons);
	initInfo(data);
}

// 是否完成
function isComplete(msgId) {
	var dialog = jDialog.confirm('是否确认完成消息吗？', {
		handler: function(button, dialog) {
			var json = urlObj.getJson();
			json['MSG_ID'] = msgId;
			json['IS_COMPLETE'] = '0';
			var data = commAjaxPost(extidUrl, json);
			initTable("load");
			dialog.close();
		}
	}, {
		handler: function(button, dialog) {
			dialog.close();
		}
	});

}

// 修改消息全部为未读的状态
function updateAllMsg(){
	var data = urlObj.getJson();
	var updateAllMsg = urlObj.url + "/messageNotify/updateAllMessageNotify";
	data['USER_ID'] = data.token.ID;
	var data = commAjaxPost(updateAllMsg,data).result;
	if (data != 0) {
	var numbers = '<i class="fa fa-bell"></i><span id="appendNumS" class="badge">'+ 0+'</span>'
	$('#appendNumS').remove();
	$('.liMsg').html("");
	$('#setNotificationNum').html("");
	$('#setNotificationNum').append(0 + '条通知');
	}
}
