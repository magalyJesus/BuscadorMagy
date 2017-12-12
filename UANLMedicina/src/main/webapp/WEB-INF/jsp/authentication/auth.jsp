<%-- 
    Document   : aunth
    Created on : 14-nov-2016, 22:18:17
    Author     : Abdiel Salas Pérez
--%>

<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html ng-app="app">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>UANL</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/>
        <link rel="icon" type="image/ico" href="${pageContext.servletContext.contextPath}/resources/ico/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/bootstrap/assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/bootstrap/assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/index.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/login.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/jquery-ui.css">
        <script src="${pageContext.servletContext.contextPath}/resources/js/angular/angular.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/css/bootstrap/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,400,700&subset=latin-ext" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/header.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/bxslider/jquery.bxslider.min.css">
        <script src="${pageContext.servletContext.contextPath}/resources/js/jquery.bxslider.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/js/jquery-ui.js"></script>
    </head>

    <body id="cuerpo" ng-controller="index">

        <style>
            <!--slider-->
            .jk-slider{
                width:100%;
            }
            /*          Hero Headers        */
            /********************************/
            .hero {
                position: absolute;
                top: 50%;
                left: 50%;
                z-index: 3;
                color: #fff;
                text-align: center;
                text-transform: uppercase;
                text-shadow: 1px 1px 0 rgba(0,0,0,.75);
                -webkit-transform: translate3d(-50%,-50%,0);
                -moz-transform: translate3d(-50%,-50%,0);
                -ms-transform: translate3d(-50%,-50%,0);
                -o-transform: translate3d(-50%,-50%,0);
                transform: translate3d(-50%,-50%,0);
            }
            .hero h1 {
                font-size: 6em;    
                font-weight: bold;
                margin: 0;
                padding: 0;
            }

            .fade-carousel .carousel-inner .item .hero {
                opacity: 0;
                -webkit-transition: 2s all ease-in-out .1s;
                -moz-transition: 2s all ease-in-out .1s; 
                -ms-transition: 2s all ease-in-out .1s; 
                -o-transition: 2s all ease-in-out .1s; 
                transition: 2s all ease-in-out .1s; 
            }
            .fade-carousel .carousel-inner .item.active .hero {
                opacity: 1;
                -webkit-transition: 2s all ease-in-out .1s;
                -moz-transition: 2s all ease-in-out .1s; 
                -ms-transition: 2s all ease-in-out .1s; 
                -o-transition: 2s all ease-in-out .1s; 
                transition: 2s all ease-in-out .1s;    
            }

            .textSearch{
                border: 1px solid #DBE1EB;
                padding-left: 20px;
                padding-right: 10px;
                padding-top: 10px;
                padding-bottom: 10px;
                border-radius: 4px;
                -moz-border-radius: 4px;
                -webkit-border-radius: 25px;
                -o-border-radius: 25px;
                background: #FFFFFF; 
                width: 60%;

            }

            .textSearch:focus
            {
                color: #2E3133;
                border-color: #FBFFAD;
            }
        </style>
