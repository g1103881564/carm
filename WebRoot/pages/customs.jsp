<%@ page pageEncoding="UTF-8"%>
<div class="row hidden-xs">
    <div class="col-lg-12">
        <h3 class="page-header">客户信息管理</h3>
    </div>
</div>
<div class="row" ng-controller="CustomCtrl">
	<div class="col-lg-12">
		<div class="panel panel-default" style="margin-top:15px">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-8">
						<i class="glyphicon glyphicon-user"></i> 客户信息查询
					</div>
					<div class="col-xs-4 text-right">
						<a style="cursor:pointer" ng-click="toggle()"><i class="glyphicon glyphicon-plus"></i>
						</a>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<div id="addpanel" style="display:none">
				<div class="row">
					<div class="col-md-4 col-xs-12" style="margin-bottom:10px">
						<div class="input-group">
							<div class="input-group-addon">姓名</div>
							<input class="form-control" ng-model="custom.name">
						</div>
					</div>
					<div class="col-md-4 col-xs-12" style="margin-bottom:10px">
						<div class="input-group">
							<div class="input-group-addon">电话</div>
							<input class="form-control" ng-model="custom.phone">
						</div>
					</div>
					<div class="col-md-4 col-xs-12" style="margin-bottom:10px">
						<div class="input-group">
							<div class="input-group-addon">性别</div>
							<select class="form-control" ng-model="custom.sex" ng-options="s.value as s.text for s in sexs">
								
							</select>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 col-xs-12" style="margin-bottom:10px">
						<div class="input-group">
							<div class="input-group-addon">备注</div>
							<input class="form-control" ng-model="custom.info">
						</div>
					</div>
					<div class="col-md-4 col-xs-12 text-right" style="margin-bottom:10px">
						<button class="btn btn-default" ng-click="query(1)">查询</button>
						<button class="btn btn-default" ng-click="cancel()">取消</button>
						<button class="btn btn-primary" ng-click="save()">确定</button>
					</div>
				</div>	
				</div>
				<p class="alert" style="padding:5px 15px;margin-bottom:5px" ng-class="{true:'alert-success',false:'alert-danger'}[flog]" ng-show="show" ng-bind="message"></p>
				<div class="table-responsive" ng-init="query(1)">
					<table class="table table-bordered table-hover">
						<tr class="active">
							<th width="7%">序号</th>
							<th>姓名</th>
							<th width="7%">性别</th>
							<th width="15%">登记日期</th>
							<th width="12%">电话号码</th>
							<th width="12%" class="text-center">车辆信息</th>
							<th width="12%" class="text-center">删除</th>
						</tr>
						<tr ng-repeat="c in customs" ng-click="get(c)">
							<td>{{$index+1}}</td>
							<td>{{c.name}}</td>
							<td>{{c.sex}}</td>
							<td>{{c.hiredate}}</td>
							<td>{{c.phone}}</td>
							<td class="text-center">
								<a href="index.jsp#cars?pid={{c.id}}">车辆信息</a>
							</td>
							<td class="text-center">
								<a style="cursor:pointer;" ng-click="dialog(c.id)">
									<i class="glyphicon glyphicon-trash"></i> 删除
								</a>
							</td>
						</tr>
					</table>
				</div>
				<div class="row" ng-show="showpages">
		          <div class="col-md-12 text-center">
		            <nav aria-label="Page navigation">
		               <ul class="pagination" style="margin:0">
		                 <li>
		                   <a style="cursor:pointer" ng-click="query(1)" aria-label="Previous">
		                     <span aria-hidden="true">&laquo;</span>
		                   </a>
		                 </li>
		                 <li ng-repeat="i in pages" ng-class="{true:'active'}[i==page]"><a style="cursor:pointer;" ng-click="query(i)">{{i}}</a></li>
		                 <li>
		                   <a style="cursor:pointer" ng-click="query(pagecount)" aria-label="Next">
		                     <span aria-hidden="true">&raquo;</span>
		                   </a>
		                 </li>
		               </ul>
		             </nav>
		          </div>
		        </div>
			</div>
		</div>
	</div>
</div>
<dialog title="警告" message="是否要删除该客户信息？"/>