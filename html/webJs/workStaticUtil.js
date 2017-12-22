//初始化数据持有框按钮以及组件遍历(你懂得!)
function EcDataToWork(url){
	this.actionUrl = url;
	this.setUserQury=function(){
		var userInfo = urlObj.getJson();
		userInfo['ROLE_ID'] = userInfo.token.ROLE_ID;
		userInfo['USER_ID'] = userInfo.token.ID;
		if(userInfo.token.IS_SUPER != "1") {
			var selectAllConsult = urlObj.url + "/workPlan/queryDpAllEmp";
			var jsonObj = commAjaxPost(selectAllConsult, userInfo);
			this.analysisJQDom(".dpButton").append(this.addUser(0, "全部", " active"));
			for(var i = 0; i < jsonObj.length; i++) {
				this.analysisJQDom(".dpButton").append(this.addUser(jsonObj[i].ID, jsonObj[i].USER_NAME, " "));
			}
		}
	}

	this.createCustomerDom = function(data){
		var html='';
			this.analysisJQDom('.appendWorkPj').html(html);
			if(data == undefined || data == null || data.length == 0){
				return false;
			}
			for(c in data){
				if(data[c].TYPE_CODE == 'ALL'){
					html+='<li class="clearfix">';
					html+='<div class="pull-left" style="width:100%">';
					html+='<div class="text-right pull-right">';
					var sysDay=0;
					var setDay=data[c].PLAN_DT;
					html+='<h4 id="referenceSize" class="PJ_CONTENT">'+data[c].PJ_INDEX+'</h4>';			
					html+='<p><span class="label label-danger arrow-in-right" ></i>NEW</span></p>';
					html+='</div>';
					html+='<p></p>';
					html+=this.projectExceed(data[c]);
					//html+='<h4 class="USER_NAME"><strong>'+data[c].PJ_CONTENT+'</strong></h4>';
					html+='<p></p>';
					html+='<p class="PLAN_DT"><i class="fa fa-clock-o"></i><abbr class="timeago" >'+getDateTostr(data[c].SB_TIME)+' / 任务发布人:'+data[c].USER_NAME+'</abbr></p>';
					html+='</div>';
					html+='<div class="clearfix"></div>';
					html+='<div class="progress" style="margin-top: 20px;overflow: inherit;">';
					html+=this.contStatic(data[c].PJ_USERS,data[c]);
					html+='</div>';
					html+='</li>';
				}else{
					html+='<li class="clearfix">';
					html+='<div class="pull-left" style="width:100%">';
					html+='<div class="text-right pull-right">';
					var sysDay=0;
					var setDay=data[c].PLAN_DT;
					html+='<h4 id="referenceSize" class="PJ_CONTENT">'+data[c].PJ_INDEX+'</h4>';			
					html+='<p><span class="label label-info arrow-in-right" style="background:#70afc4"></i>预估工时 '+Number(data[c]['PLAN_DT'])+' 天</span></p>';
					html+='</div>';
					html+='<p></p>';
					html+=this.projectExceed(data[c]);
					//html+='<h4 class="USER_NAME"><strong>'+data[c].PJ_CONTENT+'</strong></h4>';
					html+='<p></p>';
					html+='<p class="PLAN_DT"><i class="fa fa-clock-o"></i><abbr class="timeago" >'+data[c].STAR_DT+'~'+data[c].END_DT+' / 负责人:'+data[c].USER_NAME+'</abbr></p>';
					html+='</div>';
					html+='<div class="clearfix"></div>';
					html+='<div class="progress" style="margin-top: 20px;overflow: inherit;">';
					html+=this.contStatic(data[c].PJ_USERS,data[c]);
					html+='</div>';
					html+='</li>';
				}
			}
		this.analysisJQDom('.appendWorkPj').append(html);
		screenshotPreview('screenshot','x_preview','rel','customer');
	}

	this.createDom = function(data){
		var html='';
			this.analysisJQDom('.appendWorkPj').html(html);
			if(data == undefined || data == null || data.length == 0){
				return false;
			}
			if(data[0].TYPE_CODE != undefined && data[0].TYPE_CODE != null && data[0].TYPE_CODE != ''){
				this.createCustomerDom(data);
			}else{
				for(c in data){
					html+='<li class="clearfix">';
					html+='<div class="pull-left" style="width:100%">';
					html+='<div class="text-right pull-right">';
					var sysDay=0;
					var setDay=data[c].PLAN_DT;
					html+='<h4 id="referenceSize" class="PJ_CONTENT">'+data[c].PJ_INDEX+'</h4>';			
					html+='<p><span class="label label-info arrow-in-right" style="background:#70afc4"></i>预估工时 '+Number(data[c]['PLAN_DT'])+' 天</span></p>';
					html+='</div>';
					html+='<p></p>';
					html+=this.projectExceed(data[c]);
					//html+='<h4 class="USER_NAME"><strong>'+data[c].PJ_CONTENT+'</strong></h4>';
					html+='<p></p>';
					html+='<p class="PLAN_DT"><i class="fa fa-clock-o"></i><abbr class="timeago" >'+data[c].STAR_DT+'~'+data[c].END_DT+' / 发起人:'+data[c].USER_NAME+'</abbr></p>';
					html+=this.createUserList(data[c].PJ_USERS,data[c]);
					html+='</div>';
					html+='<div class="clearfix"></div>';
					html+='<div class="progress" style="margin-top: 20px;">';
					html+=this.contStatic(data[c].PJ_USERS,data[c]);
					html+='</div>';
					html+='</li>';
				}
			}
		this.analysisJQDom('.appendWorkPj').append(html);
		screenshotPreview('screenshot','x_preview','rel','project');
	}

	this.projectExceed = function(obj){
		var sysDate = this.getDateTostr(obj['SYS_DATE']);//系统当前时间
		var booleanSy = obj['COMPLETE_DT'] == undefined ? sysDate > obj['END_DT'] : obj['COMPLETE_DT'] > obj['END_DT'];//判断完成或者未完成100%的超时情况
		var dateSyTime = obj['COMPLETE_DT'] == undefined ? DateDiff(obj['END_DT'],sysDate) : (obj['COMPLETE_DT'] > obj['END_DT'] ? DateDiff(obj['END_DT'],obj['COMPLETE_DT']) : DateDiff(obj['COMPLETE_DT'],obj['END_DT']));
		var putHtml = '';
		var content = '';
		if(obj != undefined && obj['PJ_CONTENT'] != null && obj['PJ_CONTENT'] != undefined){
			content = obj['PJ_CONTENT'].length > 15 ? obj['PJ_CONTENT'].substring(0,15)+'...' : obj['PJ_CONTENT'];
		}
		if(booleanSy){
			putHtml+='<h4 id="referenceSize" class="PJ_CONTENT"><strong style="color:#d9534f">'+content+'</strong>';
			putHtml+='<div class="label label-danger" style="display: inline;margin-left: 10px;padding: 3px;"><i class="fa fa-exclamation" style="margin: 0 3px;"></i><h5 style="display: inline;">'+obj['COMPLETE_DT']+'[已超时]</h5></div>';
			putHtml+='</h4>';
		}else{
			putHtml+='<h4 id="referenceSize" class="PJ_CONTENT"><strong>'+content+'</strong></h4>';
		}
		return putHtml;
	}

	this.createUserList = function(userArr,obj){
		var userHtml="";
		if(userArr == undefined || userArr == null || userArr.length == 0){
			return userHtml;
		}
		//list-unstyled
		userHtml+='<ul class="list-unstyled" >';
		for(x in userArr){
			var falg ="";
			if(userArr[x]['USER_TYPE'] == 0){
				falg = "制作人:";
			}else if(userArr[x]['USER_TYPE'] == 1){
				falg = "协助人:";
			}else if(userArr[x]['USER_TYPE'] == 2){
				falg = "修改人:";
			}
			var node = userArr[x]['PJ_NODES'];
			var sysDate = this.getDateTostr(obj['SYS_DATE']);
			var endDate = obj['END_DT'];
			var NodeVal1 = 0;
			var NodeVal2 = 0;
			var NodeVal3 = 0;
			if(node != undefined && node != null && node != ''){
				NodeVal1 = node[0] == undefined ? 0 : parseFloat(node[0]['ACTUAL_DAY']);
				NodeVal2 = node[1] == undefined ? 0 : parseFloat(node[1]['ACTUAL_DAY']);
				NodeVal3 = node[2] == undefined ? 0 : parseFloat(node[2]['ACTUAL_DAY']);
			}
			var setNumber = (NodeVal1+NodeVal2+NodeVal3).toFixed(1) == 0.0 ? 0 : (NodeVal1+NodeVal2+NodeVal3).toFixed(1);
			userHtml+='<li style="background:#f4f4f4;">';
			userHtml+='<div ><h5 class="USER_NAME"><strong>'+falg+'</strong>'+userArr[x]['USER_NAME']+'<strong style="font-weight: bolder;"> ['+setNumber+'/'+userArr[x]['NUM_VALUE']+']</strong></h5></div>';
			userHtml+='<div class="progress clearOver" style="position: relative;">';
			if(node != undefined && node != null && node != ''){
				userHtml+=this.calculation(node,obj,userArr[x]);
			}
/*			else if(sysDate > obj['END_DT']){
					var day = DateDiff(endDate,sysDate)
					userHtml+='<div class=" progress-bar appendLine " style="border-radius: 7px; width:100%;background:rgba(217,83,79,1);"	data-toggle="tooltip2" title="任务未进行-超时'+day+'天">';
					userHtml+='<span class="">已超时</span>';
			        userHtml+='</div>';
			}*/
//			userHtml+='</div>'
			userHtml+='</div>';
			userHtml+='</li>';
		}
			userHtml+='</ul>';	
		return userHtml;
	}
	this.contStatic=function(userArr,obj){
		var userHtml="";
		if(userArr == undefined || userArr == null || userArr.length == 0){
			return userHtml;
		}
		var conNumber = Number(obj.PLAN_DT);
		var intNumbers=0;
		var numberContent = 0;
		for(x in userArr){
			var node = userArr[x]['PJ_NODES'];
			if(node != undefined && node != null && node != ''){
				if(node[node.length-1].TYPE == 0){
					//intNumbers+=(Number(node[node.length-1].ACTUAL_DAY)/Number(userArr[x].NUM_VALUE)).toFixed(2);
					intNumbers = 0.5;
					numberContent += userArr[x].NUM_VALUE*intNumbers;
				}else if(node[node.length-1].TYPE == 1){
					intNumbers = 0.8;
					numberContent += userArr[x].NUM_VALUE*intNumbers;
				}else if(node[node.length-1].TYPE == 2){
					intNumbers = 1;
					numberContent += userArr[x].NUM_VALUE*intNumbers;
				}
			}
		}
		//查询图片路径
		if(obj != undefined || obj != null || obj.length != 0){
			var pjIndex = obj['PJ_INDEX'];
			var pjContent = obj['PJ_CONTENT'];
			if(obj['PJ_USERS'].length != 0){
				for(x in obj['PJ_USERS']){
					if(obj['PJ_USERS'][x].USER_TYPE == '0'){
						var userId = obj['PJ_USERS'][x]['USER_ID'];
						var createBy = obj['PJ_USERS'][x]['CREATED_BY'];
						for(y in obj['PJ_USERS'][x]['PJ_NODES']){
							if(obj['PJ_USERS'][x]['PJ_NODES'][y].length != 0){
								var pjType = obj['PJ_USERS'][x]['PJ_NODES'][y]['TYPE'];
								var nodeIds = obj['PJ_USERS'][x]['PJ_NODES'][y]["ID"];
								if(obj['PJ_USERS'][x]['PJ_NODES'][y]['SCREENSHOTS'] !='' || obj['PJ_USERS'][x]['PJ_NODES'][y]['SCREENSHOTS'] !=null){
									var imgUrl =obj['PJ_USERS'][x]['PJ_NODES'][y]['SCREENSHOTS'];
								}else{
									var imgUrl ='/img/avatars/noPhoto.png';
								}
							}
						}								
					}					
				}				
			}
		}
		var setMode=((numberContent/conNumber).toFixed(2));
 		if((setMode*100) > "0"||(setMode*100) > 0){
			userHtml+='<div create-by="'+ createBy+'" user-id="'+userId+'" pj-type="'+pjType+'" node-id= "'+nodeIds+'" rel="'+urlObj.url+imgUrl+'" pj-index="'+pjIndex+'" pj-content="'+pjContent+'" class="progress-bar appendLine ifWidthL screenshot" title="当前进度" style="border-radius:6px;width:'+(setMode*100)+'%;background: rgba(91,192,222,1)">';
	        userHtml+='<span class="ifWidth">已完成</span>';
	 		userHtml+='<span class="text-center" style="width:100%">'+(setMode*100).toFixed(0)+'%</span>';
       	}else{
			userHtml+='<div class="progress-bar appendLine ifWidthL" title="项目进行中" style="border-radius:6px;width:100%;background: rgba(228,230,235,1)">';
 			userHtml+='<span class="text-center" style="color:#000">'+"项目进行中"+'</span>';
       	}		
        userHtml+='<input type="text" value ="'+nodeIds+'" class="hidden nodesIds">';
        userHtml+='</div>';
        return userHtml;
	}

	this.calculation=function(nodeData,obj,userArrObj){
		var html="";
		var numValue = userArrObj['NUM_VALUE'];
		var nodeData0 = nodeData[0] == undefined ? null : nodeData[0]['ACTUAL_DAY'];
		var nodeData1 = nodeData[1] == undefined ? null : nodeData[1]['ACTUAL_DAY'];
		var nodeData2 = nodeData[2] == undefined ? null : nodeData[2]['ACTUAL_DAY'];
		var nodeData2Time = nodeData[2] == undefined ? null : nodeData[2]['NODE_TIME'];
		var set050 = Number(nodeData0);
		var set5080 = Number(nodeData1);
		var set80100 = Number(nodeData2);
		var sysDate = this.getDateTostr(obj['SYS_DATE']);//系统当前时间
		var booleanSy50 = nodeData[0] == undefined ? false :set050.toFixed(1) > numValue;//假如未完成50% 的情况 判断它是否超时
		var booleanSy80 = nodeData[1] == undefined ? false :(set050+set5080).toFixed(1) > numValue;//假如未完成80% 的情况 判断它是否超时
		var booleanCs = nodeData[2] == undefined ? false : (set050+set5080+set80100).toFixed(1) > numValue;//假如有已完成100% 的情况 判断它是否超时
		var overDate = DateDiff(obj['END_DT'],sysDate);//假如超时的情况且未完成所有指标
		var overWorkeDate = nodeData[2] == undefined ? false : DateDiff(obj['END_DT'],this.getDateTostr(nodeData[2]['NODE_TIME']));//假如超时的情况且已完成所有指标
		if(this.isNull(nodeData[2])){
			if(booleanCs){//如果已完成 且 超时
				var sumNum=(set050+set5080+set80100).toFixed(1);
				var average = 4;
				var node50=this.calcNumber(set050/sumNum)-average,node80=this.calcNumber(set5080/sumNum)-average,node100=this.calcNumber(set80100/sumNum)-average;
				html+=this.setDivMode(node50,set050,nodeData[0]);
				html+=this.setDivMode(node80,set5080,nodeData[1]);
				html+=this.node100overtime(node100,set80100,nodeData[2]);	
				html+=this.nodeExceed(100-(node50+node80+node100),(sumNum-Number(numValue)).toFixed(1));
			}else{//否则已经完成也没有超时
				var sumNum=set050+set5080+set80100;
				var node50=this.calcNumber(nodeData0/numValue),node80=this.calcNumber(nodeData1/numValue); 
				html+=this.setDivMode(node50,set050,nodeData[0]);
				html+=this.setDivMode(node80,set5080,nodeData[1]);
				html+=this.setDivMode(100-(node50+node80),set80100,nodeData[2]);
			}
		}else if(this.isNull(nodeData[1])){
			if(booleanSy80){//已完成80% 且 超时
				var sumNum=(set050+set5080).toFixed(1);
				var average = 6;
				var node50=this.calcNumber(nodeData0/sumNum)-average,node80=this.calcNumber(nodeData1/sumNum)-average;
				html+=this.setDivMode(node50,set050,nodeData[0]);
				html+=this.setDivMode(node80,set5080,nodeData[1]);
				html+=this.nodeExceed(100-(node50+node80),(sumNum-Number(numValue)).toFixed(1));
			}else{//否则已完成80%也没有超时
				var conductNum=DateDiff(this.getDateTostr(nodeData[1]['NODE_TIME']),obj['END_DT']);
				var sumNum=set050+set5080+conductNum;
				var node50=this.calcNumber(nodeData0/numValue),node80=this.calcNumber(nodeData1/numValue);
				html+=this.setDivMode(node50,set050,nodeData[0]);
				html+=this.setDivMode(node80,set5080,nodeData[1]);
//				html+=this.nodeConduct(100-(node80+node80),conductNum);//进行中进度条
			}
		}else if(this.isNull(nodeData[0])){
			if(booleanSy50){//已完成50% 且 超时
				var sumNum=set050;
				var average = 12;
				var node50=this.calcNumber(nodeData0/sumNum)-average;
				html+=this.setDivMode(node50,set050,nodeData[0]);
			}else{//否则已完成50%也没有超时
				var conductNum=DateDiff(this.getDateTostr(nodeData[0]['NODE_TIME']),obj['END_DT']);
				var sumNum=set050+conductNum;
				var node50=this.calcNumber(nodeData0/numValue)
				html+=this.setDivMode(node50,set050,nodeData[0]);
//				html+=this.nodeConduct(100-node50,conductNum);//进行中进度条
			}
		}
		return html;
	}

	this.setDivMode = function(one,two,obj){
		var html = "";
		if(obj.TYPE == 2){
			html+=this.node100(one,two,obj);
		}else if(obj.TYPE == 1){
			html+=this.node80(one,two,obj);
		}else if(obj.TYPE == 0){
			html+=this.node50(one,two,obj);
		}
		return html;
	}

	this.node50 = function(percentage,day,nodeObj){
		var html='';
		var nodeTime = this.getDateTostr(nodeObj.NODE_TIME);
		var nodeStarTime = this.getDateTostr(nodeObj.START_TIME);
		html+='<div rel="'+urlObj.url+nodeObj.SCREENSHOTS+'" onclick="download(\''+nodeObj.SCREENSHOTS+'\')" class="progress-bar appendLine screenshot" style="border-radius: 6px 0 0 6px;position:relative;width:'+percentage+'%;background:rgba(182,188,123,1);" data-toggle="tooltip2" title="0%-50%(工时'+day+'天)">';
        html+='<span class="">'+day+'</span>';
        html+='<div style="position: absolute;left:-50px">';
        html+='<div style="background: url(img/vernier1.png);width: 10px;height: 10px;margin: auto;"></div>';
		html+='<div style="color:#000;min-width: 100px;">'+nodeStarTime.substring(nodeStarTime.indexOf('-')+1,nodeStarTime.length)+'</div>';
		html+='</div>';
		html+='<div style="position: absolute;right:-50px">';
		html+='<div style="background: url(img/vernier1.png);width: 10px;height: 10px;margin: auto;"></div>';
		html+='<div style="color:#000;min-width: 100px;">'+nodeTime.substring(nodeTime.indexOf('-')+1,nodeTime.length)+'</div>';
		html+='</div>';
        html+='</div>';
        return html;
	}

	this.node80 = function(percentage,day,nodeObj){
		var html='';
		var nodeTime = this.getDateTostr(nodeObj.NODE_TIME);
			html+='<div rel="'+urlObj.url+nodeObj.SCREENSHOTS+'" onclick="download(\''+nodeObj.SCREENSHOTS+'\')" class=" progress-bar appendLine screenshot" style="position:relative;width:'+percentage+'%;background:rgba(239,194,107,1); " data-toggle="tooltip2" title="50%-80%(工时'+day+'天)">';
	        html+='<span class="">'+day+'</span>';
	        html+='<div style="position: absolute;right:-50px">';
	        html+='<div style="background: url(img/vernier2.png);width: 10px;height: 10px;margin: auto;"></div>';
			html+='<div style="color:#000;min-width: 100px;background:#f4f4f4">'+nodeTime.substring(nodeTime.indexOf('-')+1,nodeTime.length)+'</div>';	
			html+='</div>';
	        html+='</div>';
        return html;
	}

	this.node100overtime = function(percentage,day,nodeObj){
		var html='';
		var nodeTime = this.getDateTostr(nodeObj.NODE_TIME);
			html+='<div rel="'+urlObj.url+nodeObj.SCREENSHOTS+'" onclick="download(\''+nodeObj.SCREENSHOTS+'\')" class=" progress-bar appendLine screenshot" style="position:relative;width:'+percentage+'%;background:rgba(255,156,91,1);" data-toggle="tooltip2" title="80%-100%(工时'+day+'天)">';
		    html+='<span class="">'+day+'</span>';
		    html+='<div style="position: absolute;right:-50px">';
			html+='<div style="background: url(img/vernier3.png);width: 10px;height: 10px;margin: auto;"></div>';
			html+='<div style="color:#000;min-width: 100px;">'+nodeTime.substring(nodeTime.indexOf('-')+1,nodeTime.length)+'</div>';
			html+='</div>';
		    html+='</div>';
        return html;
	}
	this.node100 = function(percentage,day,nodeObj){
		var html='';
		var nodeTime = this.getDateTostr(nodeObj.NODE_TIME);
			html+='<div onclick="download(\''+nodeObj.SCREENSHOTS+'\')" rel="'+urlObj.url+nodeObj.SCREENSHOTS+'"  class=" progress-bar appendLine screenshot" style="border-radius:0 6px 6px 0;position:relative;width:'+percentage+'%;background:rgba(255,156,91,1);" data-toggle="tooltip2" title="80%-100%(工时'+day+'天)">';
		    html+='<span class="">'+day+'</span>';
		    html+='<div style="position: absolute;right:-45px">';
			html+='<div style="background: url(img/vernier3.png);width: 10px;height: 10px;margin: auto;"></div>';
			html+='<div style="color:#000;min-width: 100px;">'+nodeTime.substring(nodeTime.indexOf('-')+1,nodeTime.length)+'</div>';
			html+='</div>';
		    html+='</div>';
        return html;
	}

	this.nodeConduct = function(percentage){
		var html='';
			html+='<div class=" progress-bar appendLine " style="border-radius:0 6px 6px 0;width:'+percentage+'%;background:rgba(91,192,222,1); " data-toggle="tooltip2" title="进行中">';
		    html+='<span class=""> >>> </span>';	
		    html+='</div>'
        return html;
	}

	this.nodeExceed = function(percentage,day){
		var html='';
			html+='<div class=" progress-bar appendLine " style="border-radius:0 6px 6px 0;width:'+percentage+'%;background:rgba(217,83,79,1);" data-toggle="tooltip2" title="已超时'+day+'天">';
		    html+='<span class="">'+day+'</span>';
		    html+='</div>';
        return html;
	}

	this.isNull = function(obj){
		if(obj == undefined || obj == null || obj == ''){
			return false;
		}
		return true;
	}

	this.calcNumber = function(one){
		return one.toFixed(2)*100;
	}




	this.getDateTostr = function(time){
		if(time == undefined || time == null || time == ''){
			return null;
		}
		var timestamp =time;
		var d = new Date(timestamp * 1000);    //根据时间戳生成的时间对象
		var month = (d.getMonth() + 1)<10?'0'+(d.getMonth() + 1):(d.getMonth() + 1)+"";
		var dates = (d.getDate()) <10?'0'+(d.getDate()) :(d.getDate())+"";
		var date = (d.getFullYear())+'-'+month+'-'+dates
		return date;
	}


	this.addUser = function(id, name, active){
		var type ='type';
		var emp = '<label class="btn btn-primary ' + active + '" onclick="queryUserToWorkChar(\'' + id + '\',\'' + type + '\',\'' + this.actionUrl + '\');">';
		emp += '<input type="radio" name="options"  value="' + id + '" checked > ' + name;
		emp += '</label>';
		return emp;
	}


	this.analysisJQDom=function (key){
		return	$($(key)[($(key).length-1)]); 
	}

}

