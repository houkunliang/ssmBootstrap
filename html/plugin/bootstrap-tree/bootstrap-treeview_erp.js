/**
 * Created by Administrator on 2016/1/4 0004.
 */

(function(){
     treeGrid=(function(params) {
        var conf = {
            showCheckbox: true,
            showTags: true,
            highlightSelected: false,
            data:{}
        };
        var col=[];
        var options= $.extend(false,conf,params);
        var renderData=function (obj){
            if(typeof(obj)=='string'){
                $.post(obj,{},function(data){return data;},'json');
            }
        };
        //如果不输入Data 可以使用json返回data
        if(options.data==null||options.data==''){
            options.data=renderData(options.renderdata);
        };
        //处理数据
        for(var i=0;i<options.data.length;i++){
            var  treeCol=$.extend(true,options.data[i],options.column);
                if(options.column.id!=null){
                    treeCol.id=options.data[i][options.column.id];
                }
                if(options.column.pid!=null){
                    treeCol.pid=options.data[i][options.column.pid];
                }
            if(treeCol.text!=null&&treeCol.text!=''){
                for(var c in treeCol){
                    if(c==treeCol.text){
                        treeCol.text=treeCol[c];
                    }
                }
            }
            if(treeCol.state!=null){
               for(var o in treeCol.state){
                   if(typeof (o)=='string'){
                       if(options.filter!=null){
                           for(var f in options.filter){
                               if(f==treeCol.state[o]){
                                   var r=eval(options.filter[f](i,treeCol));
                                   if(typeof (r)=='boolean'){
                                       treeCol.state[o]=r;
                                   }
                               }
                           }
                       }else{
                           console.error('not found filter');
                       }
                   }
               }
            }
            treeCol.nodes=[];
            col.push(treeCol);
        };
        var root={name:'root',nodes:[],pid:'-1',id:'0'};
        col.push(root);
        var recursion=function(id,data){
            var rootChild=getRoot(id,data);
            var rootChildren=getRootChild(id,data);
            $(rootChildren).each(function(index,element){
                var node=recursion(rootChildren[index].id,data);
                rootChild.nodes.push(node);
            });
            return rootChild;
        }
        //根据id获取节点对象
            var getRoot=function(id,data){
                var root=[];
                for(var i=0;i<data.length;i++){
                    if(data[i].id!=null&&data[i].id!=''&&data[i].id==id){
                        return data[i];
                    }
                }
                return root;
            }
        //查询id下的所有子节点
        var getRootChild=function(pid,data){
            var rootChild=[];
                    for(var i=0;i<data.length;i++){
                        if(data[i].pid!=null&&data[i].pid!=''&&data[i].pid== pid){
                            rootChild.push(data[i]);
                        }
            }
            return rootChild;
        }

        var treeIns=recursion('0',col);
        options.data=treeIns.nodes;
        $tree=$('#tree').treeview(options);
        $tree.on('nodeChecked', function(event, node) {
            if(node.nodes!=null){
                $(node.nodes).each(function(index,element){
                    $tree.treeview('checkNode', [ element.nodeId, { silent: true } ]);
                });
            }
            if(node.parentId!=null){
                if($tree.treeview('getNode',node.parentId).state.checked==false){
                    $tree.treeview('checkNode', node.parentId );
                    var sibings=$tree.treeview('getSiblings',node.nodeId);
                    $(sibings).each(function(index,element){
                        $tree.treeview('uncheckNode', element.nodeId);
                    });
                }
            }
        });
        $tree.on('nodeUnchecked', function(event, node) {
            if(node.nodes!=null){
                $(node.nodes).each(function(index,element){
                    $tree.treeview('uncheckNode', [ element.nodeId, { silent: true } ]);
                });
            }
        });
    });
})();

