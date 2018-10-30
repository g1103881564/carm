<%@ page pageEncoding="UTF-8"%>
<div class="row hidden-xs">
	<div class="col-lg-12"><h3 class="page-header">车辆维修管理</h3></div>
</div>
<div class="row" ng-controller="RecordCtrl" style="margin-top:5px">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="row">
					<div class="col-md-8 col-xs-8">
						<i class="glyphicon glyphicon-plus"></i> 车辆维修管理
					</div>
					<div class="col-md-4 col-xs-4 text-right">
						<a href="index.jsp#records"><i class="glyphicon glyphicon-list"></i>
						</a>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<div class="row" style="margin-bottom:15px">
					<div class="col-md-4">
						<div class="input-group" ng-init="getnos()">
							<div class="input-group-addon">车牌</div>
							<input id="notags" ng-model="car.no" class="form-control" ng-change="getCar()" maxlength="7" />
						</div>
					</div>
					<div class="col-md-4">
						<div class="input-group" ng-init="getBrands()">
							<div class="input-group-addon">品牌</div>
							<input type="hidden" id="carid" value="{{car.id}}">
							<select class="form-control" ng-change="getSizes()" ng-model="car.bid" ng-options="b.id as b.name for b in brands">
							</select>
						</div>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<div class="input-group-addon">型号</div>
							<select class="form-control" ng-model="car.sid" ng-options="s.id as s.name for s in sizes">
							</select>
						</div>
					</div>
				</div>
				<div class="row" style="margin-bottom:15px">
					<div class="col-md-4">
						<div class="input-group">
							<div class="input-group-addon">代码</div>
							<input class="form-control" ng-model="car.code" id="codetags" ng-change="getCar()" maxlength="17"/>
						</div>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<div class="input-group-addon">里程</div>
							<input class="form-control" ng-model="car.km"/>
							<div class="input-group-addon">KM</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<div class="input-group-addon">日期</div>
							<input class="form-control" ng-model="car.hiredate"/>
						</div>
					</div>
				</div>
				<div class="row" style="margin-bottom:15px">
					<div class="col-md-12">
						<div class="input-group">
							<div class="input-group-addon">备注</div>
							<textarea class="form-control" ng-model="car.info"></textarea>
						</div>
					</div>
				</div>
				<div class="row" style="margin-bottom:5px">
					<div class="col-md-8">
						<p class="alert" style="padding:5px 15px" ng-class="{true:'alert-success',false:'alert-danger'}[flog]" ng-show="show" ng-bind="message"></p>
					</div>
					<div class="col-md-4 text-right">
						<button class='btn btn-default' ng-click="car=null;sy=true">取消</button>
						<button class='btn btn-primary' ng-class="{true:'enabled',false:'disabled'}[sy]" ng-click="saveCar()">保存车辆信息</button>
					</div>
				</div>
				<div class="row" style="margin-bottom:5px">
					<div class="col-md-12"><hr/></div>
				</div>
				


<div id="comps">
	<div class="row" style="margin-bottom:5px">
		<div class="col-md-3">
			<div class="input-group">
				<div class="input-group-addon">配件</div>
				<input type="hidden" class="componentid">
				<input class="comptags form-control" onblur="getComponent(this)" onchange="getComponent(this)">
			</div>
		</div>
		<div class="col-md-3">
			<div class="input-group">
				<div class="input-group-addon">型号</div>
				<select class="compsizes form-control" onchange="getStock(this)">
					<option value='0'>请选择配件型号</option>
				</select>
			</div>
		</div>
		<div class="col-md-2">
			<div class="input-group">
				<div class="input-group-addon">单价</div>
				<input type="hidden" class="compprice">
				<input class="compsale form-control">
			</div>
		</div>
		<div class="col-md-2">
			<div class="input-group">
				<div class="input-group-addon">数量</div>
				<input onblur="checkQuantity(this)" class="compquantity form-control">
				<input type="hidden" class="squantity">
			</div>
		</div>
		<div class="col-md-2">
			<span style="cursor:pointer;color:#337ab7;padding-top:5px" class="glyphicon glyphicon-minus pull-left" onclick="subgroup(this)"></span>
            <span style="cursor:pointer;color:#337ab7;padding-top:5px" class="glyphicon glyphicon-plus pull-right" onclick="addgroup(this)"></span>
		</div>
	</div>
