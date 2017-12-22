var url = urlObj.messageNotifyList;
var msgAdd = urlObj.url + "/messageNotify/addMessageNotify";
var extidUrl = urlObj.url + "/messageNotify/updateMessageNotify";
var delUrl = urlObj.url + "/messageNotify/deleteMessageNotify";
var messageInfo = "/function/messageNotify/messageInfo.html";
$(function() {
	queryMessageList();
});

function queryMessageList() {
	var strdata = urlObj.getJson();
	if(strdata != null) {
		strdata['FK_USER_ID'] = strdata.token.ID;
		strdata['MSG_STATUS'] = 'NO';
		$.ajax({
			url: url,
			type: "POST",
			async: false,
			data: "data=" + JSON.stringify(strdata),
			dataType: "json",
			success: function(json) {
				if(json != undefined) {
					var str = JSON.stringify(json);
					var jsonObj = JSON.parse(str);
					var length = jsonObj.length;
					if(jsonObj != undefined && length > 0 && jsonObj != 'list is null') {
						var numbers = '<i class="fa fa-bell"></i><span id="appendNumS" class="badge">' + length + '</span>'
						$('#appendNum').html(numbers);
						$('#setNotificationNum').append(length + '条通知');
						// 循环获取json数据
						$.each(jsonObj, function(index) {
							var falg = (index % 2 == 0);
							var time = jsonObj[index]['CREATED_DT'];		
							var title = jsonObj[index]['MSG_TITLE'];
							if(title.length > 7) {
								title = title.substring(0, 6) + '...';
							}
							$('#showNotice').append(putHtml(jsonObj[index]['MSG_ID'], title, getDateTostr(time), falg));
						});
						var str = '<li class="footer"><a href="#" onclick="menuUrl(\'function/messageNotify/box\');">查看全部消息通知 <i class="fa fa-arrow-circle-right"></i></a></li>';
						$('#showNotice').append(str);
					} else {
						var aa = '<i class="fa fa-bell"></i><span id="appendNum" class="badge"></span>'
						$('#appendNum').html(aa);
						$('#setNotificationNum').append('0条通知');
						var str1 = '<li class="footer"><a href="#" onclick="menuUrl(\'function/messageNotify/box\');">查看全部消息通知 <i class="fa fa-arrow-circle-right"></i></a></li>';
						$('#showNotice').append(str1);
					}

				}
			},
			error: function() {
				alert('Error');
			}
		});
	} else {
		return false;
	}

}

// 消息通知列表
function putHtml(id, title, time, falg) {
	var spanClass = falg ? "label-success" : "label-warning";
	var html = '<li class="liMsg">';
	html += '<a href="#" onclick="details(this,\'' + id + '\');">';
	html += '<span style="margin-top:-10px" class="label ' + spanClass + '"><i class="fa fa-comment"></i></span>';
	html += '<span class="body">';
	html += '<span class="message">' + title + '</span>';
	html += '<span class="time">';
	html += '<i class="fa fa-clock-o"></i>';
	html += '<span>' + time + '</span>';
	html += '</span>';
	html += '</span>';
	html += '</a>';
	html += '</li>';
	return html;
}

// 查询消息详情
function details(obj,msgId) {
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
	if(data != "list is null"){
		initInfo(data);	
		obj.remove();
		var num=parseInt($('#appendNumS').html());
		num--;
		if(num==0){
		 	$('#appendNumS').remove();
		 	$('#setNotificationNum').html('0条通知');
		}else{
			$('#appendNumS').html(num);
			$('#setNotificationNum').html(num+'条通知');
		}
	}
}

