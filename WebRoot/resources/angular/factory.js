app.factory('FactoryBiz',['$http',function($http){
    return {
    	query:function(page,count){
    		return $http.get("factory/find/"+page+"/"+count);
    	},
    	save:function(factory){
    		return $http.post('factory/save',factory);
    	},
    	remove:function(id){
    		return $http.get('factory/remove/'+id);
    	},
    	get:function(id){
    		return $http.get('factory/get/'+id);
    	},
    	pages:function(n){
    		return $http.get("factory/count/"+n);
    	}
    }
}]);


app.controller('FactoryCtrl',['$scope','$timeout','$location','FactoryBiz',function($scope,$timeout,$location,FactoryBiz){
	$scope.factory = {
		name:'',
		person:'',
		phone:''	 
	};
	$scope.get = function(){
		var id = $location.search().id;
		if(id>0){
			var p = FactoryBiz.get(id);
			p.success(function(data){
				$scope.factory = data;
			});
		}
	}
	$scope.query = function(page){
		$scope.page = page;
		var p1 = FactoryBiz.query($scope.page,10);
		var p2 = FactoryBiz.pages(10);
		p2.success(function(pc){
			$scope.pagecount = pc;
			p1.success(function(data){
				$scope.factorys = data;
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
			});
		});
	};
	$scope.remove = function(){}
	$scope.dialog = function(id){
		$("#confirm").modal('show');
		$("#confirm-ok").click(function(){
			if(id>0){
				var p = FactoryBiz.remove(id);
				$scope.show = true;
				p.success(function(flog){
					$scope.flog = flog;
					if(flog){
						$scope.message = "供应商信息删除成功！";
						$scope.query($scope.page);
					}else{
						$scope.message = "供应商信息删除失败，请重试！";
					}
					$timeout(function(){
						$scope.message = '';
						$scope.show = false;
					},3000);
				});
			}
		});
	}
	
	$scope.save = function(){
		var regName = /^[a-zA-Z0-9\u4e00-\u9fa5]{4,15}$/;
		if(regName.test($scope.factory.name)){
			$scope.msg1 = "供应商名称格式正确";
			$scope.isok1 = true;
		}else{
			$scope.msg1 = "请输入由4~15个由汉字、数字或英文字母组成的名称";
			$scope.isok1 = false;
		}
		var regPerson = /^[a-zA-Z0-9\u4e00-\u9fa5]{2,5}$/;
		if(regPerson.test($scope.factory.person)){
			$scope.msg2 = "联系人姓名格式正确";
			$scope.isok2 = true;
		}else{
			$scope.msg2 = "请输入由2~5个由汉字、数字或英文字母组成的姓名";
			$scope.isok2 = false;
		}
		var regPhone = /^([0-9]{3,4}-[0-9]{7,8})|([0-9]{11})$/;
		if(regPhone.test($scope.factory.phone)){
			$scope.msg3 = "联系电话格式正确";
			$scope.isok3 = true;
		}else{
			$scope.msg3 = "请输入正确的手机（11位数字）或座机号码(xxx-xxxxxxx)";
			$scope.isok3 = false;
		}
		if($scope.isok1 && $scope.isok2 && $scope.isok3){
			var p = FactoryBiz.save($scope.factory);
			$scope.show = true;
			p.success(function(flog){
				$scope.flog = flog;
				if(flog){
					$scope.message = "供应商信息保存成功！";
					$scope.query($scope.page);
				}else{
					$scope.message = "供应商信息保存失败，请重试！";
				}
			}).error(function(){
				$scope.flog = false;
				$scope.message = "供应商信息保存失败，请重试！";
			});
			$timeout(function() {
				$scope.show = false;
				$scope.message = '';
			}, 2000);
		}
	};
	
}]);