(function($){
    //备份jquery的ajax方法
    var _ajax=$.ajax;
    //重写jquery的ajax方法
    $.ajax=function(opt){
        //备份opt中error和success方法
        var fn = {
            error:function(XMLHttpRequest, textStatus, errorThrown){},
            success:function(data, textStatus){}
        }
        if(opt.error){
            fn.error=opt.error;
        }
        if(opt.success){
            fn.success=opt.success;
        }
        //扩展增强处理
        var _opt = $.extend(opt,{
            error:function(XMLHttpRequest, textStatus, errorThrown){
                //错误方法增强处理
                fn.error(XMLHttpRequest, textStatus, errorThrown);
            },
            success:function(data, textStatus,xhr){
            	if(data == undefined || data == null || data== ''){return false;}
            	if(data.err != undefined && data.err != null && data.err != ''){
            		if(data.err=='Login information error'){
            			alert("您的账号已经过期或者失效！");
						window.location.href="loginFilter.html";
            			return false;
            		}else if(data.err=='Account has been forced offline'){
            			alert("您的账号异地登录，被迫强制下线！");
            			$.cookie("token",null);
            			window.location.href="loginFilter.html";
            			return false;
            		}
            	}
                //成功回调方法增强处理
                fn.success(data, textStatus);
            }
        });
        return _ajax(_opt);
    };
})(jQuery);

function initMenus(){
	//alert(12);
	var dom='';
	var json=urlObj.getJson();
	//var roleId = json.token.ROLE_ID;
	json['USER_ID']=json.token.ID;
	//alert($.cookie('REGION_ID'));
	//json['REGION_ID']=$.cookie("REGION_ID");
	json['REGION_ID']=json.token.imgRegionId;
	//alert($.cookie('REGION_ID'));
	//json['ROLE_ID'] = roleId;
	var resuleJson = null;
	if (json.token.IS_SUPER == 1) {
		resuleJson=commAjaxPost(urlObj.rootMenu,json);
	}else{
		var switchMenuMethod = urlObj.url + "/user/switchByMenu";
		resuleJson=commAjaxPost(switchMenuMethod,json);
	}
	//var resuleJson=commAjaxPost(urlObj.rootMenu,json);
	if(resuleJson != 'list is null'){
		for(x in resuleJson){
			if(resuleJson[x].PARENT_ID == 0){
				dom+='<li class="has-sub">'
				//dom+=resuleJson[x].MENU_LINK=='HOME'?'<a onclick="starChar(\'tj\');" href="#" class="">':'<a href="javascript:;" class="">';
				dom+=resuleJson[x].MENU_LINK=='HOME'?'<a onclick="history.go(0);" href="#" class="">':'<a href="javascript:;" class="">';
				dom+='<i class="fa '+resuleJson[x].ICON+' fa-fw"></i> <span class="menu-text">'+resuleJson[x].MENU_NAME+'</span>';
				dom+=resuleJson[x].MENU_LINK=='HOME'?'':'<span class="arrow"></span>';
				dom+='</a>';
				dom+='<ul class="sub">';
				for(y in resuleJson){
					if(resuleJson[x].MENU_ID == resuleJson[y].PARENT_ID){
						dom+='<li><a class="" href="#" onclick="menuUrl(\''+resuleJson[y].MENU_LINK+'\',\''+resuleJson[y].MENU_ID+'\')"><span class="sub-menu-text">'+resuleJson[y].MENU_NAME+'</span></a></li>';
					}	
				}
				dom+='</ul>';
				dom+='</li>';
			}
		}
	}
	$('#menuRoot').append(dom);
	menuRootActive(); //启用工具栏高亮和面包屑导航
	//history.go(0)="index.html";
}

//工具栏高亮 和面包屑导航
	//menuRootActive	
