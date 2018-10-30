<%@ page pageEncoding="UTF-8"%>
<div class="row hidden-xs">
  <div class="col-lg-12">
    <h3 class="page-header">配件库存管理</h3>
  </div>
</div>
<div class="row" style="margin-top:5px">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading">
        <div class="row">
          <div class="col-xs-8">
            <i class="glyphicon glyphicon-user"></i> 配件入库登记
          </div>
          <div class="col-xs-4 text-right">
            <a style="cursor:pointer" href="index.jsp#/stocks"><i class="glyphicon glyphicon-list"></i>
            </a>
          </div>
        </div>
      </div>
      <div class="panel-body">
      	<div class="row" style="margin-bottom:15px">
      		<div class="col-md-6" ng-init="getCategorys()">
	      		<div class="input-group">
	      			<div class="input-group-addon">配件分类</div>
	      			<select class="form-control" ng-model="cgid" ng-options="c.id as c.name for c in categorys" ng-change="getComponents()"></select>
	      		</div>
      		</div>
      		<div class="col-md-6">
	      		<div class="input-group">
	      			<div class="input-group-addon">配件名称</div>
	      			<select class="form-control" ng-model="stock.cid" ng-options="pc.id as pc.name for pc in components" ng-change="getComponent()">
	      			</select>
	      		</div>
      		</div>	
      	</div>
      	<div class="row" style="margin-bottom:15px">
      		<div class="col-md-6">
	      		<div class="input-group">
	      			<div class="input-group-addon">配件型号</div>
	      			<input class="form-control" style="padding-left:15px" ng-model="stock.size" id="psz" placeholder="请输入配件型号">
	      		</div>
	      	</div>
	      	<div class="col-md-6" ng-init="getFactorys()">
	      		<div class="input-group">
	      			<div class="input-group-addon" style="padding-right:26px">供应商</div>
	      			<select class="form-control" ng-model="stock.fid" ng-options="f.id as f.name for f in factorys"></select>
	      		</div>
	      	</div>
      	</div>
      	<div class="row" style="margin-bottom:15px">
	      	<div class="col-md-6">
	      		<div class="input-group">
	      			<div class="input-group-addon">配件进价</div>
	      			<input class="form-control" ng-model="stock.price" placeholder="请输入配件进价">
	      		</div>
	      	</div>
	      	<div class="col-md-6">
	      		<div class="input-group">
	      			<div class="input-group-addon">配件售价</div>
	      			<input class="form-control" ng-model="stock.sale" placeholder="请输入配件售价">
	      		</div>
	      	</div>
	    </div>
	    <div class="row" style="margin-bottom:15px">
	      	<div class="col-md-6">
	      		<div class="input-group">
	      			<div class="input-group-addon">入库数量</div>
	      			<input class="form-control" ng-model="stock.quantity" placeholder="请输入入库数量">
	      		</div>
	      	</div>
	      	<div class="col-md-6">
	      		<div class="input-group">
	      			<div class="input-group-addon">入库日期</div>
	      			<input class="form-control" type="date" ng-model="stock.indate" readonly style="background:#fff" id="indate">
	      		</div>
	      	</div>
      	</div>
      	<div class="row">
      		<div class="col-md-9">
      			<p class="alert" style="padding:5px 15px" ng-class="{true:'alert-success',false:'alert-danger'}[flog]" ng-show="show" ng-bind="message"></p>
      		</div>
      		<div class="col-md-3 text-right">
      			<button class="btn btn-default" ng-click="cancel()">取消</button>
            	<button class="btn btn-primary" ng-click="save()">确定</button>
      		</div>
      	</div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
  $(function(){
    $("#indate").datepicker({dateFormat:"yy-mm-dd"});
  });
</script>