function reWorkPoject(){
	var subJson={};
	if(selectAllConsultsJson[1] == undefined || selectAllConsultsJson[1] == null || selectAllConsultsJson[1].length <=0){
		subJson=urlObj.getJson();
	}else{
		subJson = selectAllConsultsJson[1];
	}
	var selectAllConsults = selectAllConsultsJson[0];
	var jsonObj = commAjaxPost(selectAllConsults, subJson);
	var ec =new EcDataToWork();
	ec.createDom(jsonObj);
}

function queryUserToWorkChar(userId,type,url){
	if(selectAllConsultsJson[1] == undefined || selectAllConsultsJson[1] == null || selectAllConsultsJson[1].length <=0){
		alert('参数异常！');
		return false;
	}
	if(userId == 0){
		selectAllConsultsJson[1]['ROLE_ID'] = urlObj.getJson().token.ROLE_ID;
		selectAllConsultsJson[1]['USER_ID'] =  urlObj.getJson().token.ID;
	}else{
		selectAllConsultsJson[1]['ROLE_ID'] = '';
		selectAllConsultsJson[1]['USER_ID'] = userId;
	}
	var selectAllConsults = selectAllConsultsJson[0];
	var jsonObj = commAjaxPost(selectAllConsults, selectAllConsultsJson[1]);
	var ec =new EcDataToWork();
	ec.createDom(jsonObj);
}


