var websocket = null;

//判断当前浏览器是否支持WebSocket
if('WebSocket' in window) {
	websocket = new WebSocket(urlObj.getSocket());
} else {
	alert('当前浏览器不支持websocket');
}

//连接发生错误的回调方法
websocket.onerror = function() {
	//alert("error");
	//setMessageInnerHTML("error");
};

//连接成功建立的回调方法
websocket.onopen = function(event) {
	//alert("open");
	//setMessageInnerHTML("open");
	var index = $.cookie("digBrow");
	if(index == 0) {
		send("hello~我已经上线了。");
	}
	index++;
	$.cookie("digBrow", index);
}

//接收到消息的回调方法
websocket.onmessage = function(event) {
	var json = JSON.parse(event.data);
	var img = (json.USER_HEADIMG).replace(/\~/g, "/");
	if(json.ID != null) {
		if(urlObj.getTokenObj().ID != json.ID) {
			//	var curr_time = moment().format('YYYY-MM-DD HH:mm:ss');
			var curr_time = getNowFormatDate();
			var msg = '';
			msg += '<li class="animated fadeInLeft media">';
			msg += '<a class="pull-left" href="#">';
			msg += img == 'undefined' || img == '' || img == null ? '<img class="media-object" style="border-radius:99px;width:60px;" alt="Generic placeholder image" src="img/avatars/avatar3.jpg">' : '<img class="media-object" style="border-radius:99px;width:60px;" alt="Generic placeholder image" src="' + getImgUrl(urlObj.url + img) + '">';
			msg += '</a>';
			msg += '<div class="media-body chat-pop">';
			msg += '<h4 class="media-heading">' + json.USER_NAME + '<span class="pull-right"><i class="fa fa-clock-o"></i> <abbr class="timeagos" title="' + curr_time + '" >' + curr_time + '</abbr> </span></h4></h4>';
			msg += json.msg;
			msg += '</div>';
			msg += '</li>';
			var list = $('.chat-window .chat-list');
			list.append(msg);
			jQuery("abbr.timeago").timeago();
			$('.chat-window .scroller').slimScroll({
				scrollTo: list.height()
			});
			var bwoserMesIMG = img == 'undefined' || img == '' || img == null ? '/img/avatars/avatar3.jpg' : getImgUrl(urlObj.url + img);
			msgBrowser.alert(json.USER_NAME + ":", json.msg, bwoserMesIMG);
		}
	}
}

//连接关闭的回调方法
websocket.onclose = function() {
	//	  alert("close");
	// setMessageInnerHTML("close");
}

//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
/*  window.onbeforeunload = function(){
      websocket.close();
  }*/

//将消息显示在网页上
function setMessageInnerHTML(innerHTML) {
	document.getElementById('message').innerHTML += innerHTML + '<br/>';
}

//关闭连接
function closeWebSocket() {
	websocket.close();
}

//发送消息
function send(message) {
	//var message = document.getElementById('text').value;
	//	  append();
	websocket.send(message);
}

//消息推送
var socket = null;

//判断当前浏览器是否支持WebSocket
if('WebSocket' in window) {
	socket = new WebSocket(urlObj.getMsgSocket());
} else {
	alert('当前浏览器不支持websocket');
}

//连接发生错误的回调方法
socket.onerror = function() {
	//alert("你的WebSocket链接失败");
};

//连接成功建立的回调方法
socket.onopen = function(event) {

}
	//接收到消息的回调方法
