/**
 * 
 * @param id
 * @param data
 * @param showTd 数据类型
 * [
       {
           title: "全选",
           field: "id",
           checkbox: true,
           width: 20,//宽度
           align: "center",//水平
           valign: "middle"//垂直
       }
       ,
        {
            title: "名字",//标题
            field: "name",//键名
            sortable: true//是否可排序
        },
        {
            title: "tb1",//标题
            field: "tb1",//键名
            sortable: true//是否可排序
        },
        {
            title: "tb2",//标题
            field: "tb2",//键名
            sortable: true//是否可排序
        },
        {
            title: "tb3",//标题
            field: "tb3",//键名
            sortable: true//是否可排序
        }
   ]
 * @param buttonOnclick 单击事件绑定 json数据 [{name:"按钮名称",idNmae:"按钮id",className:"按钮class",click:"单击事件方法"}]
 * @param tbOnclick 单击事件事件绑定 json数据 			   
 * 		function(field, value, row, $element){
			alert(field);
		}
 * @param toId 启用列表 参数列表的ID
 */
var bootStapJsonData=[];
var XXXXXX=function(field, value, row, $element){};
var EXXXXX=function (field, row, oldValue, $el) {};//注册编辑事件
var dbClickXXXX=function(row, tr) {}//双击事件

function main(id,data,showTd,dbclick,tbOnclick,ext,toId){
	bootStapJsonData=data;
	
	if(dbclick!=null&&dbclick!=undefined&&dbclick!=""){
	}else{
		dbclick=dbClickXXXX;
	}
	
	//绑定tb表格事件
	if(tbOnclick!=null&&tbOnclick!=undefined&&tbOnclick!=""){
	}else{
		tbOnclick=XXXXXX;
	}
		
	//修改点击事件
	if(ext!=null&&ext!=undefined&&ext!=""){
	}else{
		ext=EXXXXX;
	}
	
	//是否启用追加入表方式
	if(toId!=null&&toId!=undefined&&toId!=""){
		//初始表格
		loedTableAppd(id,data,showTd,dbclick,tbOnclick,ext);
	}else{
		//初始表格
		loedTable(id,data,showTd,dbclick,tbOnclick,ext);
	}
	//绑定table头 按钮事件事件
//	if(buttonOnclick!=null&&buttonOnclick!=undefined&&buttonOnclick!=""){
//		for(var i=0;i<buttonOnclick.length;i++){
//			$(".bootstrap-table").prepend(" <input type='button' id='"+buttonOnclick[i].idNmae+"' class='"+buttonOnclick[i].className+"' value='"+buttonOnclick[i].name+"'/>");
//			if(buttonOnclick[i]!=null&&buttonOnclick[i]!=undefined&&buttonOnclick[i]!=""){
//				$("#"+buttonOnclick[i].idNmae).on('click',buttonOnclick[i].click);
//			}
//		}
//	}
}    	


function backstageMain(id,data,showTd,dbclick,tbOnclick,ext,toId,pageList){
	bootStapJsonData=data;
	
	if(dbclick!=null&&dbclick!=undefined&&dbclick!=""){
	}else{
		dbclick=dbClickXXXX;
	}
	
	//绑定tb表格事件
	if(tbOnclick!=null&&tbOnclick!=undefined&&tbOnclick!=""){
	}else{
		tbOnclick=XXXXXX;
	}
		
	//修改点击事件
	if(ext!=null&&ext!=undefined&&ext!=""){
	}else{
		ext=EXXXXX;
	}
	backstageLoedTable(id,data,showTd,dbclick,tbOnclick,ext,pageList);
}  



