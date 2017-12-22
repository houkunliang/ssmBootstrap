var url=urlObj.regionList;
var extidUrl=urlObj.url+"/region/update";
var delUrl=urlObj.url+"/region/logicDel";
var subAddurl=urlObj.url+"/region/add";
var addUrl="/function/region/add.html";
var addBox="/function/region/addBox.html";
var updateUrl="/function/region/update.html";
var updateDepartmentUrl="/function/region/updateDepartment.html";
var info="/function/region/info.html";
var roleInfo="/function/region/roleInfo.html"
var upSelect=urlObj.url+"/region/queryMenuSelect";
var addDepartmentUrl="/function/region/addDepartment.html";
//var regionSelect=urlObj.url+"/region/queryRegionAll";
var regionRoleSelect=urlObj.url+"/region/queryRegionRoleAll";
/*var regionRole=urlObj.url+"/region/queryRegionRole";*/
var roleDetail=urlObj.url+"/region/queryRole";
var exportExcel=urlObj.url+"/region/exportRegionRoleExcel";


var imgRegionId;
$(function () {
	initTable('init',imgRegionId);
	//刷新按钮触发事件
	jQuery('.fa-refresh').click(function () {
			initTable('init',imgRegionId);
            var el = jQuery("#box_tab1");
            App.blockUI(el);
            window.setTimeout(function () {
                App.unblockUI(el);
            }, 1000);
      });
	//新增box切换事件
	$('#add').click(function (e) {
		  e.preventDefault();
		  $("#box_tab2").html(getUrl(addBox));
		  $(this).tab('show');
	});
});


