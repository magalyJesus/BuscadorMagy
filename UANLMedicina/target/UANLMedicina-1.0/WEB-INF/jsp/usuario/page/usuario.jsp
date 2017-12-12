<%-- 
    Document   : script
    Created on : 22-dic-2016, 18:20:11
    Author     : Abdiel Salas Pérez
--%>


<script>
    var app = angular.module('myApp', []);
    app.controller('myCtrl', function ($scope, $http, $interval) {
        $scope.Status = {
                          code : -1,
                          message : ''
                      }
                      
        $scope.construirArticulo = function(idArticulo, contenido, descripcion, fechaCreacion, fechaPublicacion, publicado, titulo){
            $scope.Articulo = {
                idArticulo : idArticulo,
                contenido : contenido,
                descripcion : descripcion,
                fechaCreacion : fechaCreacion,
                fechaPublicacion : fechaPublicacion, 
                publicado : publicado,
                titulo : titulo
            }
        };
        
        $scope.construirImagen = function(idImagen, url, nombre){
            $scope.Imagen = {
                idImagen : idImagen,
                url : url,
                nombre : nombre
            }
        };
    });
</script>
