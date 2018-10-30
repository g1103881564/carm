app.factory('BrandBiz',['$http',function($http){
    return {
    	query:function(page,count){
    		return $http.get("brand/find/"+page+"/"+count);
    	},
    	save:function(brand){
    		return $http.post("brand/save",brand);
    	},
    	remove:function(id){
    		return $http.get("brand/remove/"+id);
    	},
    	pages:function(n){
    		return $http.get("brand/count/"+n);
    	}
    }
}]);

app.controller('BrandCtrl',['$scope','$timeout','BrandBiz',function($scope,$timeout,BrandBiz){
	$scope.page = 1;
	$scope.query = function(page){
		$scope.page = page;
		var p1 = BrandBiz.query($scope.page,10);
		var p2 = BrandBiz.pages(10);
		p2.success(function(pc){
			$scope.pagecount = pc;
			p1.success(function(data){
				$scope.showpages = true;
				$scope.brands = data;
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
		
	};

	$scope.cancel = function(){
		$scope.brand = null;
	};

	$scope.get = function(brand){
		$scope.brand = brand;
	};

	$scope.dialog = function(){
		$("#confirm").modal('show');
	};

	$scope.remove = function(){
		var p = BrandBiz.remove($scope.brand.id);
		$scope.show = true;
		p.success(function(flog){
			$scope.flog = flog;
			if(flog){
				$scope.message = '汽车品牌删除成功！';
				$scope.brand = null;
				$scope.query($scope.page);
			}else{
				$scope.message = '汽车品牌删除失败！';
			}
		});
		$timeout(function(){
			$scope.show = false;
			$scope.message = '';
		},3000);
	};

	$scope.save = function(){
		if($scope.brand!=null){
			var p = BrandBiz.save($scope.brand);
			$scope.show = true;
			p.success(function(flog){
				$scope.flog = flog;
				if(flog){
					$scope.message = '汽车品牌保存成功！';
					$scope.query($scope.page);
				}else{
					$scope.message = '汽车品牌保存失败！';				
				}
			});
			$timeout(function(){
				$scope.show = false;
				$scope.message = '';
			},2000);
		}
	};
}]);