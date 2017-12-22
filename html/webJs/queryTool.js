//时间属性 开始queryStartDt  结束queryEndDt

function QueryTool(tbId){
	this.tbIdMe;
	this.tablObj;
	this.datas=[]; //数据源
	this.startObj; //开始
	this.endObj; //结束
	//初始化
	this.init=function(tbId,starId,endId){
		this.tbIdMe=tbId;
		this.tablObj=$(this.tbIdMe);
		this.startObj=$(starId);
		this.endObj=$(endId);
		this.datas=$(this.tbIdMe).bootstrapTable('getOptions').data;
	}

	this.loadData=function(dataArr){
		this.datas=dataArr;
	}
	
	this.startDt=function(id){
			this.startObj=$(id)
			var str=$(id).attr("queryStartDt");
			var vals=$(id).val();
			if(vals != null && vals != '' && vals != undefined){

		    }
	}

	this.endDt=function(id){
			this.endObj=$(id)
			var str=$(id).attr("queryEndDt");
			var vals=$(id).val();
			var data="";
			if(vals != null && vals != '' && vals != undefined){
				if($.browser.msie){ 
					alert('change'); 
				} else {
					alert('change1'); 
				}  
		    }
	}
	
	this.dateTimeLoad=function(starts,ends,parm){
		var data=this.datas;
		var loadData=[];
		var falg=false;
		if(starts != null  && starts != undefined  && starts != '' ){
			if(ends != null  && ends != undefined  && ends != '' ){
				falg=true;
				var str=parm;
				var starDt=starts;
				var endDt=ends;
				for(indexJ in data){
					if(data[indexJ][str] >= starDt && data[indexJ][str] <= endDt){
						loadData.push(data[indexJ]);
					}
				}
			}else{
				falg=true;
				var str=parm;
				var starDt=starts;
				for(indexJ in data){
					if(data[indexJ][str] >= starDt){
						loadData.push(data[indexJ]);
					}
				}
			}
		}else if(ends != null  && ends != undefined  && ends != '' ){
			if(starts != null  && starts != undefined  && starts != ''){
				falg=true;
				var str=parm;
				var starDt=starts;
				var endDt=ends;
				for(indexJ in data){
					if(data[indexJ][str] >= starDt && data[indexJ][str] <= endDt){
						loadData.push(data[indexJ]);
					}
				}
			}else{
				falg=true;
				var str=parm;
				var endDt=ends;
				for(indexJ in data){
					if(data[indexJ][str] <= endDt){
						loadData.push(data[indexJ]);
					}
				}
			}
		}
		if(falg){
			this.tablObj.bootstrapTable('load',loadData);
		}else{
			this.tablObj.bootstrapTable('load',this.datas);
		}
	}
	
	//自定义输入控件
	this.queryDt=function(){
		var data=this.datas;
		var loadData=[];
		var falg=false;
		if(this.startObj != null  && this.startObj != undefined  && this.startObj != '' && this.startObj.val() != ''){
			if(this.endObj != null  && this.endObj != undefined  && this.endObj != '' && this.endObj.val() != ''){
				falg=true;
				var str=this.startObj.attr("queryDt");
				var starDt=this.startObj.val();
				var endDt=this.endObj.val();
				for(indexJ in data){
					if(data[indexJ][str] >= starDt && data[indexJ][str] <= endDt){
						loadData.push(data[indexJ]);
					}
				}
			}else{
				falg=true;
				var str=this.startObj.attr("queryDt");
				var starDt=this.startObj.val();
				for(indexJ in data){
					if(data[indexJ][str] >= starDt){
						loadData.push(data[indexJ]);
					}
				}
			}
		}else if(this.endObj != null  && this.endObj != undefined  && this.endObj != '' && this.endObj.val() != ''){
			if(this.startObj != null  && this.startObj != undefined  && this.startObj != '' && this.startObj.val() != ''){
				falg=true;
				var str=this.endObj.attr("queryDt");
				var starDt=this.startObj.val();
				var endDt=this.endObj.val();
				for(indexJ in data){
					if(data[indexJ][str] >= starDt && data[indexJ][str] <= endDt){
						loadData.push(data[indexJ]);
					}
				}
			}else{
				falg=true;
				var str=this.endObj.attr("queryDt");
				var endDt=this.endObj.val();
				for(indexJ in data){
					if(data[indexJ][str] <= endDt){
						loadData.push(data[indexJ]);
					}
				}
			}
		}
		if(falg){
			this.tablObj.bootstrapTable('load',loadData);
		}else{
			this.tablObj.bootstrapTable('load',this.datas);
		}
		
	}
}
 	//按钮组默认值设置 	/*Name：Zhou Liujun*/
