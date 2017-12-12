<%-- 
    Document   : dashboard
    Created on : 01/11/2017, 01:33:07 PM
    Author     : Abdiel Salas Pérez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html ng-app="myApp">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>CMSMedicina</title>
        <link rel="icon" type="image/ico" href="${pageContext.servletContext.contextPath}/resources/ico/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/bootstrap/assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/sb-admin-2.css">

        <script src="${pageContext.servletContext.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/js/angular/angular.min.js"></script>

    </head>
    <style>
        .navbar-inverse {background:#00796B;border-bottom-color: #004D40;}
        .navbar-inverse .navbar-nav>li>a,.navbar-inverse .navbar-brand,.navbar-inverse .navbar-nav>.dropdown>a .caret
        {color: #fff;}.navbar-inverse .navbar-nav>.open>a, .navbar-inverse .navbar-nav>.open>a:hover, .navbar-inverse .navbar-nav>.open>a:focus,
        .navbar-nav>li>.dropdown-menu{background:#4DB6AC;}.nav-pills>li>a {color: #303F9F;}.nav>li>a:hover, .nav>li>a:focus {background-color: #EEEEEE;}
    </style>
    <body ng-controller="myCtrl" ng-init="listarImagen()">

        <div id="wrapper" ng-init="listarUsuarios()">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">UANL Medicina</a>
                </div>
                <!-- /.navbar-header -->

                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                    <li><a href="logout?id=${user.idUsuario}"><i class="fa fa-sign-out"></i> Logout</a></li>
                    </li>
                </ul>
                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <li ng-if="'${role}' == 'ADMINISTRADOR'"><a ng-click="start(0)" href="#"><i class="fa fa-user fa-fw"></i> Usuarios</a></li>
                            <li ng-if="'${role}' == 'ADMINISTRADOR'"><a ng-click="start(1)" href="#"><i class="fa fa-th-list fa-fw"></i> Menus</a></li>
                            <li><a ng-click="setOpcCarrusel(1); start(2);" href="#"><i class="fa fa-picture-o fa-fw" ></i> Slider</a></li>
                            <li><a ng-click="setOpcCarrusel(0); start(3);" href="#"><i class="fa fa-road fa-fw"></i> Carrusel</a></li>
                            <li ng-if="'${role}' == 'ADMINISTRADOR'"><a ng-click="start(4)" href="#"><i class="fa fa-bell-o fa-fw"></i> Notificaciones</a></li>
                            <li ng-if="'${role}' == 'ADMINISTRADOR'"><a ng-click="start(6)" href="#"><i class="fa fa-bookmark-o fa-fw"></i> Logotipo</a></li>
                            <li ng-if="'${role}' == 'ADMINISTRADOR'"><a ng-click="start(7)" href="#"><i class="fa fa-thumbs-o-up fa-fw"></i> Redes sociales</a></li>
                            <li ng-if="'${role}' == 'ADMINISTRADOR'"><a ng-click="start(8)" href="#"><i class="fa fa-envelope-o fa-fw"></i> Correo</a></li>
                            <li ng-if="'${role}' == 'ADMINISTRADOR'"><a ng-click="start(9)" href="#"><i class="fa fa-terminal fa-fw"></i> Pie de página</a></li>	
                            <li ng-if="'${role}' == 'ADMINISTRADOR'"><a ng-click="start(10)" href="#"><i class="fa fa-tags fa-fw"></i> Anuncios</a></li>
                            <li ng-if="'${role}' == 'ADMINISTRADOR'"><a ng-click="start(11)" href="#"><i class="fa fa-map-marker fa-fw"></i> Maps</a></li>
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <a href="#"><strong><span class="fa fa-dashboard"></span> ${role}</strong></a>

                        <hr>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <div class="row">
                    <div class="col-lg-12" id="user">
                        <div class="panel panel-primary">
                            <div class="panel-heading"><i class="fa fa-clock-o fa-fw"></i> Usuarios</div>
                            <div class="panel-body">
                                <button type="button" 
                                        class="open-Create btn btn-success btn-md glyphicon glyphicon-plus"
                                        data-toggle="modal" 
                                        data-target="#CreateUser">Agregar</button>

                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nombre</th>
                                            <th>Apellido Paterno</th>
                                            <th>Apellido Materno</th>
                                            <th>Email</th>
                                            <th>Contraseña</th>
                                            <th>Editar</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="users in listaUsuarios">

                                            <td>{{users[0]}}</td>
                                            <td>{{users[1]}}</td>
                                            <td>{{users[2]}}</td>
                                            <td>{{users[3]}}</td>
                                            <td>{{users[4]}}</td>
                                            <td>{{users[5]}}</td>
                                            <td>
                                                <button type="button"
                                                        data-toggle="modal" 
                                                        data-target="#EditUser" 
                                                        class="open-Edit btn btn-primary btn-sm glyphicon glyphicon-pencil" ng-click="construirUsuario(users[0], users[1], users[2], users[3], users[4], users[5])"></button>   
                                            </td>
                                            <td>
                                                <button type="button" 
                                                        data-toggle="modal" 
                                                        data-target="#DeleteUser"    
                                                        class="open-Delete btn btn-danger btn-sm glyphicon glyphicon-trash" ng-click="construirUsuario(users[0], users[1], users[2], users[3], users[4], users[5])"></button> 
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.panel-body -->
                        </div>
                    </div>
                    <div class="col-lg-12" id="menu">
                        <div class="panel panel-success">
                            <div class="panel-heading"><i class="fa fa-clock-o fa-fw"></i>Menus y Submenus</div>
                            <div class="panel-body">
                                <button type="button" 
                                        class="open-Create btn btn-success btn-md glyphicon glyphicon-plus"
                                        data-toggle="modal" 
                                        data-target="#CreateMenu">Agregar Menu</button>
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nombre</th>
                                            <th>Tipo</th>
                                            <th>Dependencia</th>
                                            <th>Ruta</th>
                                            <th>Editar</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="menu" items="${listaMenu}">
                                            <tr>

                                                <td><c:out value="${menu.idMenu}"></c:out></td>
                                                <td><c:out value="${menu.nombre}"></c:out></td>
                                                    <td>
                                                    <c:if test = "${menu.tipo == 'S'}">SubMenu</c:if>
                                                    <c:if test = "${menu.tipo == 'M'}">Menu</c:if>
                                                    </td>
                                                    <td><c:out value="${menu.dependencia}"></c:out></td>
                                                <td><c:out value="${menu.ruta}"></c:out></td>
                                                    <td>
                                                        <button type="button"
                                                                data-toggle="modal" 
                                                                data-target="#EditMenu" 
                                                                class="open-Edit btn btn-primary btn-sm glyphicon glyphicon-pencil" ng-click="construirMenu('${menu.idMenu}', '${menu.nombre}', '${menu.tipo}', ${menu.dependencia}, '${menu.ruta}')"></button>   
                                                </td>

                                                <td>
                                                    <button type="button"
                                                            data-toggle="modal" 
                                                            data-target="#DeleteMenu"    
                                                            class="open-Delete btn btn-danger btn-sm glyphicon glyphicon-trash" ng-click="construirMenu('${menu.idMenu}', '${menu.nombre}', '${menu.tipo}', '${menu.dependencia}', '${menu.ruta}')"></button> 
                                                </td>  
                                            </tr>
                                        </c:forEach>
                                    </tbody>    
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" id="slider">
                        <div class="panel panel-warning">
                            <div class="panel-heading"><i class="fa fa-clock-o fa-fw"></i> Slider</div>
                            <div class="panel-body">
                                <button type="button" 
                                        class="open-Create btn btn-success btn-md glyphicon glyphicon-plus"
                                        data-toggle="modal" 
                                        data-target="#CreateImage">Agregar Imagen</button>

                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nombre</th>
                                            <th>Descripción</th>
                                            <th>Orden</th>
                                            <th>Imagen</th>
                                            <th>Editar</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="lstImg in listaImagenes" ng-if="lstImg.tipo == 'S1'">
                                            <td>{{lstImg.idImagen}}</td>
                                            <td>{{lstImg.nombre}}</td>
                                            <td>{{lstImg.descripcion}}</td>
                                            <td>{{lstImg.activo}}</td>
                                            <td><button ng-click="Imagen.url = lstImg.url" class="btn btn-warning" data-toggle="modal" data-target="#verImagen">Ver imagen</button></td>
                                            <td>
                                                <button type="button"
                                                        data-toggle="modal" 
                                                        data-target="#EditImage" 
                                                        class="open-Edit btn btn-primary btn-sm glyphicon glyphicon-pencil" ng-click="construirImagen(lstImg.idImagen, lstImg.nombre, lstImg.descripcion, lstImg.url, lstImg.tipo, lstImg.activo, 1)"></button>
                                            </td>
                                            <td>
                                                <button type="button" 
                                                        data-toggle="modal" 
                                                        data-target="#DeleteImage"    
                                                        class="open-Delete btn btn-danger btn-sm glyphicon glyphicon-trash" ng-click="construirImagen(lstImg.idImagen, lstImg.nombre, lstImg.descripcion, lstImg.url, lstImg.tipo, lstImg.activo, 1)"></button> 
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" id="carrusel">
                        <div class="panel panel-green">
                            <div class="panel-heading"><i class="fa fa-clock-o fa-fw"></i> Carrusel</div>
                            <div class="panel-body">
                                <label>Titulo de carrusel 1</label>
                                <div class="row" ng-repeat="tituloSlider in listaImagenes" ng-if="tituloSlider.tipo == 'S5'">
                                    <div class="col-lg-8 col-md-7 col-sm-6">
                                        <input type="text" class="form-control" ng-model="tituloSlider.descripcion" />
                                    </div>
                                    <div class="col-lg-4 col-md-5 col-sm-6">
                                        <button class="btn btn-success btn-block" ng-click="atulizarDescripcionImagen(tituloSlider.idImagen, tituloSlider.url, tituloSlider.descripcion, 'S5')">Actlizar</button>
                                    </div>
                                </div>
                                <label>Titulo de carrusel 2</label>
                                <div class="row" ng-repeat="tituloSlider1 in listaImagenes" ng-if="tituloSlider1.tipo == 'S6'">
                                    <div class="col-lg-8 col-md-7 col-sm-6">
                                        <input type="text" class="form-control" ng-model="tituloSlider1.descripcion" />
                                    </div>
                                    <div class="col-lg-4 col-md-5 col-sm-6">
                                        <button class="btn btn-success btn-block" ng-click="atulizarDescripcionImagen(tituloSlider1.idImagen, tituloSlider1.descripcion, 'S6')">Actlizar</button>
                                    </div>
                                </div>
                                <br />
                                <button type="button" 
                                        class="open-Create btn btn-success btn-md glyphicon glyphicon-plus"
                                        data-toggle="modal" 
                                        data-target="#CreateImage">Agregar Imagen</button>

                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nombre</th>
                                            <th>Descripción</th>
                                            <th>Tipo</th>
                                            <th>Imagen</th>
                                            <th>Orden</th>
                                            <th>Editar</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="lstImg in listaImagenes" ng-if="lstImg.tipo == 'S2' || lstImg.tipo == 'S3' || lstImg.tipo == 'S4'">
                                            <td>{{lstImg.idImagen}}</td>
                                            <td>{{lstImg.nombre}}</td>
                                            <td class="text-justify">{{lstImg.descripcion}}</td>
                                            <td>{{lstImg.tipo == 'S2'?'Carrusel 1': lstImg.tipo == 'S3' ? 'Carrusel 2' : lstImg.tipo == 'S4'?'Carrusel 3' : ''}}</td>
                                            <td>{{lstImg.activo}}</td>
                                            <td><button ng-click="Imagen.url = lstImg.url" class="btn btn-warning" data-toggle="modal" data-target="#verImagen">Ver imagen</button></td>
                                            <td>
                                                <button type="button"
                                                        data-toggle="modal" 
                                                        data-target="#EditImage" 
                                                        class="open-Edit btn btn-primary btn-sm glyphicon glyphicon-pencil" ng-click="construirImagen(lstImg.idImagen, lstImg.nombre, lstImg.descripcion, lstImg.url, lstImg.tipo, lstImg.activo, 0)"></button>
                                            </td>
                                            <td>
                                                <button type="button" 
                                                        data-toggle="modal" 
                                                        data-target="#DeleteImage"    
                                                        class="open-Delete btn btn-danger btn-sm glyphicon glyphicon-trash" ng-click="construirImagen(lstImg.idImagen, lstImg.nombre, lstImg.descripcion, lstImg.url, lstImg.tipo, lstImg.activo, 0)"></button> 
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" id="notifications">
                        <div class="panel panel-danger">
                            <div class="panel-heading"><i class="fa fa-clock-o fa-fw"></i> Notificaciones</div>
                            <div class="panel-body" ng-init="listaBitacora()">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Acción</th>
                                            <th>Módulo</th>
                                            <th>Fecha</th>
                                            <th>Usuario</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="lstBitacora in listBitacora">
                                            <td>{{lstBitacora[0]}}</td>
                                            <td>{{lstBitacora[1]}}</td>
                                            <td>{{lstBitacora[2]}}</td>
                                            <td>{{lstBitacora[3]}}</td>
                                            <td>{{lstBitacora[5]}} {{lstBitacora[6]}}</td>
                                        </tr>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" id="roles">
                        <div class="panel panel-info">
                            <div class="panel-heading"><i class="fa fa-clock-o fa-fw"></i> Roles</div>
                            <div class="panel-body">

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" id="logo">
                        <div class="panel panel-red">
                            <div class="panel-heading"><i class="fa fa-clock-o fa-fw"></i> Logotipo</div>
                            <div class="panel-body">
                                <div ng-repeat="lstImg in listaImagenes" ng-if="lstImg.tipo == 'LG1'">
                                    <button type="button"
                                            data-toggle="modal" 
                                            data-target="#EditLogo" 
                                            class="open-Edit btn btn-primary btn-sm glyphicon glyphicon-pencil" 
                                            ng-click="construirImagen(lstImg.idImagen, lstImg.nombre, lstImg.descripcion, lstImg.url, lstImg.tipo, lstImg.activo, 0)"> Editar</button>
                                    <br />
                                    <br />
                                    <img src="${pageContext.request.contextPath}/resources/img/sliders/{{lstImg.url}}" width="100%" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" id="socialmedia">
                        <div class="panel panel-yellow">
                            <div class="panel-heading"><i class="fa fa-clock-o fa-fw"></i> Redes sociales</div>
                            <div class="panel-body">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nombre</th>
                                            <th>Orden<th>
                                            <th>Editar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="lstImg in listaImagenes" ng-if="lstImg.tipo == 'SM'">
                                            <td>{{lstImg.idImagen}}</td>
                                            <td>{{lstImg.nombre}}</td>
                                            <td>{{lstImg.activo}}</td>
                                            <td>
                                                <button type="button"
                                                        data-toggle="modal" 
                                                        data-target="#EditSocialMedia" 
                                                        class="open-Edit btn btn-primary btn-sm glyphicon glyphicon-pencil" ng-click="construirImagen(lstImg.idImagen, lstImg.nombre, lstImg.descripcion, lstImg.url, lstImg.tipo, lstImg.activo, 0)"></button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" id="correo">
                        <div class="panel panel-yellow">
                            <div class="panel-heading"><i class="fa fa-clock-o fa-fw"></i> Correo</div>
                            <div class="panel-body" ng-init="">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nombre</th>
                                            <th>Apellido Paterno</th>
                                            <th>Apellido Materno</th>
                                            <th>Email</th>
                                            <th>Contraseña</th>
                                            <th>Editar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="userSendMail in listaUsuarios" ng-if="userSendMail[8] == 'MAILSENDER'">

                                            <td>{{userSendMail[0]}}</td>
                                            <td>{{userSendMail[1]}}</td>
                                            <td>{{userSendMail[2]}}</td>
                                            <td>{{userSendMail[3]}}</td>
                                            <td>{{userSendMail[4]}}</td>
                                            <td>{{userSendMail[5]}}</td>
                                            <td>
                                                <button type="button"
                                                        data-toggle="modal" 
                                                        data-target="#EditUser" 
                                                        class="open-Edit btn btn-primary btn-sm glyphicon glyphicon-pencil" ng-click="construirUsuario(userSendMail[0], userSendMail[1], userSendMail[2], userSendMail[3], userSendMail[4], userSendMail[5])"></button>   
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" id="footer">
                        <div class="panel panel-yellow">
                            <div class="panel-heading"><i class="fa fa-clock-o fa-fw"></i> Pie de página</div>
                            <div class="panel-body" ng-init="">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Descripcion</th>
                                            <th>Tipo</th>
                                            <th>Opción</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="listTF in listaImagenes" ng-if="listTF.tipo == 'TF1' || listTF.tipo == 'TF2'">
                                            <td><input class="form-control" type="text" ng-model="listTF.idImagen" readonly="" /></td>
                                            <td><input class="form-control" type="text" ng-model="listTF.descripcion" /></td>
                                            <td><input class="form-control" type="text" ng-model="listTF.tipo" readonly="" /></td>
                                            <td>
                                                <button class="btn btn-success" ng-click="atulizarDescripcionImagen(listTF.idImagen, listTF.descripcion, listTF.tipo)">Guardar</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" id="anuncio">
                        <div class="panel panel-yellow">
                            <div class="panel-heading"><i class="fa fa-clock-o fa-fw"></i> Anuncios</div>
                            <div class="panel-body" ng-init="">
                                <div class="row">
                                    <div ng-repeat="lstImg in listaImagenes" ng-if="lstImg.tipo == 'AN'">
                                        <div class="col-lg-6">
                                            <button type="button"
                                                    data-toggle="modal" 
                                                    data-target="#EditLogo" 
                                                    class="open-Edit btn btn-primary btn-sm glyphicon glyphicon-pencil" 
                                                    ng-click="construirImagen(lstImg.idImagen, lstImg.nombre, lstImg.descripcion, lstImg.url, lstImg.tipo, lstImg.activo, 0)"> Editar</button>
                                            <br />
                                            <br />
                                            <img src="${pageContext.request.contextPath}/resources/img/sliders/{{lstImg.url}}" width="50%" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" id="map">
                        <div class="panel panel-red">
                            <div class="panel-heading"><i class="fa fa-clock-o fa-fw"></i> Maps</div>
                            <div class="panel-body" ng-init="">
                                <div class="row">
                                    <div ng-repeat="listMap in listaImagenes" ng-if="listMap.tipo == 'MAP'">
                                        <div class="col-lg-8 col-md-8 col-sm-6">
                                            <input type="text" class="form-control" ng-model="listMap.url" />                                            
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                            <button class="btn btn-success btn-block" ng-click="atulizarDescripcionImagen(listMap.idImagen, listMap.url, listMap.descripcion, 'MAP')">Guardar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <!--lista de modals inicio-->
                <!--modal fade EditUser-->
                <div class="modal fade" id="EditUser" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                <h4 class="modal-title custom_align" id="Heading">Editar Registro</h4>
                            </div>
                            <div class="modal-body">
                                <form id="contact_form_EditUser" action="SCRUD" method="POST">
                                    <div class="form-group">
                                        <input class="form-control " type="hidden" id="eIdUsuario" name="eIdUsuario" value=""/>
                                    </div>
                                    <div ng-show="Status.code != - 1" class="alert {{Status.code==1?'alert-success':'alert-danger'}}">
                                        {{Status.message}}
                                    </div>
                                    <div class="form-group">
                                        <label>Nombre</label>
                                        <input class="form-control " type="text" ng-model="User.nombre" id="eNombre" name="eNombre" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Apellido Paterno</label>
                                        <input class="form-control " type="text" ng-model="User.aPaterno" id="eApaterno" name="eApaterno" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Apellido Materno</label>
                                        <input class="form-control " type="text" ng-model="User.aMaterno" id="eAmaterno" name="eAmaterno" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Correo Electronico</label>
                                        <input class="form-control " type="text" ng-model="User.email" id="eEmail" name="eEmail" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Contraseña</label>
                                        <input class="form-control " type="text" ng-model="User.password" id="eContrasenia" name="eContrasenia" value=""/>
                                    </div>
                                </form>    
                            </div>
                            <div class="modal-footer bg-info">
                                <button id="submitFormEditUser" name="Update" type="button" class="btn btn-success btn-md" ng-click="updateUser('mail')">Guardar</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Fin modal Fade Edit-->
                <!--modal Fade CreateUser-->
                <div class="modal fade" id="CreateUser" tabindex="-1" role="dialog" aria-labelledby="create" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header bg-info">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                <h4 class="modal-title custom_align" id="Heading">Crear Registro</h4>
                            </div>
                            <div class="modal-body">
                                <form id="contact_form_CreateUser" action="SCRUD" method="POST">
                                    <div class="form-group">
                                        <input class="form-control " type="hidden" id="cIdUsuario" value=""/>
                                    </div>
                                    <div ng-show="Status.code != - 1" class="alert {{Status.code==1?'alert-success':'alert-danger'}}">
                                        {{Status.message}}
                                    </div>
                                    <div class="form-group">
                                        <label>Nombre</label>
                                        <input class="form-control " ng-model="User.nombre" type="text" id="cNombre" name="cNombre" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Apellido Paterno</label>
                                        <input class="form-control " ng-model="User.aPaterno" type="text" id="cApaterno" name="cApaterno" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Apellido Materno</label>
                                        <input class="form-control " ng-model="User.aMaterno" type="text" id="cAmaterno" name="cAmaterno" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Correo Electronico</label>
                                        <input class="form-control " ng-model="User.email" type="text" id="cEmail" name="cEmail" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Contraseña</label>
                                        <input class="form-control " ng-model="User.password" type="text" id="cContrasenia" name="cContrasenia" value=""/>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer bg-info">
                                <button id="submitFormCreateUser" name="Create" type="button" ng-click="User.idUsuario; crearUsuario();" class="btn btn-success btn-md">Crear</button>
                                <button id="resetFormCreate" type="reset" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Fin modal Fade Create-->
                <!-- modal fade DeleteUser-->
                <div class="modal fade" id="DeleteUser" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header bg-info">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title custom_align" id="Heading">Eliminando Registro</h4>
                            </div>
                            <div class="modal-body">
                                <div class="alert alert-danger glyphicon glyphicon-warning-sign">
                                    <label>¿Desea eliminar este registro?</label>
                                </div>
                                <form id="contact_form_DeleteUser" action="SCRUD" method="POST">
                                    <div class="form-group">
                                        <input class="form-control " type="hidden" id="dIdUsuario" name="dIdUsuario" value=""/>
                                    </div>
                                    <div ng-show="Status.code != - 1" class="alert {{Status.code==1?'alert-success':'alert-danger'}}">
                                        {{Status.message}}
                                    </div>
                                    <div class="form-group">
                                        <label>Nombre</label>
                                        <input class="form-control " ng-model="User.nombre" type="text" id="dNombre" value="" disabled/>
                                    </div>
                                    <div class="form-group">
                                        <label>Apellido Paterno</label>
                                        <input class="form-control " type="text" ng-model="User.aPaterno" id="dApaterno" value="" disabled/>
                                    </div>
                                    <div class="form-group">
                                        <label>Apellido Materno</label>
                                        <input class="form-control " type="text" ng-model="User.aMaterno" id="dAmaterno" value="" disabled/>
                                    </div>
                                    <div class="form-group">
                                        <label>Correo Electronico</label>
                                        <input class="form-control " type="text" id="dEmail" ng-model="User.email" value="" disabled/>
                                    </div>
                                    <div class="form-group">
                                        <label>Contraseña</label>
                                        <input class="form-control " type="text" ng-model="User.password" id="dContrasenia" value="" disabled/>
                                    </div>
                                </form>        
                            </div>
                            <div class="modal-footer bg-info">
                                <button id="submitFormDeleteUser" name="Delete" type="button" class="btn btn-danger" ng-click="eliminarUsuario(User.idUsuario)">Eliminar</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Fin modal fade Delete-->
                <!--modal Fade CreateMenu-->
                <div class="modal fade" id="CreateMenu" tabindex="-1" role="dialog" aria-labelledby="create" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header bg-info">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                <h4 class="modal-title custom_align" id="Heading">Crear Registro</h4>
                            </div>
                            <div class="modal-body">
                                <form id="contact_form_CreateMenu" action="SCRUD" method="POST">
                                    <div class="form-group">
                                        <input class="form-control" type="hidden" id="cIdMenu" value=""/>
                                    </div>
                                    <div ng-show="Status.code != - 1" class="alert {{Status.code==1?'alert-success':'alert-danger'}}">
                                        {{Status.message}}
                                    </div>
                                    <div class="form-group">
                                        <label>Nombre</label>
                                        <input class="form-control" ng-model="Menu.nombre" type="text" id="cNombreMenu" name="cNombreMenu" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Tipo de Menu</label>
                                        <input ng-init="Menu.tipo = 'M'" type="radio" ng-model="Menu.tipo" value="M" />Munú
                                        <input type="radio" ng-model="Menu.tipo" value="S" />SubMenu
                                    </div>
                                    <div class="form-group">
                                        <label>Dependencia</label>
                                        <input class="form-control" ng-model="Menu.dependencia" type="number" id="cDependencia" name="cDependencia" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Ruta</label>
                                        <input class="form-control " ng-model="Menu.ruta" ng-init="Menu.ruta = '#'" type="text" id="cRuta" name="cRuta" disabled="" value="" />
                                    </div>
                                </form>    
                            </div>
                            <div class="modal-footer bg-info">
                                <button id="submitFormCreateMenu" name="CreateMenu" type="button" class="btn btn-success btn-md" ng-click="crearMenu()">Crear</button>
                                <button id="resetFormCreate" type="reset" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Fin modal Fade Create-->
                <!--modal fade EditMenu-->
                <div class="modal fade" id="EditMenu" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header bg-info">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                <h4 class="modal-title custom_align" id="Heading">Editar Registro</h4>
                            </div>
                            <div class="modal-body">
                                <form id="contact_form_EditMenu" action="SCRUD" method="POST">
                                    <div class="form-group">
                                        <input class="form-control " type="hidden" id="eIdMenu" name="eIdMenu" value=""/>
                                    </div>
                                    <div ng-show="Status.code != - 1" class="alert {{Status.code==1?'alert-success':'alert-danger'}}">
                                        {{Status.message}}
                                    </div>
                                    <div class="form-group">
                                        <label>Nombre</label>
                                        <input class="form-control " type="text" ng-model="Menu.nombre" id="eNombreMenu" name="eNombreMenu" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Tipo Menu</label>
                                        <input type="radio" ng-model="Menu.tipo" value="M" />Munú
                                        <input type="radio" ng-model="Menu.tipo" value="S" />SubMenu
                                    </div>
                                    <div class="form-group">
                                        <label>Dependencia</label>
                                        <input class="form-control " type="number" ng-model="Menu.dependencia" id="eDependencia" name="eDependencia" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Ruta</label>
                                        <input class="form-control " disabled ng-model="Menu.ruta" type="text" id="eRuta" name="eRuta" value=""/>
                                    </div>
                                </form>    
                            </div>
                            <div class="modal-footer bg-info">
                                <button id="submitFormEditMenu" name="UpdateMenu" type="button" class="btn btn-success btn-md" ng-click="actualizarMenu()">Guardar</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Fin modal Fade Edit-->
                <!-- modal fade DeleteMenu-->
                <div class="modal fade" id="DeleteMenu" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header bg-info">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title custom_align" id="Heading">Eliminando Registro</h4>
                            </div>
                            <div class="modal-body">
                                <div class="alert alert-danger glyphicon glyphicon-warning-sign">
                                    <label>¿Desea eliminar este registro?</label>
                                </div>
                                <form id="contact_form_DeleteMenu" action="SCRUD" method="POST">
                                    <div class="form-group">
                                        <input class="form-control " type="hidden" id="dIdMenu" name="dIdMenu" value=""/>
                                    </div>
                                    <div ng-show="Status.code != - 1" class="alert {{Status.code==1?'alert-success':'alert-danger'}}">
                                        {{Status.message}}
                                    </div>
                                    <div class="form-group">
                                        <label>Nombre</label>
                                        <input class="form-control " type="text" ng-model="Menu.nombre" id="dNombreMenu" value="" disabled/>
                                    </div>
                                    <div class="form-group">
                                        <label>Tipo menú</label>
                                        <input type="radio" ng-model="Menu.tipo" value="M" disabled />Munú
                                        <input type="radio" ng-model="Menu.tipo" value="S" disabled />SubMenu
                                    </div>
                                    <div class="form-group">
                                        <label>Dependencia</label>
                                        <input class="form-control " type="text"  ng-model="Menu.dependencia" id="dDependencia" value="" disabled/>
                                    </div>
                                    <div class="form-group">
                                        <label>Ruta</label>
                                        <input class="form-control " type="text"  ng-model="Menu.ruta" id="dRuta" value="" disabled/>
                                    </div>
                                </form>        
                            </div>
                            <div class="modal-footer bg-info">
                                <button id="submitFormDeleteMenu" name="Delete" type="button" class="btn btn-danger" ng-click="eliminarMenu()">Eliminar</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal imagen-->
                <div class="modal fade" id="verImagen" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>  
                        <img src="${pageContext.request.contextPath}/resources/img/sliders/{{Imagen.url}}" width="100%" />
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close X</button>
                    </div>
                </div>
                <!--modal Fade crearImagen-->
                <div class="modal fade" id="CreateImage" tabindex="-1" role="dialog" aria-labelledby="create" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header bg-info">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                <h4 class="modal-title custom_align" id="Heading">Crear Registro</h4>
                            </div>
                            <div class="modal-body">
                                <form method="POST" action="${pageContext.request.contextPath}/uploadFile"  enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label>Titulo</label>
                                        <input class="form-control " required="" type="text" name="nombre" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Descripción</label>
                                        <textarea class="form-control " required="" name="descripcion" value=""></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label ng-if="slideCarrusel == 0">Tipo</label>
                                        <input type="hidden" value="S1" name="tipo" ng-if="slideCarrusel == 1"/>
                                        <select class="form-control" required="" name="tipo" ng-if="slideCarrusel == 0">
                                            <option value="S2">Carrusel 1</option>
                                            <option value="S3">Carrusel 2</option>
                                            <option value="S4">Carrusel 3</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Adjuntar imagen</label>
                                        <input type="file" name="file" required="">
                                    </div>
                                    <div class="form-group">
                                        <label>Orden:</label>
                                        <input type="number" name="activo" required="" class="form-control">
                                    </div>
                                    <input type="hidden" value="${user.idUsuario}" name="userIdLogged" />
                                    <input type="hidden" name="where" value="{{selectItem}}"/>
                                    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                                    <input type="submit" class="btn btn-success btn-block" value="Guardar">
                                </form>
                            </div>
                            <div class="modal-footer bg-info">
                                <button id="resetFormCreate" type="reset" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Fin modal Fade crearImagen-->


                <!--modal Fade EditImagen-->
                <div class="modal fade" id="EditImage" tabindex="-1" role="dialog" aria-labelledby="create" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header bg-info">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                <h4 class="modal-title custom_align" id="Heading">Editar Registro</h4>
                            </div>
                            <div class="modal-body">
                                <form method="POST" action="${pageContext.request.contextPath}/editarImagen1"  enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label>#</label>
                                        <input type="text" class="form-control" ng-model="Imagen.idImagen" name="idImagen" readonly=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Titulo</label>
                                        <input class="form-control " ng-model="Imagen.nombre" required="" type="text" name="nombre"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Descripción</label>
                                        <textarea class="form-control" ng-model="Imagen.descripcion" required="" name="descripcion"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label ng-if="slideCarrusel == 0">Tipo</label>
                                        <input type="text" class="form-control" value="S1" name="tipo" ng-if="slideCarrusel == 1" readonly=""/>
                                        <select class="form-control" ng-model="Imagen.tipo" required="" name="tipo" ng-if="slideCarrusel == 0">
                                            <option value="S2">Carrusel 1</option>
                                            <option value="S3">Carrusel 2</option>
                                            <option value="S4">Carrusel 3</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Adjuntar Imagen</label>
                                        <input type="file" name="file">
                                    </div>
                                    <div class="form-group">
                                        <label>Orden: </label>
                                        <input ng-model="Imagen.activo" name="activo" class="form-control" type="number"  />
                                    </div>
                                    <div class="form-group">
                                        <label>Url: </label>
                                        <input ng-model="Imagen.url" type="text" name="url" class="form-control" readonly="" />
                                    </div>
                                    <input type="hidden" name="userIdLogged" value="${user.idUsuario}"/>
                                    <input type="hidden" name="where" value="{{selectItem}}"/>
                                    <input type="submit" value="Guardar" type="button" class="btn btn-success">
                                    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                                </form>
                            </div>
                            <div class="modal-footer bg-info">

                                <button id="resetFormCreate" type="reset" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Fin modal Fade EditImagen-->

                <!--modal Fade EditSocialMedia-->
                <div class="modal fade" id="EditSocialMedia" tabindex="-1" role="dialog" aria-labelledby="create" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header bg-info">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                <h4 class="modal-title custom_align" id="Heading">Editar Registro</h4>
                            </div>
                            <div class="modal-body">
                                <form method="POST" action="${pageContext.request.contextPath}/updateSocialMedia"  enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label>#</label>
                                        <input type="text" class="form-control" ng-model="Imagen.idImagen" name="idImagen" readonly=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Titulo</label>
                                        <input class="form-control " ng-model="Imagen.nombre" required="" type="text" name="nombre" readonly/>
                                    </div>
                                    <input class="form-control" type="text" name="tipo"  ng-model="Imagen.tipo" readonly="">
                                    <div class="form-group">
                                        <label>Orden: </label>
                                        <input ng-model="Imagen.activo" name="activo" class="form-control" type="number"  />
                                    </div>
                                    <div class="form-group">
                                        <label>Url: </label>
                                        <input ng-model="Imagen.url" type="text" name="url" class="form-control"/>
                                    </div>
                                    <input type="hidden" name="where" value="{{selectItem}}"/>
                                    <input type="submit" value="Guardar" type="button" class="btn btn-success">
                                    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                                </form>
                            </div>
                            <div class="modal-footer bg-info">

                                <button id="resetFormCreate" type="reset" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Fin modal Fade EditSocialMedia-->

                <!--modal Fade EditLogo-->
                <div class="modal fade" id="EditLogo" tabindex="-1" role="dialog" aria-labelledby="create" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header bg-info">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                <h4 class="modal-title custom_align" id="Heading">Editar Registro</h4>
                            </div>
                            <div class="modal-body">
                                <form method="POST" action="${pageContext.request.contextPath}/editarImagen1"  enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label>#</label>
                                        <input type="text" class="form-control" ng-model="Imagen.idImagen" name="idImagen" readonly=""/>
                                    </div>

                                    <div class="form-group">
                                        <label>Activo</label>
                                        <input type="text" class="form-control" ng-model="Imagen.activo" name="activo"/>
                                    </div>
                                    
                                    <input type="hidden" name="tipo" value="{{Imagen.tipo}}" />
                                    <input type="hidden" name="url" value="{{Imagen.url}}" />
                                    <input type="hidden" name="activo" value="{{Imagen.activo}}" />
                                    <div class="form-group">
                                        <label>Adjuntar Imagen</label>
                                        <input type="file" name="file">
                                    </div>
                                    <input type="hidden" name="userIdLogged" value="${user.idUsuario}"/>
                                    <input type="hidden" name="where" value="{{selectItem}}"/>
                                    <input type="submit" value="Guardar" type="button" class="btn btn-success">
                                    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                                </form>
                            </div>
                            <div class="modal-footer bg-info">
                                <button id="resetFormCreate" type="reset" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Fin modal Fade EditLogo-->
                <!--modal Fade DeleteImagen-->
                <div class="modal fade" id="DeleteImage" tabindex="-1" role="dialog" aria-labelledby="create" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header bg-info">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                <h4 class="modal-title custom_align" id="Heading">Eliminar Registro</h4>
                            </div>
                            <div class="modal-body">
                                <form method="POST" action=""  enctype="multipart/form-data">
                                    <div class="form-group">
                                        <label>Titulo</label>
                                        <input class="form-control " ng-model="Imagen.nombre" required="" type="text" name="nombre" value="" disabled/>
                                    </div>
                                    <div class="form-group">
                                        <label>Descripción</label>
                                        <textarea class="form-control" ng-model="Imagen.descripcion" required="" name="descripcion" value="" disabled ></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Tipo</label>
                                        <select class="form-control" ng-model="Imagen.tipo" required="" name="tipo" disabled>
                                            <option value="S1">Slider principal</option>
                                            <option value="S2">Slider 2</option>
                                            <option value="S3">Slider 3</option>
                                            <option value="S4">Slider 4</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Imagen</label>
                                        <img src="${pageContext.request.contextPath}/resources/img/sliders/{{Imagen.url}}" width="20%" height="100px" />
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer bg-info">
                                <button id="submitFormDeleteMenu" name="Delete" type="button" class="btn btn-danger" ng-click="eliminarImagen()">Eliminar</button>
                                <button id="resetFormCreate" type="reset" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Fin modal Fade DeleteImagen-->
                <!--lista de modals fin-->

            </div>
        </div>

        <c:import url="recursos/administracion.jsp"/>
    </body>
</html>