<%@ page pageEncoding="UTF-8"%>
    <div class="row hidden-xs">
        <div class="col-lg-12">
            <h3 class="page-header">供应商管理</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default" style="margin-top:15px">
                <div class="panel-heading">
                	<div class="row">
                        <div class="col-xs-8">
						<i class="glyphicon glyphicon-user"></i> 供应商信息查询
                        </div>
                        <div class="col-xs-4 text-right">
                        <a href="index.jsp#/factory"><i class="glyphicon glyphicon-plus"></i></a>
                        </div>
					</div>		
                </div>
                <div class="panel-body">
                    <p class="alert" style="padding:5px 15px;margin-bottom:5px" ng-class="{true:'alert-success',false:'alert-danger'}[flog]" ng-show="show" ng-bind="message"></p>
                	<div class="table-responsive" ng-init="query(1)">
                	<table class="table table-bordered table-hover">
                		<tr class="active">
                			<th width="8%"  class="text-center">序号</th>
                			<th width="22%">名称</th>
                			<th width="12%">联系人</th>
                			<th width="15%">联系电话</th>
                			<th width="15%">账户</th>
                			<th>地址</th>
                            <th width="7%" class="text-center">编辑</th>
                            <th width="7%" class="text-center">删除</th>
                		</tr>
                		<tr ng-repeat="f in factorys">
                			<td  class="text-center">{{$index+1}}</td>
                			<td>{{f.name}}</td>
                			<td>{{f.person}}</td>
                			<td>{{f.phone}}</td>
                			<td>{{f.account}}</td>
                			<td>{{f.address}}</td>
                            <td class="text-center">
                            	<a href="index.jsp#/factory?id={{f.id}}">
                            		<i class="glyphicon glyphicon-pencil"></i>
                            	</a>
                            </td>
                            <td class="text-center">
								<a style="cursor:pointer;" ng-click="dialog(f.id)">
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
</div>
<dialog title="警告" message="是否要删除该供应商信息？"/>