//添加子公司
function initAddDialog(name,id){
	var dia = jDialog.dialog({
	          title : "("+name+")->添加子公司",
	      	  scrollbar:"yes",
			  width : '80%',
	          content :getUrl(addUrl),
	          buttons : [
		                  {
		                      type : 'highlight',
		                      text : '添加',
		                      handler:function(button,dialog)
		                      {
		                    	  if(add(id)==1){
		                  			initTable('init',imgRegionId);
		                  			dia.close();
		                  			subUpdateDia();
//		                			opedialog.close();
		                    	  }
		                    	  
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
	$("#country_select").select2({
		placeholder:'可选项',
		data: [{id:id,text:name}]
	});
	$("#country_select").select2('val',id);
}
		//添加部门
function initAddDialog2(name,id){
	var dia = jDialog.dialog({
	          title : "("+name+")->添加部门",
	      	  scrollbar:"yes",
			  width : '80%',
	          content :getUrl(addDepartmentUrl),
	          buttons : [
		                  {
		                      type : 'highlight',
		                      text : '添加',
		                      handler:function(button,dialog)
		                      {
		                    	  if(add2(id)==1){
		                  			initTable('init',imgRegionId);
		                  			dia.close();
		                  			subUpdateDia();
//		                			opedialog.close();
		                    	  }
		                    	  
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
	$("#department_select").select2({
		placeholder:'可选项',
		data: [{id:id,text:name}]
	});
	$("#department_select").select2('val',id);
}

function subUpdate(){
	var  json = urlObj.getJson();
	json['UPDATED_BY']=json.token.ID;
	//console.log(json);
	var falg=commFromAjax(extidUrl,json);
	return falg;
}

function select2Init(id){
	var json=urlObj.getJson();
	json['REGION_ID']=id;
	//加载表单基本数据
	var json2=urlObj.getJson();
	json2['REGION_ID_RE']=id;
	var data=commAjaxPost(url,json);
	//设置表单数据
	initUpdateFrom(data);
	//初始化加载select2插件
	var initSJSON=commAjaxPost(upSelect,json2);
	if(initSJSON=='list is null'){
		initSJSON=[];
	}
	var mrOption={REGION_ID:'0',NAME:'无所属'}
	initSJSON.push(mrOption)
	if(initSJSON==null||initSJSON==''||initSJSON==undefined){
		console.log('检查输入正确的json格式：方法错误！（select2Init）');
		return false;
	}
	$("#country_select").select2({
		placeholder:'可选项',
		data: select2Tofromatt(initSJSON,'REGION_ID','NAME')
	});
	var st='';
	if(data[0].PARENT_ID!=0){
		for(var i=0;i<initSJSON.length;i++){
			if(initSJSON[i]['REGION_ID']==data[0].PARENT_ID){
				$("#country_select").select2('val',initSJSON[i]['REGION_ID']);
			}
		}
	}else{
		$("#country_select").select2('val',0);
	}
}

function select2Init2(id){
	var json=urlObj.getJson();
	json['REGION_ID_RE']=id;
	//加载表单基本数据
	var json2=urlObj.getJson();
	json2['REGION_ID']=id;
	var data=commAjaxPost(url,json2);
	//设置表单数据
	//console.log(data);
	initUpdateFrom(data);
	//初始化加载select2插件
	var initSJSON=commAjaxPost(upSelect,json);
	//console.log(initSJSON);
	if(	initSJSON==null||initSJSON==''||initSJSON==undefined){
		console.log('检查输入正确的json格式：方法错误！（select2Init）');
		return false;
	}else{
		var menuPid=data[0].PARENT_ID||0;
		//alert(menuPid)
		selectTreeInit(initSJSON,'REGION_ID','NAME','#region_select',menuPid);
	}
	$("#region_select").select2tree();
}
 	//修改
function update(name,id,type){
	if (type == 0) {
		var dia =  jDialog.dialog({
	          title : "修改->("+name+")",
	      	  scrollbar:"yes",
			  width : '80%',
			//height:"550px",
	          content :getUrl(updateUrl),
	          buttons : [
		                  {
		                      type : 'highlight',
		                      text : '修改',
		                      handler:function(button,dialog)
		                      {
		                    	  if(subUpdate()==1){
		                  			initTable('init',imgRegionId);
		                  			dia.close();
		                  			subUpdateDia("修改成功");//操作提示
//		                			opedialog.close();
		                    	  }
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
	}else{var dia =  jDialog.dialog({
	          title : "修改->("+name+")",
	      	  scrollbar:"yes",
			  width : '80%',
	          content :getUrl(updateDepartmentUrl),
	          buttons : [
		                  {
		                      type : 'highlight',
		                      text : '修改',
		                      handler:function(button,dialog)
		                      {
		                    	  if(subUpdate()==1){
		                  			initTable('init',imgRegionId);
		                  			dia.close();
		                  			subUpdateDia("修改成功");//操作提示
//		                			opedialog.close();
		                    	  }
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
	};
	select2Init2(id);
}
	
//$(".j-dialog").dialog({
//    autoOpen: false,
//    show: {
//      effect: "blind",
//      duration: 1000
//    },
//    hide: {
//      effect: "explode",
//      duration: 1000
//    }
//})
/**公司明细**/
function menuInfo(name,id){
//		var dia =  jDialog.dialog({
//	          title : "详情->("+name+")",
//	      	  scrollbar:"yes",
//			  width : 600,
//	      	  height : 540,
//	          content :getUrl(info),
//	          buttons : [
//		                  {
//		                      type : 'highlight',
//		                      text : '关闭',
//		                      handler:function(button,dialog)
//		                      {
//		                    	  dia.close();
//		                      }
//		                  }
//		              ]
//	});
	var json=urlObj.getJson();
	json['REGION_ID']=id;
	var data=commAjaxPost(url,json);	
	//加载到右侧栏
	$("#detailsInfo").html(getUrl(info));
	$("#title-menuInfo").html(name);
	initInfo(data);
}
/**个人明细**/
function menuRoleInfo(name,id){
	var json=urlObj.getJson();
	json['USER_ID']=id;
	var data=commAjaxPost(roleDetail,json);
	//加载到右侧栏
	$("#detailsInfo").html(getUrl(roleInfo));
	$("#title-menuRoleInfo").html(name);
	initInfo(data);
	var datas=urlObj.getJson();
//	datas['PARENT_ID']=data[0];
//	var data=commAjaxPost(roleDetail,datas);
/*	if(data.length>0){
	console.log(data);
		
		for(x in data){
			if(data[x]){
				
			}
		}
	}*/
//	$('[form_sub="ROLE_NAME"]').html("yyyyy");
	//添加拨号功能
	var uObj = $('#USER_PHONE');
	if(uObj!=undefined){
		var tel = uObj.html();
		if(tel!=undefined&&tel.length>0){
			uObj.attr('href','tel:'+uObj.html());
		}
	}
}

function download2(){
	var json =urlObj.getJson();
	json['CREATED_BY']=urlObj.getJson().token.ID;
	var data = commAjaxPost(exportExcel,json);

}

function add(id){
	var json=urlObj.getJson();
	json['PARENT_ID']=id;
	json['TYPE']='0'
	json['CREATED_BY']=urlObj.getJson().token.ID;
	//alert(1);
	//console.log(json);
	var falg=commFromAjax(subAddurl,json);
	return falg;
}
function add2(id){
	var json=urlObj.getJson();
	json['PARENT_ID']=id;
	json['TYPE']='1'
	json['CREATED_BY']=urlObj.getJson().token.ID;
	//console.log(json);
	var falg=commFromAjax(subAddurl,json);
	return falg;
}
//删除弹出层
function delDialog(id){
	var dialog = jDialog.confirm('您确定要删除這条数据吗？',{
		handler : function(button,dialog) {
			var json=urlObj.getJson();
			json['REGION_ID']=id;
			json['IS_DELETED']='Y';
			var data=commAjaxPost(extidUrl,json);
//			alert(data)
			initTable('init',imgRegionId);
			dialog.close();
//			opedialog.close();

		}
	},{
		handler : function(button,dialog) {
			dialog.close();
		}
	});
}

var opedialog;

/*************Three**************/
function initTable(str,id){
	var regionRoleSelect=urlObj.url+"/region/queryRegionRoleAll";
	var subJson=urlObj.getJson();
	//console.log(subJson);
	if (id != undefined && id != null && id != '') {
		subJson['REGION_ID']=id;
	}else{
		subJson['REGION_ID']=subJson.token.imgRegionId;
	};
	var json = commAjaxPost(regionRoleSelect,subJson);
    treeNode(json);
}

function treeNode(json){
 	var tree = treeGrid({
        data:json,
//      emptyIcon:"glyphicon",
        showIcon:true,
//      nodeIcon: "glyphicon glyphicon-user",
		emptyIcon: "glyphicon ",
		selectedColor:"#d43f3a", //高亮文字颜色
		selectedBackColor:"#f5f5f5",//高亮背景
		highlightSelected: true,
		showCheckbox:false,//不显示复选框
		// expandIcon:"glyphicon glyphicon-yen",//设置列表树可展开节点的图标。
		// emptyIcon:"glyphicon glyphicon-yen",
        // collapseIcon:"glyphicon glyphicon-yen", //设置列表树可收缩节点的图标。
        column: {
            text: 'NAME',
            id: 'REGION_ID',
            pid: 'PARENT_ID',
        },
		onNodeSelected: function(event,node) {
		 	var infoHtml = "";
			// var tree = $('#tree'); 	//获取控件 
		 //    var node = tree.treeview('getNode',node.nodeId);  //获取当前节点对象  
		   		//如果子节点为0 可删除
		 	if (node.nodes.length<=0) {
		 		//如果TYPE为0 可增加公司和部门
		 		if (node.TYPE != '' && node.TYPE==0) {
					//infoHtml += '<button onclick="initAddDialog(\''+node.NAME+'\',\''+node.REGION_ID+'\');" style="width:18%;min-width:70px;background:#db5e8d;border:none;white-space:nowrap;"  class="ssi-button success">新增子公司</button><button onclick="initAddDialog2(\''+node.NAME+'\',\''+node.REGION_ID+'\');" style="width:18%;min-width:70px;background:#db5e8d;border:none;white-space:nowrap;"  class="ssi-button success">新增部门</button><button onclick="update(\''+node.NAME+'\',\''+node.REGION_ID+'\',\''+node.TYPE+'\');"style="width:14%;min-width:46px;background:#db5e8d;border:none;white-space:nowrap;" class="ssi-button success">修改</button><button onclick="delDialog(\''+node.REGION_ID+'\');" style="width:14%;min-width:46px;background:#db5e8d;border:none;white-space:nowrap;"  class="ssi-button success">删除</button>';
					infoHtml += '<button onclick="initAddDialog2(\''+node.NAME+'\',\''+node.REGION_ID+'\');" style="width:18%;min-width:70px;background:#db5e8d;border:none;white-space:nowrap;"  class="ssi-button success">新增部门</button><button onclick="update(\''+node.NAME+'\',\''+node.REGION_ID+'\',\''+node.TYPE+'\');"style="width:14%;min-width:46px;background:#db5e8d;border:none;white-space:nowrap;" class="ssi-button success">修改</button><button onclick="delDialog(\''+node.REGION_ID+'\');" style="width:14%;min-width:46px;background:#db5e8d;border:none;white-space:nowrap;"  class="ssi-button success">删除</button>';
					$("#detailsButton").html(infoHtml);
					menuInfo(node.NAME,node.REGION_ID);
		 		}else if (node.TYPE ==1){
		 			//TYPE 为1 只能增加部门
					infoHtml += '<button onclick="initAddDialog2(\''+node.NAME+'\',\''+node.REGION_ID+'\');" style="width:18%;min-width:70px;background:#db5e8d;border:none;white-space:nowrap;"  class="ssi-button success">新增部门</button><button onclick="update(\''+node.NAME+'\',\''+node.REGION_ID+'\',\''+node.TYPE+'\');"style="width:14%;min-width:46px;background:#db5e8d;border:none;white-space:nowrap;" class="ssi-button success">修改</button><button onclick="delDialog(\''+node.REGION_ID+'\');" style="width:14%;min-width:46px;background:#db5e8d;border:none;white-space:nowrap;"  class="ssi-button success">删除</button>';
					$("#detailsButton").html(infoHtml);
         	      	menuInfo(node.NAME,node.REGION_ID);
		 		}else{
					$("#detailsButton").html(infoHtml);
//					console.log(node);
         	      	menuRoleInfo(node.NAME,node.REGION_ID);
		 		};
 
		 	}else{
         	   	if (node.TYPE==0) {
					//infoHtml += '<button onclick="initAddDialog(\''+node.NAME+'\',\''+node.REGION_ID+'\');" style="width:18%;min-width:70px;background:#db5e8d;border:none;white-space:nowrap;"  class="ssi-button success">新增子公司</button><button onclick="initAddDialog2(\''+node.NAME+'\',\''+node.REGION_ID+'\');" style="width:18%;min-width:70px;background:#db5e8d;border:none;white-space:nowrap;"  class="ssi-button success">新增部门</button><button onclick="update(\''+node.NAME+'\',\''+node.REGION_ID+'\',\''+node.TYPE+'\');"style="width:14%;min-width:46px;background:#db5e8d;border:none;white-space:nowrap;" class="ssi-button success">修改</button>';
					infoHtml += '<button onclick="initAddDialog2(\''+node.NAME+'\',\''+node.REGION_ID+'\');" style="width:18%;min-width:70px;background:#db5e8d;border:none;white-space:nowrap;"  class="ssi-button success">新增部门</button><button onclick="update(\''+node.NAME+'\',\''+node.REGION_ID+'\',\''+node.TYPE+'\');"style="width:14%;min-width:46px;background:#db5e8d;border:none;white-space:nowrap;" class="ssi-button success">修改</button>';
					$("#detailsButton").html(infoHtml);
					menuInfo(node.NAME,node.REGION_ID);
		 		}else{
					infoHtml += '<button onclick="initAddDialog2(\''+node.NAME+'\',\''+node.REGION_ID+'\');" style="width:18%;min-width:70px;background:#db5e8d;border:none;white-space:nowrap;"  class="ssi-button success">新增部门</button><button onclick="update(\''+node.NAME+'\',\''+node.REGION_ID+'\',\''+node.TYPE+'\');"style="width:14%;min-width:46px;background:#db5e8d;border:none;white-space:nowrap;" class="ssi-button success">修改</button>';
         	      	$("#detailsButton").html(infoHtml);
					menuInfo(node.NAME,node.REGION_ID);
		 		};
        	}	
   		}
    });    		
}

var temp = 0;
function select2Img(){
	/*var json=urlObj.getJson();
	var queryImg = urlObj.url + "/region/queryRegionByLogUser";
	json['USER_ID']=json.token.ID;
	var initSJSON=commAjaxPost(queryImg,json);
	//console.log(initSJSON);
	if(	initSJSON==null||initSJSON==''||initSJSON==undefined){
		console.log('检查输入正确的json格式：方法错误！（select2Init）');
		return false;
	}else {
		if (initSJSON.length <= 1 || initSJSON == 'list is null') {
			if (initSJSON[0].REGION_HEADIMG == null || initSJSON[0].REGION_HEADIMG == '') {
					$("#changeImgs").html('<img src="img/logo2.png" alt="Cloud Admin Logo" style="margin-left:50px;left:0px;"  class="img-responsive" height="30" width="120"/>');						
				}else{
					url = getRegionImgUrl(urlObj.url+initSJSON[0].REGION_HEADIMG);
					$("#changeImgs").html('<img src="'+url+'" alt="Cloud Admin Logo" style="margin-left:50px;left:0px;"  class="img-responsive" height="30" width="120"/>');				
				};
		}else{
				for (var i = 0; i <= initSJSON.length - 1; i++) {
				//console.log(1);
				var url;
				if (initSJSON[i].REGION_ID != null && initSJSON[i].REGION_ID != '') {
					if (initSJSON[i].REGION_HEADIMG == null || initSJSON[i].REGION_HEADIMG == '') {
						$("#reg_img").append($('<li  id = "jemp'+ i+'"><a><img src="img/logo2.png" alt="Cloud Admin Logo" class="img-responsive" height="30" width="120"><input id="imgRegion_id'+i+'" type="hidden" value="'+initSJSON[i].REGION_ID+'"></a></li>'));
						//$("#reg_img").append($('<li id = "jemp'+ i+'"><img src="'+urlObj.url+initSJSON[i].REGION_HEADIMG+'" alt="Cloud Admin Logo"  class="img-responsive" height="70" width="250"/><input id="imgRegion_id'+i+'" type="hidden" value="'+initSJSON[i].REGION_ID+'"/></li>'));					
					}else{
						url = getRegionImgUrl(urlObj.url+initSJSON[i].REGION_HEADIMG);
						$("#reg_img").append($('<li  id = "jemp'+ i+'"><a><img src="'+url+'" alt="Cloud Admin Logo" class="img-responsive" height="30" width="120"/><input id="imgRegion_id'+i+'" type="hidden" value="'+initSJSON[i].REGION_ID+'"></a></li>'));					
					};
				};
				if(i == 0){
					if (initSJSON[i].REGION_HEADIMG == null || initSJSON[i].REGION_HEADIMG == '') {
						$("#changeImg").html('<a><img src="img/logo2.png" alt="Cloud Admin Logo"  class="img-responsive" height="30" width="120"/><input id="imgRegion_id'+i+'" type="hidden" value="'+initSJSON[i].REGION_ID+'"></a>');						
					}else{
						url = getRegionImgUrl(urlObj.url+initSJSON[i].REGION_HEADIMG);
						$("#changeImg").html('<a><img src="'+url+'" alt="Cloud Admin Logo"  class="img-responsive" height="30" width="120"/><input id="imgRegion_id'+i+'" type="hidden" value="'+initSJSON[i].REGION_ID+'"></a>');				
					};
					//switchCompany(initSJSON[i].REGION_ID);
				}
				$("#reg_img li").click(function(){
					var num = $(this).index();
					imgRegionId = $("#imgRegion_id"+num).val();
					imgRegionInput = $(this).html();
					switchCompany(imgRegionId, imgRegionInput);
					history.go(0);
				});	
			};
		};
		
	};*/
}
$(document).ready(function(){ 
	var json = urlObj.getJson();
	//var imgRegionInput = $.cookie("imgRegionInput");
	var imgRegionInput = json.token.imgRegionInput;
	//alert(imgRegionInput)
	if (imgRegionInput != null && imgRegionInput != "" && imgRegionInput != undefined) {
		//alert(1);
		$("#changeImg").html(imgRegionInput);
		//$.cookie("imgRegionInput","");
		//console.log($.cookie('imgRegionInput'));
	};
}); 

/**搜索**/
var search = function(e) {
	  var pattern = $('#input-search').val();
	  var options = {
	    ignoreCase: $('#chk-ignore-case').is(':checked'),
	    exactMatch: $('#chk-exact-match').is(':checked'),
	    revealResults: $('#chk-reveal-results').is(':checked')
	  };
	  var results = $('#tree').treeview('search', [ pattern, options ]);
	  var output = '<p>' + results.length + ' matches found</p>';
	  $.each(results, function (index, result) {
	    output += '<p>- ' + result.text + '</p>';
	  });
	  $('#search-output').html(output);
	  treeviewExpandAll(true);//展开
}
	$('#input-search').on('keyup', search);
/****************************/


// 切换公司事件
function switchCompany(imgRegionId, imgRegionInput) {
	//console.log(imgRegionId);
	var json=urlObj.getJson();
	json['USER_ID']=json.token.ID;
	json['REGION_ID']=imgRegionId;
	if (imgRegionInput != null) {
		var switchMenuMethod = urlObj.url + "/user/selectByRegionUser";
		var resuleJson=commAjaxPost(switchMenuMethod,json);
		var tempRoleID ;
		var temproleName ;
		if(	resuleJson==null||resuleJson==''||resuleJson==undefined){
			console.log('检查输入正确的json格式：方法错误！（select2Init）');
			return false;
		}else {
			tempRoleID = resuleJson[0].ROLE_ID;
			temproleName =  resuleJson[0].ROLE_NAME;
			var length = resuleJson.length;
			if(length > 0){
				for (var i = 1; i < length; i++) {
					tempRoleID += "," + resuleJson[i].ROLE_ID;
					temproleName += " " + resuleJson[i].ROLE_NAME;
				};
			}
		}
		//console.log(resuleJson);
		//alert(imgRegionId);
		var jsonUser ={"token":json.token.imgRegionInput = imgRegionInput,"token":json.token.imgRegionId = imgRegionId};
		var jsonUser ={"token":json.token.ROLE_ID = tempRoleID,"token":json.token.ROLE_NAME = temproleName};
		//var jsonUser ={"token":json.token.imgRegionId = $.cookie("REGION_ID")}
	}else{
		var jsonUser ={"token":json.token.imgRegionId = imgRegionId};
	};
	$.cookie("token",JSON.stringify(json.token));
	$.cookie("digBrow",0);
}
//公司图片判断
function getRegionImgUrl(url) {
    var resuleImg="";
    $.ajax({
        url: url,
        type: 'GET',
        async: false,
        complete: function(response) {
            if(response.status == 200) {
                resuleImg=url;
            } else {
                resuleImg='/img/logo2.png';
            }
        }
    });
    return resuleImg;
}