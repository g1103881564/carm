<%@ page pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-xs-12">
		<div style="padding-top:15px">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<i class="glyphicon glyphicon-bookmark"></i> {{dt}}份收入与利润统计图表
				</div>
				<div class="panel-body" ng-init="states()" style="padding:0 15px;">
					<div class="row">
						<div class="col-md-12  col-xs-12">
							<div id="cmChart" style="height:300px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<div style="padding-top:15px">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<i class="glyphicon glyphicon-bookmark"></i> 配件库存分类统计图表
				</div>
				<div class="panel-body" ng-init="states()" style="padding:0 15px;">
					<div class="row">
						<div class="col-md-12  col-xs-12">
							<div id="stateChart" style="height:300px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-xs-12">
		<div style="padding-top:15px">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<i class="glyphicon glyphicon-bookmark"></i> 配件库存预警
				</div>
				<div class="panel-body" ng-init="warning()" style="padding:15px;">
					<div class="row">
						<div class="col-md-12 col-xs-12">
							<div class="table-responsive text-center" style="height:350px">
							<table class="table table-bordered table-condensed" style="width:99%">
								<tr ng-repeat="w in wdata">
									<td width="20%" class="warning">{{w.name}}</td>
									<td>
										<div class="row" ng-repeat="s in w.stocks">
											<div class="col-md-6 col-xs-6">{{s.size}}</div>
											<div class="col-md-6 col-xs-6">{{s.quantity}}</div>
										</div>
									</td>
								</tr>
							</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>