function getDateYesOrNo(dateString){
	return (/^(\d{4})-(\d{2})$/).test(dateString);
}

var screenshotPreview = function(elink, preBox, URLsource,Specific){
	var flag = true;
	var elemlink = elink; //要添加预览的链接
	var previewBox = preBox; //预览用的视图框
	var URL = URLsource; //预览图片地址来源
	var positionScreen = function(event){
		var proChatTop = event.clientY;
		var proChatLeft = event.clientX;
		var proChatHeight = $(".scroller").height();
		var proChatWidth = $(".scroller").width();
		if(proChatHeight-proChatTop>180){
			$('.'+previewBox).css({top:12}).fadeIn("slow");
		}else{
			$('.'+previewBox).css({top:-177}).fadeIn("slow");
		}
		if(proChatLeft-proChatWidth*2<110){
			$('.'+previewBox).css({left:20}).fadeIn("slow");
		}else{
			$('.'+previewBox).css({right:0}).fadeIn("slow");
		}
	};
	var showScreen = function(event){
		//$('.'+previewBox).remove();
	    //判断预览图片的地址来源
	    if(URL=='rel'){             
	        thisURL = $(this).attr('rel');
	    }else if(URL=='href'){
	        thisURL = $(this).attr('href');
	    }else {
	    	return false
	    };
		var userId = $(this).attr("user-id");
		var pjType = $(this).attr("pj-type");
		var nodeId = $(this).attr("node-id");
		var pjIndex =  $(this).attr("pj-index");
		var pjContent =  $(this).attr("pj-content");
		var createById = $(this).attr("create-by");
	    thisTitle = $(this).attr('title'); //获取预览框的说明文字
	    //$(this).attr('title','');          //临时性的将title设置为空，避免鼠标放上去系统默认的提示框出现
	    //var screenTxt = (thisTitle != null)?"<p>"+thisTitle+"</p>" : "";
	    var objHtml = "";
	    	objHtml = "<div  style='z-index:9999;position: absolute;' class='" +previewBox+ "'>";
	    	objHtml +=		"<h5 style='background:#5e87b0;padding:5px;margin:0;cursor: pointer;border-radius: 5px 5px 0 0'>";
	    	objHtml +=			"<font class='pull-left'>"+thisTitle+" 图片预览</font>";
	    	if(Specific != "project"){	//非项目部人员的加载问题反馈
				objHtml +=				'<a onclick="downloadFeedback(\''+previewBox+'\',\''+userId+'\',\''+pjType+'\',\''+nodeId+'\',\''+pjIndex+'\',\''+pjContent+'\',\''+createById+'\')" class="pull-right" title="问题反馈" style="margin-right:10px;color: #fff;"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span>反馈</a>';
	    	}
			objHtml +=				'<a onclick="downloadImages(\''+thisURL+'\')" class="pull-right" title="下载图片" style="margin-right:10px;color: #fff;"><span class="glyphicon glyphicon-download" aria-hidden="true"></span>下载</a>';
			objHtml +=				'<div class="clearfix" aria-hidden="true" title=""></div>';	
	    	objHtml +=		"</h5>";
	    	objHtml +=		"<div class='x-img' style='width: 320px;height: 150px;border: 1px solid #337ab7;padding:5px;background:#fff'>";
	    	objHtml +=		"<img data-action='zoom' src='" +getPorjectImgUrl(thisURL)+ "' alt='showpic'/>";
	    	objHtml +=		"</div>";
    		objHtml += "</div>";
		if(flag){
			$(objHtml).appendTo($(this));
			flag=false;
		}
	    positionScreen(event);
	};
	var hideScreen = function(){
	    $(this).attr('title',thisTitle);
	    $('.'+previewBox+',.zoom-img-wrap').remove();
		flag=true;
	};
	$('.'+ elemlink).hover(showScreen,hideScreen);
};
	//操作窗口