function menuRootActive(){
	$("[class='sub']").find("li").click(function(){
		$("[class='sub']").find("li").removeClass("current");
		$(this).addClass("current");
		$(".breadcrumb").html(""); //重置面包屑导航
		$(".breadcrumb").append("<li><i class='fa fa-home'></i> <a href='index.html'>首页</a></li>"+"<li></li>"+"<li></li>");
		$(".breadcrumb").children().eq(1).html($(this).parent().prev().html());//获取当前点击元素的文字 //two  
		$(".breadcrumb").children().eq(2).html($(this).find("a").text());//获取当前点击元素的父元素html	//last 
		$("body").removeClass("slidebar");
	});	
	//点击index的时候清空面包屑导航
	$("[href='index.html']").click(function(){
		$(".breadcrumb").html("<li><i class='fa fa-home'></i><a href='index.html'>首页</a></li>");
	});
}
function menuUrl(url,menuId){
	//$("#contAppend").load(url);
	var token=$.cookie("token");
	if(token==null||token==''||token==undefined){
		alert("您的账号过期或者失效");
		window.location.href="login.html";
	}
	$.ajax({  
		url:url+".html", 
        type: "get",  
        async: false,  
        data:"",
        dataType: "html",
        success: function(html) {
        	rootToBut(menuId);
        	$("#contAppend").html("");
        	$("#contAppend").append(html);
        },  
        error: function(){alert('Error');}  
    }); 
    rootButton.filterDom();
    var toole=$("#appenTools").html();
	if(toole != null && toole != undefined && toole != ''){
		$('.fixed-table-toolbar').prepend(toole);
	}
}

function leftCharTest(){
		var leftChartsJson=urlObj.getJson();
		leftChartsJson['USER_ID']=leftChartsJson.token.ID;
		var resuleLeftCharJson=commAjaxPost(urlObj.leftCharsUrl,leftChartsJson);
		$('#resumeNum').html(resuleLeftCharJson[0].resume[0].jobNumber);
		var leftDiv=resuleLeftCharJson[0].soureArry;											
		if(leftDiv != null && leftDiv != undefined && leftDiv != ''){
			$('#leftPicChar').html("");
			for(x in leftDiv){
				var percent=(parseInt(leftDiv[x].soureNumber)/parseInt(resuleLeftCharJson[0].resume[0].jobNumber))*100;
			
				var domChar='<div class="col-md-4 text-center">';
					domChar+='<div id="dash_pie_'+x+'" class="piechart" data-percent="'+percent+'">';
					domChar+='<span class="percent"></span>';												
					domChar+='</div>';											
					domChar+='<a href="#" class="title">'+leftDiv[x].soureName+'('+leftDiv[x].soureNumber+')</a>';														
					domChar+='</div>';	
				$('#leftPicChar').append(domChar);
			}
			var index=leftDiv.length;
			for(var c=0;c<index;c++){
				var strId='#dash_pie_'+c
				var mathNumber=Math.ceil(Math.random()*ThemeArr.colors.length);
				$(strId).easyPieChart({
					easing: 'easeOutBounce',
					onStep: function(from, to, percent) {
						$(this.el).find('.percent').text(Math.round(percent)+"%");
					},
					lineWidth: 6,
					barColor: ThemeArr.colors[mathNumber]
				});
				window.chart = $(strId).data('easyPieChart');
			}
		}										
}

function rootToBut(menuId){
	var json=urlObj.getJson();
	json['USER_ID']=json.token.ID;
	json['MENU_ID']=menuId;
    var resuleJson=commAjaxPost(urlObj.rootButAction,json);
    if(json.token.IS_SUPER=='1'){
    	rootButton.setRootAll();
    }else{
    	rootButton.lode();
		rootButton.setRootButton(resuleJson);	
    }
}

function getDateTostr(time){
	var timestamp =time;
	var d = new Date(timestamp * 1000);    //根据时间戳生成的时间对象
	var date = (d.getFullYear()) + "-" + 
	           (d.getMonth() + 1) + "-" +
	           (d.getDate()) + " " + 
	           (d.getHours()) + ":" + 
	           (d.getMinutes()) + ":" + 
	           (d.getSeconds());
	return date;
}

function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    return currentdate;
}

function getNowFormatDateToDay() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
    return currentdate;
}

function getStrToDate(time){
	var date =time;
	date = date.substring(0,19);    
	date = date.replace(/-/g,'/'); 
	var timestamp = new Date(date).getTime();
	return timestamp;
}

