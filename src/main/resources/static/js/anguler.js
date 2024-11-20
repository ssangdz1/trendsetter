var app = angular.module('myApp', ['ngRoute']);

app.config(['$routeProvider', function ($routeProvider) {
    $routeProvider
        .when('/hien-thi-san-pham', {
            templateUrl: '/hien-thi-san-pham',
            controller: 'SanPhamController'
        })
        .when('/hien-thi-san-pham-chi-tiet', {
            templateUrl: '/hien-thi-san-pham-chi-tiet',
            controller: 'ChiTietSanPhamController'
        })
        .when('/hien-thi-hoa-don', {
            templateUrl: '/hien-thi-hoa-don',
            controller: 'HoaDonController'
        })
        .when('/hien-thi-hoa-don-chi-tiet', {
            templateUrl: '/hien-thi-hoa-don-chi-tiet',
            controller: 'HoaDonChiTietController'
        })
        .when('/hien-thi-nhan-vien', {
            templateUrl: '/hien-thi-nhan-vien',
            controller: 'NhanVienController'
        })
        .when('/hien-thi-khach-hang', {
            templateUrl: '/hien-thi-khach-hang',
            controller: 'KhachHangController'
        })
        .when('/hien-thi-thong-ke', {
            templateUrl: '/hien-thi-thong-ke',
            controller: 'ThongKeController'
        })
        .otherwise({
            redirectTo: ''
        });
}]);

// Controllers cho từng phần

app.controller('SanPhamController', ['$scope', function ($scope) {
    $scope.message = "Đây là trang Quản Lý Sản Phẩm.";
}]);

app.controller('ChiTietSanPhamController', ['$scope', function ($scope) {
    $scope.message = "Đây là trang Quản Lý Sản Phẩm Chi Tiết.";
}]);

app.controller('HoaDonController', ['$scope', function ($scope) {
    $scope.message = "Đây là trang Quản Lý Hóa Đơn.";
}]);

app.controller('HoaDonChiTietController', ['$scope', function ($scope) {
    $scope.message = "Đây là trang Quản Lý Hóa Đơn Chi Tiết.";
}]);

app.controller('NhanVienController', ['$scope', function ($scope) {
    $scope.message = "Đây là trang Quản Lý Nhân Viên.";
}]);

app.controller('KhachHangController', ['$scope', function ($scope) {
    $scope.message = "Đây là trang Quản Lý Khách Hàng.";
}]);