function BstpTable(obj,url,showTd,dbclick,tbOnclick,ext){
	   this.obj=obj;
     this.url=url;
     this.showTd=showTd;
     this.dbclick=dbclick;
     this.tbOnclick=tbOnclick;
     this.ext=ext;

    this.inint = function(searchArgs){
         //---先销毁表格 ---
         this.obj.bootstrapTable('destroy');  
         //---初始化表格,动态从服务器加载数据--- 
         this.obj.bootstrapTable({
            //【发出请求的基础信息】
            url: this.url,
            method: 'post',
            contentType: "application/x-www-form-urlencoded",
            //【查询设置】
            /* queryParamsType的默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
            设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber */
            queryParamsType:'', 
            queryParams: function queryParams(params) {
              var param = {  
                  pageNumber: params.pageNumber,    
                  pageSize: params.pageSize
              }; 
              for(var key in searchArgs){
                  param[key]=searchArgs[key]
              }  
              return param;                   
            }, 
            //【其它设置】
            pagination:true,
    		    pageNumber:1,                       //初始化加载第一页，默认第一页
    		    pageSize: 10,                       //每页的记录行数（*）
    		    pageList: [10, 25, 50, 100],
    		    sidePagination: "server",
    		    cache: false,
    		    striped: true,//是否显示行间隔色
    		    clickToSelect: true, //是否启用点击选中行
    		    sortable: true, 					//是否启用排序
    			  height:550,
    		    toolbarAlign: "right",//工具栏对齐方式
    		    columns: this.showTd, 
    		    onEditableSave:this.ext,
    		    onDblClickRow:this.dbclick,
    			  onClickCell:this.tbOnclick
        })
     }

     this.load = function(searchArgs){
     	 var monitoringTabClass = monitoringTab(this.obj);
     	 this.obj.bootstrapTable('destroy');  
         //---初始化表格,动态从服务器加载数据--- 
         this.obj.bootstrapTable({
            //【发出请求的基础信息】
            url: this.url,
            method: 'post',
            contentType: "application/x-www-form-urlencoded",
            //【查询设置】
            /* queryParamsType的默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
            设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber */
            queryParamsType:'', 
            queryParams: function queryParams(params) {
              var param = {  
                  pageNumber: params.pageNumber,    
                  pageSize: params.pageSize
              }; 
              for(var key in searchArgs){
                  param[key]=searchArgs[key]
              }  
              return param;                   
            }, 
            //【其它设置】
            pagination:true,
		    pageNumber:monitoringTabClass.pageNumber,//初始化加载第一页，默认第一页
		    pageSize: monitoringTabClass.pageSize,  //每页的记录行数（*）
		    pageList: [10, 25, 50, 100],
		    sidePagination: "server",
		    cache: false,
		    striped: true,//是否显示行间隔色
		    clickToSelect: true, //是否启用点击选中行
		    sortable: true, 					//是否启用排序
			  height:550,
		    toolbarAlign: "right",//工具栏对齐方式
		    columns: this.showTd, 
		    onEditableSave:this.ext,
		    onDblClickRow:this.dbclick,
			  onClickCell:this.tbOnclick
        })
     }
}

function MonitoringTabClass(one,tow){
	this.pageNumber = (one == undefined || one == null) ? 10 : one;
	this.pageSize = (tow == undefined || tow == null) ? 10 : tow;
}

function monitoringTab(obj){
	var arr = obj.bootstrapTable('getOptions');
	return new MonitoringTabClass(arr.pageNumber,arr.pageSize);
}


function backstageLoedTable(id,data,showTd,dbclick,tbOnclick,ext,pageList){	
	$(id).bootstrapTable({
       data:data,							//数据源
       //pagination:true,
       //pageNumber:1,                      //初始化加载第一页，默认第一页
       //pageSize: 10,                      //每页的记录行数（*）
       toolbar: "#tools",              //工具按钮用哪个容器
       //pageList: [10, 25, 50, 100],
       cache: false,
       showExport: true,                //是否显示导出
       striped: true,//是否显示行间隔色
       clickToSelect: true, //是否启用点击选中行
       sortable: true, 					//是否启用排序
       clickToSelect:true, 
       search:true,
//       strictSearch: true,//是否启用模糊索引，默认模糊索引
       searchAlign:"right",
       exportDataType: "all",         //当前页'basic',所有页'all',选中页'selected'.
	   height:550,
       toolbarAlign: "right",//工具栏对齐方式
//       showColumns: true,                  //是否显示所有的列
//       showRefresh: true,                  //是否显示刷新按钮
       columns: showTd, 
       onClickRow: function(row, tr) {
      //本行属于点列点击事件 数据自己取
// 	    dataTable.push(row);
// 		alert("根据ID查询："+row.id);
// 		alert("单击");
     	},
        onEditableSave:ext,
        onDblClickRow:dbclick,
	    onClickCell:tbOnclick
	});
	backPage(id,pageList);
}

