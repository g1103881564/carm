<%@ page pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>管理员登录</title>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
  	<script type="text/javascript" src="resources/js/jquery.min.js"></script>
  	<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
  </head>
  <body>
  	<div class="container">
  		<div class="row hidden-xs" style="height:150px"></div>
  		<div class="row">
  			<div class="col-md-6 col-md-offset-3 col-xs-12">
  				<div class="panel panel-primary">
				  <div class="panel-heading">
				    <h3 class="panel-title">
				    	<i class="glyphicon glyphicon-user"></i> 管理员登录
				    </h3>
				  </div>
				  <div class="panel-body">
				    <div class="form-group" style="margin-bottom:30px">
				    	<div class="input-group">
				    		<div class="input-group-addon" style="background:#fff">账号</div>
				    		<input class="form-control" id="uname" placeholder="请输入用户名">
				    	</div>
				    </div>
				    <div class="form-group" style="margin-bottom:30px">
				    	<div class="input-group">
				    		<div class="input-group-addon" style="background:#fff">口令</div>
				    		<input class="form-control" type="password" id="upwd" placeholder="请输入密码">
				    	</div>
				    </div>
				    <div class="form-group">
				    	<div class="input-group">
				    		<div class="input-group-addon" style="background:#fff">验证</div>
				    		<input class="form-control" id="code" placeholder="请输入验证码">
				    		<div class="input-group-addon" style="background:#fff;padding:0"><img src="image.jsp" id="rcode"></div>
				    	</div>
				    </div>
				  </div>
				  <div class="panel-footer" style="background:#fff">
				  	<div class="row">
				  		<div class="col-md-7 col-xs-6" id="logmsg"></div>
				  		<div class="col-md-5 col-xs-6 text-right">
				  			<button class="btn btn-primary" id="btnLogin">  登 录   </button>
				  		</div>
				  	</div>	
				  </div>
				</div>
  			</div>
  		</div>
  	</div>	
	<script type="text/javascript">
		$(function(){
			$("#uname").focus();
			$("#uname").keypress(function(event){
				if (event.keyCode == 13){
					$("#upwd").focus();
				}
			});
			$("#upwd").keypress(function(event){
				if (event.keyCode == 13){
					$("#code").focus();
				}
			});
			$("#code").keypress(function(event){
				if (event.keyCode == 13){
					$("#btnLogin").click();
				}
			});
			$("#rcode").click(function(){
				location.reload();
			});
			$("#btnLogin").click(function(){
				var code = $("#code").val();
				var uname = $("#uname").val();
				var upwd = $("#upwd").val();
				if(uname.length<2){
					$("#logmsg").html("<span style='color:red'>请输入正确的用户名！</span>");
					return;
				}else{
					$("#logmsg").html("");
				}
				if(upwd.length<4){
					$("#logmsg").html("<span style='color:red'>请输入正确的密码！</span>");
					return;
				}else{
					$("#logmsg").html("");
				}
				if(code.length<4){
					$("#logmsg").html("<span style='color:red'>请输入正确的验证码！</span>");
					return;
				}else{
					$("#logmsg").html("");
				}
				
				$.getJSON("admin/check/"+code,function(flog){
					if(!flog){
						$("#logmsg").html("<span style='color:red'>验证码输入有误，请重试！</span>");
					}else{
						var admin = {username:uname,password:upwd,code:code};
						$.getJSON("admin/login",admin,function(data){
							if(data.id>0){
								location.href="pages/index.jsp#/default";
							}
						});
					}
				});	
			});
		});
	</script>
  </body>
</html>