socket.onmessage = function(event) {

	//window.location.reload();//刷新网页
	var json = JSON.parse(event.data);
	// 定时弹出框(消息通知)
	var timeOrder = 10;
	setTimeout(function() {
		var createTime = json.CREATED_DT;
		var unique_id = $.gritter.add({
			title: '标题：' + json.MSG_TITLE,
			text: '内容：' + json.MSG_BODY,
			image: 'img/gritter/cloud.png',
			sticky: true,
			time: '时间：' + getDateTostr(createTime),
			class_name: 'my-sticky-class'
		});
		setTimeout(function() {
			$.gritter.remove(unique_id, {
				fade: true,
				speed: 'slow'
			});
		}, 10000);
	}, timeOrder);
	
	// 消息
	if ($('.liMsg').html() !=undefined) {
		$('.liMsg').html("");
	}
	var messageUrl = urlObj.messageNotifyList
	var jsonObj = {};
		jsonObj['FK_USER_ID'] = json.USER_ID_ARR;
		jsonObj['MSG_STATUS'] = 'NO';
		var datas = commAjaxPost(messageUrl, jsonObj);
		var length = datas.length;
		if(datas != undefined && length > 0 && datas != 'list is null') {
			var numbers = '<i class="fa fa-bell"></i><span id="appendNumS" class="badge">' + length + '</span>'
			$('#appendNum').html(numbers);
			$('#setNotificationNum').html("");
			$('#setNotificationNum').append(length + '条通知');
			// 循环获取json数据
			$.each(datas, function(index) {
				var falg = (index % 2 == 0);
				var time = datas[index]['CREATED_DT'];
				var title = datas[index]['MSG_TITLE'];
				if(title.length > 7) {
					title = title.substring(0, 6) + '...';
				}
				$('.dropdown-title').after(putHtml(datas[index]['MSG_ID'], title, getDateTostr(time), falg));
			});
		}else{
			$('#setNotificationNum').append(0 + '条通知');
		}
	timeOrder += 10;
	msgBrowser.alert(json.MSG_TITLE, json.MSG_BODY, "/img/megBroow.png"); // 桌面通知
}

//onbeforeunload
//onunload
window.onbeforeunload = function() { //author: meizz 
	//鼠标相对于用户屏幕的水平位置 - 窗口左上角相对于屏幕左上角的水平位置 = 鼠标在当前窗口上的水平位置
	var n = window.event.screenX - window.screenLeft;
	//鼠标在当前窗口内时，n<m，b为false；鼠标在当前窗口外时，n>m，b为true。20这个值是指关闭按钮的宽度
	var b = n > document.documentElement.scrollWidth - 20;
	//鼠标在客户区内时，window.event.clientY>0；鼠标在客户区外时，window.event.clientY<0
	//刷新浏览器时触发
	if(b && window.event.clientY < 0 || window.event.altKey || window.event.ctrlKey) {
		//console.log('run 1');
		var extidUrSS = urlObj.url + "/user/updateOnline";
		var json = urlObj.getJson();
		json['ID'] = json.token.ID;
		json['IS_ONLINE'] = '1';
		var data = commAjaxPost(extidUrSS, json);
		websocket.close();
		socket.close();
	} else if(event.clientY > document.body.clientHeight || event.altKey) { //关闭浏览器时触发
		//console.log('run 2');
		var extidUrSS = urlObj.url + "/user/updateOnline";
		var json = urlObj.getJson();
		json['ID'] = json.token.ID;
		json['IS_ONLINE'] = '0';
		var data = commAjaxPost(extidUrSS, json);
		return "您确定离开此网站?";
	}
	//else if(){//关闭浏览器选项卡时触发

	//(window.event || arguments[0]).returnValue = ""
	//}
	//console.log(e.returnValue)
}

/***刷新事件监听***/
window.onkeydown = function(e) { //键盘按键控制
	//鼠标相对于用户屏幕的水平位置 - 窗口左上角相对于屏幕左上角的水平位置 = 鼠标在当前窗口上的水平位置
	var n = window.event.screenX - window.screenLeft;
	//鼠标在当前窗口内时，n<m，b为false；鼠标在当前窗口外时，n>m，b为true。20这个值是指关闭按钮的宽度
	var b = n > document.documentElement.scrollWidth - 20;
	e = e || window.event;
	if((e.ctrlKey && e.keyCode == 82) || e.keyCode == 116 || b && window.event.clientY < 0) { //F5刷新，禁止 //ctrl+R            
		//利用对话框返回的值 （true 或者 false）  
		if(confirm("您确定刷新网页吗?这将会重新加载网站，您已提交的表单数据也可能会被重新提交！")) {
			window.location.reload(); //刷新网页
			//          alert("确定刷新");  
		} else {
			return null;
			//          alert("取消刷新");  
		}
	}
}