<%@ page pageEncoding="UTF-8"%>
<div class="row hidden-xs">
	<div class="col-lg-12"><h3 class="page-header">车辆维修管理</h3></div>
</div>
<div class="row" ng-controller="RecordCtrl" style="margin-top:5px">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="row">
					<div class="col-md-8 col-xs-8">
						<i class="glyphicon glyphicon-plus"></i> 车辆维修记录查询
					</div>
					<div class="col-md-4 col-xs-4 text-right">
						<a href="index.jsp#record"><i class="glyphicon glyphicon-plus"></i>
						</a>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<div class="row" style="margin-bottom:15px">
					<div class="col-md-3" ng-init="getnos()" style="z-index:1000">
						<input class="form-control ui-autocomplete-input" style="padding-left:15px" placeholder="车牌号码" ng-model="record.no" id="notags">
					</div>
					<div class="col-md-3" ng-init="getnonames()" style="z-index:1000">
						<input class="form-control ui-autocomplete-input" style="padding-left:15px" placeholder="客户姓名或电话" ng-blur="getcname()" ng-model="cname" id="cutags">
					</div>
					<div class="col-md-6" style="z-index:1000">
						<input class="form-control ui-autocomplete-input" style="padding-left:15px" placeholder="车辆识别码" ng-model="record.code" id="codetags">
					</div>
				</div>
				<div class="row" style="margin-bottom:15px">
					<div class="col-md-6">
						<div class="input-group">
							<input class="form-control" placeholder="开始日期" style="background:#fff;border-right:0" id="mdate1" readonly ng-model="record.mdate">
							<div class="input-group-addon" style="border-left:0;border-right:0;padding:9px 7px 10px 7px;background:#fff">至</div>
							<input class="form-control" placeholder="结束日期" style="background:#fff;border-left:0" id="mdate2" readonly ng-model="record.mdate1">
						</div>
					</div>
					<div class="col-md-4">
						<div class="input-group">
							<input class="form-control" ng-model="record.smoney" style="border-right:0" placeholder="维修费用">
							<div class="input-group-addon" style="border-left:0;border-right:0;background:#fff;">至</div>
							<input class="form-control" ng-model="record.smoney1" style="border-left:0" placeholder="维修费用">
						</div>
					</div>
					<div class="col-md-2 text-right" style="padding-left:0">
						<button class="btn btn-default" ng-click="cls()">取消</button>
						<button class="btn btn-primary" ng-click="query(1)">查询</button>
					</div>
				</div>
				
				<p class="alert" style="padding:5px 15px;margin-bottom:5px" ng-class="{true:'alert-success',false:'alert-danger'}[flog]" ng-show="show" ng-bind="message"></p>
				<div class="row">
					<div class="col-md-12">
						<div class="table-responsive" ng-init="query(1)">
							<table class="table table-bordered table-hover">
								<tr class="active">
		                			<th width="7%"  class="text-center">序号</th>
		                			<th width="10%">客户姓名</th>
		                			<th width="12%">车牌号码</th>
		                			<th width="12%">维修日期</th>
		                			<th width="12%">工时费</th>
		                			<th width="12%">实收费用</th>
		                			<th width="12%">支付方式</th>
		                			<th width="10%">维修人员</th>
		                            <th width="7%" class="text-center">详情</th>
		                            <th width="7%" class="text-center">删除</th>
		                		</tr>
		                		<tr ng-repeat="r in records">
		                			<td class="text-center">{{$index+1}}</td>
		                			<td>{{r.cname}}</td>
		                			<td>{{r.no}}</td>
		                			<td>{{r.mdate}}</td>
		                			<td>{{r.hmoney}}</td>
		                			<td>{{r.smoney}}</td>
		                			<td>{{r.pay}}</td>
		                			<td>{{r.ename}}</td>
		                			<td class="text-center">
		                				<a style="cursor:pointer;" ng-click="showDetail(r.id)"> 
		                					<i class="glyphicon glyphicon-eye-open"></i>
										</a>
		                			</td>
		                			<td class="text-center">
		                				<a style="cursor:pointer;" ng-click="dialog(r.id)"> 
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
</div>
<dialog title="警告" message="是否要删除该维修记录？" />

<div id="details" class="modal fade" tabindex="-1" role="details">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">维修记录详情</h4>
      </div>
      <div class="modal-body">
        <div class="table-responsive">
        	<table class="table table-bordered table-hover">
        		<tr class="active">
        			<th>序号</th><th>配件</th><th>型号</th><th>厂家</th>
        			<th>供应商</th><th>单价</th><th>数量</th><th>小计</th>
        		</tr>
        	</table>
        </div>
        <div class="row">
        	<div class="col-xs-12 text-right" id="total"></div>
        </div>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>

<script>
   $(function(){
   		$("#mdate1").datepicker({dateFormat:"yy-mm-dd"});
   		$("#mdate2").datepicker({dateFormat:"yy-mm-dd"});
   });
</script>