initCharRoot();

var testJson = [
  {	
  	"TYPE": "column",
    "DESCRIBE": "收到简历,邀约次数,预约上门次数",
    "ORD_NO": "0",
    "DATA": [
      {
      	"date": "2017-05-05",
        "row_1": "1",
        "row_2": "2",
        "row_3": "3"
      },
      {
        "date": "2017-05-06",
        "row_1": "4",
        "row_2": "5",
        "row_3": "6"
      }
    ]
  }
];

function initCharRoot(){
	var userId = urlObj.getJson().token.ID;
	if(userId!=undefined){
		var json={};
		json['USER_ID']=userId;
		json['ROLE_ID']=getLoginUserRoleId();
		var resuleJson=commAjaxPost(urlObj.setCharAction,json);//获取当前用户所有的查询
		//console.log(resuleJson);
		if(resuleJson != null && resuleJson != '' && resuleJson != undefined && resuleJson !='list is null'){
			ecCharDiv(resuleJson);
		}
	}
}

function getLoginUserRoleId(){
	
	
	return false;
}

function ecCharDiv(resuleJson){
	console.log(resuleJson);
	var arrColum=[];
	for(x in resuleJson){
		if(resuleJson[x].TYPE == 'line'){
			//$("#appendDivChar").after(getUrl("/function/util/GeneralManager/lineChar.html"));
		}else if(resuleJson[x].TYPE == 'leftCharts'){
			//$("#appendDivChar").after(getUrl("/function/util/GeneralManager/leftChar.html"));
			//leftCharTest(resuleJson);
		}else if(resuleJson[x].TYPE == 'column'){
			$("#appendDivChar").after(getUrl("/function/util/GeneralManager/columnChar.html"));
			var eCharUtil=new ECharUtil();
			arrColum.push(eCharUtil);
		}
	}
	for(x in arrColum){
		redyShadowOption(arrColum[x],resuleJson).shadowEchar('shadowOption');
	}
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
		redyLineOption(eCharUtil,data[0].lineChar).lineEchar('lineChar');
	}

	if(data[0].picChar != null && data[0].picChar !='' && data[0].picChar != undefined){
		var eCharUtil2=new ECharUtil();
		redyShadowOption(eCharUtil2,data[0].picChar).shadowEchar('shadowOption');
	}
}

function leftCharTest(resuleJson){
		var leftChartsJson=urlObj.getJson();
		leftChartsJson['USER_ID']=leftChartsJson.token.ID;
		var titles='';
		var titleArr=[];
		if(resuleJson != null && resuleJson != undefined && resuleJson != 'list is null'){
			for(c in resuleJson){
				if(resuleJson[c].TYPE=='leftCharts'){
					leftChartsJson['ID']=resuleJson[c].ID;
					titles=resuleJson[c].DESCRIBE;
				}
			}
		}
		titleArr=titles.split(",");
		$('#title1').append(titleArr[0]);
		$('#title2').html(titleArr[1]);
		var resuleLeftCharJson=commAjaxPost(urlObj.setCharUtileAction,leftChartsJson);
		console.log(resuleLeftCharJson)
		var strsArr = new Array();
		var contentNumber=0;
		var contentNumber2=0;
		if(resuleLeftCharJson != null && resuleLeftCharJson != undefined && resuleLeftCharJson!='list is null'){
			for(c in resuleLeftCharJson){
				contentNumber+=parseInt(resuleLeftCharJson[c].counts);
			}
		}
		$('#resumeNum').html(contentNumber);
		if(resuleLeftCharJson[0] == undefined || resuleLeftCharJson[0] == '' || resuleLeftCharJson[0] == null){
			$('#invitation').html(0);
		}else{
			$('#invitation').html(resuleLeftCharJson[0].nuber);
		}
		$('#resumeNum').html(contentNumber);											
		if(resuleLeftCharJson != null && resuleLeftCharJson != undefined && resuleLeftCharJson != 'list is null'){
			$('#leftPicChar').html("");
			for(x in resuleLeftCharJson){
				var percent=0;
				if(parseInt(contentNumber) != 0){
					percent=(parseInt(resuleLeftCharJson[x].counts)/parseInt(contentNumber))*100;
				}
				var setPercent=isNaN(percent)?0:percent;
				var domChar='<div class="col-md-4 text-center">';
					domChar+='<div id="dash_pie_'+x+'" class="piechart" data-percent="'+setPercent+'">';
					domChar+='<span class="percent"></span>';												
					domChar+='</div>';											
					domChar+='<a href="#" class="title">'+resuleLeftCharJson[x].NAME+'('+resuleLeftCharJson[x].counts+')</a>';														
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
	var leftChartsJson=urlObj.getJson();
		leftChartsJson['USER_ID']=leftChartsJson.token.ID;
	if(resuleJson != null && resuleJson != undefined && resuleJson != 'list is null'){
		for(c in resuleJson){
			if(resuleJson[c].TYPE=='column'){
				leftChartsJson['ID']=resuleJson[c].ID;
				titles=resuleJson[c].DESCRIBE;
			}
		}
	}
	var titleArr=titles.split(",");
	//$('#title1').append(titleArr[0]);
	//$('#title2').html(titleArr[1]);
	var data=commAjaxPost(urlObj.setCharUtileAction,leftChartsJson);
	console.log(1);
	console.log(data);
	eCharUtil.shadowOption.xAxis.data=dateJs;
	eCharUtil.shadowOption.legend.data=["收到简历","邀约次数","预约上门次数"];
	//var data=resuleJson;
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