app.factory('ComponentBiz',['$http',function($http){
    return {
    	query:function(page,count){
    		return $http.get("component/find/"+page+"/"+count);
    	},
    	save:function(component){
    		return $http.post("component/save",component);
    	},
    	remove:function(id){
    		return $http.post("component/remove/"+id);
    	},
    	get:function(id){
    		return $http.get("component/get/"+id);
    	},
    	find:function(comp){
    		return $http.post("component/query",comp);
    	},
    	simple:function(){
    		return $http.get("component/simple");
    	},
    	getStock:function(id){
    		return $http.get("stock/get/"+id);
    	},
    	pages:function(comp){
    		return $http.post("component/count",comp);
    	},
    	getmoney:function(money){
    		return $http.post("component/money",money);
    	}
    }
}]);

app.controller('ComponentCtrl',['$scope','$timeout','$location','ComponentBiz','FactoryBiz','CategoryBiz',function($scope,$timeout,$location,ComponentBiz,FactoryBiz,CategoryBiz){
	$scope.component = {
		id:'0',cid:'0',fid:0,code:'',name:'',price:'0.00',sale:'0.00',term:'',warning:'10'
	}
	
	$scope.comp = {
		cid:'0',page:1,count:10
	}
	$scope.remove = function(){}
	$scope.dialog = function(id){
		$("#confirm").modal('show');
		$("#confirm-ok").click(function(){
			if(id>0){
				var p1 = ComponentBiz.get(id);
				p1.success(function(ps){
					if(ps.stocks!=null && ps.stocks.length>0){
						$scope.show = true;
						$scope.message = "该配件库存非空，不允许删除！";
						$scope.isok = false;
						$timeout(function(){
							$scope.message = '';
							$scope.show = false;
						},3000);
					}else{
						var p = ComponentBiz.remove(id);
						p.success(function(data){
							$scope.show = true;
							if(data){
								$scope.message = "配件信息删除成功！";
								$scope.isok = true;
								$scope.query($scope.page);
							}else{
								$scope.message = "配件信息删除失败！";
								$scope.isok = false;
							}
							$timeout(function(){
								$scope.message = '';
								$scope.show = false;
							},3000);
						});
					}
				});
			}
		});
	}
	
	$scope.getComponentId = function(id){
		$scope.componentid = id;
	}
	
	$scope.getFactorys = function(){
		var p = FactoryBiz.query(1,100);
		p.success(function(data){
			$scope.factorys = data;
			$scope.factorys.unshift({id:0,name:'请选择供应商'});
		});
	}

	$scope.get = function(){
		var id = $location.search().id;
		if(id>0){
			var p = ComponentBiz.get(id);
			p.success(function(data){
				$scope.component = data;
			});
		}
	}
	
	$scope.page = 1;
	$scope.find = function(page){
		if($scope.comp.name==undefined){
			$scope.comp.name = "";
		}
		$scope.comp.page = page;
		var p1 = ComponentBiz.find($scope.comp);
		var p2 = ComponentBiz.pages($scope.comp);
		p2.success(function(pc){
			$scope.pagecount = pc;
			p1.success(function(data){
				$scope.showpages = true;
				$scope.components = data;
				$scope.pages = [];
				if($scope.page<5 || $scope.pagecount<5){
					for(i=0;i<5 && i<$scope.pagecount;i++){
						$scope.pages[i] = (i+1);
					}
				}else if($scope.page>=5 && $scope.page<$scope.pagecount-5){
					for(j=0,i=$scope.page;i<=$scope.page+5 && j<5;i++,j++){
						$scope.pages[j] = i;
					}
				}else{
					for(j=0,i=$scope.pagecount-4;i<=$scope.pagecount;i++,j++){
						$scope.pages[j] = i;
					}
				}
			});
		});
	}
	
	
	$scope.query = function(page){
		$scope.page = page;
		var p1 = ComponentBiz.query($scope.page,10);
		var p2 = ComponentBiz.pages($scope.comp);
		p2.success(function(pc){
			$scope.pagecount = pc;
			p1.success(function(data){
				$scope.showpages = true;
				$scope.components = data;
				$scope.pages = [];
				if($scope.page<5 || $scope.pagecount<5){
					for(i=0;i<5 && i<$scope.pagecount;i++){
						$scope.pages[i] = (i+1);
					}
				}else if($scope.page>=5 && $scope.page<$scope.pagecount-5){
					for(j=0,i=$scope.page;i<=$scope.page+5 && j<5;i++,j++){
						$scope.pages[j] = i;
					}
				}else{
					for(j=0,i=$scope.pagecount-4;i<=$scope.pagecount;i++,j++){
						$scope.pages[j] = i;
					}
				}
			});
		});
	}
	
	$scope.stockmoney = function(){
		var money = {cname:null};
		if($scope.cname!="请选择配件类别"){
			var money = {cname:$scope.cname};
		}
		var p = ComponentBiz.getmoney(money);
		p.success(function(data){
			$scope.moneys = data;
			$scope.sumb = 0;
			$scope.suma = 0;
			var names = new Array();
			var qs = new Array();
			var ms = new Array();
			$.each($scope.moneys,function(i,q){
				$scope.suma+=q.quantity;
				$scope.sumb+=q.price;
				names.push(q.name);
				qs.push(q.quantity);
				ms.push(q.price);
			});
			
			var myChart = echarts.init(document.getElementById('cmChart'));
			option = {
				    title : {
				        text: '配件库存价值统计图'
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				        data:['库存量','价值']
				    },
				    toolbox: {
				        show : true,
				        feature : {
				        	dataZoom: {},
				            magicType : {show: true, type: ['line', 'bar']},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    calculable : true,
				    xAxis : [
				        {
				            type : 'category',
				            data : names
				        }
				    ],
				    yAxis : [
				        {
				            type : 'value'
				        }
				    ],
				    series : [
				        {
				            name:'库存量',
				            type:'bar',
				            data:qs,
				            markPoint : {
				                data : [
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				            markLine : {
				                data : [
				                    {type : 'average', name: '平均值'}
				                ]
				            }
				        },
				        {
				            name:'价值',
				            type:'bar',
				            data:ms,
				            markPoint : {
				                data : [
				                    {type : 'min', name: '最小值'}
				                ]
				            },
				            markLine : {
				                data : [
				                    {type : 'average', name : '平均值'}
				                ]
				            }
				        }
				    ]
				};

			myChart.setOption(option);
			
		});
	}

	$scope.getCategorys = function(){
		var p = CategoryBiz.query(1,100);
		p.success(function(data){
			$scope.categorys = data;
			$scope.categorys.unshift({id:'0',name:'请选择配件类别'});
			$scope.cname = '请选择配件类别';
		});
	}

	$scope.cancel = function(){
		$scope.component = {
			id:'0',cid:'0',fid:0,code:'',name:'',price:'0.00',sale:'0.00',term:'',warning:'10'
		}
	}

	$scope.save = function(){
		var reg = /^[\S]{2,20}$/;
		if(!reg.test($scope.component.code)){
			$scope.msg = "配件编号至少由2个字符组成";
			$scope.isok = true;
			return;
		}else{
			$scope.msg = "";
			$scope.isok = false;
		}
		
		if(!reg.test($scope.component.name)){
			$scope.msg = "配件名称至少由2个字符组成";
			$scope.isok = true;
			return;
		}else{
			$scope.msg = "";
			$scope.isok = false;
		}

		if($scope.component.cid<1){
			$scope.msg = "请选择配件类别";
			$scope.isok = true;
			return;
		}else{
			$scope.msg = "";
			$scope.isok = false;
		}

		var regPrice = /^[0-9]{1,7}\.?[0-9]{0,2}$/;
		if(!regPrice.test($scope.component.price)){
			$scope.msg = "配件进价必须为数字（两位小数）";
			$scope.isok = true;
			return;
		}else{
			$scope.msg = "";
			$scope.isok = false;
		}
		if(!regPrice.test($scope.component.sale)){
			$scope.msg = "配件售价必须为数字（两位小数）";
			$scope.isok = true;
			return;
		}else{
			$scope.msg = "";
			$scope.isok = false;
		}
		if($scope.component.fid<1){
			$scope.component.fid = undefined;
		}

		if(!reg.test($scope.component.term)){
			$scope.msg = "配件质保期至少由2个字符组成";
			$scope.isok = true;
			return;
		}else{
			$scope.msg = "";
			$scope.isok = false;
		}

		if(!$scope.isok){
			var p = ComponentBiz.save($scope.component);
			p.success(function(data){
				$scope.isok = true;
				if(data!=null){
					$scope.component = data;
					$(".cid").val($scope.component.id);
					$scope.msg = "配件信息保存成功！";		
				}else{
					$scope.msg = "配件信息保存失败，请重试！";
				}
				$timeout(function(){
					$scope.isok = false;
				},1000);
			});
		}
	}
	
}]);