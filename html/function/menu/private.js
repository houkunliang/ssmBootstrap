var url=urlObj.menuJson;
var listAll=urlObj.url+"/menu/MenuAndButtonList";
var extidUrl=urlObj.url+"/menu/update";
var delUrl=urlObj.url+"/menu/logicDel";
var subAddurl=urlObj.url+"/menu/add";
var addUrl="/function/menu/add.html";
var updateUrl="/function/menu/update.html";
var info="/function/menu/info.html";
var selectUrl=urlObj.url+"/menu/queryMenuSelect"
//权限按钮
var initButtonHtml="/function/menu/buttonAdd.html";
var initButtonExtHtml="/function/menu/buttonExt.html";
var buttonListAction=urlObj.url+"/menu/buttonSelect";
var buttonAddAction=urlObj.url+"/menu/insertButton";
var buttonExtAction=urlObj.url+"/menu/updateByButton";
	



$(function () {
	initTable('init');
	$('#fatherAdd').click(function(){
		addFatherAdd();
	})
});

function addFatherAdd(){
	var dia = jDialog.dialog({
	          title : "添加一级菜单",
        	scrollbar:"yes",
			  width : '80%',
	          content :getUrl(addUrl),
	          buttons : [
		                  {
		                      type : 'highlight',
		                      text : '添加',
		                      handler:function(button,dialog)
		                      {
		                    	  if(insertFather()==1){
		                  			initTable("init");
		                  			dia.close();
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
	$('#icons').css('display','block');
	IconObj.initIcons('#jquery_icon');
}

function insertFather(){
	var json=urlObj.getJson();
	json['PARENT_ID']='0';
	json['CREATED_BY']=urlObj.getJson().token.ID;
	var falg=commFromAjax(subAddurl,json);
	return falg;
}


function initAddDialog(name,id){
	var dia = jDialog.dialog({
	          title : "("+name+")->添加子菜单",
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
		                  			initTable("init");
		                  			dia.close();
		                			opedialog.close();
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
}


function subUpdate(){
	var falg=commFromAjax(extidUrl);
	return falg;
}

function select2Init(id){
	var json=urlObj.getJson();
	json['MENU_ID_RE']=id;
	//加载表单基本数据
	var json2=urlObj.getJson();
	json2['MENU_ID']=id;
	var data=commAjaxPost(url,json2);
	//设置表单数据
	initUpdateFrom(data);
	//初始化加载select2插件
	var initSJSON=commAjaxPost(selectUrl,json);
	//console.log(initSJSON);
	if(	initSJSON==null||initSJSON==''||initSJSON==undefined){
		console.log('检查输入正确的json格式：方法错误！（select2Init）');
		return false;
	}else{
		var menuPid=data[0].PARENT_ID||0;
/*		if(initSJSON.length>0){
			for(var z=0;z<initSJSON.length;z++){
				var val = initSJSON[z].MENU_ID,pId = initSJSON[z].PARENT_ID,name=initSJSON[z].MENU_NAME;
				var text  = '<option value="'+val+'" parent="'+pId+'"';
					if(val!=undefined&&val==menuPid){
						text += 'selected="selected"';
					}
					text += '>'+name+'</option>';
				$("#country_select").append(text);
			}
		}*/	
		selectTreeInit(initSJSON,'MENU_ID','MENU_NAME','#country_select',menuPid);
	}

	$("#country_select").select2tree();
	//jquery icon初始化
	IconObj.initIcons("#jquery_icon");
	
}


function update(name,id){
	var dia =  jDialog.dialog({
	          title : "修改->("+name+")",
	      	  scrollbar:"yes",
			  width :'80%',
	          content :getUrl(updateUrl),
	          buttons : [
		                  {
		                      type : 'highlight',
		                      text : '修改',
		                      handler:function(button,dialog)
		                      {
		                    	  if(subUpdate()==1){
		                  			initTable("init");
		                  			dia.close();
		                			opedialog.close();
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
	select2Init(id);
}

function menuInfo(name,id){
		var dia =  jDialog.dialog({
	          title : "详情->("+name+")",
	      	  scrollbar:"yes",
			  width : '80%',
	          content :getUrl(info),
	          buttons : [
		                  {
		                      type : 'highlight',
		                      text : '关闭',
		                      handler:function(button,dialog)
		                      {
		                    	  dia.close();
		                      }
		                  }
		              ]
	});
	var json=urlObj.getJson();
	json['MENU_ID']=id;
	var data=commAjaxPost(url,json);
	initInfo(data);
}


function add(id){
	var json=urlObj.getJson();
	json['PARENT_ID']=id;
	json['CREATED_BY']=urlObj.getJson().token.ID;
	var falg=commFromAjax(subAddurl,json);
	return falg;
}


//删除弹出层
function delDialog(id){
	var dialog = jDialog.confirm('您确定要删除這条数据吗？',{
		handler : function(button,dialog) {
			var json=urlObj.getJson();
			json['MENU_ID']=id;
			var data=commAjaxPost(delUrl,json);
			initTable("init");
			dialog.close();
			opedialog.close();
		},
	},{
		handler : function(button,dialog) {
			dialog.close();
		}
	
	});
}

/*************Three**************/
function initTable(str){
	var subJson=urlObj.getJson();
	$.ajax({  
        url:listAll,  
        type: "POST",  
        async: false,  
        data:"data="+JSON.stringify(subJson),
        dataType: "json",
        success: function(json) {
        	if(json != 'list is null'){
        		treeNode(json)
        	}
        },  
        error: function(){alert('Error');}  
    });

}

function treeNode(json){
	var tree = treeGrid({
		selectedColor:"#d43f3a", //高亮文字颜色
		selectedBackColor:"#f5f5f5",//高亮背景
		highlightSelected: true,
	    showCheckbox: false,//是否显示checkbox  
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
            checkedFilter: function (index, node) {
                if (node.isCheck == true) {
                    return true;
                } else {
                    return false;
                }
            }
        },
        onNodeSelected: function(event, node) {
            if(node.CODE != null && node.CODE != undefined && node.CODE != ''){
            		opedialog =  jDialog.dialog({
            			closeable:true,
	         	        title : '按钮权限操作',
	         	      	scrollbar:"yes",
	         	        content :'<button onclick="initUpdateButton(\''+node.MENU_NAME+'\',\''+node.MENU_ID+'\');"style="width:49%" class="ssi-button success">修改按钮权限</button><button onclick="delButton(\''+node.MENU_ID+'\');" style="width:49%"  class="ssi-button success">删除按钮权限</button>'
	         	    });

            }else{
            	if(node.nodes.length<=0){
				   opedialog =  jDialog.dialog({
				   		  closeable:true,
	         	          title : node.MENU_NAME,
	         	      	  scrollbar:"yes",
	         	          content :node.PARENT_ID==0? '<button class="ssi-button success" onclick="menuInfo(\''+node.MENU_NAME+'\',\''+node.MENU_ID+'\');" style="width:24%" >查看明细</button><button onclick="initAddDialog(\''+node.MENU_NAME+'\',\''+node.MENU_ID+'\');" style="width:24%"  class="ssi-button success">新增</button><button onclick="update(\''+node.MENU_NAME+'\',\''+node.MENU_ID+'\');"style="width:24%" class="ssi-button success">修改</button><button onclick="delDialog(\''+node.MENU_ID+'\');" style="width:24%"  class="ssi-button success">删除</button>':'<button class="ssi-button success" onclick="menuInfo(\''+node.MENU_NAME+'\',\''+node.MENU_ID+'\');" style="width:24%" >查看明细</button><button onclick="initButtonAdd(\''+node.MENU_NAME+'\',\''+node.MENU_ID+'\');" style="width:24%"  class="ssi-button success">新增权限</button><button onclick="update(\''+node.MENU_NAME+'\',\''+node.MENU_ID+'\');"style="width:24%" class="ssi-button success">修改</button><button onclick="delDialog(\''+node.MENU_ID+'\');" style="width:24%"  class="ssi-button success">删除</button>',
	         	      	});
	     	   }else{
	         	   opedialog =  jDialog.dialog({
	         	   		  closeable:true,
	         	          title : node.MENU_NAME,
	         	      	  scrollbar:"yes",
	         	          content :node.PARENT_ID==0? '<button class="ssi-button success" onclick="menuInfo(\''+node.MENU_NAME+'\',\''+node.MENU_ID+'\');" style="width:40%" >查看明细</button><button onclick="initAddDialog(\''+node.MENU_NAME+'\',\''+node.MENU_ID+'\');" style="width:25%"  class="ssi-button success">新增</button><button onclick="update(\''+node.MENU_NAME+'\',\''+node.MENU_ID+'\');"style="width:25%" class="ssi-button success">修改</button>':'<button class="ssi-button success" onclick="menuInfo(\''+node.MENU_NAME+'\',\''+node.MENU_ID+'\');" style="width:32%" >查看明细</button><button onclick="initButtonAdd(\''+node.MENU_NAME+'\',\''+node.MENU_ID+'\');" style="width:32%"  class="ssi-button success">新增权限</button><button onclick="update(\''+node.MENU_NAME+'\',\''+node.MENU_ID+'\');"style="width:32%" class="ssi-button success">修改</button>',
	         	      	}); 
	     	   }
            }

        }
    });
}


/****************************/

function initButtonAdd(name,id){
	var dia =  jDialog.dialog({
	          title : "菜单：("+name+")->新增权限",
	      	  scrollbar:"yes",
			  width : '80%',
	          content :getUrl(initButtonHtml),
	          buttons : [
		                  {
		                      type : 'highlight',
		                      text : '新增',
		                      handler:function(button,dialog)
		                      {
		                    	  if(buttonToAdd(id)==1){
		                  			initTable("init");
		                  			dia.close();
		                			opedialog.close();
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

}

function buttonToAdd(id){
	var json=urlObj.getJson();
	json['MENU_ID']=id;
	var falg=commFromAjax(buttonAddAction,json);
	return falg;
}

function initUpdateButton(name,id){
	var dia =  jDialog.dialog({
	          title : "修改权限",
	      	  scrollbar:"yes",
			  width : 600,
	      	  height : 150,
	          content :getUrl(initButtonExtHtml),
	          buttons : [
		                  {
		                      type : 'highlight',
		                      text : '修改',
		                      handler:function(button,dialog)
		                      {
		                    	  if(updateButton(id)==1){
		                  			initTable("init");
		                  			dia.close();
		                			opedialog.close();
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
	var json=urlObj.getJson();
	json['ID']=id;
	var data=commAjaxPost(buttonListAction,json);
	//设置表单数据
	initUpdateFrom(data);
	$("#country_select").select2({'val':data.CODE});
}

function updateButton(id){
	var json=urlObj.getJson();
	var falg=commFromAjax(buttonExtAction,json);
	return falg;
}


function delButton(id){
	var dialog = jDialog.confirm('您确定要删除這条数据吗？',{
		handler : function(button,dialog) {
			var json=urlObj.getJson();
			json['ID']=id;
			json['IS_DELETED']='Y';
			var data=commAjaxPost(buttonExtAction,json);
			initTable("init");
			dialog.close();
			opedialog.close();
		}
	},{
		handler : function(button,dialog) {
			dialog.close();
		},

	});
}
var opedialog;

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
