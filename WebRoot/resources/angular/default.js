app.factory('DefaultBiz',['$http',function($http){
    return {
    	warning:function(){
    		return $http.get("default/warning");
    	},
    	state:function(){
    		return $http.get("default/stock");
    	},
    	current:function(){
    		return $http.get("default/current");
    	}
    }
}]);

app.controller('DefaultCtrl',['$scope','$timeout','DefaultBiz',function($scope,$timeout,DefaultBiz){
	$scope.current = function(){
		var p = DefaultBiz.current();
		p.success(function(data){
			var now = new Date();
			$scope.dt = now.getFullYear()+"\u5E74"+(now.getMonth()+1)+"\u6708";
			
			var days = new Array();
			var smoney = new Array();
			var money = new Array();
			$.each(data,function(i,p){
				days.push(p.mdate);
				smoney.push(p.smoney);
				money.push(p.money);
			});
			
			var myChart = echarts.init(document.getElementById('cmChart'));
			option = {
			    tooltip: {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['\u6536\u5165','\u5229\u6DA6']
			    },
				toolbox: {
				    show: true,
				    feature: {
				       dataZoom: {yAxisIndex: 'none'},
				       dataView: {readOnly: false},
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
			
		});
	}
	$scope.current();
	
	$scope.sc = true;
	$scope.sd = false;
	$scope.changeTD = function(f){
		if(f==0){
			$scope.sd = true;
			$scope.sc = false;
		}else{
			$scope.sc = true;
			$scope.sd = false;
		}
	}
	
	$scope.warning = function(){
		var p = DefaultBiz.warning();
		p.success(function(wdata){
			if(wdata.length>0){
				$scope.wdata = wdata;
			}
		});
	}
	
	$scope.states = function(){
		var p = DefaultBiz.state();
		p.success(function(stdata){
			if(stdata.length>0){
				var names = new Array();
				var datas = new Array();
				$.each(stdata,function(i,p){
					names.push(p.sname);
					datas.push({name:p.sname,value:p.quantity});
				});
				var myChart = echarts.init(document.getElementById('stateChart'));
				option = {
				    tooltip : {
				        trigger: 'item',
				        formatter: "{b}-{a}{c}({d}%)"
				    },
				    legend: {
				    	orient: 'vertical',
				        x: 'left',
				        data:names
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            magicType : {
				                show: true,
				                type: ['pie', 'funnel']
				            },
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    calculable : true,
				    series : [
				        {
				        	name:'\u5E93\u5B58\u91CF\uFF1A',
				            type:'pie',
				            radius : [5, 130],
				            roseType : 'angle',
				            data:datas,
				            itemStyle:{ 
					            normal:{ 
					                  label:{ 
					                    show: true, 
					                    formatter: '{b} : {c} ({d}%)' 
					                  }, 
					                  labelLine :{show:true} 
					            } 
					        }
				        }
				    ],
				    optionToContent: function(opt) {
				    	var table = '<table class="table table-bordered">'
				    	+ '<tr class="active"><th>\u914D\u4EF6\u5206\u7C7B</td><td>\u5E93\u5B58\u6570\u91CF</th></tr>';
				    	$.each(datas,function(i,d){
				    		table+='<tr><td>'+d.name+'</td><td>'+d.value+'</td>'
				    	});
				    	table += '</table>';
				    	return table;
				    }
				};
		        myChart.setOption(option);
			}
		});
	}
	$scope.states();
}]);