<%@ page pageEncoding="UTF-8"%>
<div class="row hidden-xs">
	<div class="col-lg-12">
		<h3 class="page-header">收入与利润统计</h3>
	</div>
</div>
<div class="row" style="margin-top:5px">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="glyphicon glyphicon-leaf"></i> 收入与利润统计
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-5 col-xs-5" style="margin-bottom:5px" ng-init="getYears()">
						<div class="input-group">
							<div class="input-group-addon">年份</div>
							<select ng-model="stateyear" ng-click="statemonth=null" class="form-control" ng-options="y.id as y.name for y in years"></select>
						</div>
					</div>
					<div class="col-md-5 col-xs-5" style="margin-bottom:5px">
						<div class="input-group">
							<div class="input-group-addon">月份</div>
							<input type="month" ng-click="stateyear=0" ng-model="statemonth" class="form-control">
						</div>	
					</div>
					<div class="col-md-2 col-xs-2" style="margin-bottom:5px">
						<button class="btn btn-primary btn-block" ng-click="moneystate()">查询</button>
					</div>
				</div>
				
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<tr class="active">
							<th width="15%">序号</th>
							<th>日期</th>
							<th>收入</th>
							<th>利润</th>
						</tr>
						<tr ng-repeat="r in records">
							<td>{{$index+1}}</td>
							<td>{{r.mdate}}</td>
							<td>{{r.smoney}}</td>
							<td>{{r.money}}</td>
						</tr>
						<tr>
							<th></th>
							<th>合计</th>
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