</div>


				
				<div class="row" style="margin-bottom:5px">
					<div class="col-md-12"><hr/></div>
				</div>
				<div class="row" style="margin-bottom:15px">
					<div class="col-md-4">
						<div class="input-group">
							<div class="input-group-addon">维修日期</div>
							<input readonly id="xdate" class="form-control">
						</div>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<div class="input-group-addon">维修人员</div>
							<select id="xemp" class="form-control"></select>
						</div>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<div class="input-group-addon">工时费用</div>
							<input type="number" id="hmoney" class="form-control" value="0.00">
						</div>
					</div>
				</div>
				<div class="row" style="margin-bottom:15px">
					<div class="col-md-4">
						<div class="input-group">
							<div class="input-group-addon" style="border-right:1px solid #ccc">支付方式</div>
							<select id="pay" class="form-control">
								<option value="现金">现金</option>
								<option value="挂账">挂账</option>
								<option value="微信">微信</option>
								<option value="支付宝">支付宝</option>
							</select>
						</div>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<div class="input-group-addon">应收费用</div>
							<input id="ymoney" onclick="calc()" readonly class="form-control" value="0.00">
						</div>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<div class="input-group-addon">实收费用</div>
							<input type="number" onfocus="calc()" id="smoney" class="form-control" value="0.00">
						</div>
					</div>
				</div>
				<div class="row" style="margin-bottom:15px">
					<div class="col-md-12">
						<div class="input-group">
							<div class="input-group-addon">维修备注</div>
							<textarea class="form-control" id="info"></textarea>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-10">
						<p class="alert" style="padding:5px 15px" id="rmsg"></p>
					</div>
					<div class="col-md-2 text-right">
						<button class='btn btn-primary disabled' id="srbtn" onclick="saveRecord()">保存维修记录</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var tags = new Array();
	$(function(){
		$("#xemp>option").remove();
		$.getJSON("emp/find/1/100",function(data){
			$.each(data,function(i,p){
				var $op = $("<option value='"+p.id+"'>"+p.name+"</option>");
				$("#xemp").append($op);
			});
		});
		
		var date = new Date();
		$("#xdate").val(date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate());
		$("#xdate").datepicker({dateFormat:"yy-mm-dd"});
		$.getJSON("component/simple",function(data){
			$.each(data,function(i,comp){
				tags[i] = comp.code+'-'+comp.name+'-'+comp.id;
			});
			if(tags.length>0){
				var $sub = $("#comps>div:first");
				$sub.find(".comptags").autocomplete({
					source:tags
				});
			}
		});
	});
	
	function calc(){
		$rows = $("#comps>div");
		var total = 0;
		$.each($rows,function(){
			var sale = $(this).find(".compsale").val();
			var quantity = $(this).find(".compquantity").val();
			if(sale>0 && quantity>0){
				var sum = parseFloat(sale) * parseFloat(quantity);
				total+=sum;
			}
		});
		var hmoney = $("#hmoney").val();
		if(hmoney>0){
			total+=parseFloat(hmoney);
		}	
		$("#ymoney").val(total);
		$("#smoney").val(total);
		
	}

	function addgroup(){
		var $sub = $("#comps>div:first").clone();
		$sub.find("input").val("");
		$sub.find("select").val("0");
		$sub.find("select>option:gt(0)").remove();
		$sub.find(".comptags").autocomplete({
			source:tags
		});
		$("#comps").append($sub);
	}

	function subgroup(btn){
		if($("#comps>div").length>1){
			$(btn).parent().parent().remove();
		}
	}

	function getStock(sz){
		$.getJSON("stock/get/"+sz.value,function(data){
			var $p = $(sz).parent().parent().parent();
			$p.find(".compprice").val(data.price);
			$p.find(".compsale").val(data.sale);
			$p.find(".compquantity").val(data.quantity);
			$p.find(".squantity").val(data.quantity);
		});
	}

	function getComponent(comp){
		var $sel = $(comp).parent().parent().parent().find(".compsizes");
		$sel.find("option:gt(0)").remove();
		if(comp.value.length>0){
			var sary = comp.value.split("-");
			if(sary.length>2){
				$(comp).parent().parent().parent().find(".componentid").val(sary[2]);
				$.getJSON("component/get/"+sary[2],function(data){
					if(data.stocks.length>0){
						$.each(data.stocks,function(i,s){
							var $opt = $("<option></option>");
							$opt.attr('value',s.id);
							$opt.text(s.size);
							$sel.append($opt);
						});
					}
				});
			}
		}
	}

	function checkQuantity(q){
		var max = $(q).parent().find(".squantity").val();
		if(parseFloat(q.value)>parseFloat(max)){
			q.value = max;
		}
	}

	function saveRecord(){
		var carid = $("#carid").val();
		if(carid>0){
			$rows = $("#comps").find(".row");
			var cids = new Array();
			var sizes = new Array();
			var sids = new Array();
			var prices = new Array();
			var quantitys = new Array();
			var sales = new Array();
			var f = true;
			$.each($rows,function(i,r){
				var compid = $(r).find(".componentid").val();
				var sid = $(r).find(".compsizes").val();
				var quantity = $(r).find(".compquantity").val();
				var price = $(r).find(".compprice").val();
				var sale = $(r).find(".compsale").val();
				if(compid<=0){
					$("#rmsg").text("请选择汽车配件！");
					$("#rmsg").removeClass("alert-success");
					$("#rmsg").addClass("alert-danger");
					f = false;
					return false;
				}
				if(sid<=0){
					$("#rmsg").text("请选择配件型号！");
					$("#rmsg").removeClass("alert-success");
					$("#rmsg").addClass("alert-danger");
					f = false;
					return false;
				}
				if(quantity<=0){
					$("#rmsg").text("配件数量不能为0！");
					$("#rmsg").removeClass("alert-success");
					$("#rmsg").addClass("alert-danger");
					f = false;
					return false;
				}
				if(compid>0 && sid>0 && quantity>0){
					cids[i] = compid;
					sizes[i] = $(r).find(".compsizes>option:selected").text();
					sids[i] = sid;
					prices[i] = price;
					quantitys[i] = quantity;
					sales[i] = sale;
				}
			});
			
			if(f){
				var record = {};
				record.carid = carid;
				record.date = $("#xdate").val();
				record.emp = $("#xemp").val();
				record.hmoney = $("#hmoney").val();
				record.ymoney = $("#ymoney").val();
				record.smoney = $("#smoney").val();
				record.pay = $("#pay").val();
				record.info = $("#info").val();
				record.cids = cids;
				record.sizes = sizes;
				record.sids = sids;
				record.prices = prices;
				record.quantitys = quantitys;
				record.sales = sales;
				
				$.ajax({
					url:'record/save',
					method:'POST',
					data:record,
					success:function(flog){
						console.log(flog);
						if(flog){
							$("#rmsg").text("维修记录保存成功！");
							$("#rmsg").removeClass("alert-danger");
							$("#rmsg").addClass("alert-success");
							$("#srbtn").addClass("disabled");
						}else{
							$("#rmsg").text("维修记录保存失败！");
							$("#rmsg").removeClass("alert-success");
							$("#rmsg").addClass("alert-danger");
						}
					}
				});
			}else{
				$("#rmsg").text("请检查录入信息是否正确！");
				$("#rmsg").removeClass("alert-success");
				$("#rmsg").addClass("alert-danger");
			}	
		}
	}

</script>