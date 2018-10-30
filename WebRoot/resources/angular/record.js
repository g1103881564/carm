app.factory('RecordBiz',['$http',function($http){
	return{
		find:function(record){
    		return $http.post("record/query",record);
    	},
    	remove:function(rid){
    		return $http.get("record/remove/"+rid);
    	},
    	pages:function(record){
    		return $http.post("record/count",record);
    	},
    	getRecord:function(id){
    		return $http.get("record/get/"+id);
    	},
    	monthstate:function(month){
    		return $http.get("record/month/"+month);
    	},
    	yearstate:function(year){
    		return $http.get("record/year/"+year);
    	}
	}
}]);

app.controller('RecordCtrl',['$scope','$timeout','RecordBiz','CarBiz','BrandBiz','SizeBiz','CategoryBiz','ComponentBiz','CustomBiz','EmpBiz',function($scope,$timeout,RecordBiz,CarBiz,BrandBiz,SizeBiz,CategoryBiz,ComponentBiz,CustomBiz,EmpBiz){
	$scope.page = 1;
	$scope.record = {page:1,count:10,emp:0,status:-1};
	$scope.statuss = [
	    {value:-1,text:'\u7EF4\u4FEE\u72B6\u6001'},{value:0,text:'\u672A\u5B8C\u6210'},{value:1,text:'\u5DF2\u5B8C\u6210'}
	];
	
	$scope.years = new Array();
	$scope.getYears = function(){
		$scope.years.push({id:0,name:'\u8BF7\u9009\u62E9\u5E74\u4EFD'});
		for(i=2017;i<=2027;i++){
			$scope.years.push({id:i,name:i});
		}
		$scope.stateyear = new Date().getFullYear();
		$scope.moneystate();
	}
	
	
	
	$scope.statemonth = null;
	
	$scope.moneystate = function(){
		if($scope.stateyear>0){
			var p = RecordBiz.yearstate($scope.stateyear);
			p.success(function(data){
				$scope.records = data;
				$scope.chartitle = $scope.stateyear+"\u5E74\u5EA6\u6536\u5165\u4E0E\u5229\u6DA6\u7EDF\u8BA1\u56FE";
				if($scope.records!=null){
					$scope.suma = 0;
					$scope.sumb = 0;
					$.each($scope.records,function(i,r){
						$scope.suma+=r.smoney;
						$scope.sumb+=r.money;
					});
				}
				$scope.charts();
			});
		}else if($scope.statemonth!=null){
			var m = $scope.statemonth.getFullYear()+'-'+($scope.statemonth.getMonth()+1);
			var p = RecordBiz.monthstate(m);
			p.success(function(data){
				$scope.records = data;
				$scope.chartitle = $scope.statemonth.getFullYear()+"\u5E74"+($scope.statemonth.getMonth()+1)+"\u6708\u4EFD\u6536\u5165\u4E0E\u5229\u6DA6\u7EDF\u8BA1\u56FE";
				if($scope.records!=null){
					$scope.suma = 0;
					$scope.sumb = 0;
					$.each($scope.records,function(i,r){
						$scope.suma+=r.smoney;
						$scope.sumb+=r.money;
					});
				}
				$scope.charts();
			})
		}
	}
	$scope.charts = function(){
		var days = new Array();
		var smoney = new Array();
		var money = new Array();
		$.each($scope.records,function(i,p){
			days.push(p.mdate);
			smoney.push(p.smoney);
			money.push(p.money);
		});
		
		var myChart = echarts.init(document.getElementById('cmChart'));
		option = {
			title:{
				text:$scope.chartitle,left: 'center'
			},
		    tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		        data:['\u6536\u5165','\u5229\u6DA6'],
		        bottom: 10
		    },
			toolbox: {
			    show: true,
			    feature: {
			       magicType: {type: ['line', 'bar']},
			       restore: {},
			       saveAsImage: {}
			    }
			},
			xAxis:  {
			    type: 'category',
			    boundaryGap: false,
			    data: days
			},
			yAxis: {
			    type: 'value',
			    axisLabel: {formatter: '\uFFE5{value}'}
			},
			series: [
			    {
			        name:'\u6536\u5165',
			        type:'line',
			        data:smoney,
			        markLine: {
			            data: [{type: 'average', name: '平均值'}]
			        }
			    },
			    {
			        name:'\u5229\u6DA6',
			        type:'line',
			        data:money,
			        markLine: {
			            data: [{type: 'average', name: '平均值'}]
			        }
			    }
			],
		    optionToContent: function(opt) {
		    	var table = '<table class="table table-bordered">'
		    	+ '<tr class="active"><th>\u65E5\u671F</th><th>\u6536\u5165</td><td>\u5229\u6DA6</th></tr>';
		    	$.each(days,function(i){
		    		table+='<tr><td>'+days[i]+'</td><td>'+smoney[i]+'</td><td>'+money[i]+'</td>'
		    	});
		    	table += '</table>';
		    	return table;
		    }
		};
		myChart.setOption(option);
	}
	//根据维修记录ID查询维修详情信息
	$scope.showDetail = function(id){
		var p = RecordBiz.getRecord(id);
		p.success(function(data){
			var $table = $("#details").find("table");
			$table.find("tr:gt(0)").remove();
			$.each(data.detail,function(i,d){
				var p2 = ComponentBiz.get(d.cid);
				p2.success(function(cp){
					var $tr = $("<tr></tr>");
					$("<td>"+(i+1)+"</td>").appendTo($tr);
					$("<td>"+d.pname+"</td>").appendTo($tr);
					$("<td>"+d.size+"</td>").appendTo($tr);
					if(cp.factory!=null){
						$("<td>"+cp.factory+"</td>").appendTo($tr);
					}else{
						$("<td>&nbsp;</td>").appendTo($tr);
					}
					if(cp.fact!=null && cp.fact.name!=null){
						$("<td>"+cp.fact.name+"</td>").appendTo($tr);
					}else{
						$("<td>&nbsp;</td>").appendTo($tr);
					}
					$("<td>"+d.sale+"</td>").appendTo($tr);
					$("<td>"+d.quantity+"</td>").appendTo($tr);
					$("<td>"+(d.sale*d.quantity)+"</td>").appendTo($tr);
					$tr.appendTo($table);
				});
			});
			$("#total").html("<strong>\u5DE5\u65F6\u8D39\uFF1A"+data.hmoney+"&nbsp;&nbsp;&nbsp;&nbsp;\u5E94\u6536\uFF1A"+data.ymoney+"&nbsp;&nbsp;&nbsp;&nbsp;\u5B9E\u6536\uFF1A"+data.smoney+"</strong>");
			$("#details").modal('show');
		});
	}
	
	//客户姓名文本框失去焦点时的字符串处理方法
	$scope.getcname = function(){
		var cname = $scope.cname;
		if(cname!=undefined && cname!=null && cname.length>11){
			$scope.record.cname = cname.substring(0,11);
			$scope.cname = cname.substring(11);
			$scope.cname = $scope.cname.replace('[','').replace(']','');
		}
	}
	
	//取消按钮点击
	$scope.cls = function(){
		$scope.record = null;
		$scope.cname = null;
		$scope.record = {page:1,count:10,emp:0,status:-1};
		$scope.query(1);
	}
	
	//查询所有员工信息
	$scope.getEmps = function(){
		var p = EmpBiz.query(1,1000);
		p.success(function(data){
			$scope.emps = data;
			$scope.emps.unshift({id:0,name:'\u7EF4\u4FEE\u4EBA\u5458'});
		});
	}
	
	//查询所有客户电话及姓名信息用于实现文本框cutags自动完成功能
	$scope.getnonames = function(){
		var p = CustomBiz.getnonames();
		p.success(function(data){
			$("#cutags").autocomplete({
			   source:data
			});
		});
	}
	
	//查询维修记录信息
	$scope.query = function(page){
		$scope.record.page = page;
		$scope.page = page;
		var p1 = RecordBiz.find($scope.record);
		var p2 = RecordBiz.pages($scope.record);
		p2.success(function(pc){
			$scope.pagecount = pc;
			p1.success(function(data){
				$scope.showpages = true;
				$scope.records = new Array();
				$.each(data,function(i,r){
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
	}
	
	//删除确认对话框
	$scope.dialog = function(id){
		$("#confirm").modal('show');
		$("#confirm-ok").click(function(){
			if(id>0){
				var p = RecordBiz.remove(id);
				$scope.show = true;
				p.success(function(flog){
					$scope.flog = flog;
					if(flog){
						$scope.message = '\u5BA2\u6237\u4FE1\u606F\u5220\u9664\u6210\u529F\uFF01';
						$scope.query($scope.page);
					}else{
						$scope.message = '\u5BA2\u6237\u4FE1\u606F\u5220\u9664\u5931\u8D25\uFF01';
					}
					$timeout(function(){
						$scope.show = false;
						$scope.message = '';
					},2000);
				});
			}
		});	
	}
	
	$scope.remove = function(){}
	
	//查询所有车牌号码用于实现文本框notags自动完成功能
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
	//保存车辆基本信息
	$scope.saveCar = function(){
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
		
		var regNo = /^[\u4e00-\u9fa5]{1}[A-Za-z]{1}[A-Za-z0-9]{5}$/; 
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
		p.success(function(data){
			if(data!=null && data.id>0){
				$scope.car = data;
				$scope.flog = true;
				$scope.message = '\u8F66\u8F86\u4FE1\u606F\u4FDD\u5B58\u6210\u529F\uFF01';
				$scope.sy = false;
				if($scope.car.id>0){
					$("#srbtn").removeClass("disabled");
				}else{
					$("#srbtn").addClass("disabled");
				}
			}else{
				$scope.flog = false;
				$scope.message = '\u8F66\u8F86\u4FE1\u606F\u4FDD\u5B58\u5931\u8D25\uFF01';
			}
			
			$timeout(function(){
				$scope.show = false;
				$scope.message = '';
			},2000);
		});
	}
	
	//根据用户选择的配件查询配件库存记录
	$scope.getComponent = function(){
		var str = $scope.code;
		var sary = str.split('-');
		if(sary.length>2){
			$scope.code = sary[1];
			var componentid = sary[2];
			var p = ComponentBiz.get(componentid);
			p.success(function(data){
				$scope.stocks = data.stocks;
			});
		}
	}
	
	//根据ID查询配件库存记录
	$scope.getStock = function(){
		if($scope.stock.id>0){
			var p = ComponentBiz.getStock($scope.stock.id);
			p.success(function(data){
				$scope.stock = data;
			});
		}
	}
	
	//查询所有车辆品牌信息
	$scope.getBrands = function(){
		var p = BrandBiz.query(1,1000);
		p.success(function(data){
			$scope.brands = data;
			$scope.brands.unshift({id:'0',name:'\u8BF7\u9009\u62E9\u54C1\u724C'});
		});
	}
	//根据车辆品牌查询所有车型
	$scope.getSizes = function(){
		if($scope.car.bid>0){
			var p = SizeBiz.query($scope.car.bid,1,1000);
			p.success(function(data){
				$scope.sizes = data;
				$scope.sizes.unshift({id:'0',name:'\u8BF7\u9009\u62E9\u578B\u53F7'});
			});
		}
	}
	//根据用户选择的车牌号码查询车辆基本信息
	$scope.getCar = function(){
		var no = $("#notags").val();
		var code = $("#codetags").val();
		var nc = "0";
		if(no.length==7){
			nc = no;
		}else if(code.length==17){
			nc = code;
		}
		if(nc!="0"){
			var p = CarBiz.getCarByNo(nc);
			p.success(function(data){
				if(data.id!=undefined){
					$scope.car = data;
					$scope.getSizes();
					if($scope.car.id>0){
						$("#srbtn").removeClass("disabled");
					}else{
						$("#srbtn").addClass("disabled");
					}
				}
			});
		}
	}

}]);
	
	