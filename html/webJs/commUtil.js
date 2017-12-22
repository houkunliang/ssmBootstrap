//动态设置 select2 插件格式方法 规定数据 arr格式
function select2Tofromatt(json,key,val){
	var reslutArr=[];
	if(json==null||json==''||json==undefined){
		console.log('检查输入正确的json格式：方法错误！（select2fromatt）');
		return false;
	}	
	if(json.length>0){
		for(var g=0;g<json.length;g++){
			var setJson={};
			setJson['id']=json[g][key];
			setJson['text']=json[g][val];
			reslutArr.push(setJson);
		}
	}
	return reslutArr;
} 

//动态设置 select2 插件格式选项禁止选择的方法 规定数据 arr格式---------zhouliujun
function select2TofromattDisabled(json,key,val,val1,val2){
	var reslutArr=[];
	if(json==null||json==''||json==undefined){
		console.log('检查输入正确的json格式：方法错误！（select2fromatt）');
		return false;
	}	
	if(json.length>0){
		for(var g=0;g<json.length;g++){
			var setJson={};
			setJson['id']=json[g][key];
			setJson['text']=json[g][val];
			if(json[g][val1] != val2){
				setJson['disabled'] = true;
			}
			reslutArr.push(setJson);
		}
	}
	return reslutArr;
} 

//创建 tree 设置类
/*
	调用方案
	var html=new treeMenu(zNodes).init(0);	
	console.log(html)	
*/
function treeMenu(json,keyId,keyName){
	if(json!=undefined&&json!=[]){
		this.tree = json || [];
		this.groups={};
		if(keyId!=undefined&&keyId!=null&&keyId!=''){
			this.keyId = keyId;
		}else{
			return false;
		}

		if(keyName!=undefined&&keyName!=null&&keyName!=''){
			this.keyName = keyName;
		}else{
			return false;
		}
	}else{
		return false;
	}
};

//树形设置
treeMenu.prototype={
    init:function(PARENT_ID){
        this.group();
        return this.getDom(this.groups[PARENT_ID]);
    },
    group:function(){
        for(var i=0;i<this.tree.length;i++){
            if(this.groups[this.tree[i].PARENT_ID]){
                this.groups[this.tree[i].PARENT_ID].push(this.tree[i]);
            }else{
                this.groups[this.tree[i].PARENT_ID]=[];
                this.groups[this.tree[i].PARENT_ID].push(this.tree[i]);
            }
        }
    },
/*    getDom:function(a){
        if(!a){return ''}
        var html='\n<ul >\n';
        for(var i=0;i<a.length;i++){
            html+='<li><a href="#">'+a[i].name+'</a>';
            html+=this.getDom(this.groups[a[i].id]);
            html+='</li>\n';
        };
        html+='</ul>\n';
        return html;
    }*/
    getDom:function(json){
        if(!json){return ''}
    	var obj=[];
        for(var i=0;i<json.length;i++){
        	obj.push({id:json[i][this.keyId],text:json[i][this.keyName],children:this.getDom(this.groups[json[i][this.keyId]])})
        };
        return obj;
    }
};

/*function selectTreeInit(json,val,name,id){
	alert(json);
	if(json==null||json==''||json==undefined){
		console.log('检查输入正确的json格式：方法错误！（select2fromatt）');
		return false;
	}	
	if(json.length>0){
		for(var z=0;z<json.length;z++){
			var val = json[z][val],pId = json[z].PARENT_ID,name=json[g][name]
			var text = '<option value="'+val+'" parent="'+pId+'">'+name+'</option>';
			$(id).append(text);
		}
	}
}*/

function selectTreeInit(json,vals,names,id,setId){
	if(json==null||json==''||json==undefined){
		console.log('检查输入正确的json格式：方法错误！（select2fromatt）');
		return false;
	}	
	if(json.length>0){
		for(var z=0;z<json.length;z++){
			var val = json[z][vals],pId = json[z].PARENT_ID,name=json[z][names]
			var text  = '<option value="'+val+'" parent="'+pId+'"';
					if(val!=undefined&&val==setId){
						text += 'selected="selected"';
					}
					text += '>'+name+'</option>';
			$(id).append(text);
		}
	}
}

function selectTreeInitDisb(json,disKey,disVal,vals,names,id,setId){
	if(json==null||json==''||json==undefined){
		console.log('检查输入正确的json格式：方法错误！（selectTreeInitDisb）');
		return false;
	}	
	if(json.length>0){
		for(var z=0;z<json.length;z++){
			var val = json[z][vals],pId = json[z].PARENT_ID,name=json[z][names]
			var text  = '<option value="'+val+'" parent="'+pId+'"';
				if(val!=undefined&&val==setId){
					text += 'selected="selected"';
				}
				if(disKey != undefined && disKey != null && disKey != ''){
					if(json[z][disKey] == disVal){
						text += 'disabled=""';
					}
				}
				text += '>'+name+'</option>';
			$(id).append(text);
		}
	}
}

