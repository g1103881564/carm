<%@ page pageEncoding="UTF-8"%>
<div class="row hidden-xs">
  <div class="col-lg-12">
    <h3 class="page-header">用户管理</h3>
  </div>
</div>
<div class="row" style="margin-top:5px">
  <div class="col-lg-12">
    <div class="panel panel-default">
      <div class="panel-heading">
        <i class="glyphicon glyphicon-bookmark"></i> 修改管理员密码
      </div>
      <div class="panel-body">
        <div class="form-group">
		  	<div class="input-group">
			  <div class="input-group-addon">原密码</div>
			  <input id="ypwd" placeholder="请输入原密码" class="form-control"/>
		  	</div>
		</div>
		<div class="form-group">
		  	<div class="input-group">
			  <div class="input-group-addon">新密码</div>
			  <input id="npwd" placeholder="请输入新密码" class="form-control"/>
		  	</div>
		</div>
		<div class="row">
			<div class="col-md-10 col-xs-8">
				<p class="alert" id="pwdmsg" style="padding:6px 15px"></p>
			</div>
			<div class="col-md-2 col-xs-4">  
		  	  <button id="btnpwd" class="btn btn-primary btn-block">保存</button>
			</div>  
	    </div>
      </div>
    </div>
  </div>
</div>
<script>
	$(function(){
		$("#btnpwd").click(function(){
			var ypwd = $("#ypwd").val();
			var npwd = $("#npwd").val();
			if(ypwd.length<5){
				$("#pwdmsg").html("请输入正确的原始密码！");
				$("#pwdmsg").removeClass("alert-success");
				$("#pwdmsg").addClass("alert-danger");
				return false;
			}
			if(npwd.length<5){
				$("#pwdmsg").html("请输入正确的新密码！");
				$("#pwdmsg").removeClass("alert-success");
				$("#pwdmsg").addClass("alert-danger");
				return false;
			}
			$.ajax({
				url:'admin/update',
				data:{ypwd:ypwd,npwd:npwd},
				method:'post',
				success:function(flog){
					if(flog){
						$("#pwdmsg").html("新密码设置成功，请记住新密码！");
						$("#pwdmsg").removeClass("alert-danger");
						$("#pwdmsg").addClass("alert-success");
					}else{
						$("#pwdmsg").html("密码修改不成功,请重试！");
						$("#pwdmsg").removeClass("alert-success");
						$("#pwdmsg").addClass("alert-danger");
					}
				}
			});
		});
	});
</script>