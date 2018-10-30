<%@ page pageEncoding="UTF-8"%>
    <div class="row hidden-xs">
        <div class="col-lg-12">
            <h3 class="page-header">配件库存管理</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default" style="margin-top:15px">
                <div class="panel-heading">
                	<div class="row">
                        <div class="col-xs-8">
						<i class="glyphicon glyphicon-user"></i> 配件入库记录查询
                        </div>
                        <div class="col-xs-4 text-right">
                        <a href="index.jsp#/instock"><i class="glyphicon glyphicon-plus"></i></a>
                        </div>
					</div>		
                </div>
                <div class="panel-body">
                	<div class="row" style="margin-bottom:10px">
                	   <div class="col-md-12" style="padding-left:0">	
                		<div class="col-md-2">
                			<input class="form-control" ng-model="cond.cname" placeholder="请输入配件名称">
                		</div>
                		<div class="col-md-3" ng-init="getFactorys()">
                			<select class="form-control" ng-model="cond.fid" ng-options="f.id as f.name for f in factorys"></select>
                		</div>
                		<div class="col-md-5">
                			<div class="input-group">
                				<input class="form-control" placeholder="开始日期" style="border-right:0" id="tb" ng-model="cond.begin">
                				<span class="input-group-addon" style="background:#fff;padding:9px 7px 11px 7px;border-left:0;border-right:0">至</span>
                				<input class="form-control" placeholder="结束日期" style="border-left:0" id="te" ng-model="cond.end">
                			</div>
                		</div>
                		<div class="col-md-2 text-right" style="padding:0">
                			<button class="btn btn-default" ng-click="cancelquery()">取消</button>
                			<button class="btn btn-primary" ng-click="query(1)">查询</button>
                		</div>
                	  </div>  	
                	</div>
                	<div class="row">
                		<div class="col-md-12">
                    		<p class="alert" style="padding:5px 15px;margin-bottom:5px" ng-class="{true:'alert-success',false:'alert-danger'}[flog]" ng-show="show" ng-bind="message"></p>
                		</div>
                	</div>
                	<div class="row">
                		<div class="col-md-12">
		                	<div class="table-responsive" ng-init="query(1)">
		                	<table class="table table-bordered table-hover">
		                		<tr class="active">
		                			<th width="8%"  class="text-center">序号</th>
		                			<th>配件名称</th>
		                			<th>配件型号</th>
		                			<th>供应商</th>
		                			<th>进价</th>
		                			<th>售价</th>
		                			<th>入库数量</th>
		                			<th>入库日期</th>
		                            <th width="7%" class="text-center">删除</th>
		                		</tr>
		                		<tr ng-repeat="s in stocks">
		                			<td  class="text-center">{{$index+1}}</td>
		                			<td>{{s.cname}}</td>
		                			<td>{{s.size}}</td>
		                			<td>{{s.fname}}</td>
		                			<td>{{s.price}}</td>
		                			<td>{{s.sale}}</td>
		                			<td>{{s.quantity}}</td>
		                			<td>{{s.indate}}</td>
		                            <td class="text-center">
										<a style="cursor:pointer;" ng-click="dialog(s.id)">
						                  <i class="glyphicon glyphicon-trash"></i>
						                </a>
									</td>
		                		</tr>
		                		<tr>
		                			<th colspan="4">合计</th>
		                			<th>{{sumprice}}</th>
		                			<th>{{sumsale}}</th>
		                			<th>{{sumquantity}}</th>
		                			<th>&nbsp;</th>
		                			<th>&nbsp;</th>
		                		</tr>
		                	</table>
		                	</div>
		                </div>
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
<dialog title="警告" message="是否要删除该配件入库信息？"/>
<script type="text/javascript">
  $(function(){
    $("#tb").datepicker({dateFormat:"yy-mm-dd"});
    $("#te").datepicker({dateFormat:"yy-mm-dd"});
  });
</script>