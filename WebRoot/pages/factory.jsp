<%@ page pageEncoding="UTF-8"%>
	<div class="row hidden-xs">
        <div class="col-lg-12">
            <h3 class="page-header">供应商管理</h3>
        </div>
    </div>
    <div class="row" ng-init="get()">
        <div class="col-lg-12">
            <div class="panel panel-default" style="margin-top:15px">
                <div class="panel-heading">
                	<div class="row">
						<div class="col-md-6 col-xs-8">
                        <i class="glyphicon glyphicon-user"></i> 供应商信息录入
                        </div>
                        <div class="col-md-6 col-xs-4 text-right">
                        <a href="index.jsp#/factorys"><i class="glyphicon glyphicon-list"></i></a>
                        </div>
					</div>		
                </div>
                <div class="panel-body">
                	<div class="form-group" ng-class="{true:'has-success',false:'has-error'}[isok1]">
                		<div class="input-group">
                			<div class="input-group-addon">供应商名称</div>
                			<input ng-model="factory.name" class="form-control" placeholder="请输入供应商名称">
                			<input ng-model="factory.id" type="hidden"/>
                		</div>
                        <p style="text-align: right">{{msg1}}</p>
                	</div>
                	<div class="form-group" ng-class="{true:'has-success',false:'has-error'}[isok2]">
                		<div class="input-group">
                			<div class="input-group-addon">联系人姓名</div>
                			<input ng-model="factory.person" class="form-control" placeholder="请输入联系人姓名">
                		</div>
                        <p style="text-align: right">{{msg2}}</p>
                	</div>
                	<div class="form-group" ng-class="{true:'has-success',false:'has-error'}[isok3]">
                		<div class="input-group">
                			<div class="input-group-addon">供应商电话</div>
                			<input ng-model="factory.phone" class="form-control" placeholder="请输入联系电话">
                		</div>
                        <p style="text-align: right">{{msg3}}</p>
                	</div>
                	<div class="form-group">
                		<div class="input-group">
                			<div class="input-group-addon">供应商地址</div>
                			<input ng-model="factory.address" class="form-control" placeholder="请输入供应地址">
                		</div>
                	</div>
                	<div class="form-group">
                		<div class="input-group">
                			<div class="input-group-addon">供应商账户</div>
                			<input ng-model="factory.account" class="form-control" placeholder="请输入供应商账户">
                		</div>
                        <label>{{msg4}}</label>
                	</div>
                	
                	<div class="row">
                		<div class="col-md-10">
                		  <p class="alert" style="padding:5px 15px" ng-class="{true:'alert-success',false:'alert-danger'}[flog]" ng-show="show" ng-bind="message"></p>
                		</div>
                		<div class="col-md-2">
                			<button class="btn btn-primary btn-block" ng-click="save()">保存</button>
                		</div>
                	</div>
                </div>
            </div>
        </div>
    </div>