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
            .ng-scope{
                margin-top: -22px;
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



  <!-- Inicia Slider principal-->
        <div class="bannerTest">
            <div class="container">
                <div class="infoBannerTest">
                    <h1 class="tituloBannerTipo">Titulo del Banner</h1>
                  <p><span class="descripBanner">Descripcion del banner, este color se cambiara por una imagen de su preferencia</span></p>
                </div>
            </div>
        </div>
        <div class="sec2Parrafo">
            <div class="container">
                <div class="sec2Descrip">
                    <div class="col-sm-10 col-sm-offset-1">
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel ultrices libero, ut bibendum purus.
                            Donec ac quam gravida quam malesuada aliquam. Praesent est arcu, gravida vitae vestibulum ac,
                            congue nec lectus. Ut rutrum sagittis libero eu dapibus. Nam quis gravida odio.
                            Nam eget massa laoreet, pellentesque ...
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <section class="container-fluid section_types">
            <div class="row">

                <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4 bg-1 p-0">
                    <div class="section_off">
                        <p class="title_off">Imagen Uno</p>
                    </div>
                    <div class="section_on align-middle">
                        <p class="title_on">Lorem Ipsum</p><br>
                        <p class="description">
                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo ...
                        </p>
                        <a href="" class="see_more">Ver mas [ + ]</a>
                    </div>
                </div>
                <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4 bg-2 p-0">
                    <div class="section_off">
                        <p class="title_off">Imagen Dos</p>
                    </div>
                    <div class="section_on">
                        <p class="title_on">Lorem Ipsum</p><br>
                        <p class="description">
                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo ...
                        </p>
                        <a href="" class="see_more">Ver mas [ + ]</a>
                    </div>
                </div>
                <div class="col-sm-12 col-md-4 col-lg-4 col-xl-4 bg-3 p-0">
                    <div class="section_off">
                        <p class="title_off">Imagen Tres</p>
                    </div>
                    <div class="section_on">
                        <p class="title_on">Lorem Ipsum</p><br>
                        <p class="description">
                            Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo ...
                        </p> </div>
                </div>

            </div>
        </section>
                        
                        
               
                        

  
            <style>
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
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Login</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container well" id="sha">
                                <div class="row">
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
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>

                </div>
            </div>
        </div> <br><br><br>
        

       
      







        <%@include file="../page/footer.jsp" %>
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

    </body>
</html>
