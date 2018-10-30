<%@ page pageEncoding="UTF-8"%>
    <div class="row hidden-xs">
        <div class="col-lg-12">
            <h3 class="page-header">配件管理</h3>
        </div>
    </div>
    <div class="row" style="margin-top:5px" ng-controller="ComponentCtrl">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                	<div class="row">
                		<div class="col-md-9 col-xs-7">
							<i class="glyphicon glyphicon-plus"></i> 配件信息录入
						</div>
						<div class="col-md-3 col-xs-5 text-right">
							<a href="index.jsp#/components"><i class="glyphicon glyphicon-list"></i></a>
						</div>
					</div>		
                </div>
                <div class="panel-body" ng-init="get()">
                	
                	<div role="tabpanel" id="mytab">

                      <!-- Nav tabs -->
                      <ul class="nav nav-tabs" role="tablist" id="nas">
                        <li role="presentation" class="active"><a style="cursor:pointer" aria-controls="home" role="tab" data-toggle="tab">配件信息</a></li>
                        <li role="presentation"><a style="cursor:pointer" aria-controls="profile" role="tab" data-toggle="tab">库存信息</a></li>
                      </ul>

                      <!-- Tab panes -->
                      <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home" style="padding:15px;border:1px solid #ddd;border-top:0">
                            <div class="row">
                                <div class="col-md-6 col-xs-12" style="margin-bottom:10px">
                                    <div class="input-group" id="code" ng-init="getCodes()">
                                        <div class="input-group-addon">编号</div>
                                        <input class="form-control" ng-model="component.code" placeholder="请输入配件编号">
                                        <input type="hidden" ng-model="component.id">
                                    </div>
                                </div>
                                <div class="col-md-6 col-xs-12" style="margin-bottom:10px">
                                    <div class="input-group" id="name">
                                        <div class="input-group-addon">名称</div>
                                        <input class="form-control" ng-model="component.name" placeholder="请输入配件名称">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-xs-12" style="margin-bottom:10px" ng-init="getCategorys()">
                                    <div class="input-group" id="kind">
                                        <div class="input-group-addon">类别</div>
                                        <select class="form-control" ng-model="component.cid" ng-options="c.id as c.name for c in categorys">
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 col-xs-12" style="margin-bottom:10px">
                                    <div class="input-group" id="factory">
                                        <div class="input-group-addon">预警</div>
                                        <input ng-model="component.warning" class="form-control" placeholder="请输入库存预警数量">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-xs-12" style="margin-bottom:10px">
                                    <div class="input-group" id="price">
                                        <div class="input-group-addon">进价</div>
                                        <input ng-model="component.price" class="form-control" placeholder="请输入配件进价">
                                    </div>
                                </div>
                                <div class="col-md-6 col-xs-12" style="margin-bottom:10px">
                                    <div class="input-group" id="sale">
                                        <div class="input-group-addon">售价</div>
                                        <input ng-model="component.sale" class="form-control" placeholder="请输入配件售价">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-xs-12" style="margin-bottom:10px" ng-init="getFactorys()">
                                    <div class="input-group" id="factory">
                                        <div class="input-group-addon">商家</div>
                                        <select class="form-control" ng-model="component.fid" ng-options="f.id as f.name for f in factorys">
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 col-xs-12" style="margin-bottom:10px">
                                    <div class="input-group" id="price">
                                        <div class="input-group-addon">质保</div>
                                        <input ng-model="component.term" class="form-control" placeholder="请输入质保期">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                            	<div class="col-md-12 col-xs-12" style="margin-bottom:10px">
                                    <div class="input-group" id="factory">
                                        <div class="input-group-addon">厂家</div>
                                        <input ng-model="component.factory" class="form-control" placeholder="请输入生产厂家">
                                    </div>
                                </div>
                            </div>    
                            <div class="row">
                                <div class="col-md-12 col-xs-12" style="margin-bottom:10px">
                                    <div class="input-group" id="info">
                                        <div class="input-group-addon">备注</div>
                                        <textarea rows='3' ng-model="component.info" class="form-control"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-8 col-xs-12" style="margin-bottom:10px">
                                    <div style="padding:6px 15px" class="alert alert-warning" ng-show="isok">{{msg}}</div>
                                </div>
                                <div class="col-md-4 col-xs-12 text-right" style="margin-bottom:10px">
                                    <button id="btnCancel" class="btn btn-default" ng-click="cancel()">重置</button>
                                    <button id="btnSave" class="btn btn-primary" ng-click="save()">保存</button>
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="profile" style="padding:15px;border:1px solid #ddd;border-top:0">
                            <div class="table-responsive">
                            	<table class="table table-bordered">
                            		<tr>
                            			<th colspan="5" class="text-center"><strong>{{component.name}}</strong></th>
                            		</tr>
                            		<tr class="active">
                            			<th>序号</th><th>配件型号</th><th>进价</th><th>售价</th><th>库存数量</th>
                            		</tr>
                            		<tr ng-repeat="stock in component.stocks">
                            			<td>{{$index+1}}</td>
                            			<td>{{stock.size}}</td>
                            			<td>{{stock.price}}</td>
                            			<td>{{stock.sale}}</td>
                            			<td>{{stock.quantity}}</td>
                            		</tr>
                            	</table>
                            </div>
                        </div>
                        
                      </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<script type="text/javascript">
    $(function(){
        $('#mytab a').click(function() {
           var p = $(this).attr("aria-controls");
		   if(p=='home'){
		      $("#profile").hide(10); 
		  	  $("#home").show(10);
		   }else{
		      $("#home").hide(10); 
		  	  $("#profile").show(10);
		   }
	    });
    });
</script>