app.factory('CategoryBiz',['$http',function($http){
    return {
    	query:function(page,count){
    		return $http.get("category/find/"+page+"/"+count);
    	},
    	save:function(cate){
    		return $http.post("category/save",cate);
    	},
    	remove:function(id){
    		return $http.get("category/remove/"+id);
    	},
    	pages:function(n){
    		return $http.get("category/count/"+n);
    	}
    }
}]);
app.controller('CategoryCtrl',['$scope','$timeout','CategoryBiz',function($scope,$timeout,CategoryBiz){
	$scope.page = 1;
	$scope.query = function(page){
		$scope.page = page;
		var p1 = CategoryBiz.query($scope.page,10);
		var p2 = CategoryBiz.pages(10);
		p2.success(function(pc){
			$scope.pagecount = pc;
			p1.success(function(data){
				$scope.showpages = true;
				$scope.categorys = data;
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
	$scope.dialog = function(){
		$("#confirm").modal('show');
	};
	$scope.cancel = function(){
		$scope.category = null;
	}
	$scope.get = function(category){
		$scope.category = category;
	};
	$scope.remove = function(){
		var p = CategoryBiz.remove($scope.category.id);
		$scope.show = true;
		p.success(function(flog){
			$scope.flog = flog;
			if(flog){
				$scope.message = '配件类别删除成功！';
				$scope.category = null;
				$scope.query($scope.page);
			}else{
				$scope.message = '配件类别删除失败！';
			}
			$timeout(function(){
				$scope.show = false;
				$scope.message = '';
			},2000);
		});
	}
	$scope.save = function(){
		if($scope.category!=null){
			var p = CategoryBiz.save($scope.category);
			$scope.show = true;
			p.success(function(flog){
				$scope.flog = flog;
				if(flog){
					$scope.message = '配件类别保存成功！';
					$scope.query($scope.page);
				}else{
					$scope.message = '配件类别保存失败！';				
				}
				$timeout(function(){
					$scope.show = false;
				},2000);
			});
		}
	};
}]);