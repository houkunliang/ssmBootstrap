function RootButton(){
    this.add = false;
    this.update=false;
    this.deleted=false;

    this.setRootButton=function(arr){
    	if(arr != null && arr!='' && arr != undefined){
    		for(var i=0;i<arr.length;i++){
    			if(arr[i].CODE=='add'){
    				this.add=true;
    			}else if(arr[i].CODE=='update'){
    				this.update=true;
    			}else if(arr[i].CODE=='deleted'){
    				this.deleted=true;
    			}
    		}
    	}
    }

    this.lode=function(){
    	    this.add = false;
		    this.update=false;
		    this.deleted=false;
    }

    this.setRootAll=function(){
    	this.add = true;
	    this.update=true;
	    this.deleted=true;
    }

    this.filterDom=function(){
    	var adds=this.add;
    	var updates=this.update;
    	var deleteds=this.deleted;
    	$("[rootButton]").each(function () {
			var str=$(this).attr("rootButton");
			if(!adds){
				if(str == 'add'){
					$(this).remove();
				}
			}
			if(!updates){
				if(str == 'update'){
					$(this).remove();
				}
			}
			if(!deleteds){
				if(str == 'deleted'){
					$(this).remove();
				}
			}
		});
    }

}

var rootButton=new RootButton();