<%@ page pageEncoding="UTF-8"%>
<div class="row hidden-xs">
	<div class="col-lg-12">
		<h3 class="page-header">车辆信息管理</h3>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default" style="margin-top:15px">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-8">
						<i class="glyphicon glyphicon-user"></i> 车辆信息查询
					</div>
					<div class="col-xs-4 text-right">
						<a href="index.jsp#car"><i class="glyphicon glyphicon-plus"></i>
						</a>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<div class="row" ng-init="getnos()">
					<div class="col-md-3 col-xs-12" style="margin-bottom:10px">
						<input id="notags" style="padding-left:15px" placeholder="请输入车牌号码" ng-model="condition.no" class="form-control" autocomplete="off">
					</div>
					<div class="col-md-4 col-xs-12" style="margin-bottom:10px">
						<input id="codetags" style="padding-left:15px" placeholder="请输入车牌识别码" ng-model="condition.code" class="form-control" autocomplete="off">
					</div>
					<div class="col-md-3 col-xs-12" style="margin-bottom:10px" ng-init="getCustom()">
						<input id="cutags" style="padding-left:15px" placeholder="客户姓名或电话" ng-model="condition.phone" class="form-control ui-autocomplete-input" autocomplete="off">
					</div>
					<div class="col-md-2 col-xs-12 text-right" style="margin-bottom:10px;padding-left:0">
						<button class="btn btn-default" ng-click="cancel()">取消</button>
						<button class="btn btn-primary" ng-click="query(1)">查询</button>
					</div>	
				</div>
			
				<p class="alert" style="padding:5px 15px;margin-bottom:5px" ng-class="{true:'alert-success',false:'alert-danger'}[flog]" ng-show="show" ng-bind="message"></p>
				<div class="table-responsive" ng-init="query(1)">
					<table class="table table-bordered table-hover">
						<tr>
							<th width="7%">序号</th>
							<th width="15%">车牌号</th>
							<th>品牌</th>
							<th>型号</th>
							<th>年份</th>
							<th>客户</th>
							<th class="text-center">编辑</th>
							<th class="text-center">删除</th>
						</tr>
						<tr ng-repeat="c in cars" ng-click="getRow(c)">
							<td>{{$index+1}}</td>
							<td>{{c.no}}</td>
							<td>{{c.brand.name}}</td>
							<td>{{c.size.name}}</td>
							<td>{{c.year}}</td>
							<td>{{c.custom.name}}</td>
							<td class="text-center"><a href="index.jsp#/car?id={{c.id}}"> <i
									class="glyphicon glyphicon-pencil"></i></a>
							</td>
							<td class="text-center"><a style="cursor:pointer;" ng-click="dialog()"> <i
									class="glyphicon glyphicon-trash"></i> </a>
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
<dialog title="警告" message="是否要删除该车辆信息？" />
