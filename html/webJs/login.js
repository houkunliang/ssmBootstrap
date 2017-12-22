function login(){
	if(!hklfromTest()){
		return false;
	}
	var loginAcct=$("#exampleInputEmail1").val();
	var loginPass=$("#exampleInputPassword1").val();
    lodeGifUtil.gifInit();
    lodeGifUtil.show();
	jump(loginAcct,loginPass);
}


function jump(accut,pas){
	data={"USER_ACCOUNT":accut,"USER_PASS":pas,"NO_IS_SUPER":"NO_IS_SUPER"};
	$.ajax({  
		url:urlObj.login, 
        type: "post",  
        async: true,  
        data:"data="+JSON.stringify(data),
        dataType: "json",  
//      jsonp: "callbackparam", //服务端用于接收callback调用的function名的参数   
//      jsonpCallback: "success_jsonpCallback", //callback的function名称,服务端会把名称和data一起传递回来   
        success: function(json) {
        	if(json.result=='0'){
        		alert("账号或密码错误,请输入正确的账号或密码");
                lodeGifUtil.hide();
        	}else{
				$.cookie("token",JSON.stringify(json.token));
                $.cookie("digBrow",0);
                //star(json);
        		window.location.href="index.html?country=#";
        	}
        },  
        error: function(){alert('Error');lodeGifUtil.hide();}  
    }); 
}

function star(json){
    var extidUrl = urlObj.url + "/user/updateOnline";
    var userId=json.token.ID;
    var jsonUser ={"token":json.token};
        jsonUser['ID'] = userId;
        jsonUser['IS_ONLINE']='0';
    $.ajax({  
        url:extidUrl, 
        type: "post",  
        async: true,  
        data:"data="+JSON.stringify(jsonUser),
        dataType: "json",  
        success: function(json) {
        },  
        error: function(){alert('Error');}  
    }); 
}