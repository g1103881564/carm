<%@ page pageEncoding="UTF-8"%>
<div class="row hidden-xs">
    <div class="col-lg-12">
        <h3 class="page-header">配件类别管理</h3>
    </div>
</div>
<div class="row" style="margin-top:5px">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
            	<i class="glyphicon glyphicon-cog"></i> 配件类别管理
            </div>
            <div class="panel-body">
				<div class="row" style="margin-bottom:15px">
					<div class="col-md-9 col-xs-6">
						<input placeholder="请输入类别名称" name="name" ng-model="category.name" class="form-control">
					</div>
					<div class="col-md-3 col-xs-6 text-right">
						<button class="btn btn-default" ng-click="cancel()">取消</button>
						<button class="btn btn-primary" ng-click="save()">保存</button>
					</div>
				</div>		
            	<p class="alert" style="padding:5px 15px;margin-bottom:5px" ng-class="{true:'alert-success',false:'alert-danger'}[flog]" ng-show="show" ng-bind="message"></p>
                <div class="table-responsive" ng-init="query(1)">
                   	<table class="table table-bordered table-hover">
                   		<tr class="active">
                   			<th width="9%" class="text-center">序号</th>
                   			<th>名称</th>
                   			<th width="10%" class="text-center">操作</th>
                   		</tr>
                   		<tr ng-repeat="c in categorys" ng-click="get(c)">
                   			<td class="text-center">{{$index+1}}</td>
                   			<td>{{c.name}}</td>
                   			<td class="text-center">
								<a style="cursor:pointer;" ng-click="dialog()">
				                  <i class="glyphicon glyphicon-trash"></i> 
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
<dialog title="警告" message="是否要删除该配件类别信息？"/>