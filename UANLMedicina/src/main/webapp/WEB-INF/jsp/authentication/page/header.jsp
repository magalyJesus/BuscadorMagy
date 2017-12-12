<%@page import="model.pojo.Menu"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.DAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <link href="bootstrap/css/header.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
          <div class="container-fluid">
            <div class="navbar-header">
              <a class="navbar-brand" href="#">Medicina</a>
            </div>
            <ul class="nav navbar-nav">
              <li>
                  <%
                      List<Menu> menus = DAO.menuList();
                      pageContext.setAttribute("menus", menus);
                  %>
                  <c:forEach var="menu" items="${menus}">
                  <div class="dropdown">
                        <a href="${menu.getRuta()}"><button class="dropbtn"><c:out value="${menu.getNombre()}"/></button></a>
                        <c:set var="idMenu"><c:out value="${menu.getIdMenu()}"/></c:set>
                        <%
                            List<Menu> subMenus = DAO.subMenuList((String)pageContext.getAttribute("idMenu"));
                              pageContext.setAttribute("subMenus", subMenus);
                        %>  
                        <div class="dropdown-content">
                          <c:forEach var="submenu" items="${subMenus}">
                            <a href="${submenu.getRuta()}"><c:out value="${submenu.getNombre()}"/></a>
                          </c:forEach>  
                        </div>
                  </div>
                  </c:forEach>
              </li>
            </ul>
          </div>
        </nav>
           
         
        
    </body>
</html>

<!-- viejo header
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container">
        <a class="navbar-brand" href="#">Medicina</a>
    </div>
</nav>
<br>
<br>
<br>
<br>

-->