QueryTool.prototype.buttonsJson = [{
		//网咨模块
		val1:"userIdn", //未分配  
		val2:"userIdy", //已分配
		val3:"default1" //默认
	},
	{	//系统用户
		val1:"idOnliney", //在线	
		val2:"idOnlinen", //离线
		val3:"default", //默认
		val4:"statey", //在职
		val5:"staten" //离职
	},
	{	//电话邀约
		val1:"isInvitationn", //未邀约   
 		val2:"isInvitationy", //已邀约
 		val3:"putoff", //推迟
		val4:"default2" //默认
	},
	{	//上门记录
		val1:"isReadn", // 未上门
		val2:"isReady", //已上门
		val3:"default2" //默认
	},
	{	//签约管理
		val1:"isSignn", // 未签约
		val2:"isSigny", //已签约
		val3:"default2" //默认
	}]

 	//按钮索引值	/*Name：Zhou Liujun*/
QueryTool.prototype.buttonParm = {
		userId:"USER_ID", //咨询师id
		idOnline:"IS_ONLINE", //用户在线状态
 		state:"STATE", //用户状态   在职/离职
 		isInvitation:"IS_INVITATION", //电话邀约   
		isRead:"IS_READ", //上门记录  
		isSign:"USER_ID",//签约管理 
	}

	//集成按钮组  	/*Name：Zhou Liujun*/
QueryTool.prototype.buttons = function(buttonId,buttonPar){
		var buttonsJson = this.buttonsJson;
		var btnParm = this.buttonParm;
		var tempData = this.datas;  	//数据源
		var tablObj = this.tablObj; //获得表格id
		$(buttonId+" .btn").click(function(){
			var loadData=[];
			var val = $(this).find('input').val();
			//条件过滤数据源
			if(val == buttonsJson[0].val1){ 
				for(x in tempData){
					if(tempData[x][btnParm.userId] == undefined){
						loadData.push(tempData[x]);	//已分配
					}	
				}	
			}else if(val == buttonsJson[0].val2){
				for(x in tempData){
					if(tempData[x][btnParm.userId] != undefined){
						loadData.push(tempData[x]);	//未分配
					}	
				}	
			}else if(val == buttonsJson[1].val1){	
				for(x in tempData){
					if(tempData[x][btnParm.idOnline] == "0"){
						loadData.push(tempData[x]);	//在线
					}	
				}	
			}else if(val == buttonsJson[1].val2){	
				for(x in tempData){
					if(tempData[x][btnParm.idOnline] == "1"){
						loadData.push(tempData[x]);	//离线
					}	
				}	
			}else if(val == buttonsJson[1].val4){	
				for(x in tempData){
					if(tempData[x][btnParm.state] == "1"){
						loadData.push(tempData[x]);	//在职
					}	
				}	
			}else if(val == buttonsJson[1].val5){	
				for(x in tempData){
					if(tempData[x][btnParm.state] == "0"){
						loadData.push(tempData[x]);	//离职
					}	
				}	
			}else if(val == buttonsJson[2].val1){
				for(x in tempData){
					if(tempData[x][btnParm.isInvitation] == "未邀约"){
						loadData.push(tempData[x]);	//未邀约
					}	
				}	
			}else if(val == buttonsJson[2].val2){
					for(x in tempData){
						if(tempData[x][btnParm.isInvitation] == "已邀约"){
							loadData.push(tempData[x]);	//已邀约
						}	
				}	
			}else if(val == buttonsJson[2].val3){	
				for(x in tempData){
					if(tempData[x][btnParm.isInvitation] == "推迟"){
						loadData.push(tempData[x]);	//推迟
					}	
				}	
			}else if(val == buttonsJson[3].val1){	
				for(x in tempData){
					if(tempData[x][btnParm.isRead] == "1"){
						loadData.push(tempData[x]);	//未上门
					}	
				}	
			}else if(val == buttonsJson[3].val2){	
				for(x in tempData){
					if(tempData[x][btnParm.isRead] == "0"){
						loadData.push(tempData[x]);	//已上门
					}	
				}	
			}else if(val == buttonsJson[4].val1){	
				for(x in tempData){
					if(tempData[x][btnParm.isSign] == undefined){
						loadData.push(tempData[x]);	//未签约
					}	
				}				
			}else if(val == buttonsJson[4].val2){	
				for(x in tempData){
					if(tempData[x][btnParm.isSign] != undefined){
						loadData.push(tempData[x]);	//已签约
						
					}	
				}	
			}else{
				loadData = tempData;
			}
			tablObj.bootstrapTable('load',loadData);
		})
	}