function backPage(id,json){
		$(".fixed-table-pagination").remove();
		var   str='<div class="fixed-table-pagination">';
		    str+='<div class="pull-left pagination-detail">';
			str+=' <span class="pagination-info">显示第 1 到第 10 条记录，总共 '+json[0].total+' 条记录</span>';
			str+='  <span class="page-list">每页显示 <span class="btn-group dropup">';
			str+='  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span class="page-size">'+json[0].pageSize+'</span> <span class="caret"></span></button>';
			str+='  <ul class="dropdown-menu" role="menu">';
			str+=json[0].pageSize==10?'<li class="active acSize"><a href="javascript:void(0)">10</a></li>':'<li onclick="toPagesRow(10);"><a href="javascript:void(0)">10</a></li>';
			str+=json[0].pageSize==25?'<li class="active acSize"><a href="javascript:void(0)">25</a></li>':'<li onclick="toPagesRow(25);"><a href="javascript:void(0)">25</a></li>';
			str+=json[0].pageSize==50?'<li class="active acSize"><a href="javascript:void(0)">50</a></li>':'<li onclick="toPagesRow(50);"><a href="javascript:void(0)">50</a></li>';
			str+=json[0].pageSize==100?'<li class="active acSize"><a href="javascript:void(0)">100</a></li>':'<li onclick="toPagesRow(100);"><a href="javascript:void(0)">100</a></li>';
			str+='  </ul></span> 条记录</span></div><div class="pull-right pagination">';
			str+=' <ul class="pagination">';
			str+=' <li class="page-pre" onclick="upPage('+json[0].pageNum+')"><a href="javascript:void(0)">‹</a></li>';
			if((Number(json[0].pages)-Number(json[0].pageNum))<4){
				str+=' <li class="page-number" onclick="toPagesNuber(1);"><a href="javascript:void(0)">1</a></li>';
				str+=' <li class="page-number"><a href="javascript:void(0)">...</a></li>';
				for(var s=4;s>=0;s--){
					str+=json[0].pageNum==(Number(json[0].pages)-s)?'<li class="page-number active acNumber" onclick="toPagesNuber('+(Number(json[0].pages)-s)+');"><a href="javascript:void(0)">'+(Number(json[0].pages)-s)+'</a></li>':'<li class="page-number" onclick="toPagesNuber('+(Number(json[0].pages)-s)+');"><a href="javascript:void(0)">'+(Number(json[0].pages)-s)+'</a></li>';
				}
			}else{
				if(json[0].pageNum>=5){
					str+=' <li class="page-number" onclick="toPagesNuber(1);"><a href="javascript:void(0)">1</a></li>';
					str+=' <li class="page-number"><a href="javascript:void(0)">...</a></li>';
					str+=' <li class="page-number" onclick="toPagesNuber('+(Number(json[0].pageNum)-1)+');"><a href="javascript:void(0)">'+(Number(json[0].pageNum)-1)+'</a></li>';
					str+=' <li class="page-number active acNumber" onclick="toPagesNuber('+json[0].pageNum+');"><a href="javascript:void(0)">'+json[0].pageNum+'</a></li>';
					str+=' <li class="page-number" onclick="toPagesNuber('+(Number(json[0].pageNum)+1)+');"><a href="javascript:void(0)">'+(Number(json[0].pageNum)+1)+'</a></li>';
				}else{
					for(var i=0;i<5;i++){
						str+=json[0].pageNum==(i+1)?' <li class="page-number active acNumber" onclick="toPagesNuber('+(i+1)+');"><a href="javascript:void(0)">'+(i+1)+'</a></li>':' <li class="page-number" onclick="toPagesNuber('+(i+1)+');"><a href="javascript:void(0)">'+(i+1)+'</a></li>';
					}
				}
				str+=' <li class="page-number"><a href="javascript:void(0)">...</a></li>';
				str+=' <li class="page-number" onclick="toPagesNuber('+Number(json[0].pages)+');"><a href="javascript:void(0)">'+Number(json[0].pages)+'</a></li>';
			}

			str+=' <li class="page-next" onclick="nextPage('+json[0].pages+','+json[0].pageNum+')"><a href="javascript:void(0)">›</a></li>';
			str+=' </ul>';
			str+=' </div>';
			str+='</div>';
		$(id).after(str);
}

