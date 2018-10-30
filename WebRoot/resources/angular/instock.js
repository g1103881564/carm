app.factory('InstockBiz',['$http',function($http){
    return {
		pages:function(condition){
			return $http.post("instock/count",condition);
		},
    	query:function(condition){
			return $http.post("instock/find",condition);
		},
		save:function(stock){
			return $http.post("instock/save",stock);
		},
		remove:function(id){
			return $http.get("instock/remove/"+id);
		},
		add:function(stock){
			return $http.post("instock/add",stock);
		},
		monthstate:function(month){
    		return $http.get("instock/month/"+month);
    	},
    	yearstate:function(year){
    		return $http.get("instock/year/"+year);
    	}
    };
}]);

app.controller('InstockCtrl',['$scope','$timeout','$location','InstockBiz','ComponentBiz','FactoryBiz','CategoryBiz',function($scope,$timeout,$location,InstockBiz,ComponentBiz,FactoryBiz,CategoryBiz){
	$scope.cgid='0';
	$scope.stock = {fid:'0',cid:'0',indate:new Date()}
	$scope.cancel = function(){
		$("#tags").val('');
		$scope.cgid = '0';
		$scope.stock = {fid:'0',cid:'0',price:undefined,sale:undefined,quantity:undefined,size:undefined,indate:new Date()};
	}
	
	$scope.years = new Array();
	$scope.getYears = function(){
		$scope.years.push({id:0,name:'\u8BF7\u9009\u62E9\u5E74\u4EFD'});
		for(i=2017;i<=2027;i++){
			$scope.years.push({id:i,name:i});
		}
		$scope.stateyear = 0;
	}
	
	$scope.statemonth = new Date();
	$scope.moneystate = function(){
		if($scope.stateyear>0){
			var p = InstockBiz.yearstate($scope.stateyear);
			p.success(function(data){
				$scope.stocks = data;
				if($scope.stocks!=null){
					$scope.suma = 0;
					$scope.sumb = 0;
					$.each($scope.stocks,function(i,r){
						$scope.suma+=r.price;
						$scope.sumb+=r.quantity;
					});
				}
			});
		}else if($scope.statemonth!=null){
			var m = $scope.statemonth.getFullYear()+'-'+($scope.statemonth.getMonth()+1);
			var p = InstockBiz.monthstate(m);
			p.success(function(data){
				$scope.stocks = data;
				if($scope.stocks!=null){
					$scope.suma = 0;
					$scope.sumb = 0;
					$.each($scope.stocks,function(i,r){
						$scope.suma+=r.price;
						$scope.sumb+=r.quantity;
					});
				}
			})
		}
	}
	$scope.moneystate();
	$scope.cancelquery = function(){
		$scope.cond = {fid:'0',page:1,count:10};
		$scope.query(1);
	}
	
	$scope.cond = {fid:'0',page:1,count:10};
	$scope.query = function(page){
		$scope.cond.page = page;
		$scope.cond.count = 10;
		var p2 = InstockBiz.pages($scope.cond);
		p2.success(function(pc){
			$scope.pagecount = pc;
			$scope.showpages = true;
			var p = InstockBiz.query($scope.cond);
			p.success(function(data){
				$scope.stocks = data;
				$scope.sumprice=0;
				$scope.sumsale=0;
				$scope.sumquantity=0;
				$.each(data,function(){
					$scope.sumprice+=this.price;
					$scope.sumsale+=this.sale;
					$scope.sumquantity+=this.quantity;
				});
				console.log($scope.sumprice);
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
	
	$scope.save = function(){
		$scope.show = true;
		if($scope.stock.cid<=0){
			$scope.message="\u8BF7\u9009\u62E9\u5165\u5E93\u914D\u4EF6\uFF01";
            $scope.flog = false;
            return;
		}
		var regsize = /^[\s\S]{2,30}$/;
        if(!regsize.test($scope.stock.size) || $scope.stock.size==undefined){
            $scope.message="\u8BF7\u8F93\u5165\u914D\u4EF6\u578B\u53F7\uFF082~30\u4E2A\u5B57\u7B26\uFF09\uFF01";
            $scope.flog = false;
            return;
        }
        if($scope.stock.fid<=0){
			$scope.message="\u8BF7\u9009\u62E9\u4F9B\u5E94\u5546\uFF01";
            $scope.flog = false;
            return;
		}
        var regnum = /^[0-9]{1,}\.?[0-9]{0,2}$/;
        if(!regnum.test($scope.stock.price) || $scope.stock.price<=0){
            $scope.message="\u914D\u4EF6\u8FDB\u4EF7\u5FC5\u987B\u4E3A\u6570\u5B57\uFF01";
            $scope.flog = false;
            return;
        }
        if(!regnum.test($scope.stock.sale) || $scope.stock.sale<=0){
            $scope.message="\u914D\u4EF6\u552E\u4EF7\u5FC5\u987B\u4E3A\u6570\u5B57\uFF01";
            $scope.flog = false;
            return;
        }
        if(!regnum.test($scope.stock.quantity) || $scope.stock.quantity<=0){
            $scope.message="\u914D\u4EF6\u6570\u91CF\u5FC5\u987B\u4E3A\u6570\u5B57\uFF01";
            $scope.flog = false;
            return;
        }
		
		var p;
		if($scope.stock.id>0){
			p = InstockBiz.save($scope.stock);
		}else{
			p = InstockBiz.add($scope.stock);
		}
		p.success(function(flog){
			$scope.flog = flog;
			$scope.show = true;
			if(flog){
				$scope.message = "\u914D\u4EF6\u5165\u5E93\u6210\u529F";
				$timeout(function(){
					$scope.show = false;
					$scope.message = '';
					$scope.cancel();
				},3000);
			}else{
				$scope.message = "\u914D\u4EF6\u5165\u5E93\u5931\u8D25";
				$timeout(function(){
					$scope.show = false;
					$scope.message = '';
				},3000);
			}
		});
	}
	
	$scope.dialog = function(id){
		$scope.id = id;
		$("#confirm").modal('show');
	}
	
	$scope.remove = function(){
		if($scope.id>0){
			$scope.show = true;
			var p = InstockBiz.remove($scope.id);
			p.success(function(flog){
				$scope.flog = flog;
				if(flog){
					$scope.message="\u914D\u4EF6\u5165\u5E93\u4FE1\u606F\u5220\u9664\u6210\u529F";
					$scope.query(1);
				}else{
					$scope.message="\u914D\u4EF6\u5165\u5E93\u4FE1\u606F\u5220\u9664\u5931\u8D25";
				}
				$timeout(function(){
					$scope.show = false;
					$scope.message = '';
				},3000);
			});
		}
	}
	
	$scope.getCategorys = function(){
		var p = CategoryBiz.query(1,1000);
		p.success(function(data){
			$scope.categorys = data;
			$scope.categorys.unshift({id:'0',name:'\u8BF7\u9009\u62E9\u914D\u4EF6\u7C7B\u522B'});
		});
	}
	
	$scope.getComponents = function(){ 	
		var comp = {page:1,count:10000,cid:$scope.cgid,name:''};
		var p = ComponentBiz.find(comp);
		p.success(function(data){
			data.unshift({id:'0',name:'\u8BF7\u9009\u62E9\u914D\u4EF6'});
			$scope.components = data;
			$scope.stock.cid = '0';
		});
	}
	
	$scope.getComponent = function(){
		if($scope.stock.cid>0){
			var p = ComponentBiz.get($scope.stock.cid);
			p.success(function(data){
				$scope.stock.price = data.price;
				$scope.stock.sale = data.sale;
				$scope.stock.fid = data.fid;
				var stags = new Array();
				$.each(data.stocks,function(){
					stags.push(this.size);
				});
				$("#psz").autocomplete({
					source:stags
				});
			});
		}
	}

	$scope.getFactorys = function(){
		var p = FactoryBiz.query(1,1000);
		p.success(function(data){
			$scope.factorys = data;
			$scope.factorys.unshift({id:'0',name:'\u8BF7\u9009\u62E9\u4F9B\u8D27\u5546'});
		});
	}
}]);