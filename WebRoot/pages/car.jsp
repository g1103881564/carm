<%@ page pageEncoding="UTF-8"%>
<div class="row hidden-xs">
	<div class="col-lg-12">
		<h3 class="page-header">车辆信息管理</h3>
	</div>
</div>
<div class="row" ng-init="getCar()" style="margin-top:5px">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="row">
					<div class="col-md-8">
						<i class="glyphicon glyphicon-plus"></i> 车辆信息录入
					</div>
					<div class="col-md-4 text-right">
						<a href="index.jsp#cars"><i class="glyphicon glyphicon-list"></i>
						</a>
					</div>
				</div>
			</div>
			<div class="panel-body">

				<div role="tabpanel" id="mytab">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a
							style="cursor:pointer;" aria-controls="home" role="tab"
							data-toggle="tab">车辆信息</a></li>
						<li role="presentation"><a style="cursor:pointer;"
							aria-controls="profile" role="tab" data-toggle="tab">维修记录</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="home"
							style="padding:15px;border:1px solid #ddd;border-top:0">
							<div class="row stock" style="margin-bottom:15px">
								<div class="col-md-6" style="margin-bottom: 15px">
									<input type="hidden" value="{{custom.id}}" />
									<div class="input-group" ng-init="getBrands()">
										<div class="input-group-addon">品牌</div>
										<select ng-model="car.bid" class="form-control"
											ng-options="b.id as b.name for b in brands"
											ng-change="getSizes()"></select>
									</div>
								</div>
								<div class="col-md-6" style="margin-bottom: 15px">
									<div class="input-group">
										<div class="input-group-addon">型号</div>
										<select class="form-control" ng-model="car.sid"
											ng-options="s.id as s.name for s in sizes"></select>
									</div>
								</div>
								<div class="col-md-6" style="margin-bottom: 15px">
									<div class="input-group">
										<div class="input-group-addon">编码</div>
										<input placeholder="请输入识别码" class="form-control"
											ng-model="car.code" />
									</div>
								</div>
								<div class="col-md-6" style="margin-bottom: 15px">
									<div class="input-group">
										<div class="input-group-addon">颜色</div>
										<input placeholder="请输入车辆颜色" class="form-control"
											ng-model="car.color" />
									</div>
								</div>
								<div class="col-md-6" style="margin-bottom: 15px">
									<div class="input-group">
										<div class="input-group-addon">车牌</div>
										<input placeholder="请输入车牌号码" class="form-control"
											ng-model="car.no" />
									</div>
								</div>
								<div class="col-md-6" style="margin-bottom: 15px">
									<div class="input-group">
										<div class="input-group-addon">里程</div>
										<input type="number" placeholder="请输入行驶里程数"
											class="form-control" ng-model="car.km" />
										<div class="input-group-addon">公里</div>
									</div>
								</div>
								<div class="col-md-6" style="margin-bottom: 15px">
									<div class="input-group" ng-init="getCustoms()">
										<div class="input-group-addon">客户</div>
										<select class="form-control" ng-model="car.pid"
											ng-options="s.id as s.name for s in customs"></select>
									</div>
								</div>
								<div class="col-md-6" style="margin-bottom: 15px">
									<div class="input-group">
										<div class="input-group-addon">年份</div>
										<input type="number" placeholder="请输入车辆年份"
											class="form-control" ng-model="car.year" />
									</div>
								</div>
								<div class="col-md-12">
									<div class="input-group">
										<div class="input-group-addon">备注</div>
										<textarea class="form-control" rows="3" placeholder="备注"
											ng-model="car.info"></textarea>
									</div>
								</div>
							</div>

							<div class="row" style="margin-top:15px">
								<div class="col-md-8">
									<p class="alert" style="padding:5px 15px"
										ng-class="{true:'alert-success',false:'alert-danger'}[flog]"
										ng-show="show" ng-bind="message"></p>
								</div>
								<div class="col-md-2">
									<a ng-show="showcars" class="btn btn-default"
										href="cars.jsp?pid={{car.id}}">更多车辆</a>
								</div>
								<div class="col-md-2">
									<button class="btn btn-primary btn-block" ng-click="save()">保存</button>
								</div>
							</div>



						</div>
						<div role="tabpanel" class="tab-pane" id="profile"
							style="padding:15px;border:1px solid #ddd;border-top:0">

							<div class="row">
								<div class="col-md-12">
									<div class="table-responsive">
										<table class="table table-bordered table-hover">
											<tr class="active">
												<th width="7%" class="text-center">序号</th>
												<th width="10%">客户姓名</th>
												<th width="12%">车牌号码</th>
												<th width="12%">维修日期</th>
												<th width="12%">工时费</th>
												<th width="12%">实收费用</th>
												<th width="12%">维修状态</th>
												<th width="10%">维修人员</th>
											</tr>
											<tr ng-repeat="r in records">
												<td class="text-center">{{$index+1}}</td>
												<td>{{r.cname}}</td>
												<td>{{r.no}}</td>
												<td>{{r.mdate}}</td>
												<td>{{r.hmoney}}</td>
												<td>{{r.smoney}}</td>
												<td>{{r.status}}</td>
												<td>{{r.ename}}</td>
											</tr>
										</table>
									</div>
									<div class="row" ng-show="showpages">
										<div class="col-md-12 text-center">
											<nav aria-label="Page navigation">
												<ul class="pagination" style="margin:0">
													<li><a style="cursor:pointer" ng-click="query(1)"
														aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
													</a></li>
													<li ng-repeat="i in pages"
														ng-class="{true:'active'}[i==page]"><a
														style="cursor:pointer;" ng-click="query(i)">{{i}}</a>
													</li>
													<li><a style="cursor:pointer"
														ng-click="query(pagecount)" aria-label="Next"> <span
															aria-hidden="true">&raquo;</span> </a></li>
												</ul>
											</nav>
										</div>
									</div>
								</div>
							</div>


						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(function() {
		$('#mytab a').click(function() {
			var p = $(this).attr("aria-controls");
			if (p == 'home') {
				$("#profile").hide(10);
				$("#home").show(10);
			} else {
				$("#home").hide(10);
				$("#profile").show(10);
			}
		});
	});
</script>