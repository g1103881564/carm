<%@ page pageEncoding="UTF-8"%>
<div class="row hidden-xs">
	<div class="col-lg-12">
		<h3 class="page-header">车辆型号管理</h3>
	</div>
</div>
<div class="row" style="margin-top:5px">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="glyphicon glyphicon-leaf"></i> 车辆型号管理
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-md-5 col-xs-6" style="margin-bottom:5px" ng-init="getBrands()">
						<select ng-model="size.bid"
							ng-options="b.id as b.name for b in brands" ng-change="query(1)"
							class="form-control">
						</select>
					</div>
					<div class="col-md-5 col-xs-6" style="margin-bottom:5px">
						<input name="name" placeholder="型号名称" ng-model="size.name" class="form-control">
					</div>
					<div class="col-md-2 col-xs-12 text-right" style="margin-bottom:5px;padding-left:0">
						<button class="btn btn-default" ng-click="cancel()">取消</button>
						<button class="btn btn-primary" ng-click="save()">保存</button>
					</div>
				</div>
				<p class="alert" style="padding:5px 15px;margin-bottom:5px"
					ng-class="{true:'alert-success',false:'alert-danger'}[flog]"
					ng-show="show" ng-bind="message"></p>
				<div class="table-responsive" ng-init="query(1)">
					<table class="table table-bordered table-hover">
						<tr class="active">
							<th width="15%">序号</th>
							<th>名称</th>
							<th width="10%" class="text-center">操作</th>
						</tr>
						<tr ng-repeat="s in sizes" ng-click="get(s)">
							<td>{{$index+1}}</td>
							<td>{{s.name}}</td>
							<td class="text-center"><a style="cursor:pointer;"
								ng-click="dialog()"> <i class="glyphicon glyphicon-trash"></i>
							</a></td>
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
								<li ng-repeat="i in pages" ng-class="{true:'active'}[i==page]"><a
									style="cursor:pointer;" ng-click="query(i)">{{i}}</a>
								</li>
								<li><a style="cursor:pointer" ng-click="query(pagecount)"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<dialog title="警告" message="是否要删除该车型信息？" />