<%-- 
    Document   : busqueda
    Created on : 08-nov-2017, 22:51:45
    Author     : Abdiel Salas Pérez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html ng-app="app">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>UANL</title>
        <link rel="icon" type="image/ico" href="${pageContext.servletContext.contextPath}/resources/ico/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/bootstrap/assets/css/font-awesome.min.css">
        <script src="${pageContext.servletContext.contextPath}/resources/js/angular/angular.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/css/bootstrap/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,400,700&subset=latin-ext" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/header.css">

    </head>
    <body ng-controller="busqueda">
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container" style="height: 120px; margin-bottom: 2%;">
                <div class="navbar-header">

                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button> 
                    <a class="navbar-brand" href="#"><img src="resources/img/logo.png" width="180" height="100" data-active-url="resources/img/logo.png" alt=""></a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="login.htm">MI CUENTA</a></li>
                        <li><a href="https://www.facebook.com/Congreso-Nacional-de-Investigaci%C3%B3n-en-Medicina-1383778481850063/"><i class="fa fa-facebook"></i></a></li>
                        <li><a><i class="fa fa-twitter"></i></a></li>
                        <li><a><i class="fa fa-tumblr"></i></a></li>
                        <li><a><i class="fa fa-vimeo-square"></i></a></li>
                        <li><a><i class="fa fa-linkedin"></i></a></li>
                        <li><a><i class="fa fa-dribbble"></i></a></li>
                        <li><a><i class="fa fa-instagram"></i></a></li>
                        <li><a><i class="fa fa-rss"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div style="margin-top: 12%">
            <div class="col-lg-12" id="menu">
                <div class="panel panel-success">
                    <div class="panel-heading"><i class="fa fa-clock-o fa-fw"></i>{{resultadoUnico[0].titulo}}</div>
                    <div class="panel-body">
                        {{resultadoUnico[0].resumen}}
                    </div>
                </div>
            </div>
        </div>

        <script>
                    var app = angular.module('app', []);
                    app.controller('busqueda', function ($scope, $http, $interval) {

                        $scope.buscar = function () {

                            $http.get("buscar?palabra=${param["busqueda"]}")
                                    .success(function (response) {
                                        $scope.resultadoUnico = response;
                                    })
                                    .error(function () {});
                        };
                        $scope.buscar();
                    });
        </script>
    </body>
</html>
