app.factory('SizeBiz',['$http',function($http){
	return{
		query:function(bid,page,count){
			return $http.get('size/find/'+bid+'/'+page+'/'+count);
		},
		remove:function(id){
			return $http.get('size/remove/'+id);
		},
		save:function(size){
			return $http.post('size/save',size);
		},
		pages:function(bid,n){
    		return $http.get("size/count/"+bid+"/"+n);
    	}
	}
}]);
app.controller('SizeCtrl',['$scope','$timeout','BrandBiz','SizeBiz',function($scope,$timeout,BrandBiz,SizeBiz){
	$scope.page = 1;
	$scope.size = {
		bid:0
	}
	$scope.getBrands = function(){
		var p = BrandBiz.query(1,1000);
		p.success(function(data){
			data.unshift({id:0,name:'请选择品牌'});
			$scope.brands = data;
		});
	}
	$scope.dialog = function(){
		$("#confirm").modal('show');
	};
	
	$scope.query = function(page){
		$scope.page = page;
		var p1 = SizeBiz.query($scope.size.bid,$scope.page,10);
		var p2 = SizeBiz.pages($scope.size.bid,10);
		p2.success(function(pc){
			$scope.pagecount = pc;
			p1.success(function(data){
				$scope.showpages = true;
				$scope.sizes = data;
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
	$scope.cancel = function(){
		$scope.size = null;
	}
	$scope.get = function(size){
		$scope.size = size;
	};
	$scope.remove = function(){
		var p = SizeBiz.remove($scope.size.id);
		$scope.show = true;
		p.success(function(flog){
			$scope.flog = flog;
			if(flog){
				$scope.message = '汽车型号删除成功！';
				$scope.query($scope.page);
				$scope.size = null;
			}else{
				$scope.message = '汽车型号删除失败！';
			}
			$timeout(function(){
				$scope.show = false;
				$scope.message = '';
			},2000);
		});
	}
	$scope.save = function(){
		if($scope.size!=null){
			var p = SizeBiz.save($scope.size);
			$scope.show = true;
			p.success(function(flog){
				$scope.flog = flog;
				if(flog){
					$scope.message = '车辆型号保存成功！';
					$scope.query($scope.page);
				}else{
					$scope.message = '车辆型号保存失败！';
				}
				$timeout(function(){
					$scope.show = false;
				},2000);
			});
		}
	};
}]);