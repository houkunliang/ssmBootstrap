emToken();
$(function() {
	$("#infoXQ").click(function() {
		var cont = getUrl('/function/util/userInfo.html');
		var url = urlObj.url + "/user/updateObj";
		var json = urlObj.getJson();
		var dialog = jDialog.dialog({
			title: '用户明细',
			width: '60%',
			content: cont,
			buttons: [{
				type: 'highlight',
				text: '关闭',
				handler: function(button, dialog) {
					if($("#falgText").val() != 0) {
						$("#changepasswordShow").remove();
						var name = $("#USER_NAMES").val();
						var sex = $("#country_selectUser").val();
						var USER_ADDRESSS = $("#USER_ADDRESSS").val();
						var USER_PHONE = $("#inputSuccess").val();
						var USER_EMAILS = $("#USER_EMAILS").val();
						json['ID'] = json.token.ID;
						json['USER_NAME'] = name;
						json['USER_SEX'] = sex;
						json['USER_ADDRESS'] = USER_ADDRESSS;
						json['USER_PHONE'] = USER_PHONE;
						json['USER_EMAIL'] = USER_EMAILS;
						if(!hklfromTest()) {
							return false;
						}
						var data = commAjaxPost(url, json);
						if(data.result == 1) {
							var setToken = urlObj.getJson();
							setToken.token.USER_NAME = name;
							setToken.token.USER_SEX = sex;
							setToken.token.USER_ADDRESS = USER_ADDRESSS;
							setToken.token.USER_PHONE = USER_PHONE;
							setToken.token.USER_EMAIL = USER_EMAILS;
							$.cookie("token", JSON.stringify(setToken.token));
							dialog.close();
							history.go(0);
						}
					} else {
						dialog.close();
					}

				}
			}]

		});
	})
	$('#setInfo').click(function() {
			setInfo();
		})
	$('#mesgDiv').css("display", "block");
	App.setPage("index");
	App.init();
	$('#lodingGif').remove();
});


function emToken(){
	var token = $.cookie("token");
	if(token == 'null' || token == null || token == '' || token == undefined) {
		alert("您的账号已经过期或者失效！");
		window.location.href = "loginFilter.html";
	}
	token = JSON.parse(token);
	if(token.USER_HEADIMG != null && token.USER_HEADIMG != '' && token.USER_HEADIMG != undefined) {
		$("#hedaImg").attr('src', getImgUrl(urlObj.url + token.USER_HEADIMG));
	}
	select2Img();
	initMenus();
	$("#userName").html(token.USER_NAME); //用户名
	if(token.ROLE_NAME == "" || token.ROLE_NAME == undefined || token.ROLE_NAME == null) {
		$("#roleName").html("暂无角色").removeClass("hidden"); //用户角色
	} else {
		if((token.ROLE_NAME).length <= 4) {
			$("#roleName").html(token.ROLE_NAME).removeClass("hidden"); //用户角色
		} else {
			$("#roleNames").html(token.ROLE_NAME).removeClass("hidden"); //用户角色
		}
	}
}




function out() {
	var dialog = jDialog.dialog({
		title: '退出',
		content: '是否退出当前登录？',
		buttons: [{
			type: 'highlight',
			text: '退出',
			handler: function(button, dialog) {
				//outSystem();
				$.cookie('token', null);
				window.location.href = "loginFilter.html";
			}
		}, {
			type: 'highlight',
			text: '取消',
			handler: function(button, dialog) {
				dialog.close();
			}
		}]
	});
}

function setPas() {
	var one = $('#pasOne').val();
	var pasTow = $('#pasTow').val();
	var pasThree = $('#pasThree').val();
	var img = $('#upImgs').val();
	var json = urlObj.getJson();
	if(!hklfromTest()) {
		return false;
	}
	if(json.token.USER_PASS == one) {
		var extidUrl = urlObj.url + "/user/updateObj";
		json['ID'] = json.token.ID;
		json['USER_PASS'] = pasTow;
		if(img != '' && img != null && img != undefined) {
			json['USER_HEADIMG'] = img;
		}
		var data = commAjaxPost(extidUrl, json);
		if(data.result == 1) {
				alert('修改密码成功!');
				$.cookie('token', null); 
				window.location.href="loginFilter.html";
				$.cookie('token', null);
				window.location.href = "loginFilter.html";
			} else {
				alert('修改密码失败!');
			}
	} else {
		alert('旧密码有错误!');
	}

}

function outSystem() {
	var extidUrSS = urlObj.url + "/user/updateOnline";
	var json = urlObj.getJson();
	json['ID'] = json.token.ID;
	json['IS_ONLINE'] = '1';
	var data = commAjaxPost(extidUrSS, json);
}
/************用户资料卡下拉展示***************/
$("#header-user").mouseover(function() {
	$(this).addClass("open");
}).mouseout(function() {
	$(this).removeClass("open");
})


