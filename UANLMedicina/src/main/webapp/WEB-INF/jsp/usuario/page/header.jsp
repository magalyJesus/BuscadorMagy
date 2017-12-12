<%-- 
    Document   : header
    Created on : 02-nov-2017, 7:28:54
    Author     : Abdiel Salas Pérez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">

            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button> 
            <a class="navbar-brand" href="#"><img src="bootstrap/img/logo.png" width="180" height="100" data-active-url="bootstrap/img/logo.png" alt=""></a>
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
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-left">
                <li>
                    <c:forEach var="menu" items="${listaMenu}">
                        <c:if test = "${menu.dependencia == 1}">
                            <div class="dropdown">
                                <a href="${menu.ruta}"><button class="dropbtn"><c:out value="${menu.nombre}"/></button></a>
                                    <c:set var="idMenu"><c:out value="${menu.idMenu}"/></c:set>
                                    <div class="dropdown-content">
                                    <c:forEach var="submenu" items="${listaMenu}">
                                        <c:if test = "${submenu.dependencia == 2}">
                                            <a href="${submenu.ruta}">${submenu.nombre}</a>
                                        </c:if>
                                    </c:forEach>  
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </li>
            </ul>
        </div>
    </div>
</div>
