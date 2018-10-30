<%@ page pageEncoding="UTF-8"%>
<div class="row hidden-xs">
  <div class="col-lg-12">
    <h3 class="page-header">员工信息管理</h3>
  </div>
</div>
<div class="row" style="margin-top:5px">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading">
        <div class="row">
          <div class="col-xs-8">
            <i class="glyphicon glyphicon-user"></i> 员工信息查询
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
            <div class="col-md-3 col-xs-6" style="margin-bottom:5px">
              <div class="input-group">
                <div class="input-group-addon">姓名</div>
                <input ng-model="emp.name" class="form-control" placeholder="姓名"/>
              </div>
            </div>
            <div class="col-md-3 col-xs-6" style="margin-bottom:5px">
              <div class="input-group">
                <div class="input-group-addon">性别</div>
                <select ng-model="emp.sex" ng-options="s.value as s.text for s in sexs" class="form-control">
                </select>
              </div>
            </div>
            <div class="col-md-3 col-xs-6" style="margin-bottom:5px">
              <div class="input-group">
                <div class="input-group-addon">电话</div>
                <input ng-model="emp.phone" placeholder="电话号码" maxlength="11" minlength="7" class="form-control"/>
              </div>
            </div>
            <div class="col-md-3 col-xs-6" style="margin-bottom:5px">
              <div class="input-group">
                <div class="input-group-addon">入职日期</div>
                <input ng-model="emp.hiredate" placeholder="入职日期" id="xdate" readonly class="form-control"/>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-6 col-xs-12" style="margin-bottom:5px">
              <div class="input-group">
                <div class="input-group-addon">住址</div>
                <input ng-model="emp.addr" placeholder="居住地址" class="form-control"/>
              </div>
            </div>
            <div class="col-md-4 col-xs-12" style="margin-bottom:5px">
              <div class="input-group">
                <div class="input-group-addon">证件</div>
                <input ng-model="emp.no" placeholder="证件号码" minlength="18" maxlength="18" class="form-control"/>
              </div>
            </div>
            <div class="col-md-2  col-xs-12 text-right" style="margin-bottom:5px">
	            <button class="btn btn-default" ng-click="cancel()">取消</button>
	            <button class="btn btn-primary" ng-click="save()">保存</button>
            </div>
          </div>
        </div> 
        <p class="alert" style="padding:5px 15px;margin-bottom:5px" ng-class="{true:'alert-success',false:'alert-danger'}[flog]" ng-show="show" ng-bind="message"></p>
        <div class="table-responsive" ng-init="query(1)">
          <table class="table table-bordered table-hover table-condensed">
            <tr class="active">
              <th width="8%">序号</th>
              <th width="10%">姓名</th>
              <th width="8%">性别</th>
              <th width="12%">电话号码</th>
              <th width="18%">身份证号码</th>
              <th>住址</th>
              <th class="text-center" width="10%">操作</th>
            </tr>
            <tr ng-repeat="b in emps" ng-click="get(b)">
              <td ng-bind="$index+1"></td>
              <td ng-bind="b.name"></td>
              <td ng-bind="b.sex"></td>
              <td ng-bind="b.phone"></td>
              <td ng-bind="b.no"></td>
              <td ng-bind="b.addr"></td>
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
<dialog title="警告" message="是否要删除该员工信息？"/>
<script type="text/javascript">
  $(function(){
    var date = new Date();
    $("#xdate").val(date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate());
    $("#xdate").datepicker({dateFormat:"yy-mm-dd"});
  });
</script>