//多条件查询	/*Name：Zhou Liujun*/
QueryTool.prototype.manyConditions = function(starts,ends,parm,buttonId,buttonVal){

	var data=this.datas;	//数据源
	var btnParm = this.buttonParm;
	var loadData=[];
	var tempData = [];	//临时数据源
	var falg=false;
	var stateFalg = false; //筛选顺序
	var buttonsJson = this.buttonsJson;	
	var html = $(".delayTime").html();
	var val;
	if(buttonVal == undefined ||buttonVal == null ||buttonVal == ''){
		val = $(buttonId + " .active").find('input').val();
	}else{
		val = buttonVal;
	}
	//时间筛选
	if(starts != null  && starts != undefined  && starts != '' ){
		if(ends != null  && ends != undefined  && ends != '' ){
			falg=true;
			var str=parm;
			var starDt=starts;
			var endDt=ends;
			if(html.length == 0|| html.indexOf("默认") != -1){
				for(indexJ in data){
					if(data[indexJ][str] != undefined){
						if(data[indexJ][str] >= starDt && data[indexJ][str] <= endDt){
							tempData.push(data[indexJ]);
						}
					}
					if(data[indexJ][str] == undefined){
						tempData.push(data[indexJ]);
					}
				}
			}else{
				for(indexJ in data){
					if(data[indexJ][str] >= starDt && data[indexJ][str] <= endDt){
						tempData.push(data[indexJ]);
					}
				}
			}	
			if(val == buttonsJson[0].val1){ 
				for(x in tempData){
					if(tempData[x][btnParm.userId] == undefined){
						loadData.push(tempData[x]);	//已分配
					}	
				}	
			}else if(val == buttonsJson[0].val2){
				for(x in tempData){
					if(tempData[x][btnParm.userId] != undefined){
						loadData.push(tempData[x]);	//未分配
					}	
				}	
			}else if(val == buttonsJson[1].val1){	
				for(x in tempData){
					if(tempData[x][btnParm.idOnline] == "0"){
						loadData.push(tempData[x]);	//在线
					}	
				}	
			}else if(val == buttonsJson[1].val2){	
				for(x in tempData){
					if(tempData[x][btnParm.idOnline] == "1"){
						loadData.push(tempData[x]);	//离线
					}	
				}	
			}else if(val == buttonsJson[1].val4){	
				for(x in tempData){
					if(tempData[x][btnParm.state] == "1"){
						loadData.push(tempData[x]);	//在职
					}	
				}	
			}else if(val == buttonsJson[1].val5){	
				for(x in tempData){
					if(tempData[x][btnParm.state] == "0"){
						loadData.push(tempData[x]);	//离职
					}	
				}	
			}else if(val == buttonsJson[2].val1){
				for(x in tempData){
					if(tempData[x][btnParm.isInvitation] == "未邀约"){
						loadData.push(tempData[x]);	//未邀约
					}	
				}	
				
			}else if(val == buttonsJson[2].val2){
				for(x in tempData){
					if(tempData[x][btnParm.isInvitation] == "已邀约"){
						loadData.push(tempData[x]);	//已邀约
					}	
				}	
			}else if(val == buttonsJson[2].val3){	
				for(x in tempData){
					if(tempData[x][btnParm.isInvitation] == "推迟"){
						loadData.push(tempData[x]);	//推迟
					}	
				}	
			}else if(val == buttonsJson[3].val1){	
				for(x in tempData){
					if(tempData[x][btnParm.isRead] == "1"){
						loadData.push(tempData[x]);	//未上门
					}	
				}	
			}else if(val == buttonsJson[3].val2){	
				for(x in tempData){
					if(tempData[x][btnParm.isRead] == "0"){
						loadData.push(tempData[x]);	//已上门
					}	
				}	
			}else if(val == buttonsJson[4].val1){	
				for(x in tempData){
					if(tempData[x][btnParm.isSign] == undefined){
						loadData.push(tempData[x]);	//未签约
					}	
				}	
			}else if(val == buttonsJson[4].val2){	
				for(x in tempData){
					if(tempData[x][btnParm.isSign] != undefined){
						loadData.push(tempData[x]);	//已签约
					}	
				}	
			}else{
				loadData = tempData;
			}
		}else{
			falg=true;
			var str=parm;
			var starDt=starts;
			for(indexJ in data){
				if(data[indexJ][str] >= starDt){
					loadData.push(data[indexJ]);
				}
			}
		}
	}else if(ends != null  && ends != undefined  && ends != '' ){
		if(starts != null  && starts != undefined  && starts != ''){
			falg=true;
			var str=parm;
			var starDt=starts;
			var endDt=ends;
			for(indexJ in data){
				if(data[indexJ][str] >= starDt && data[indexJ][str] <= endDt){
					loadData.push(data[indexJ]);
				}
			}
			console.log(null);
		}else{
			falg=true;
			var str=parm;
			var endDt=ends;
			for(indexJ in data){
				if(data[indexJ][str] <= endDt){
					loadData.push(data[indexJ]);
				}
			}
			console.log(null);
		}
	}
	//输出到页面
	if(falg){
		this.tablObj.bootstrapTable('load',loadData);
	}else{
		this.tablObj.bootstrapTable('load',data);
	}
}