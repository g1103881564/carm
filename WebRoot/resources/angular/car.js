app.factory('CarBiz',['$http',function($http){
    return {
		query:function(condition){
			return $http({
				url:"car/find",
				method: 'post',
				data:JSON.stringify(condition)
			});
		},
		find:function(id){
			return $http.get("car/get/"+id);
		},
		save:function(car){
			return $http.post("car/save",car);
		},
		remove:function(id){
			return $http.get("car/remove/"+id);
		},
		getnos:function(){
			return $http.get("car/getnos");
		},
		getCarByNo:function(no){
			return $http({
				url:"car/getcar",
				method: 'post',
				data:JSON.stringify({'no':no})
			});
		},
		pages:function(condition){
			return $http({
				url:"car/count",
				method: 'post',
				data:JSON.stringify(condition)
			});
    	}
    };
}]);
app.controller('CarCtrl',['$scope','$timeout','$location','CustomBiz','BrandBiz','SizeBiz','CarBiz','RecordBiz',function($scope,$timeout,$location,CustomBiz,BrandBiz,SizeBiz,CarBiz,RecordBiz){
	$scope.car = {
		bid:'0',sid:'0',pid:'0'
	}
	
	$scope.getCustom = function(){
		var pid = $location.search().pid;
		if(pid>0){
			$scope.condition.custom = pid;
			$scope.query(1);
		}
	}
	
	$scope.getnos = function(){
		var p = CarBiz.getnos();
		p.success(function(data){
			var nos = new Array();
			var cos = new Array();
			$.each(data,function(i,s){
				nos.push(s.substring(0,s.indexOf('-')));
				cos.push(s.substring(s.indexOf('-')+1));
			});
			$("#notags").autocomplete({
			    source:nos
			});
			$("#codetags").autocomplete({
				source:cos
			});
		});
	}
	
	$scope.getnonames = function(){
		var p = CustomBiz.getnonames();
		p.success(function(data){
			$("#cutags").autocomplete({
			   source:data
			});
		});
	}
	$scope.getnonames();
	$scope.condition = {
	    page:1,
	    count:10
	}
	$scope.cancel = function(){
		$scope.condition = {
			page:1,
			count:10
		}
		$scope.query(1);
	}
	$scope.page = 1;
	$scope.query = function(page){
		var phone = $scope.condition.phone;
		if(phone!=null && phone!=undefined){
			$scope.condition.phone = phone.substring(0,11);
		}
		$scope.page = page;
		$scope.condition.page = page;
		var p2 = CarBiz.pages($scope.condition);
		var p1 = CarBiz.query($scope.condition);
		p2.success(function(pc){
			$scope.pagecount = pc;
			p1.success(function(data){
				$scope.condition.custom = null;
				$scope.cars = data;
				if(data.length>0){
					$scope.showpages = true;
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
				}else{
					$scope.showpages = false;
				}
			});
		})
		
	}
	
	$scope.getRow = function(car){
		$scope.car = car;
	}
	
	$scope.getCar = function(){
		var id = $location.search().id;
		if(id>0){
			var p = CarBiz.find(id);
			p.success(function(data){
				$scope.car = data;
				$scope.getSizes();
				//查询该车辆维修记录
				var record = {page:1,count:10,emp:0,status:-1,no:data.no};
				var p1 = RecordBiz.find(record);
				var p2 = RecordBiz.pages(record);
				p2.success(function(pc){
					$scope.pagecount = pc;
					p1.success(function(rdata){
						$scope.showpages = true;
						$scope.records = new Array();
						$.each(rdata,function(i,r){
							if(r.status=='0'){
								r.status = '\u672A\u5B8C\u6210';
							}else{
								r.status = '\u5DF2\u5B8C\u6210';
							}
							$scope.records[i]=r;
						});
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
				
			});
		}
	}
	
	$scope.dialog = function(){
		$("#confirm").modal('show');
	}
	
	$scope.remove = function(){
		if($scope.car.id>0){
			$scope.show = true;
			var p2 = CarBiz.find($scope.car.id);
			p2.success(function(data){
				if(data!=null && data.records!=null && data.records.length>0){
					$scope.flog = false;
					$scope.message = '\u8BE5\u8F66\u8F86\u7EF4\u4FEE\u8BB0\u5F55\u975E\u7A7A\u4E0D\u5141\u8BB8\u5220\u9664\uFF01';
					$timeout(function(){
						$scope.show = false;
						$scope.message = '';
					},3000);
				}else{
					var p = CarBiz.remove($scope.car.id);
					p.success(function(flog){
						$scope.flog = flog;
						if(flog){
							$scope.message = '\u8F66\u8F86\u4FE1\u606F\u5220\u9664\u6210\u529F\uFF01';
							$scope.brand = null;
							$scope.query($scope.page);
						}else{
							$scope.message = '\u8F66\u8F86\u4FE1\u606F\u5220\u9664\u5931\u8D25\uFF01';
						}
					});
					$timeout(function(){
						$scope.show = false;
						$scope.message = '';
					},2000);
				}
			});
		}
		
	};

	$scope.getBrands = function(){
		var p = BrandBiz.query(1,1000);
		p.success(function(data){
			$scope.brands = data;
			$scope.brands.unshift({id:'0',name:'\u8BF7\u9009\u62E9\u54C1\u724C'});
			
		});
	}

	$scope.getSizes = function(){
		if($scope.car.bid>0){
			var p = SizeBiz.query($scope.car.bid,1,1000);
			p.success(function(data){
				$scope.sizes = data;
				$scope.sizes.unshift({id:'0',name:'\u8BF7\u9009\u62E9\u578B\u53F7'});
				
			});
		}
	}

	$scope.getCustoms = function(){
		var p = CustomBiz.query({},1,1000);
		p.success(function(data){
			$scope.customs = data;
			$scope.customs.unshift({id:'0',name:'\u8BF7\u9009\u62E9\u8F66\u4E3B'});
			
		});
	}

	$scope.save = function(){
		if($scope.car.bid<=0){
			$scope.message = '\u8BF7\u9009\u62E9\u54C1\u724C\uFF01';
			$scope.show = true;
			$scope.flog = false;
			$timeout(function(){
				$scope.show = false;
				$scope.message = '';
			},2000);
			return;
		}
		if($scope.car.sid<=0){
			$scope.message = '\u8BF7\u9009\u62E9\u578B\u53F7\uFF01';
			$scope.show = true;
			$scope.flog = false;
			$timeout(function(){
				$scope.show = false;
				$scope.message = '';
			},2000);
			return;
		}
		var regCode = /^[0-9a-zA-Z]{17}$/;
		if($scope.car.code!='' && $scope.car.code!=undefined && !regCode.test($scope.car.code)){
			$scope.message = '\u8BF7\u8F93\u516517\u4F4D\u8F66\u8F86\u8BC6\u522B\u7801\uFF01';
			$scope.show = true;
			$scope.flog = false;
			$timeout(function(){
				$scope.show = false;
				$scope.message = '';
			},2000);
			return;
		}else{
			$scope.car.code = '';
		}
		
		var regNo = /^[\u4e00-\u9fa5]{1}[A-Za-z0-9]{6}$/; 
		if(!regNo.test($scope.car.no)){
			$scope.message = '\u8BF7\u8F93\u5165\u6B63\u786E\u7684\u8F66\u724C\u53F7\u7801\uFF01';
			$scope.show = true;
			$scope.flog = false;
			$timeout(function(){
				$scope.show = false;
				$scope.message = '';
			},2000);
			return;	
		}

		var p = CarBiz.save($scope.car);
		$scope.show = true;
		p.success(function(flog){
			$scope.flog = flog;
			if(flog){
				$scope.message = '\u8F66\u8F86\u4FE1\u606F\u4FDD\u5B58\u6210\u529F\uFF01';
			}else{
				$scope.message = '\u8F66\u8F86\u4FE1\u606F\u4FDD\u5B58\u5931\u8D25\uFF01';
			}
			$timeout(function(){
				$scope.show = false;
				$scope.message = '';
			},2000);
		});
	}
}]);