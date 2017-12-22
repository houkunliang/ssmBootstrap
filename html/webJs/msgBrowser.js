//时间属性 开始queryStartDt  结束queryEndDt

if (window.Notification) {
	Notification.requestPermission(function(status){
        if(Notification.permission !== status){
            Notification.permission = status;
        }
    });
} else {
    alert('浏览器不支持Notification');    
}

function MsgBrowser(){
	this.alert=function(title,body,icon){
		if (Notification.permission == "granted") {
           	this.content(title,body,icon);
        } else if (Notification.permission != "denied") {
            Notification.requestPermission(function (permission) {
              this.content(title,body,icon);
            });
        }
	}

	this.content=function(titles,bodys,icons){
			if (Notification.permission == "granted") {
            var notification = new Notification(titles, {
            	lang :'utf-8',
                body: bodys,
                icon: icons
            });
            notification.onclick = function() {
            	//弹出框回调事件
                notification.close();    
            };
        }
	}

}

var msgBrowser=new MsgBrowser();