var app = angular.module('app',["ui.router"]);
app.directive('dialog',function(){
	return {
		restrict:'E',
		templateUrl:"dialog.jsp",
		replace:true,
		link:function(scope,e,attrs){
			$("#confirm").find(".modal-title").text(attrs.title);
			$("#confirm").find(".modal-body").text(attrs.message);
			$("#confirm-ok").click(function(){
				$("#confirm").modal('hide');
				scope.remove();
			});
		}
	}
});
app.config(function ($stateProvider, $urlRouterProvider) {
    $urlRouterProvider.when("", "/brand");
    $stateProvider
    .state('default', {
        url: '/default',
        templateUrl: 'default.jsp',
        controller:'DefaultCtrl'
    })
	.state('brand', {
        url: '/brand',
        templateUrl: 'brand.jsp',
        controller:'BrandCtrl'
    })
    .state('emp', {
        url: '/emp',
        templateUrl: 'emp.jsp',
        controller:'EmpCtrl'
    })
    .state("size", {
        url:"/size",
        templateUrl: "size.jsp",
        controller:'SizeCtrl'
    })
    .state("factory", {
        url:"/factory",
        templateUrl: "factory.jsp",
        controller:'FactoryCtrl'
    })
    .state("factorys", {
        url:"/factorys",
        templateUrl: "factorys.jsp",
        controller:'FactoryCtrl'
    })
    .state("category", {
        url:"/category",
        templateUrl: "category.jsp",
        controller:'CategoryCtrl'
    })
    .state("component", {
        url:"/component",
        templateUrl: "component.jsp",
        controller:'ComponentCtrl'
    })
    .state("components", {
        url:"/components",
        templateUrl: "components.jsp",
        controller:'ComponentCtrl'
    })
    .state("customs", {
        url:"/customs",
        templateUrl: "customs.jsp",
        controller:'CustomCtrl'
    })
    .state("car", {
        url:"/car",
        templateUrl: "car.jsp",
        controller:'CarCtrl'
    })
    .state("cars", {
        url:"/cars",
        templateUrl: "cars.jsp",
        controller:'CarCtrl'
    })
    .state("record", {
        url:"/record",
        templateUrl: "record.jsp",
        controller:'RecordCtrl'
    })
    .state("records", {
        url:"/records",
        templateUrl: "records.jsp",
        controller:'RecordCtrl'
    })
    .state("repwd", {
        url:"/repwd",
        templateUrl: "repwd.jsp"
    })
    .state("money", {
        url:"/money",
        templateUrl: "money.jsp",
        controller:'RecordCtrl'
    })
    .state("stock", {
        url:"/stock",
        templateUrl: "smoney.jsp",
        controller:'ComponentCtrl'
    })
    .state("instock", {
        url:"/instock",
        templateUrl: "instock.jsp",
        controller:'InstockCtrl'
    })
    .state("stocks", {
        url:"/stocks",
        templateUrl: "stocks.jsp",
        controller:'InstockCtrl'
    })
    .state("instocks", {
        url:"/instocks",
        templateUrl: "instocks.jsp",
        controller:'InstockCtrl'
    })
});