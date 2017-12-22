
initCharRoot();

function initCharRoot(){
	var url=urlObj.url+"/resumeInvitation/queryDpUserStats"
	var json=urlObj.getJson();
	json['USER_ID'] = json.token.ID;
	json['ROLE_ID'] = json.token.ROLE_ID;
	var data=commAjaxPost(url,json);
	if(data[0].leftChar != null && data[0].leftChar !='' && data[0].leftChar != undefined){
		leftCharTest(data[0].leftChar);
	}
	
	if(data[0].lineChar != null && data[0].lineChar !='' && data[0].lineChar != undefined){
		redyLineOption(eCharUtil,data[0].lineChar).lineEchar('lineChar');;
	}

	if(data[0].picChar != null && data[0].picChar !='' && data[0].picChar != undefined){
		var eCharUtil2=new ECharUtil();
		redyShadowOption(eCharUtil2,data[0].picChar).shadowEchar('shadowOption');
	}

	var setUserList=data[0].userList;
	var setDom="";
	if(setUserList != null && setUserList !='' && setUserList != undefined){
		for(c in setUserList){
			setDom+=addUserList(setUserList[c].ID,setUserList[c].USER_NAME);
		}
	}
	$("#myButton").append(setDom);
}

function addUserList(id,name){
	var dom='<label class="btn btn-primary"  onclick="subQueryMe(this);">'
		dom+='<input type="radio" name="options"  value="'+id+'" checked > '+name
		dom+='</label>'
	return dom;
}

function subQueryMe(obj){
	var url=urlObj.url+"/resumeInvitation/queryUserStats"
	var json=urlObj.getJson();
	json['USER_IDS'] = $(obj).children('input').val();
	var data=commAjaxPost(url,json);
	if(data[0] != null && data[0] !='' && data[0] != undefined){
		leftCharTest(data[0].leftChar);
	}
	
	if(data[0] != null && data[0].lineChar !='' && data[0] != undefined){
		redyLineOption(eCharUtil,data[0].lineChar).lineEchar('lineChar');;
	}

	if(data[0] != null && data[0] !='' && data[0] != undefined){
		var eCharUtil2=new ECharUtil();
		redyShadowOption(eCharUtil2,data[0].picChar).shadowEchar('shadowOption');
	}
}

function queryAllChar(){
	var url=urlObj.url+"/resumeInvitation/queryDpUserStats"
	var json=urlObj.getJson();
	json['USER_ID'] = json.token.ID;
	var data=commAjaxPost(url,json);
	if(data[0].leftChar != null && data[0].leftChar !='' && data[0].leftChar != undefined){
		leftCharTest(data[0].leftChar);
	}
	
	if(data[0].lineChar != null && data[0].lineChar !='' && data[0].lineChar != undefined){
		redyLineOption(eCharUtil,data[0].lineChar).lineEchar('lineChar');;
	}

	if(data[0].picChar != null && data[0].picChar !='' && data[0].picChar != undefined){
		var eCharUtil2=new ECharUtil();
		redyShadowOption(eCharUtil2,data[0].picChar).shadowEchar('shadowOption');
	}
}

