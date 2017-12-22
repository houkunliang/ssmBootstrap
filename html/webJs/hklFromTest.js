var phone = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
var mail = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
var english=/^[A-Za-z]+$/;
var nochinese= /.*[\u4e00-\u9fa5]+.*$/;;

//english phone isnull emali number nochinese txtLength

function hklfromTest(){
	var falg=true;
	$("[hklfrom]").each(function () {
		var str=$(this).attr("hklfrom");
		var json = jQuery.parseJSON(str);
	    var obj = eval(json);
		if(obj.isnull!=null&&obj.isnull!=undefined&&obj.isnull!=''){
			if(obj.isnull=='true'){
				if($(this).val()==''){
					if($(this).next("span").length>=1){
						$(this).css({"border-color":"red","box-shadow":"0px 0px 2px red"});
						$(this).next("span").html(obj.message.isnull);
					}else{
						$(this).css({"border-color":"red","box-shadow":"0px 0px 2px red"});
						$(this).after('<span class="red">'+obj.message.isnull+'</span>');
					}
					falg=false;
					return true ;
				}
			}
		}
		if(obj.number!=null&&obj.number!=undefined&&obj.number!=''){
			if($(this).val()!=''){
				if(obj.number=='true'){
					if(isNaN($(this).val())){
						if($(this).next("span").length>=1){
							$(this).css({"border-color":"red","box-shadow":"0px 0px 2px red"});
							$(this).next("span").html(obj.message.number);
						}else{
							$(this).css({"border-color":"red","box-shadow":"0px 0px 2px red"});
							$(this).after('<span class="red">'+obj.message.number+'</span>');
						}
						falg=false;
						return true ;
					}
				}
			}
		}
		if(obj.phone!=null&&obj.phone!=undefined&&obj.phone!=''){
			if($(this).val()!=''){
				if(obj.phone=='true'){
					if(!phone.test($(this).val())){
						if($(this).next("span").length>=1){
							$(this).css({"border-color":"red","box-shadow":"0px 0px 2px red"});
							$(this).next("span").html(obj.message.phone);
						}else{
							$(this).css({"border-color":"red","box-shadow":"0px 0px 2px red"});
							$(this).after('<span class="red">'+obj.message.phone+'</span>');
						}
						falg=false;
						return true ;
					}
				}
			}
		}
		if(obj.emali!=null&&obj.emali!=undefined&&obj.emali!=''){
			if($(this).val()!=''){
				if(obj.emali=='true'){
					if(!mail.test($(this).val())){
						if($(this).next("span").length>=1){
							$(this).css({"border-color":"red","box-shadow":"0px 0px 2px red"});
							$(this).next("br").next("span").html(obj.message.emali);
						}else{
							$(this).css({"border-color":"red","box-shadow":"0px 0px 2px red"});
							$(this).after('<span class="red">'+obj.message.emali+'</span>');
						}
						falg=false;
						return true ;
					}
				}
			}
		}
		if(obj.english!=null&&obj.english!=undefined&&obj.english!=''){
			if($(this).val()!=''){
				if(obj.english=='true'){
					if(!english.test($(this).val())){
						if($(this).next("span").length>=1){
							$(this).css({"border-color":"red","box-shadow":"0px 0px 2px red"});
							$(this).next("br").next("span").html(obj.message.english);
						}else{
							$(this).css({"border-color":"red","box-shadow":"0px 0px 2px red"});
							$(this).after('<span class="red">'+obj.message.english+'</span>');
						}
						falg=false;
						return true ;
					}
				}
			}
		}
		if(obj.nochinese!=null&&obj.nochinese!=undefined&&obj.nochinese!=''){
			if($(this).val()!=''){
				if(obj.nochinese=='true'){
					if(nochinese.test($(this).val())){
						if($(this).next("span").length>=1){
							$(this).css({"border-color":"red","box-shadow":"0px 0px 2px red"});
							$(this).next("br").next("span").html(obj.message.nochinese);
						}else{
							$(this).css({"border-color":"red","box-shadow":"0px 0px 2px red"});
							$(this).after('<span class="red">'+obj.message.nochinese+'</span>');
						}
						falg=false;
						return true ;
					}
				}
			}
		}
		if(obj.txtLength!=null&&obj.txtLength!=undefined&&obj.txtLength!=''){
			if(obj.txtLength.length>0){
				if(obj.txtLength[0]!='false'){
					if(obj.txtLength[0]>$(this).val().length){
						if($(this).next("span").length>=1){
							$(this).css({"border-color":"red","box-shadow":"0px 0px 2px red"});
							$(this).next("br").next("span").html('长度不能小于'+obj.txtLength[0]+'位');
						}else{
							$(this).css({"border-color":"red","box-shadow":"0px 0px 2px red"});
							$(this).after('<span class="red">长度不能小于'+obj.txtLength[0]+'位</span>');
						}
						falg=false;
						return true ;
					}
				}
				if(obj.txtLength[1]!='false'){
					if(obj.txtLength[1]<$(this).val().length){
						if($(this).next("span").length>=1){
							$(this).css({"border-color":"red","box-shadow":"0px 0px 2px red"});
							$(this).next("br").next("span").html('长度不能大于'+obj.txtLength[1]+'位');
						}else{
							$(this).css({"border-color":"red","box-shadow":"0px 0px 2px red"});
							$(this).after('<span class="red">长度不能大于'+obj.txtLength[1]+'位</span>');
						}
						falg=false;
						return true ;
					}
				}
			}
		}
		$(this).removeAttr("style");
		$(this).next("span").remove();
		$(this).next("br").remove();
//		$(this).next("br").after('<span class="red"><font style="color:green">正确</font></span>');
	});
	return falg;
}
