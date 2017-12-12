<footer class="sec-footer">
	<div class="container-fluid">
		<div class="col-sm-12">
                    <div class="col-sm-4"><br>
                         <h4 class="seccRedesSocFooter">Secciones </h4> <hr>
                         <div class="col-sm-6 col-xs-7">
                            <ul class="nav footer-nav">
                                <p><a href="#" class="footerTexto">Aviso de Privacidad</a></p> <br>
                                <a href="#" class="footerTexto">Condiciones Legales</a><br>
                            </ul>
                        </div>  
                        <div class="col-sm-6 col-xs-5">
                            <ul class="nav footer-nav">
                                <p><a href="#" class="footerTexto">Preguntas Frecuentes</a></p><br>
                                   <a href="#" class="footerTexto" data-toggle="modal" data-target="#mdContact">Contacto</a>
                            </ul>
                        </div>	
                    </div><br>
                    <div class="col-sm-4">
                        <h4><br></h4><hr>
                        <div class="col-sm-2">
                            <a href="https://www.facebook.com/Congreso-Nacional-de-Investigaci%C3%B3n-en-Medicina-1383778481850063/"><i class="fa fa-facebook-square fa-3x color-facebook"></i></a>
                         </div>
                        <div class="col-sm-2">
                            <a href="#"><i class="fa fa-twitter-square fa-3x color-twitter"></i></a>
                        </div>
                        <div class="col-sm-2">
                            <a href="#"><i class="fa fa-google-plus-square fa-3x color-google-plus"></i></a>
                        </div>
                        <div class="col-sm-2">
                            <a href="#"><i class="fa fa-linkedin-square fa-3x color-linkedin"></i></a>
                        </div>
                        <div class="col-sm-2">
                            <a href="#"><i class="fa fa-pinterest-square fa-3x color-pinterest"></i></a>
                        </div>	
                    </div>
                    <div class="col-sm-4">
		        <h4 class="seccRedesSocFooter">Redes Sociales </h4><hr>
                            <ul class="nav navbar-nav navbar-footer">
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
                <div class="line-footer">
                    <div class="container">
			<div class="col-sm-8"><br>
                            <p ng-repeat="tf2 in listaImagenes| filter : {tipo : 'TF2'}" class="item {{$index==0?'active':''}}" >
                                {{tf2.descripcion}}
                            </p>
			</div>
                    </div>
                </div>
</footer>

