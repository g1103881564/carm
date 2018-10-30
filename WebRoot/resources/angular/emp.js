app.factory('EmpBiz',['$http',function($http){
    return {
    	query:function(page,count){
    		return $http.get("emp/find/"+page+"/"+count);
    	},
    	save:function(emp){
    		return $http.post("emp/save",emp);
    	},
    	remove:function(id){
    		return $http.get("emp/remove/"+id);
    	},
    	pages:function(n){
    		return $http.get("emp/count/"+n);
    	}
    }
}]);

app.controller('EmpCtrl',['$scope','$timeout','EmpBiz',function($scope,$timeout,EmpBiz){
	$scope.page = 1;
	$scope.sexs = [{value:'男',text:'男'},{value:'女',text:'女'}];
	$scope.emp = {
		sex:'男'
	}
	$scope.query = function(page){
		$scope.page = page;
		var p1 = EmpBiz.query($scope.page,10);
		var p2 = EmpBiz.pages(10);
		p2.success(function(pc){
			$scope.pagecount = pc;
			p1.success(function(data){
				$scope.showpages = true;
				$scope.emps = data;
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

	$scope.toggle = function(){
		$("#addpanel").slideToggle(500);
	}

	$scope.cancel = function(){
		$scope.emp = null;
	};

	$scope.get = function(emp){
		$scope.emp = emp;
	};

	$scope.dialog = function(){
		$("#confirm").modal('show');
	};

	$scope.remove = function(){
		var p = EmpBiz.remove($scope.emp.id);
		$scope.show = true;
		p.success(function(flog){
			$scope.flog = flog;
			if(flog){
				$scope.message = '\u5458\u5DE5\u4FE1\u606F\u5220\u9664\u6210\u529F';
				$scope.emp = null;
			}else{
				$scope.message = '\u5458\u5DE5\u4FE1\u606F\u5220\u9664\u5931\u8D25';
			}
			$scope.query($scope.page);
		});
		$timeout(function(){
			$scope.show = false;
			$scope.message = '';
		},2000);
	};

	$scope.save = function(){
		$scope.show = true;
		if($scope.emp!=null){
			var regname = /^[\u4e00-\u9fa5]{2,5}$/;
			if(!regname.test($scope.emp.name)){
				$scope.message="\u59D3\u540D\u683C\u5F0F\u6709\u8BEF\uFF01";
				$scope.flog = false;
				return;
			}
			var regphone = /^1[0-9]{10}$/;
			if(!regphone.test($scope.emp.phone)){
				$scope.message="\u7535\u8BDD\u53F7\u7801\u683C\u5F0F\u6709\u8BEF\uFF01";
				$scope.flog = false;
				return;
			}
			var regno = /^[0-9]{17}[0-9a-zA-Z]{1}$/;
			if(!regno.test($scope.emp.no)){
				$scope.message="\u8EAB\u4EFD\u8BC1\u53F7\u7801\u683C\u5F0F\u6709\u8BEF\uFF01";
				$scope.flog = false;
				return;
			}
			
			var p = EmpBiz.save($scope.emp);
			
			p.success(function(flog){
				$scope.flog = flog;
				if(flog){
					$scope.message = '\u5458\u5DE5\u4FE1\u606F\u4FDD\u5B58\u6210\u529F';
				}else{
					$scope.message = '\u5458\u5DE5\u4FE1\u606F\u4FDD\u5B58\u5931\u8D25';				
				}
				$scope.query($scope.page);
			});
		}
		$timeout(function(){
			$scope.show = false;
			$scope.message = '';
		},3000);
	};
}]);