function getUrl(url){
	var reslut="";
	$.ajax({  
		url:url, 
        type: "get",  
        async: false,  
        data:"",
        dataType: "html",
        success: function(html) {
        	reslut= html;
        },  
        error: function(){alert('Error');}  
    }); 
	return reslut;
}
//数据请求的统一方式
function commAjaxPost(url,json){
	var reslut;
	$.ajax({  
		url:url, 
        type: "post",  
        async: false,  
        data:"data="+JSON.stringify(json),
        dataType: "json",  
        success: function(json) {
			reslut=json;
        },  
        error: function(){
		}  
    });  
	return reslut;
}

//数据请求的统一方式
function commPointAjaxPost(url,key,val){
	var json=urlObj.getJson();
	json[key]=val;
	var reslut;
	$.ajax({  
		url:url, 
        type: "post",  
        async: false,  
        data:"data="+JSON.stringify(json),
        dataType: "json",  
        success: function(json) {
			reslut=json;
        },  
        error: function(){
		}  
    });  
	return reslut;
}

//刷新 table
function initTable(str){
	$.ajax({  
        url:url,  
        type: "POST",  
        async: false,  
        data:"data="+JSON.stringify(strdata),
        dataType: "json",
        success: function(json) {
    		if(str=='init'){
    			main("#mytable-s",json,showTd,null,tbOnclick,ext,null);
    		}else if(str=='load'){
    			$('#mytable-s').bootstrapTable('load', json);
    		}
        },  
        error: function(){alert('Error');}  
    });

}

//表单提交 共有方法
function commFromAjax(url,json){
	if(!hklfromTest()){
		return false;
	}
	var subJson = {};
	if(json!=null&&json!=''&&json!=undefined){
		subJson=json;
	}
	var reslut=0;
	$("[form_sub]").each(function () {
		var str=$(this).attr("form_sub");
		subJson[str]=$(this).val();
	});
	subJson['token']=JSON.parse($.cookie("token"));
	$.ajax({  
		url:url, 
        type: "post",  
        async: false,  
        data:"data="+JSON.stringify(subJson),
        dataType: "json",  
        success: function(json) {
			reslut=json.result;
        },  
        error: function(){
			reslut=0;
		}  
    });
	return reslut;
}

//修改初始化
function initUpdateFrom(json){
	$("[form_sub]").each(function () {
		var str=$(this).attr("form_sub");
		if(jQuery.isArray(json)){
			for(var key in json[0])
			{
				if(str==key){
					if($(this).is('select')){
						$(this).val(json[0][key]).trigger("change");;
					}else{
						$(this).val(json[0][key]);
					}
				}
			}
		}else{
			for(var key in json)
			{
				if(str==key){
					if($(this).is('select')){
						$(this).val(json[key]).trigger("change");;
					}else{
						$(this).val(json[key]);
					}
				}
			}
		}
	});
	$("[form_img]").each(function () {
		var str=$(this).attr("form_img");
		if(jQuery.isArray(json)){
			for(var key in json[0])
			{
			    alert(2)
				if(str==key){
					if(json[0][key]!=null&&json[0][key]!=''&&json[0][key]!=undefined){
						$(this).arrt('src',urlObj.url+json[0][key]);
					}
				}
			}
		}else{
			for(var key in json)
			{
				if(str==key){
					if(json[key]!=null&&json[key]!=''&&json[key]!=undefined){
						$(this).arrt('src',urlObj.url+json[0][key]);
					}
				}
			}
		}
	});

	$("[DT]").each(function () {
		var str=$(this).attr("DT");
		if(jQuery.isArray(json)){
			for(var key in json[0])
			{
				if(str==key){
					if(json[0][key]!=null&&json[0][key]!=''&&json[0][key]!=undefined){
						$(this).val(json[0][key]==''||json[0][key]==null||json[0][key]==undefined?"":getDateTostr(json[0][key]));
					}
				}
			}
		}else{
			for(var key in json)
			{
				if(str==key){
					if(json[key]!=null&&json[key]!=''&&json[key]!=undefined){
						$(this).val(json[key]==''||json[key]==null||json[key]==undefined?"":getDateTostr(json[key]));
					}
				}
			}
		}
	});
}