<!--Nuevo Header-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light" ng-init="listarImagenes()">
            <a class="navbar-brand" href="index.php"> 
                <img ng-repeat="lstLogo in listaImagenes| filter : {tipo : 'LG1'}" src="${pageContext.request.contextPath}/resources/img/sliders/{{lstLogo.url}}" style="width: 25%; height: 115px;"/>
            </a>
            <!--<button class="navbar-toggler " type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>-->

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="" data-toggle="modal" class="buttonNewCuenta" data-target="#loginn">MI CUENTA</a></li>
                    <li ng-repeat="lstSm in listaImagenes| filter : {tipo : 'SM'}" ng-if="lstSm.activo>0"><a href="{{lstSm.url}}"><i class="fa fa-{{lstSm.nombre}}"></i></a></li>
                </ul>
            </div>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active">
                        <c:forEach var="menu" items="${listaMenu}">
                            <c:if test = "${menu.tipo == 'M'}">
                                <div class="dropdown">
                                    <a href="${menu.ruta}"><button class="dropbtn"><c:out value="${menu.nombre}"/></button></a>
                                        <c:set var="idMenu"><c:out value="${menu.idMenu}"/></c:set>
                                        <c:set var="depe"><c:out value="${menu.dependencia}"/></c:set>
                                        <div class="dropdown-content">
                                        <c:forEach var="submenu" items="${listaMenu}">
                                            <c:if test = "${submenu.tipo == 'S'}">
                                                <c:if test = "${depe == submenu.dependencia}">
                                                    <a href="${pageContext.servletContext.contextPath}/menussubmenus?file=${submenu.nombre}">${submenu.nombre}</a>
                                                </c:if>
                                            </c:if>
                                        </c:forEach>  
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </li>
                </ul>
            </div>
        </nav>
<!--Fin Nav-->
<div class='thetop'></div>
<div class='testheight'><br><br>

