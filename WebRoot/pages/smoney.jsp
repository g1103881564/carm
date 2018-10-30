<%@ page pageEncoding="UTF-8"%>
<div class="row hidden-xs">
	<div class="col-lg-12">
		<h3 class="page-header">配件库存价值统计</h3>
	</div>
</div>
<div class="row" style="margin-top:5px">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="glyphicon glyphicon-leaf"></i> 配件库存价值统计
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-12 col-xs-12" style="margin-bottom:5px" ng-init="getCategorys()">
						<div class="input-group">
							<div class="input-group-addon">配件类别</div>
							<select ng-model="cname" class="form-control" ng-change="stockmoney()" ng-options="c.name as c.name for c in categorys"></select>
						</div>
					</div>
				</div>
				
				<div class="table-responsive" ng-init="stockmoney()">
					<table class="table table-bordered table-hover">
						<tr class="active">
							<th width="15%">序号</th>
							<th>配件类别</th>
							<th>配件名称</th>
							<th>配件库存</th>
							<th>配件价值</th>
						</tr>
						<tr ng-repeat="m in moneys">
							<td>{{$index+1}}</td>
							<td>{{m.cname}}</td>
							<td>{{m.name}}</td>
							<td>{{m.quantity}}</td>
							<td>{{m.price}}</td>
						</tr>
						<tr class="active">
							<th colspan="3">合计</th>
							<th>{{suma}}</th>
							<th>{{sumb}}</th>
						</tr>
					</table>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div id="cmChart" style="height:350px;"></div>
					</div> 
				</div>
			</div>
		</div>
	</div>
</div>