//初始化详情页面
function initInfo(json){
	$("[form_sub]").each(function () {
		var str=$(this).attr("form_sub");
		if(jQuery.isArray(json)){
			for(var key in json[0])
			{
				if(str==key){
					if($(this).is('select')){
						$(this).val(json[0][key]).trigger("change");;
					}else{
						$(this).html(json[0][key]);
					}
				}
			}
		}else{
			for(var key in json)
			{
				if(str==key){
					if($(this).is('select')){
						$(this).val(json[key]).trigger("change");;
					}else{
						$(this).html(json[key]);
					}
				}
			}
		}
	});
	$("[form_img]").each(function () {
		var str=$(this).attr("form_img");
		if(jQuery.isArray(json)){
			for(var key in json[0])
			{
				if(str==key){
					if(json[0][key]!=null&&json[0][key]!=''&&json[0][key]!=undefined){
						$(this).arrt('src',123123);
					}
				}
			}
		}else{
			for(var key in json)
			{
				if(str==key){
					if(json[key]!=null&&json[key]!=''&&json[key]!=undefined){
						$(this).arrt('src',urlObj.url+json[0][key]);
					}
				}
			}
		}
	});
	$("[DT]").each(function () {
		var str=$(this).attr("DT");
		if(jQuery.isArray(json)){
			for(var key in json[0])
			{
				if(str==key){
					if($(this).is('select')){
						$(this).val(json[0][key]).trigger("change");;
					}else{
						$(this).html(json[0][key]==''||json[0][key]==null||json[0][key]==undefined?"暂无":getDateTostr(json[0][key]));
					}
				}
			}
		}else{
			for(var key in json)
			{
				if(str==key){
					if($(this).is('select')){
						$(this).val(json[key]).trigger("change");;
					}else{
						$(this).html(json[key]==''||json[key]==null||json[key]==undefined?"暂无":getDateTostr(json[key]));
					} 
					
				}
			}
		}
	});
}	

//按钮组控制
/*调用方法参考bootstrap按钮组插件 为按钮盒子添加 id：myButton；
  调用myButtonTables()；
 */

function myButtonTables(){
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
		 		if(arr[z].IS_ONLINE == '1' || arr[z].IS_ONLINE == "0"){
		 			rue.push(arr[z]);
		 		}
		 	}
		 	$('#mytable-s').bootstrapTable('load', rue);
		 }
		 hideGoalUpdateTab(); //重排表单后调用标签控制
	});
	//附加：点击刷新按钮之后 重置按钮组
	$(".fa-refresh").click(function(){
		$("#box_tab1 #myButton .btn").removeClass("active");
		$("#box_tab1 #myButton .btn:first-child").addClass("active");
	});
}
//重置样式
function buttonRefresh(){
	$("#box_tab1 #myButton .btn").removeClass("active");
	$("#box_tab1 #myButton .btn:first-child").addClass("active");
}
//清除样式
function romoveStyle(styleName,active){
	$(styleName).removeClass(active);
}


//标签页控制
/*调用方法 hideGoalUpdateTab()
 *为需要隐藏的标签页添加 hidden 类名
 * 
 * 为需要点击显示的标签添加 boxTab 类名
 */

function hideGoalUpdateTab(){
	//需要隐藏的目标对象
	var hide_goal = $("[id='update']").parent();
	//禁止点击
	$("[id = 'update']").on('click', function(e){
	 	e.preventDefault();
	});
	//点击切换选项卡
	$(".nav-tabs li").nextAll().click(function(){
		hide_goal.addClass("hidden");
	});
	//显示按钮
	$(".boxTab").click(function(){
		//获取需要显示的盒子标题
		hide_goal.removeClass("hidden");
	});	
}
/**多级列表树控件**/
//展开或收起当前节点
//function treeviewThis(node){
//	var tree = $('#tree'); 	//获取控件 
//  var node = tree.treeview('getNode',node.nodeId);  //获取当前节点对象  
//  if(node.state.expanded){   
//      tree.treeview('collapseNode', node.nodeId); //处于展开状态则折叠     
//  } else {  
//      tree.treeview('expandNode', node.nodeId); //展开    
//  };  
//}
//全部收缩
function treeviewCollapseAll(state){
	$('[id="tree"]').treeview('collapseAll', { silent:state});
	$(".treeAll-2").addClass("hidden");
	$(".treeAll-1").removeClass("hidden");
}
//全部展开
function treeviewExpandAll(state){
	$('[id="tree"]').treeview('expandAll', {silent: state});
	$(".treeAll-1").addClass("hidden");
	$(".treeAll-2").removeClass("hidden");
}