function leftCharTest(resuleJson){
		var resuleLeftCharJson=resuleJson;
		/*var resuleLeftCharJson=commAjaxPost(urlObj.leftCharsUrl,leftChartsJson);*/
		var contentNumber=0;
		var contentNumber2=0;
		if(resuleLeftCharJson != null && resuleLeftCharJson != undefined && resuleLeftCharJson!='list is null'){
			for(c in resuleLeftCharJson){
				if(resuleLeftCharJson[c].NAME=='收到的简历'){
					contentNumber=resuleLeftCharJson[c].number;
				}
				if(resuleLeftCharJson[c].NAME=='邀约比例'){
					contentNumber2=resuleLeftCharJson[c].number;
				}
			}
		}
		$('#resumeNum').html(contentNumber);
		$('#invitation').html(contentNumber2)											
		if(resuleLeftCharJson != null && resuleLeftCharJson != undefined && resuleLeftCharJson != 'list is null'){
			$('#leftPicChar').html("");
			for(x in resuleLeftCharJson){
				var percent=0;
				if(parseInt(contentNumber) != 0){
					percent=(parseInt(resuleLeftCharJson[x].number)/parseInt(contentNumber))*100;
				}
				var setPercent=isNaN(percent)?0:percent;
				var domChar='<div class="col-md-4 text-center">';
					domChar+='<div id="dash_pie_'+x+'" class="piechart" data-percent="'+setPercent+'">';
					domChar+='<span class="percent"></span>';												
					domChar+='</div>';											
					domChar+='<a href="#" class="title">'+resuleLeftCharJson[x].NAME+'('+resuleLeftCharJson[x].number+')</a>';														
					domChar+='</div>';	
				$('#leftPicChar').append(domChar);
			}
			var index=resuleLeftCharJson.length;
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


function redyShadowOption(eCharUtil,resuleJson){
	var dateJs=dateArr();
	eCharUtil.shadowOption.xAxis.data=dateJs;
	eCharUtil.shadowOption.legend.data=["收到简历","邀约次数","预约上门次数"];
	var data=resuleJson;
	var setDataArr=[];
	var setJson={};
	var contetNumberArrs=[];
	var distNumberArrs=[];
	var optionNumberArrs=[];
	if(data != null && data != '' && data != undefined){
		for(m in dateJs){
			var flag=true;
			for(h in data){
				if(dateJs[m] == data[h].date){
					contetNumberArrs.push(data[h].contetNumber);
					distNumberArrs.push(data[h].phoneNumber);
					optionNumberArrs.push(data[h].backNumber);
					flag=false;
				}
			}
			if(flag){
				contetNumberArrs.push(0);
				distNumberArrs.push(0);
				optionNumberArrs.push(0);
			}
		}
	}
	setJson['name']='收到简历';
	setJson['type']='bar';
	setJson['smooth']='smooth';
	setJson['data']=contetNumberArrs;
	setDataArr.push(setJson);
	setJson={}
	setJson['name']='邀约次数';
	setJson['type']='bar';
	setJson['smooth']='smooth';
	setJson['data']=distNumberArrs;
	setDataArr.push(setJson);
	setJson={}
	setJson['name']='预约上门次数';
	setJson['type']='bar';
	setJson['smooth']='smooth';
	setJson['data']=optionNumberArrs;
	setDataArr.push(setJson);
	setJson={}
	eCharUtil.shadowOption.series=setDataArr;
	return eCharUtil;
}

function redyLineOption(eCharUtil,resuleJson){
	var dateJs=dateArr();
	eCharUtil.lineOption.xAxis.data=dateJs;
	eCharUtil.lineOption.legend.data=["收到简历","邀约次数","预约上门次数"];
	var data=resuleJson;
	var setDataArr=[];
	var setJson={};
	var contetNumberArrs=[];
	var distNumberArrs=[];
	var optionNumberArrs=[];
	if(data != null && data != '' && data != undefined){
		for(m in dateJs){
			var flag=true;
			for(h in data){
				if(dateJs[m] == data[h].date){
					contetNumberArrs.push(data[h].contetNumber);
					distNumberArrs.push(data[h].phoneNumber);
					optionNumberArrs.push(data[h].backNumber);
					flag=false;
				}
			}
			if(flag){
				contetNumberArrs.push(0);
				distNumberArrs.push(0);
				optionNumberArrs.push(0);
			}
		}
	}
	setJson['name']='收到简历';
	setJson['type']='line';
	setJson['smooth']='smooth';
	setJson['data']=contetNumberArrs;
	setDataArr.push(setJson);
	setJson={}
	setJson['name']='邀约次数';
	setJson['type']='line';
	setJson['smooth']='smooth';
	setJson['data']=distNumberArrs;
	setDataArr.push(setJson);
	setJson={}
	setJson['name']='预约上门次数';
	setJson['type']='line';
	setJson['smooth']='smooth';
	setJson['data']=optionNumberArrs;
	setDataArr.push(setJson);
	setJson={}
	eCharUtil.lineOption.series=setDataArr;
	return eCharUtil;
}

function dateArr(){
	var dateArr=[];
	for(var i=6;i>=0;i--){
		if(i == 0){
			var date = new Date();
		}else{
			var date = new Date(new Date().getTime() - i*86400000);
		}
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var day = date.getDate();
		if(month<10){
			month='0'+month
		}
		if(day<10){
			day='0'+day
		}
		var dateStr=(year + '-' + month + '-' + day);
		dateArr.push(dateStr);
	}
	return dateArr;
/*	var yesterdsay = new Date(new Date().getTime() - 86400000);
	var year = yesterdsay.getFullYear();
	var month = yesterdsay.getMonth() + 1;
	var day = yesterdsay.getDate();
	alert(year + '-' + month + '-' + day);*/
}