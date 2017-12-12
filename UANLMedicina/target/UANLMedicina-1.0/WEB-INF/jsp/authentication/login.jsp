<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/bootstrap/bootstrap-3.3.7-dist/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/css/login.css">
        <link href="bootstrap/css/login.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,400,700&subset=latin-ext" rel="stylesheet">
        <script src="${pageContext.servletContext.contextPath}/resources/js/jquery.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/css/bootstrap/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/resources/js/sha1.js"></script>

    </head>

    <body>
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
                <button type="submit" onclick="encript()" class="btn btn-lg btn-primary btn-block">Iniciar Sesión</button>
                <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
            </form:form>
        </div>
        <c:import url="page/footer.jsp"/>
    </body>
</html>

<script>
    function encript() {
        var passReal = Sha1.hash($("#password").val());
        $("#password").val(passReal);
        document.forms["f"].submit();
    }
</script>