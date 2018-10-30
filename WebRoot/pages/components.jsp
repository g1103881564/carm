<%@ page pageEncoding="UTF-8"%>
<div class="row hidden-xs">
	<div class="col-lg-12">
		<h3 class="page-header">配件信息管理</h3>
	</div>
</div>
<div class="row" ng-controller="ComponentCtrl">
	<div class="col-lg-12">
		<div class="panel panel-default" style="margin-top:15px">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-8">
						<i class="glyphicon glyphicon-user"></i> 配件信息查询
					</div>
					<div class="col-xs-4 text-right">
						<a style="cursor:pointer;" id="search"><i
							class="glyphicon glyphicon-search"></i>
						</a>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<div style="display:none" id="query-panel">
					<div class="row">
						<div class="col-md-3 col-xs-12" style="margin-bottom:10px" ng-init="getCategorys()">
							<select ng-model="comp.cid" class="form-control"
								ng-options="c.id as c.name for c in categorys">
							</select>
						</div>
						<div class="col-md-3 col-xs-12" style="margin-bottom:10px">
							<input ng-model="comp.name" class="form-control"
								placeholder="配件名称" />
						</div>
						<div class="col-md-4 col-xs-12 form-inline" style="margin-bottom:10px">
							<div class="input-group">
								<input class="form-control" ng-model="comp.sale" placeholder="售价">
								<div class="input-group-addon" style="background:#fff;padding:9px 5px 11px 5px;border-left:0;border-right:0">至</div>
								<input class="form-control" ng-model="comp.sale2" placeholder="售价">
							</div>
						</div>
						<div class="col-md-2 col-xs-12" style="margin-bottom:10px">
							<button ng-click="find(1)" class="btn btn-primary btn-block">查询</button>
						</div>
					</div>
				</div>

				<p style="padding:5px 15px;margin-bottom:5px" ng-show="show"
					ng-class="{true:'bg-success',false:'bg-danger'}[isok]">{{message}}</p>
				<div class="table-responsive" ng-init="find(1)">
					<table class="table table-bordered table-hover">
						<tr class="active">
							<th width="7%">序号</th>
							<th>编号</th>
							<th width="20%">名称</th>
							<th width="10%">售价</th>
							<th width="18%">生产厂商</th>
							<th width="12%">质保期</th>
							<th width="7%">库存</th>
							<th width="7%" class="text-center">编辑</th>
							<th width="7%" class="text-center">删除</th>
						</tr>
						<tr ng-repeat="c in components" ng-click="getComponentId(c.id)">
							<td>{{$index+1}}</td>
							<td>{{c.code}}</td>
							<td>{{c.name}}</td>
							<td>{{c.sale}}</td>
							<td>{{c.factory}}</td>
							<td>{{c.term}}</td>
							<td><a style="cursor:pointer" cname="{{c.name}}" cid="{{c.id}}"
								onclick="showstocks(this)">库存</a>
							</td>
							<td class="text-center">
								<a
								href="index.jsp#/component?id={{c.id}}"> <i
									class="glyphicon glyphicon-pencil"></i> </a></td>
							<td class="text-center">
								<a style="cursor:pointer;"
								ng-click="dialog(c.id)"> <i class="glyphicon glyphicon-trash"></i>
							</a></td>
						</tr>
					</table>
				</div>
				<div class="row" ng-show="showpages">
					<div class="col-md-12 text-center">
						<nav aria-label="Page navigation">
							<ul class="pagination" style="margin:0">
								<li><a style="cursor:pointer" ng-click="find(1)"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li ng-repeat="i in pages" ng-class="{true:'active'}[i==comp.page]"><a
									style="cursor:pointer;" ng-click="find(i)">{{i}}</a>
								</li>
								<li><a style="cursor:pointer" ng-click="find(pagecount)"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!--modal -->
<div id="dialog2" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog2">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">配件库存信息管理</h4>
			</div>
			<div class="modal-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="tab-stocks">
						<tr>
							<th colspan="5" class="text-center"><strong id="pjmc"></strong></th>
						</tr>
						<tr class="active">
							<th>序号</th><th>配件型号</th><th>进价</th><th>售价</th><th>库存数量</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<dialog title="警告" message="是否要删除该配件信息？" />
<script type="text/javascript">
	var cid = 0;
	function showstocks(a) {
		$("#tab-stocks tr:gt(1)").remove();
		$("#pjmc").text($(a).attr("cname"));
		$("#dialog2").modal({
			keyboard : false
		});
		cid = $(a).attr("cid");
		$.getJSON("stock/find/" + cid, function(data) {
			if (JSON.stringify(data).length > 2) {
				$.each(data, function(i, s) {
					var $row = $("<tr></tr>");
					$("<td>"+(i+1)+"</td>").appendTo($row);
					$("<td>"+s.size+"</td>").appendTo($row);
					$("<td>"+s.price+"</td>").appendTo($row);
					$("<td>"+s.sale+"</td>").appendTo($row);
					$("<td>"+s.quantity+"</td>").appendTo($row);
					$("#tab-stocks").append($row);
				});
			}
		});
	}

	$(function() {
		$("#search").click(function() {
			var $a = $("#query-panel");
			$a.slideToggle(500);
		});
	});
</script>