function toPagesRow(size){
	initTable('load',$(".acNumber>a").html(),size);
}

function toPagesNuber(num){
	initTable('load',num,$(".acSize>a").html());
}

function upPage(index){
	if(index>1){
		index--;
		initTable('load',index,$(".acSize>a").html());
	}
}

function nextPage(pages,index){
	if(pages-index>=1){
		index++
		initTable('load',index,$(".acSize>a").html());
	}
}
//表格
function loedTable(id,data,showTd,dbclick,tbOnclick,ext){
	$(id).bootstrapTable({
       data:data,							//数据源
       pagination:true,
       pageNumber:1,                      //初始化加载第一页，默认第一页
       pageSize: 10,                      //每页的记录行数（*）
       toolbar: "#tools",              //工具按钮用哪个容器
       pageList: [10, 25, 50, 100],
       cache: false,
       //showExport: true,                //是否显示导出
       striped: true,//是否显示行间隔色
       clickToSelect: true, //是否启用点击选中行
       sortable: true, 					//是否启用排序
       clickToSelect:true, 
       search:true,
       strictSearch: false,//是否启用模糊索引，默认模糊索引
       searchAlign:"right",
       exportDataType: "all",         //当前页'basic',所有页'all',选中页'selected'.
	   height:600,
       toolbarAlign: "right",//工具栏对齐方式
//       showColumns: true,                  //是否显示所有的列
//       showRefresh: true,                  //是否显示刷新按钮
       columns: showTd, 
       onClickRow: function(row, tr) {
      //本行属于点列点击事件 数据自己取
// 	    dataTable.push(row);
// 		alert("根据ID查询："+row.id);
// 		alert("单击");
     	},
        onEditableSave:ext,
        onDblClickRow:dbclick,
	    onClickCell:tbOnclick
	});

//是否开启双击事件
//	$('td').on('dblclick',function(){
//	    $(this).html("<input type='text' value='"+$(this).html()+"'>");
//	})
}

function loedTableAppd(id,data,showTd,dbclick,tbOnclick){
	$(id).bootstrapTable({
       data:data,							//数据源
       pagination:true,
       pageNumber:1,                       //初始化加载第一页，默认第一页
       pageSize: 10,                       //每页的记录行数（*）
       pageList: [10, 25, 50, 100],
       cache: false,
       striped: true,//是否显示行间隔色
       clickToSelect: true, //是否启用点击选中行
       sortable: true, 					//是否启用排序
	   height:550,
       toolbarAlign: "right",//工具栏对齐方式
       columns: showTd, 
       onDblClickRow:dbclick,
	   onClickCell:tbOnclick
	});	
}


function subTable(tId,id,data,showTd,tbOnclick){
	$(tId).bootstrapTable({
       data:data,							//数据源
       pagination:true,
       pageNumber:1,                       //初始化加载第一页，默认第一页
       pageSize: 10,                       //每页的记录行数（*）
       pageList: [10, 25, 50, 100],
       cache: false,
       striped: true,//是否显示行间隔色
       clickToSelect: true, //是否启用点击选中行
       sortable: true, 					//是否启用排序
	   height:550,
       toolbarAlign: "right",//工具栏对齐方式
//       columns: showTd, 
	   onDblClickRow:function(row, tr) {
			alert("1双击");
	    },
	   onClickCell:tbOnclick
	});	
}
