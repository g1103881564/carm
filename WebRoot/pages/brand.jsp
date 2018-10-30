<%@ page pageEncoding="UTF-8"%>
<div class="row hidden-xs">
  <div class="col-lg-12">
    <h3 class="page-header">车辆品牌管理</h3>
  </div>
</div>
<div class="row" style="margin-top:5px">
  <div class="col-lg-12">
    <div class="panel panel-default">
      
      <div class="panel-heading">
        <i class="glyphicon glyphicon-bookmark"></i> 车辆品牌管理
      </div>
      
      <div class="panel-body">
        <div class="row">
		  <div class="col-md-8 col-xs-12" style="margin-bottom:10px">
		  	<div class="input-group">
			  <div class="input-group-addon">品牌名称</div>
			  <input ng-model="brand.name" placeholder="请输入品牌名称" class="form-control"/>
		  	</div>
		  </div>
		  <div class="col-md-4 col-xs-12 text-right" style="margin-bottom:10px">
			  <button class="btn btn-default" ng-click="cancel()">取消</button>
			  <button class="btn btn-primary" ng-click="save()">保存</button>
		  </div>		
        </div>
        <p class="alert" style="padding:5px 15px;margin-bottom:5px" ng-class="{true:'alert-success',false:'alert-danger'}[flog]" ng-show="show" ng-bind="message"></p>

        <div class="table-responsive" ng-init="query(1)">
          <table class="table table-bordered table-hover table-condensed">
            <tr class="active">
              <th width="15%">序号</th>
              <th>名称</th>
              <th width="15%" class="text-center">操作</th>
            </tr>
            <tr ng-repeat="b in brands" ng-click="get(b)">
              <td ng-bind="$index+1"></td>
              <td ng-bind="b.name"></td>
              <td  class="text-center">
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
<dialog title="警告" message="是否要删除该品牌信息？"/>