function selectInit(json,vals,names,id,select){
	if(json==null||json==''||json==undefined){
		console.log('检查输入正确的json格式：方法错误！（select2fromatt）');
		return false;
	}	
	if(json.length>0){
		var arry ='';
		for(var z=0;z<json.length;z++){
			var val = json[z][vals],name=json[z][names];
			var text  = '<option value="'+val+'"';
			if(val!=undefined&&val==select){
				text += 'selected="selected"';
			}
				text += '>'+name+'</option>';
			arry+=text;
		}
		$(id).html(arry);
	}
}

//获取当前时间
function getNowTime(){
	var dt = new Date();
	var month = dt.getMonth()+1;
	var day = dt.getDate();
	var time = dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
	return dt.getFullYear() + '-' + (month<10 ? '0' : '') + month + '-' + (day<10 ? '0' : '') + day + ' ' + time; 
}
//获取昨天的日期
function getYesterday(){
	var dt = new Date();
	var year = dt.getFullYear();
	var month = dt.getMonth()+1;
	var day = dt.getDate();
	return year + '-' + (month<10 ? '0' : '') + month + '-' + (day<10 ? '0' : '') + day + " 00:00:00"; 
}
//获取今天的日期时分
function getToday(){
	var dt = new Date();
	var year = dt.getFullYear();
	var month = dt.getMonth()+1;
	var day = dt.getDate();
	return year + '-' + (month<10 ? '0' : '') + month + '-' + (day<10 ? '0' : '') + day+ " 23:59:59"; 
}

//获取当前年月
function getYearMouth(){
	var dt = new Date();
	var year = dt.getFullYear();
	var month = dt.getMonth()+1;
	return year + '-' + (month<10 ? '0' : '') + month; 
}

//获取本周一日期
function getCurrentMonday(){
	var dt = new Date();
	var week = dt.getDay();
	var millisecond = 1000 * 60 * 60 * 24; 
	var minusDay = week != 0 ? week - 1 : 6;
	//本周 周一    
    var monday = new Date(dt.getTime() - (minusDay * millisecond));  
	return monday.getFullYear() + '-' +((monday.getMonth()+1)<10?"0":"")+ (monday.getMonth()+1) + '-' +(monday.getDate()<10?"0":"")+ monday.getDate()+ " 00:00:00"; 
}

//获取本周末日期
function getCurrentSunday(){
	var dt = new Date();
	var week = dt.getDay();
	var millisecond = 1000 * 60 * 60 * 24; 
	var minusDay = week != 0 ? week - 1 : 6;
	//本周 周一    
    var monday = new Date(dt.getTime() - (minusDay * millisecond));  
	//本周 周日    
    var sunday = new Date(monday.getTime() + (6 * millisecond)); 
	return  sunday.getFullYear() + '-' +((sunday.getMonth()+1)<10?"0":"")+ (sunday.getMonth()+1) + '-' +(sunday.getDate()<10?"0":"")+ sunday.getDate()+ " 23:59:59"; 
}

//获取本月一日
function getCurrentMonthFirst(){
	var dt = new Date();
	var currentYear = dt.getFullYear();
	var currentMonth = dt.getMonth();
	var firstDay = new Date(currentYear, currentMonth, 1);
	return firstDay.getFullYear() + '-' + ((firstDay.getMonth()+1)<10?"0":"")+(firstDay.getMonth()+1) + '-' +(firstDay.getDate()<10?"0":"")+ firstDay.getDate()+ " 00:00:00"; 
}
//获取本月最后一日
function getCurrentMonthLast(){
	var dt = new Date();
	var currentYear = dt.getFullYear();
	var currentMonth = dt.getMonth();
	var firstDay = new Date(currentYear, currentMonth, 1);
	var millisecond = 1000 * 60 * 60 * 24;
	var nextMonthDayOne = new Date(currentYear, currentMonth + 1, 1);
	var lastDay = new Date(nextMonthDayOne.getTime() - millisecond);  
	return lastDay.getFullYear() + '-' +((lastDay.getMonth()+1)<10?"0":"")+ (lastDay.getMonth()+1) + '-' +(lastDay.getDate()<10?"0":"")+lastDay.getDate()+" 23:59:59"; 
}

