<%-- 
    Document   : scriptManager
    Created on : 29/06/2017, 02:59:10 PM
    Author     : Abdiel Salas Pérez
--%>

<script>
    var app = angular.module('myApp', []);
    app.controller('myCtrl', function ($scope, $http, $log) {
        $scope.selectItem = 0;
        $scope.slideCarrusel = 0;
        $scope.listaMenusM = {};
        $scope.User = {};
        $scope.Menu = {};
        $scope.Imagen = {};
        $scope.Status = {
            code: -1,
            message: ''
        }
        $scope.construirUsuario = function (idUsuario, nombre, aPaterno, aMaterno, email, password) {
            $scope.User = {
                idUsuario: idUsuario,
                nombre: nombre,
                aPaterno: aPaterno,
                aMaterno: aMaterno,
                email: email,
                password: password
            }
        };

        $scope.construirMenu = function (idMenu, nombre, tipo, dependencia, ruta) {
            $scope.Menu = {
                idMenu: idMenu,
                dependencia: dependencia,
                nombre: nombre,
                ruta: ruta,
                tipo: tipo
            }
        };

        $scope.construirImagen = function (idImagen, nombre, descripcion, url, tipo, activo, slideCarrusel) {
            $scope.Imagen = {
                idImagen: idImagen,
                nombre: nombre,
                descripcion: descripcion,
                url: url,
                tipo: tipo,
                activo: activo
            }
            $scope.slideCarrusel = slideCarrusel;
        };

        $scope.setOpcCarrusel = function (slideCarrusel) {
            $scope.slideCarrusel = slideCarrusel;
        };

        $scope.listarUsuarios = function () {
            $http.get("listarUsuarios")
                    .success(function (response) {
                        $scope.listaUsuarios = response;
                    })
                    .error(function () {});
        };

        $scope.crearUsuario = function () {
            $http.get("agregarUsuario?nombre=" + $scope.User.nombre + "&aPaterno="
                    + $scope.User.aPaterno + "&aMaterno=" + $scope.User.aMaterno + "&email=" + $scope.User.email
                    + "&password=" + $scope.User.password + "&activo=1")
                    .success(function (response) {
                        if (response) {
                            $scope.Status.code = 1;
                            $scope.Status.message = 'Se agregó un nuevo registro exitosamente';
                        } else {
                            $scope.Status.code = 0;
                            $scope.Status.message = 'Ocurrio un error al agregar un nuevo registro';
                        }
                    })
                    .error(function () {});
        };

        $scope.updateUser = function (update) {
            var url = "updateUser";
            if (update === "mail") {
                url = "updateUserMailSender";
            }
            $http.get(url + "?nombre=" + $scope.User.nombre + "&aPaterno="
                    + $scope.User.aPaterno + "&aMaterno=" + $scope.User.aMaterno + "&email=" + $scope.User.email
                    + "&password=" + $scope.User.password + "&activo=1" + "&idUsuario=" + $scope.User.idUsuario)
                    .success(function (response) {
                        if (response) {
                            $scope.Status.code = 1;
                            $scope.Status.message = 'Se actualizó un nuevo registro exitosamente';
                        } else {
                            $scope.Status.code = 0;
                            $scope.Status.message = 'Ocurrio un error al actualizar un nuevo registro';
                        }
                    })
                    .error(function () {});
        };

        $scope.eliminarUsuario = function (idUsuario) {
            $http.get("eliminarUsuario?idUsuario=" + idUsuario)
                    .success(function (response) {
                        if (response) {
                            $scope.Status.code = 1;
                            $scope.Status.message = 'Se eliminó un nuevo registro exitosamente';
                        } else {
                            $scope.Status.code = 0;
                            $scope.Status.message = 'Ocurrio un error al eliminar un nuevo registro';
                        }
                    })
                    .error(function () {});
        };

        $scope.crearMenu = function () {
            $http.get("agregarMenu?nombre=" + $scope.Menu.nombre + "&tipo="
                    + $scope.Menu.tipo + "&dependencia=" + $scope.Menu.dependencia + "&ruta=" + $scope.Menu.ruta)
                    .success(function (response) {
                        if (response) {
                            $scope.Status.code = 1;
                            $scope.Status.message = 'Se agregó un nuevo registro exitosamente';
                        } else {
                            $scope.Status.code = 0;
                            $scope.Status.message = 'Ocurrio un error al agregar un nuevo registro';
                        }
                    })
                    .error(function () {
                        alert('Error o');
                    });
        };

        $scope.actualizarMenu = function () {
            $http.get("actualizarMenu?idMenu=" + $scope.Menu.idMenu + "&nombre="
                    + $scope.Menu.nombre + "&tipo=" + $scope.Menu.tipo + "&dependencia=" + $scope.Menu.dependencia
                    + "&ruta=" + $scope.Menu.ruta)
                    .success(function (response) {
                        if (response) {
                            $scope.Status.code = 1;
                            $scope.Status.message = 'Se actualizó un nuevo registro exitosamente';
                        } else {
                            $scope.Status.code = 0;
                            $scope.Status.message = 'Ocurrio un error al actualizar un nuevo registro';
                        }
                    })
                    .error(function () {});
        };

        $scope.eliminarMenu = function () {
            $http.get("eliminarMenu?idMenu=" + $scope.Menu.idMenu)
                    .success(function (response) {
                        if (response) {
                            $scope.Status.code = 1;
                            $scope.Status.message = 'Se eliminó un nuevo registro exitosamente';
                        } else {
                            $scope.Status.code = 0;
                            $scope.Status.message = 'Ocurrio un error al eliminar un nuevo registro';
                        }
                    })
                    .error(function () {});
        };

        $scope.editarImagen = function () {
            $http.get("editarImagen?idImagen=" + $scope.Imagen.idImagen + "&nombre=" + $scope.Imagen.nombre
                    + "&url=" + $scope.Imagen.url + "&descripcion=" + $scope.Imagen.descripcion
                    + "&tipo=" + $scope.Imagen.tipo + "&activo=" + $scope.Imagen.activo)
                    .success(function (response) {
                        if (response) {
                            $scope.Status.code = 1;
                            $scope.Status.message = 'Se editó un nuevo registro exitosamente';
                        } else {
                            $scope.Status.code = 0;
                            $scope.Status.message = 'Ocurrio un error al editar un nuevo registro';
                        }
                    })
                    .error(function () {});
        };

        $scope.eliminarImagen = function () {
            $http.get("eliminarImagen?idImagen=" + $scope.Imagen.idImagen + "&url=" + $scope.Imagen.url + "&userIdLogged=${user.idUsuario}")
                    .success(function (response) {
                        if (response) {
                            alert('Se eliminó correctamente');
                        } else {
                            alert('Se ha producido un error al eliminar la imagen');
                        }
                    })
                    .error(function () {});
        };

        $scope.listarImagen = function () {
            $http.get("listarImagenes")
                    .success(function (response) {
                        $scope.listaImagenes = response;
                    })
                    .error(function () {
                        alert('Ocurrió un error al cargar la lista de imagenes');
                    });
        };

        $scope.atulizarDescripcionImagen = function (idImagen, url, descripcion, tipo) {
            $http.get("atulizarDescripcionImagen?idImagen=" + idImagen + "&url=" + url + "&descripcion=" + descripcion + "&tipo=" + tipo + "&userIdLogged=${user.idUsuario}")
                    .success(function (response) {
                        if (response) {
                            alert('Se actualizó la información correctamente');
                        } else {
                            alert('No se ha podido actualizar la información');
                        }
                    })
                    .error(function () {});
        };

        $scope.listaBitacora = function () {
            $http.get("listaBitacora").success(function (response) {
                $scope.listBitacora = response;
            }).error(function () {});
        };

        $scope.start = function(index, role) {            
            $scope.selectItem = index;
            var option = ['user', 'menu', 'slider', 'carrusel', 'notifications', 'roles', 'logo', 'socialmedia', 'correo', 'footer', 'anuncio', 'map'];
            for (var i = 0; i < option.length; i++) {
                $("#" + option[i]).hide();
            }
            $("#" + option[index]).show();
        };
        
        if ('${role}' == 'ADMINISTRADOR') {
            
            if("${param['start']}"==''){
                $scope.start(0);
            }else{
                $scope.start('${param['start']}');
            }
        } else if ('${role}' == 'EDITOR') {
            if("${param['start']}"==''){
                $scope.start(2);
            }else{
                $scope.start('${param['start']}');
            }
        }

    });



</script>