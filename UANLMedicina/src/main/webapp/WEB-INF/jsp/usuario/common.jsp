<%-- 
    Document   : index
    Created on : 14-nov-2016, 15:15:41
    Author     : Abdiel Salas Pérez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html ng-app="myApp">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>UANL</title>

        <link rel="icon" type="image/ico" href="${pageContext.servletContext.contextPath}/resources/ico/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/w3/w3.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/animate.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/w3/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/bootstrap/bootstrap-3.3.7-dist/css/daterangepicker.css"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/header.css">

        <script src="${pageContext.servletContext.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.min.js"></script>    

        <script src="${pageContext.servletContext.contextPath}/resources/js/angular/angular.min.js"></script> 
    </head>

    <body ng-controller="myCtrl">
        <c:import url="page/header.jsp"/>

        <br />
        <br />
        <br />
        <br />
        <br />
        
        <div class="contenido" ng-init="listarUsuarios()">
            <div class="container">
                <h2>Listado de Articulos</h2>
                <button type="button" 
                        class="open-Create btn btn-success btn-md glyphicon glyphicon-plus"
                        data-toggle="modal" 
                        data-target="#CreateArticulo">Agregar Contenido</button>

                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Contenido</th>
                            <th>Descripción</th>
                            <th>Fecha Creación</th>
                            <th>Fecha Publicación</th>
                            <th>Publicado</th>
                            <th>Titulo</th>
                            <th>Editar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="articulos" items="${listaArticulo}">
                            <tr>
                                <td>${articulos.idArticulo}</td>
                                <td>${articulos.contenido}</td>
                                <td>${articulos.descripcion}</td>
                                <td>${articulos.fechaCreacion}</td>
                                <td>${articulos.fechaPublicacion}</td>
                                <td>${articulos.publicado}</td>
                                <td>${articulos.titulo}</td>
                                <td>
                                    <button type="button"
                                            data-toggle="modal" 
                                            data-target="#EditArticulo" 
                                            class="open-Edit btn btn-primary btn-sm glyphicon glyphicon-pencil" ng-click="construirUsuario(users[0], users[1], users[2], users[3], users[4], users[5])"></button>   
                                </td>
                                <td>
                                    <button type="button" 
                                            data-toggle="modal" 
                                            data-target="#DeleteUser"    
                                            class="open-Delete btn btn-danger btn-sm glyphicon glyphicon-trash" ng-click="construirUsuario(users[0], users[1], users[2], users[3], users[4], users[5])"></button> 
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <br />
                <br />
                <br />
                <h2>Listado de Imagenes</h2>
                <button type="button" 
                        class="open-Create btn btn-success btn-md glyphicon glyphicon-plus"
                        data-toggle="modal" 
                        data-target="#CreateImage">Agregar Imagen</button>

                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Url</th>
                            <th>Editar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <c:forEach var="imagenes" items="${listaImagen}">
                            <tr>
                                <td>${imagenes.idImagen}</td>
                                <td>${imagenes.nombre}</td>
                                <td>${imagenes.url}</td>
                                <td>
                                    <button type="button"
                                            data-toggle="modal" 
                                            data-target="#EditImage" 
                                            class="open-Edit btn btn-primary btn-sm glyphicon glyphicon-pencil" ng-click="construirUsuario(users[0], users[1], users[2], users[3], users[4], users[5])"></button>   
                                </td>
                                <td>
                                    <button type="button" 
                                            data-toggle="modal" 
                                            data-target="#DeleteUser"    
                                            class="open-Delete btn btn-danger btn-sm glyphicon glyphicon-trash" ng-click="construirUsuario(users[0], users[1], users[2], users[3], users[4], users[5])"></button> 
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                        
                        <!--modal Fade CreateUser-->
                <div class="modal fade" id="CreateArticulo" tabindex="-1" role="dialog" aria-labelledby="create" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                <h4 class="modal-title custom_align" id="Heading">Crear Registro</h4>
                            </div>
                            <div class="modal-body">
                                <form id="contact_form_CreateUser" action="SCRUD" method="POST">
                                    <div class="form-group">
                                        <input class="form-control " type="hidden" id="cIdUsuario" value=""/>
                                    </div>
                                    <div ng-show="Status.code !=-1" class="alert {{Status.code==1?'alert-success':'alert-danger'}}">
                                        {{Status.message}}
                                    </div>
                                    <div class="form-group">
                                        <label>Contenido</label>
                                        <input class="form-control " ng-model="User.nombre" type="text" id="cNombre" name="cNombre" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>descripción</label>
                                        <input class="form-control " ng-model="User.aPaterno" type="text" id="cApaterno" name="cApaterno" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Fecha Creacion</label>
                                        <input class="form-control " ng-model="User.aMaterno" type="text" id="cAmaterno" name="cAmaterno" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Fecha Publicacion</label>
                                        <input class="form-control " ng-model="User.email" type="text" id="cEmail" name="cEmail" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Publicado</label>
                                        <input class="form-control " ng-model="User.password" type="text" id="cContrasenia" name="cContrasenia" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Titulo</label>
                                        <input class="form-control " ng-model="User.password" type="text" id="cContrasenia" name="cContrasenia" value=""/>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button id="submitFormCreateUser" name="Create" type="button" ng-click="User.idUsuario; crearUsuario();" class="btn btn-success btn-md">Crear</button>
                                <button id="resetFormCreate" type="reset" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Fin modal Fade Create-->
                        <!--modal Fade CreateUser-->
                <div class="modal fade" id="CreateImage" tabindex="-1" role="dialog" aria-labelledby="create" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                <h4 class="modal-title custom_align" id="Heading">Crear Registro</h4>
                            </div>
                            <div class="modal-body">
                                <form id="contact_form_CreateUser" action="SCRUD" method="POST">
                                    <div class="form-group">
                                        <input class="form-control " type="hidden" id="cIdUsuario" value=""/>
                                    </div>
                                    <div ng-show="Status.code !=-1" class="alert {{Status.code==1?'alert-success':'alert-danger'}}">
                                        {{Status.message}}
                                    </div>
                                    <div class="form-group">
                                        <label>Nombre</label>
                                        <input class="form-control " ng-model="User.nombre" type="text" id="cNombre" name="cNombre" value=""/>
                                    </div>
                                    <div class="form-group">
                                        <label>Url</label>
                                        <input class="form-control" type="file" name="file" required="">
                                    </div>
                                    
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button id="submitFormCreateUser" name="Create" type="button" ng-click="User.idUsuario; crearUsuario();" class="btn btn-success btn-md">Crear</button>
                                <button id="resetFormCreate" type="reset" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Fin modal Fade Create-->
            </div>
        </div>

        <a href="logout?id=${user.idUsuario}" class="btn btn-xs btn-link margen" title="Cerrar sesión"><i class="glyphicon glyphicon-log-out"></i> Salir</a>
        
        <c:import url="page/usuario.jsp"/>
    </body>
</html>
