<%-- 
    Document   : nav2
    Created on : 15-nov-2016, 13:37:41
    Author     : PrismaGram
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<meta name="viewport" content="width= device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" >

<header>
    <div class="menu_bar">
        <a href="#" class="bt-menu"><span class="glyphicon glyphicon-menu-hamburger"></span>Gallo de oro</a>
    </div>

    <nav class="">
        <ul>   
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <div class="w3-row">
                    <div class="w3-col m2">
                <a href="#"><img title="Gallo de Oro" src="${pageContext.servletContext.contextPath}/resources/img/ico/logo_gallo.png" width="50px" class="w3-btn-floating w3-black margen grow" height="50px"> </a>
                </div>
                    
                    <div class="w3-col m3"> <div style="">
                        <div id="google_translate_element" ></div>
                    <script type="text/javascript">
                        function googleTranslateElementInit() {
                            new google.translate.TranslateElement({pageLanguage: 'es', layout: google.translate.TranslateElement.InlineLayout.HORIZONTAL, autoDisplay: false}, 'google_translate_element');
                        }
                        $(".goog-te-combo").attr("class", "goog-te-combo form-control");
                    </script>
                    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
                    </div></div></div>
                
            </div>
            
            <div class="navbar-form navbar-right">
                
                <li><button type="button" class="btn btn-link w3-text-white allBtn btn-xs" style=" color: white;" data-toggle="modal" data-target="#modalRecoverPassword">Recuperar <br> contraseña</button></li>  
                <a href="http://www.markeking.com.mx/" target="_blank" class="w3-btn-floating w3-amber margen" title="Markeking"><i class="glyphicon glyphicon-shopping-cart w3-text-white"></i></a>
                <a href="https://www.facebook.com/Gallo-de-Oro-382088085319878/?fref=ts" target="_blank" class="w3-btn-floating margen" title="Facebook" style="background: #3b5998"><i class="fa fa-facebook"></i></a>
                <a href="https://twitter.com/gallodeoro_mx" class="w3-btn-floating w3-blue margen" target="_blank" title="Twitter"><i class="fa fa-twitter"></i></a>
                <a href="https://www.youtube.com/channel/UC_xc6wvqJkbZapdeCCfIi3Q?sub_confirmation=1" target="_blank" class="w3-btn-floating w3-red margen"  title="Youtube"><i class="fa fa-youtube"></i></a>
                <a href="https://www.instagram.com/gallodeoro.mx/" class="w3-btn-floating w3-brown margen" target="_blank" title="Instagram" ><i class="fa fa-instagram"></i></a> 
            </div>

            <form:form name='f' action="/gallodeoro/auth"  method='POST' id="sub">
                <div class="form-group navbar-form navbar-right">
                    <li> 
                        <div class="input-group input-group-sm">                            
                            <span class="input-group-addon">                                
                                <span class="glyphicon glyphicon-user"></span>                                 
                            </span>
                            <input id="email" name="email" type="text" class="form-control input-sm"  placeholder="Correo electrónico" required="" />
                        </div>&nbsp;
                    </li>
                    <li> 
                        <div class="input-group input-group-sm">                            
                            <span class="input-group-addon">                               
                                <span class="glyphicon glyphicon-lock"></span>                              
                            </span>
                            <input id="password" type="password" name="password" class="form-control input-sm"  placeholder="Contraseña" required="" />
                        </div>
                    </li>
                    <li>&nbsp;<button onclick="encript()"  class="btn btn-success btn-xs"><i class="glyphicon glyphicon-log-in"></i> Iniciar Sesión</button></li>
                    <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />                       
                </div>
            </form:form>         



        </ul>
    </nav>
</header>

<style>
    #imaginary_container{
        margin-top:20%; /* Don't copy this */
    }
    .stylish-input-group .input-group-addon{
        background: white !important; 
    }
    .stylish-input-group .form-control{
        border-right:0; 
        box-shadow:0 0 0; 
        border-color:#ccc;
    }
    .stylish-input-group button{
        border:0;
        background:transparent;
    }
</style>


<script type="text/javascript">
                $(document).ready(main);

                var contador = 1;

                function main() {
                    $('.menu_bar').click(function () {
                        // $('nav').toggle(); 

                        if (contador == 1) {
                            $('nav').animate({
                                left: '0'
                            });
                            contador = 0;
                        } else {
                            contador = 1;
                            $('nav').animate({
                                left: '-100%'
                            });
                        }

                    });

                }
                ;
</script>
