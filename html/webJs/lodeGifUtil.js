function LodeGifUtil(){
	this.gif='<div id="lodeGifDom" style="position:absolute;top:0px;width:100%;height:100%;display:none;background:white;z-index:10000"><center style="margin-top:10%"><img alt="" width="500" id="hedaImg" src="/img/LG.gif" /></center></div>';

	this.gifInit=function(){
		$('body').append(this.gif);
	}

	this.hide=function(){
		$('#lodeGifDom').css("display","none");
	}

	this.show=function(){
		$('#lodeGifDom').css("display","block");
	}

	this.appendDiv=function(){
		$('#contAppend').html(this.gif);
	}

	this.remove=function(){
		$('#contAppend').remove();
	}
}
var lodeGifUtil=new LodeGifUtil();
