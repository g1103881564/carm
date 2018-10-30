app.factory('CustomBiz',['$http',function($http){
    return {
    	query:function(custom,page,count){
    		return $http.post("custom/find/"+page+"/"+count,custom);
    	},
    	save:function(custom){
    		return $http.post("custom/save",custom);
    	},
    	remove:function(id){
    		return $http.get("custom/remove/"+id);
    	},
    	pages:function(custom,n){
    		return $http.post("custom/count/"+n,custom);
    	},
    	getnonames:function(){
    		return $http.post("custom/getnonames");
    	}
    }
}]);

app.controller('CustomCtrl',['$scope','$timeout','CustomBiz',function($scope,$timeout,CustomBiz){
	$scope.page = 1;
	$scope.sexs = [{value:"\u6027\u522B",text:"\u6027\u522B"},{value:"\u7537",text:"\u7537"},{value:'\u5973',text:'\u5973'}];
	$scope.custom = {
	    name:null,
	    sex:'\u6027\u522B',
	    phone:null
	}
	$scope.query = function(page){
		$scope.page = page;
		if($scope.custom.sex=='\u6027\u522B'){
			$scope.custom.sex=undefined;
		}
		var p1 = CustomBiz.query($scope.custom,$scope.page,10);
		var p2 = CustomBiz.pages($scope.custom,10);
		p2.success(function(pc){
			$scope.pagecount = pc;
			p1.success(function(data){
				$scope.customs = data;
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
				var p = CustomBiz.remove(id);
				$scope.show = true;
				p.success(function(flog){
					$scope.flog = flog;
					if(flog){
						$scope.message = "\u5BA2\u6237\u4FE1\u606F\u5220\u9664\u6210\u529F\uFF01";
						$scope.cancel();
						$scope.query($scope.page);
					}else{
						$scope.message = "\u5BA2\u6237\u4FE1\u606F\u5220\u9664\u5931\u8D25\uFF01";
					}
					$timeout(function(){
						$scope.message = '';
						$scope.show = false;
					},3000);
				});
			}
		});
	}
	$scope.toggle = function(){
		$("#addpanel").slideToggle(500);
	}
	$scope.cancel = function(){
		$scope.custom = {
		    name:null,
		    sex:null,
		    phone:null
		}
	}
	$scope.get = function(custom){
		$scope.custom = custom;
	};
	
	$scope.save = function(){
		var p = CustomBiz.save($scope.custom);
		$scope.show = true;
		p.success(function(obj){
			if(obj.id>0){
				$scope.flog = true;
				$scope.message = '\u5BA2\u6237\u4FE1\u606F\u4FDD\u5B58\u6210\u529F\uFF01';
				$scope.cancel();
				$scope.query($scope.page);
			}else{
				$scope.flog = false;
				$scope.message = '\u5BA2\u6237\u4FE1\u606F\u4FDD\u5B58\u5931\u8D25\uFF01';				
			}
			$timeout(function(){
				$scope.show = false;
			},2000);
		});
		
	};
}]);