</div>


  <!-- Inicia Slider principal-->
 
        <section class="jk-slider" style="margin-top: -22px">
            <div id="carousel-example" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div ng-repeat="ltImagenMain in listaImagenes| filter : {tipo : 'S1'}"  class="item {{$index == 0?'active':''}}" >
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/resources/img/sliders/{{ltImagenMain.url}}" width="100%" style="margin-top:90px;">
                        </a>
                        

                        <div class="hero">
                            <hgroup>
                                <p><span class="tituloSliderFT"> {{ltImagenMain.nombre}}</span></p>
                                <p><span class="tituloSliderFTSegundo">{{ltImagenMain.descripcion}}</span></p>
                                <div class="buscadorFondo">
                                    <input class="textSearch" ng-model="search" ng-keydown="listarBusqueda($event, search)" placeholder="Realiza una búsqueda">
                                    <button class="btn btn-success" ng-click="buscar(search)">Buscar</button>
                                    <button class="btn btn-success" ng-click="buscar(search)">Avanzado</button>
                                </div>
                            </hgroup>
                        </div>
                    </div>
                </div>
            </div>
        </section>
                        
                        
                        
    <!--<div class="h-sec1-banner">
       <ul class="bxslider-home">
           <li class="h-sec1">
                <div class="col-sm-12 texto">
                    <span class="titulo1"><p>TALISIS</p> </span>
                    <span class="titulo2"><p>LEARNING AND DEVELOPMENT</p> </span>
                     <span class="titulo3"><p>DRIVE CHANGE TO EMPOWER YOUR BUSINESS</p> </span>
                 </div>         
            </li>
            <li class="h-sec2">
                 <div class="col-sm-12 texto">
                     <span class="titulo1"><p>TALISIS</p> </span>
                     <span class="titulo2"><p>LEARNING AND DEVELOPMENT</p> </span>
                     <span class="titulo3"><p>DRIVE CHANGE TO EMPOWER YOUR BUSINESS</p> </span>
                 </div> 
            </li>
            <li class="h-sec3">
                 <div class="col-sm-12 texto">
                     <span class="titulo1"><p>TALISIS</p> </span>
                     <span class="titulo2"><p>LEARNING AND DEVELOPMENT</p> </span>
                     <span class="titulo3"><p>DRIVE CHANGE TO EMPOWER YOUR BUSINESS</p> </span>
                 </div>          
            </li>
        </ul>
    </div> -->                   
                        
                        
   <!-- Finaliza Slider principal-->
        <div class="container"><br><br>
            <div class="mtituloDespuesSlider">
                <h4 class="margin-top" ng-repeat="lstImagenTite1 in listaImagenes| filter : {tipo : 'S5'}"><span class="mtituloDespuesSliderFont"> {{lstImagenTite1.descripcion}}</span></h4>
            </div>
        </div><br><br>

        
        <div class="container">
            <div class="row">

                <div id="carousel-center" class="carousel slide hidden-xs" data-ride="carousel">
                    <!-- Wrapper for slides -->
                     <div class="controls pull-left hidden-xs">
                       <a class="left fa fa-chevron-left btn btn-info" href="#carousel-center"
                               data-slide="prev" style="margin-top: 150px !important; margin-left:-42px; position: absolute;"></a>
                        <a class="left fa fa-chevron-right btn btn-info" href="#carousel-center" data-slide="next"
                            style="margin-top: 150px !important; margin-left:101%; position: absolute;"></a>
                     </div>
                  
                    <div class="carousel-inner" >
                      
                        <div ng-repeat="listaImg in listaImagenes| filter : {tipo : 'S2'}" ng-if="$index % 4 == 0" class="item {{$index==0?'active':''}}" ng-init="parentIndex = $index">
                           
                            <div class="row">
                          
                                <div ng-repeat="listImage in listaImagenes| filter : {tipo : 'S2'}" class="col-sm-3" ng-if="$index >= parentIndex && $index < (parentIndex + 4)">
                                    <div class="col-item">
                                        <div class="photo">
                                            <img src="${pageContext.request.contextPath}/resources/img/sliders/{{listImage.url}}" class="img-responsive"  style="height: 200px">
                                        </div>
                                        <div class="info">
                                            <div class="row">
                                                <div class="price col-md-6"  style="height: 100px;">
                                                    <h5 class="price-text-color">{{listImage.nombre}}</h5>
                                                    <!--{{listImage.descripcion| limitTo: 20 }}...-->
                                                </div>
                                            </div>
                                            <div class="separator clear-left">
                                                <p class="btn-details">

                                                    <a href="#" class="hidden-sm magalyVerMas"  data-toggle="modal" data-target="#modalVerMas" ng-click="construirImagen(listImage.idImagen, listImage.nombre, listImage.descripcion, listImage.url, listImage.tipo, listImage.activo)">>> Ver más</a></p>
                                            </div>
                                            <div class="clearfix">
                                            </div>
                                            
                                        </div>
                                    </div>
                                        
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
                                        
                
                <div class="row">
                    <div class="col-lg-9 col-md-9 col-sm-6"></div>
                    <div class="col-lg-3 col-md-3 col-sm-6">
                        <!-- Controls -->
                        <br><br><br><br>
                            
                            <!--    <div class="controls pull-left hidden-xs" style="margin-top: 150px !important; margin-left:-42px;">
                                <a class="left fa fa-chevron-left btn btn-info" href="#itemslider" data-slide="prev"></a>
                            <a class="left fa fa-chevron-right btn btn-info" href="#itemslider" data-slide="next"></a>-->
                     </div>
                    </div>
                </div>
            </div>
            <style>
                @import url(http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css);
                .col-item {border: 1px solid #E1E1E1; border-radius: 5px; background: #FFF; }
                .col-item .photo img {margin: 0 auto;width: 100%;}
                .col-item .info {padding: 10px; border-radius: 0 0 5px 5px; margin-top: 1px;}
                .col-item:hover .info { background-color: #F5F5DC;}
                .col-item .price {/*width: 50%;*/float: left;margin-top: 5px;}
                .col-item .price h5 {line-height: 20px;margin: 0;}
                .price-text-color{color: #219FD1;}
                .col-item .info .rating{color: #777;}
                .col-item .rating{/*width: 50%;*/float: left;font-size: 17px;text-align: right;line-height: 52px;margin-bottom: 10px;height: 52px;}
                .col-item .separator{border-top: 1px solid #E1E1E1;}
                .clear-left{clear: left;}
                .col-item .separator p{line-height: 20px;margin-bottom: 0;margin-top: 10px;text-align: center;}
                .col-item .separator p i{margin-right: 5px;}
                .col-item .btn-add{width: 50%;float: left;}.col-item .btn-add{border-right: 1px solid #E1E1E1;}
                .col-item .btn-details{width: 50%;float: left;padding-left: 10px;}.controls{margin-top: 20px;}[data-slide="prev"]{margin-right: 10px;}
            </style>
            <!--slider center end-->


            <!--Inicio modal-->
            <!-- Modal -->
            <div class="modal fade" id="modalVerMas" role="dialog">
                <div class="modal-dialog modal-lg">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header bg-info" >
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">{{Imagen.nombre}}</h4>
                        </div>
                        <div class="modal-body" style="min-width: 200px">
                            <img src="${pageContext.request.contextPath}/resources/img/sliders/{{Imagen.url}}" style="width: 230px; height: 173px; float: left; margin-bottom: 10px">
                            <div class="text-justify" style="min-height: 200px;text-align: center;">{{Imagen.descripcion| limitTo: 2000}}</div>

                        </div>
                        <div class="modal-footer bg-info">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>
            <!--Fin modal-->
        </div>

        <div class="container" id="notepierdas">
            <div class="text-left">
                <h4 class="margin-top nuevoNot" ng-repeat="lstImagenTite1 in listaImagenes| filter : {tipo : 'S6'}">{{lstImagenTite1.descripcion}}</h4>
            </div>
            <div class="row ">
                <div class="col-xs-12 col-md-6 col-sm-6">
                    <div class="carousel carousel-showmanymoveone slide" id="itemslider">
                        <div class="carousel-inner">
                            <div ng-repeat="lImgFIn1 in listaImagenes| filter : {tipo : 'S3'}" class="item {{$index==0?'active':''}}" >
                                <div class="col-xs-12 col-sm-12 col-md-12">
                                    <a href="#"><img src="${pageContext.request.contextPath}/resources/img/sliders/{{lImgFIn1.url}}" class="img-responsive center-block" style="width:100%; height:300px;"></a>
                                    <h4 class="text-center">{{lImgFIn1.nombre}}</h4>
                                    <h5 class="text-center">{{lImgFIn1.descripcion| limitTo: 20}}</h5>
                                    <h6 style="cursor: pointer;" class="text-center ver-mas" data-toggle="modal" data-target="#modalVerMas" ng-click="construirImagen(lImgFIn1.idImagen, lImgFIn1.nombre, lImgFIn1.descripcion, lImgFIn1.url, lImgFIn1.tipo, lImgFIn1.activo)">Ver mas</h6>
                                </div>
                            </div>
                        </div>
                        <div id="slider-control" class="text-center">
                            <a class="left fa fa-chevron-left btn btn-info" href="#itemslider" data-slide="prev"></a>
                            <a class="left fa fa-chevron-right btn btn-info" href="#itemslider" data-slide="next"></a>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-md-6 col-sm-6">
                    <div class="carousel carousel-showmanymoveone slide" id="itemslider2">
                        <div class="carousel-inner">
                            <div ng-repeat="listS4 in listaImagenes| filter : {tipo : 'S4'}" class="item {{$index==0?'active':''}}" >
                                <div class="col-xs-12 col-sm-12 col-md-12">
                                    <a href="#"><img src="${pageContext.request.contextPath}/resources/img/sliders/{{listS4.url}}" class="img-responsive center-block" style="width:100%; height:300px;"></a>
                                    <h4 class="text-center">{{listS4.nombre}}</h4>
                                    <h5 class="text-center">{{listS4.descripcion| limitTo: 20}}</h5>
                                    <h6 style="cursor: pointer;" class="text-center ver-mas1" data-toggle="modal" data-target="#modalVerMas" ng-click="construirImagen(listS4.idImagen, listS4.nombre, listS4.descripcion, listS4.url, listS4.tipo, listS4.activo)">Ver mas</h6>
                                </div>
                            </div>
                        </div>
                        <div id="slider-control" class="text-center">
                            <a class="left fa fa-chevron-left btn btn-info" href="#itemslider2" data-slide="prev"></a>
                            <a class="left fa fa-chevron-right btn btn-info" href="#itemslider2" data-slide="next"></a>
                        </div>
                    </div>                    
                </div>

            </div>
        </div>
    
        <div class="container">

            <!-- Modal -->
            <div class="modal fade" id="mdContact" role="dialog">
                <div class="modal-dialog modal-lg">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Contacto</h4>
                        </div>
                        <div class="modal-body">
                            <form method="POST" action="${pageContext.request.contextPath}/sendMail" >
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Nombre:</th>
                                            <th><input type="text" name="nombre" class="form-control"/></th>
                                        </tr>
                                        <tr>
                                            <th>Apellidos:</th>
                                            <th><input type="text" name="apellidos" class="form-control"/></th>
                                        </tr>
                                        <tr>
                                            <th>Correo:</th>
                                            <th><input type="email" name="correo" class="form-control"/></th>
                                        </tr>
                                        <tr>
                                            <th>Teléfono:</th>
                                            <th><input type="phone" name="telefono" class="form-control"/></th>
                                        </tr>
                                        <tr>
                                            <th>Mensage:</th>
                                            <th><textarea class="form-control" name="mensage"></textarea></th>
                                        </tr>
                                        <tr>
                                            <th></th>
                                            <th><input type="submit" value="Enviar" class="btn btn-success btn-block" /></th>
                                    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                                    </tr>
                                    </thead>
                                </table>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>

                </div>
            </div>
                                    
            <div class="modal fade" id="loginn" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content1">
                       
                        <div class="modal-body">
                            <h4 class="modal-title"><br><br></h4>
                            <div class="container well" id="sha">
                                <div class="row">
                                    <h4 class="modal-title">BIENVENIDO</h4>
                                    <div class="col-xs-12">
                                        <img src="resources/img/avatar.png" class="img-responsive" id="avatar">
                                    </div>
                                </div>

                                <form:form name='f' action="/UANLMedicina/auth"  method='POST' id="sub">
                                    <div class="form-group">
                                        <input type="email" class="form-control" placeholder="Correo electrónico" id="email" name="email" required />
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" placeholder="Contraseña" id="password" name="password" /> <br>
                                    </div>
                                    <button type="submit" class="btn btn-lg btn-primary btn-block">Iniciar Sesión</button>
                                    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                                </form:form>
                            </div>
                            <div style="text-align: right;">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                     
                    </div>

                </div>
            </div>
        </div> <br><br><br>
        
        <div class="container-fluid">
            <div class="row">
                <div ng-repeat="lstImgAnuncion in listaImagenes| filter : {tipo : 'AN'}">
                    <div class="col-sm-3 fotosMapaAntes {{$index==0?'text-right':''}} " ng-if="lstImgAnuncion.activo>0">
                        <img src="${pageContext.request.contextPath}/resources/img/sliders/{{lstImgAnuncion.url}}" width="100%" height="250px" style="box-shadow: 1px 1px 1px 2px #b5b1b1;"/>
                    </div>
                </div>
            </div>                      
        </div><br><br><br>
       
      
<!--Mapa-->                    
        <div class="container-fluid">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <c:forEach var="mapas" items="${listaImagen}">
                     <c:if test = "${mapas.tipo == 'MAP'}">
                            <iframe width="100%" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="${mapas.url}"></iframe>
                    </c:if>
                </c:forEach>
            </div>
        </div>
<!--Contacto-->
	    

    <div class="sec3Contacto" id="contacto">
        <br><br><br>
        <div class="container">
            <div class="">
                <form action="#" method="post">
                    <div class="col-sm-8 col-sm-offset-2 formulario">
                        <div class="col-sm-12 tituloPreg">
                            <p><span class="tituloPreg1">Contactános</span> </p> 
                        </div> 
                        <div class="col-sm-12">
                            <div class="col-sm-6">
                                <input type="text" id="fname" required="required" name="nombre" placeholder="Nombre Completo">
                            </div>
                            <div class="col-sm-6">
                                <input type="text" id="fname" required="required" name="email" placeholder="Email">
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="col-sm-6">
                                <input type="text" id="fname" required="required" name="Teléfono" placeholder="Teléfono (10 dígitos)">
                            </div>
                            <div class="col-sm-6">
                                <textarea type="text" name="comentario" required="required" id="fname" placeholder="Comentarios .."></textarea>
                            </div>
                            <div class="col-sm-2 col-sm-offset-4">
                               <button class="button_enviar">ENVIAR</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>





<div class='scrolltop'>
    <div class='scroll icon'><i class="fa fa-4x fa-angle-up"></i></div>
</div>

        <%@include file="page/footer.jsp" %>
        <script>
            $(window).scroll(function() {
                if ($(this).scrollTop() > 2000 ) {
                    $('.scrolltop:hidden').stop(true, true).fadeIn();
                } else {
                    $('.scrolltop').stop(true, true).fadeOut();
                }
            });
$(function(){$(".scroll").click(function(){$("html,body").animate({scrollTop:$(".thetop").offset().top},"1000");return false})})
        </script>
        <script>
                    var app = angular.module('app', []);
                    app.controller('index', function ($scope, $http, $interval) {
                        $scope.S1 = "'S1'";

                        $.widget("custom.catcomplete", $.ui.autocomplete, {
                            _create: function () {
                                this._super();
                                this.widget().menu("option", "items", "> :not(.ui-autocomplete-category)");
                            },
                            _renderMenu: function (ul, items) {
                                var that = this,
                                        currentCategory = "";
                                $.each(items, function (index, item) {
                                    var li;
                                    if (item.category != currentCategory) {
                                        ul.append("<li class='ui-autocomplete-category'>" + item.category + "</li>");
                                        currentCategory = item.category;
                                    }
                                    li = that._renderItemData(ul, item);
                                    if (item.category) {
                                        li.attr("aria-label", item.category + " : " + item.label);
                                    }
                                });
                            }
                        });

                        var data = [];

                        $scope.construirImagen = function (idImagen, nombre, descripcion, url, tipo, activo) {
                            $scope.Imagen = {
                                idImagen: idImagen,
                                nombre: nombre,
                                descripcion: descripcion,
                                url: url,
                                tipo: tipo,
                                activo: activo
                            }
                        };

                        $scope.listarImagenes = function () {
                            $http.get("listarImagenes")
                                    .success(function (response) {
                                        $scope.listaImagenes = response;
                                    })
                                    .error(function () {});
                        };

                        $scope.listarBusqueda = function (event, palabra) {

                            if ($.trim(palabra) != '') {
                                $('.carousel').carousel('pause');
                            } else {
                                $('.carousel').carousel('cycle');
                            }

                            $http.get("listaBusqueda?palabra=" + palabra)
                                    .success(function (response) {
                                        $scope.listaBusqeuda = response;
                                        data = [];
                                        for (var i = 0; i < response.length; i++) {
                                            data = data.concat([{label: response[i].resumen, category: response[i].titulo}]);
                                        }
                                        $(".buscadorUanl").catcomplete({
                                            delay: 0,
                                            source: data
                                        });
                                    })
                                    .error(function () {});
                        };

                        $scope.buscar = function (palabra) {
                            if ($.trim(palabra) != '') {
                                window.location.href = "${pageContext.servletContext.contextPath}/vistaBusqueda?busqueda=" + palabra;
                            }
                        };

                    });
        </script>
<script> 
$(document).ready(function(){

    $('.bxslider-home').bxSlider({
        auto: true,
    });

    var slider_width = $(".marcas .container").width() / 3;
    $('.slider_marcas').bxSlider({
        minSlides: 1,
        maxSlides: 3,
        slideWidth: slider_width,
        slideMargin: 0,
        auto: true,
    });

    $(".js-modal-btn").modalVideo();
});
</script>
    </body>
</html>