//post 下载方法
function outFile(){
	this.DownLoadFile=function (options) {
	    var config = $.extend(true, { method: 'post' }, options);
	    var $iframe = $('<iframe id="down-file-iframe" />');
	    var $form = $('<form target="down-file-iframe" method="' + config.method + '" />');
	    $form.attr('action', config.url);
	    $form.append('<textarea type="hidden" name="data">'+ config.data+'</textarea>');
	    $iframe.append($form);
	    $(document.body).append($iframe);
	    $form[0].submit();
	    $iframe.remove();
	}
	this.initOpen=function(url,data){
		var options={
			url:url, 
			data:data,
			method:'post',
			dataType:"json"
		}
		this.DownLoadFile(options);
	}
}

//普通图片判断
function getImgUrl(url) {
    var resuleImg="";
    $.ajax({
        url: url,
        type: 'GET',
        async: false,
        complete: function(response) {
            if(response.status == 200) {
                resuleImg=url;
            } else {
                resuleImg='/img/avatars/avatar3.jpg';
            }
        }
    });
    return resuleImg;
}

//项目原画图判断
function getPorjectImgUrl(url) {
	var resuleImg = "";
	$.ajax({
		url: url,
		type: 'GET',
		async: false,
		complete: function(response) {
			if(response.status == 200) {
				resuleImg = url;
			} else {
				resuleImg = '/img/avatars/noPhoto.png';
			}
		}
	});
	return resuleImg;
}
//show:"blind",clip,drop,explode,fold,puff,slide,scale,size,pulsate
//hide:"blind",clip,drop,explode,fold,puff,slide,scale,size,pulsate
 		/****操作成功提示框****/
function subUpdateDia(content){
	var str=(content==null||content==undefined||content==''?'操作成功':content);
//	var str="删除成功";
	var w=150+str.length;
	var subHtml = "<div style='width:100%;text-align:center;color:#555;line-height: 45px;font-size:16px;'>"+
				  "<i class='fa fa-check-circle-o sl'style='color:green'></i>"+str+"</div>";
	var dia =  jDialog.dialog({
          title : null,
          padding:"0 5px",
      	  scrollbar:"yes",
      	  showTitle: false,
      	  autoClose: 1000,
 		  dialogClassName:"dianlogAddClass", 
 		  maskClassName:"hidden", 
 		  top:'35%',
 		  left:'40%',
		  width : w,
      	  height : 80,
          content :subHtml,
          closeable: false,
	});
}

/******开关控件参数配置******/
/**调用html
'<div class="bootstrap-switch-animate">'+
	'<input type="checkbox" name="IS_CONTACT" id="is_contact" value="" checked/>'+
'</div>'
* 方法：bootSwitch(id名,开状态文本,关状态文本,开状态val,关状态val)
* */
 function bootSwitch(switchId,TextOn,TextOff,ev,st){
 	var Id = switchId == ""||TextOn ==null||TextOn ==undefined? "[type = 'checkbox']":TextOn;
 	var txt1 = TextOn == ""||TextOn ==null||TextOn ==undefined? "是":TextOn;
 	var txt2 = TextOff == ""||TextOff ==null||TextOff ==undefined? "否":TextOff;
   	var val1 = ev == ""||ev == null||ev ==undefined? "1":ev;
   	var val2 = st == ""||st == null||st == undefined? "0":st;
 	var stat = ""; 
 	if(	$(switchId).val() != undefined || $(switchId).val() != null || $(switchId).val() != ""){
 		if($(switchId).val() == "是"||$(switchId).val() == 1 || $(switchId).val() == "1"){
	   		stat = true;
	   	}else if($(switchId).val() == "否"||$(switchId).val() == 0 ||$(switchId).val() == "0"){
	   		stat = false;
	   	}
 	}

 	$(switchId).bootstrapSwitch({  
   		state:stat,//默认状态
      	onText:txt1,  //文本
      	offText:txt2,  
 		onColor:"success",  //颜色
		offColor:"info",  
		size:"small",   //尺寸
		animate:"ture", //动画
//		handleWidth:"40", //两边宽度
//		labelWidth:"20", //中间宽度
//     	inverse:"false", //颠倒顺序
        onSwitchChange:function(event,state){  
           if(state == true){  
                $(this).val(val1);  
//             console.log("yes");
            }else{  
                $(this).val(val2);  
//              console.log("no");
            }  
		}  
	})
 }

