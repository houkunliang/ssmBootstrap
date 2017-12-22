function UrlObj(){
	//this.ip="192.168.1.20:8080/creba"
	//this.ip="192.168.2.100:8080/creba"
	this.ip="192.168.0.199:8080/OA_ONE";
	this.url="http://"+this.ip;
	this.wsUrl = "ws://"+this.ip;
	
	//统一提交的 json数据
	this.token=$.cookie("token");
	
	this.getTokenObj=function(){
		var tokenObj=JSON.parse(this.token);
		return tokenObj;
	}
	
	this.getSocket=function(){
		if(this.token!='null'&&this.token!=null&&this.token!=null&&this.token!=undefined){
			var tokenObj=JSON.parse(this.token);
			//sendSocket.replace(/\//g, "#")
			var img=tokenObj.USER_HEADIMG!=null&&tokenObj.USER_HEADIMG!=''?(tokenObj.USER_HEADIMG).replace(/\//g, "~"):"undefined";
			var webSocket=this.wsUrl+"/websocket/"+tokenObj.ID+"/"+tokenObj.USER_NAME+"/"+img;
			return webSocket;
		}
	}
	
	this.getMsgSocket=function(){
		if(this.token!='null'&&this.token!=null&&this.token!=null&&this.token!=undefined){
			var getMsgSocketUrl=this.wsUrl+"/msgWebsocket/"+this.getJson().token.ID;
			return getMsgSocketUrl;
		}
	}
	
	//上传接口
	this.uplod=this.url+"/uplodUtil";
	this.ckUplod=this.url+"/ckUplodUtil";
	this.ckCopyImg=this.url+"/ckCopyImg";
	this.uplodWorde=this.url+"/uplodWordUtil";
	//上传路径
	this.uplodPhotos="pictureResources/photos";
	this.uplodVideo="pictureResources/video";
	//资源路径
	this.uplodResources = "pictureResources/resources";
	//word图片路径
	this.wordImgUrl=this.url+"/pictureResources/PDF";
	//登陆
	this.login=this.url+"/login/login";
	//用户列表
	this.userList=this.url+"/user/queryUserAll";
	//通用查询char模块工具类
	this.setCharUtileAction=this.url+"/statistics/charUtile";
	//查询当前用户左侧统计模块
	this.leftCharsUrl=this.url+"/statistics/queryUserToOperateNum";
	//当前用户下所有的菜单
	this.rootMenu=this.url+"/user/userRootToMenu";
	//当前用户可操作的权限
	this.rootButAction=this.url+"/menu/userToRooleButton";
	//根据当前用户查询统计功能列表出来
	this.setCharAction=this.url+"/stats/userToCharSet";
	//菜单管理
	this.menuJson=this.url+"/menu/queryMenuAll";
	//区域化管理
	this.regionList=this.url+"/region/queryRegionAll";
	//角色列表展示管理
	this.roleList=this.url+"/role/queryRoleAll";
	//部门列表
	this.dplist=this.url+"/department/queryDepartmentAll";
	// 字典列表
	this.dictionaryList=this.url+"/dictionary/queryDictionary";
	// 消息通知列表
	this.messageNotifyList=this.url+"/messageNotify/queryMessageNotify";

	//通用统计
	this.statsList=this.url+"/stats/query";

	//信息发布列表
	this.msg=this.url+"/msg/queryUserAll";

	//资源链接
	this.resources=this.url+"/resources/selectByList";
	
	//模板管理
	this.template=this.url+"/template/selectByList";

	//题库列表
	this.questionList=this.url+"/template/selectByQuestionList";
	
	this.getJson=function(){
		if(this.token!=undefined&&this.token!=null){
			return {"token":JSON.parse(this.token)};
		}	
		return null;
	}
}

var urlObj=new UrlObj();