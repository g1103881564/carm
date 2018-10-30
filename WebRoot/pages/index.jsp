<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>汽修管理信息系统</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="resources/images/favicon.ico"/>
    <link href="../resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/css/metisMenu.min.css" rel="stylesheet">
    <link href="../resources/css/timeline.css" rel="stylesheet">
    <link href="../resources/css/sb-admin-2.css" rel="stylesheet">
    <link href="../resources/css/jquery-ui.min.css" rel="stylesheet">
    <link href="../resources/css/morris.css" rel="stylesheet">
    <link href="../resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <script src="../resources/js/jquery.min.js"></script>
    <script src="../resources/js/jquery-ui.min.js"></script>
    <script src="../resources/js/bootstrap.min.js"></script>
    <script src="../resources/js/metisMenu.min.js"></script>
    <script src="../resources/js/sb-admin-2.js"></script>
    <script src="../resources/js/angular.min.js"></script>
    <script src="../resources/js/angular-ui-router.js"></script>
    <script src="../resources/js/echarts.min.js"></script>
    <script src="../resources/angular/app.js"></script>
    <script src="../resources/angular/brand.js"></script>
    <script src="../resources/angular/size.js"></script>
    <script src="../resources/angular/factory.js"></script>
    <script src="../resources/angular/category.js"></script>
    <script src="../resources/angular/component.js"></script>
    <script src="../resources/angular/custom.js"></script>
    <script src="../resources/angular/car.js"></script>
    <script src="../resources/angular/record.js"></script>
    <script src="../resources/angular/emp.js"></script>
    <script src="../resources/angular/default.js"></script>
    <script src="../resources/angular/instock.js"></script>
    <!--[if lt IE 9]>
        <script src="../resources/js/html5shiv.js"></script>
        <script src="../resources/js/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        *{
            font-family:'微软雅黑';
        }
    </style>
  </head>
  
  <body ng-app="app">
    
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <img style="float:left;margin-top:2px;margin-left:10px" width="10%" src="../resources/images/ca.png"/>
                <a class="navbar-brand"> 汽修管理信息系统 v2.0</a>
            </div>
            <ul class="nav navbar-top-links navbar-right hidden-xs">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> ${admin.username} <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="index.jsp#/repwd"><i class="fa fa-gear fa-fw"></i> 修改密码</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="../logout.jsp"><i class="fa fa-sign-out fa-fw"></i> 安全退出</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                    	<li>
                    		<a href="index.jsp#/default"><i class="glyphicon glyphicon-th-large"></i> 首 页</a>
                    	</li>
                    	<li>
                            <a href="index.jsp#/emp"><i class="glyphicon glyphicon-user"></i> 员工信息管理</a>
                        </li>
                        <li>
                            <a href="index.jsp#/brand"><i class="glyphicon glyphicon-bookmark"></i> 汽车品牌管理</a>
                        </li>
                        <li>
                            <a href="index.jsp#/size"><i class="glyphicon glyphicon-leaf"></i> 汽车型号管理</a>
                        </li>
                        
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-briefcase"></i> 供应商管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="index.jsp#/factory"><i class="glyphicon glyphicon-save"></i> 供应商信息录入</a>
                                </li>
                                <li>
                                    <a href="index.jsp#/factorys"><i class="glyphicon glyphicon-search"></i> 供应商信息查询</a>
                                </li>
                            </ul>
                        </li>
                        
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-cog"></i> 汽车配件管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="index.jsp#/category"><i class="glyphicon glyphicon-th-list"></i> 配件类别管理</a>
                                </li>
                                <li>
                                    <a href="index.jsp#/component"><i class="glyphicon glyphicon-save"></i> 配件信息录入</a>
                                </li>
                                <li>
                                    <a href="index.jsp#/components"><i class="glyphicon glyphicon-search"></i> 配件信息查询</a>
                                </li>
                            </ul>
                        </li>
                        
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-shopping-cart"></i> 配件入库管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="index.jsp#/instock"><i class="glyphicon glyphicon-save"></i> 配件入库登记</a>
                                </li>
                                <li>
                                    <a href="index.jsp#/stocks"><i class="glyphicon glyphicon-search"></i> 入库记录查询</a>
                                </li>
                            </ul>
                        </li>
                        
                        <li>
                            <a href="index.jsp#/customs"><i class="glyphicon glyphicon-king"></i> 客户信息管理</a>
                        </li>
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-knight"></i> 车辆信息管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="index.jsp#car"><i class="glyphicon glyphicon-save"></i> 车辆信息登记</a>
                                </li>
                                <li>
                                    <a href="index.jsp#cars"><i class="glyphicon glyphicon-search"></i> 车辆信息查询</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-wrench"></i> 维修信息管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="index.jsp#record"><i class="glyphicon glyphicon-save"></i> 维修信息登记</a>
                                </li>
                                <li>
                                    <a href="index.jsp#records"><i class="glyphicon glyphicon-search"></i> 维修信息查询</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="glyphicon glyphicon-picture"></i> 统计查询<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="index.jsp#money"><i class="glyphicon glyphicon-object-align-bottom"></i> 收入与利润统计</a>
                                </li>
                                <li>
                                    <a href="index.jsp#instocks"><i class="glyphicon glyphicon-object-align-bottom"></i> 配件入库信息统计</a>
                                </li>
                                <li>
                                    <a href="index.jsp#stock"><i class="glyphicon glyphicon-object-align-bottom"></i> 配件库存价值统计</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div id="page-wrapper" ui-view="">
            
        </div>
    </div>
    
  </body>
</html>