/****表格工具栏按钮*****/

function tableTools(){
	//状态按钮判断
	$(".stateButton").click(function(){
		$("#myButton label").fadeToggle(500).removeClass("hidden");
		$(".timeData").fadeOut(200);
		$(".wkInput").val("");
		$("#myTimeButton label").removeClass("active");
		$(".delayTime").html("");
	})
		//点击只显示当前
	$("#myButton label").click(function(){
		$("#myButton label").addClass("active");
		$(".wkInput").val("");
		$("#myTimeButton label").removeClass("active");
//		$(".delayTime").html("");
		$(".timeData").fadeOut(200);
	})
	
		//时间按钮判断
	$("#tDate").click(function(){
//		$("#myButton label").addClass("hidden");
		$(".timeData").fadeToggle(500);
		$(".wkInput").val("");
		$(".delayTime").html("");
	})
		//高亮控制
	$("#myTimeButton label").click(function(){
		$("#myTimeButton label").removeClass("active");
		if($(this).hasClass("active") == false){
			$(this).addClass("active");
		}
//		$("#myButton label").addClass("hidden");
		$(".delayTime").html($(this).text());
		$(".timeData").fadeOut(200);
	})
		//窗口变化检测
	window.onresize =function (){
		var w = document.body.clientWidth; 
		setTimeout(function(){
			if(w <= 1075){
				$("#myButton").hide();
			}else if(w <1590){
				$(".timeData").fadeOut(200);
				$("#tDate").click(function(){
					$("#myButton label").addClass("hidden");
				})
			}else if(w >=1590){
				$("#myButton").fadeIn(500);
				$(".timeData").fadeIn(500);
			}
		},50)
	}
		//页面加载检测
	$(function (){
		var w = document.body.clientWidth; 
		setTimeout(function(){
			if(w <= 1075){
				$("#myButton").hide();
			}else if(w < 1590){
				$(".timeData").fadeOut(200);
				$("#tDate").click(function(){
					$("#myButton label").addClass("hidden");
				})
			}else if(w >=1590){
				$("#myButton").fadeIn(500);
				$(".timeData").fadeIn(500);
			}
		},50)
	})	
}




function  DateDiff(sDate1,  sDate2){    //sDate1和sDate2是2006-12-18格式  
   if(sDate1 == undefined || sDate1 == null || sDate1 == ''){
   		return null;
   }
   if(sDate2 == undefined || sDate2 == null || sDate2 == ''){
   		return null;
   }
   var  aDate,  oDate1,  oDate2,  iDays  
   aDate  =  sDate1.split("-")  
   oDate1  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])    //转换为12-18-2006格式  
   aDate  =  sDate2.split("-")  
   oDate2  =  new  Date(aDate[1]  +  '-'  +  aDate[2]  +  '-'  +  aDate[0])  
   iDays  =  parseInt(Math.abs(oDate1  -  oDate2)  /  1000  /  60  /  60  /24)    //把相差的毫秒数转换为天数  
   iDays = iDays==0?1:iDays;
   return  iDays;
}  
	



function tounicode(str)
{
    var result = [];  
    var len = str.length;  
    for(var i=0; i<len; i++){  
        //由于 需要转义 所以存储 两个 \  
        result.push('\\u');  
        //保留4位  
        result.push(('0000' + str.charCodeAt(i).toString(16)).slice(-4));//10 转 16  
    }  
    return result.join(''); 
}

function isNull(obj){
	return (obj == null || obj == undefined || obj == '') ? true :false;
}

/*function tohanzi(data)
{
    if(data == '') return '请输入十六进制unicode';
    data = data.split("\\u");
    var str ='';
    for(var i=0;i<data.length;i++)
    {
        str+=String.fromCharCode(parseInt(data[i],16).toString(10));
    }
    return str;
}*/