function download(src,nodeId){
	
}

function downloadFeedback(previewBox,userId,pjType,nodeId,pjIndex,pjContent,createById){
	$('.'+previewBox).remove();
	var cont = '<textarea placeholder="请输入反馈信息，1000字以内" style="border-radius:5px;border:1px solid #e7e7e7" rows="10" cols="72" id="Feedback" value="" ></textarea>';
		cont +='<span class="textNum pull-right" style="margin-right:3%">您还可以输入0/1000字</span>';
		cont +='<span class="clearfix"></span>';	
	var dialog = jDialog.dialog({
			title: '用户反馈',
			width: '550px',
			content: cont,
			buttons: [{
				type: 'highlight',
				text: '发送反馈',
				handler: function(button, dialog) {
					const subJson = urlObj.getJson();;
					const addIdeaFeedBack = urlObj.url +'/ideaFeedBack/addIdeaFeedBack';
					const Feedback = $('#Feedback').val();//反馈信息
					subJson['USER_ID'] = userId;
					subJson['TYPE'] = pjType;
					subJson['FK_NODE_ID'] = nodeId;
					subJson['CREATED_BY'] = subJson.token.ID;
					subJson['FEEDBACK_CONTENT'] = Feedback;	
					if(Feedback != "" && Feedback != null && Feedback.length <=1000){
						
							if(userId != null && userId != undefined && userId.length > 0) {
								subJson['MSG_TITLE'] = "反馈消息";
								subJson['MSG_BODY'] = "项目索引为:" + pjIndex + "，内容为：" + pjContent+ "的项目反馈内容：" + Feedback;
								subJson['USER_ID_ARR'] = userId;
								}
							if(commAjaxPost(addIdeaFeedBack, subJson).result == '1'){
								
							socket.send(JSON.stringify(subJson)); // 推送
							subUpdateDia("发送成功！！");
							dialog.close();
						}else{
							subUpdateDia("发送失败！");
						};		
					}else if(Feedback.length >1000){
						alert("反馈内容超出最大字数限制！！");
					}
				}
			},
			{
				type: 'highlight',
				text: '关闭窗口',
				handler: function(button, dialog) {
					dialog.close();
				}
			}]
		});
$('#Feedback').focus(function(){
	var	textNum = $(this).val().length;
	if(textNum<=1000){
		$('.textNum').html('您还可以输入'+textNum+'/1000字');
	}else{
		$('.textNum').html('您还可以输入<font color="#f00">'+textNum+'</font>/1000字');
	}
}).keydown(function(){
	var	textNum = $(this).val().length;
	if(textNum<=1000){
		$('.textNum').html('您还可以输入'+textNum+'/1000字');
	}else{
		$('.textNum').html('您还可以输入<font color="#f00">'+textNum+'</font>/1000字');
	}
})
	$('.j-dialog .j-dialog-btn').css({'font-size':'12px'})
}

function downloadImages(src){
    var $a = document.createElement('a');
    if(src == '' || src == undefined || src == null){
    	alert("该用户没有上传当前进度完成图片!");
    	return false;
    }
    var imgUrl = src;
    var blean = false;
    $.ajax({
        url: imgUrl,
        type: 'GET',
        async: false,
        complete: function(response) {
            if(response.status != 200) {
                alert('该进度找不到对应的项目进度完成图片，或者图片丢失。');
               	blean = true;
            }
        }
    });
    if(blean){
    	 return false;
    }
    $a.setAttribute("href",src);
    $a.setAttribute("download", "");
    var evObj = document.createEvent('MouseEvents');
    evObj.initMouseEvent( 'click', true, true, window, 0, 0, 0, 0, 0, false, false, true, false, 0, null);
    $a.dispatchEvent(evObj);
}
