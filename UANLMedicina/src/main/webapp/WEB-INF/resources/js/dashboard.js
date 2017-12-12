/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$('.contenido').on("click", ".open-Edit", function () {
    if (!$(".contenido").hasClass(".abrir")){
        $('.contenido').removeClass('abrir');
    }
    var idUsuario = $(this).data('id');
    var Nombre = $(this).data('nombre');
    var Apaterno = $(this).data('apaterno');
    var Amaterno = $(this).data('amaterno');
    var Email = $(this).data('email');
    var Contrasenia = $(this).data('contrasenia');
    $(".modal-body #eIdUsuario").val( idUsuario );
    $(".modal-body #eNombre").val( Nombre );
    $(".modal-body #eApaterno").val( Apaterno );
    $(".modal-body #eAmaterno").val( Amaterno );
    $(".modal-body #eEmail").val( Email );
    $(".modal-body #eContrasenia").val( Contrasenia );
   
});


$('.contenido').on("click", ".open-Edit", function () {
    if (!$(".contenido").hasClass(".abrir")){
        $('.contenido').removeClass('abrir');
    }
    var idMenu = $(this).data('id');
    var Nombre = $(this).data('nombre');
    var Tipo = $(this).data('tipo');
    var Dependencia = $(this).data('dependencia');
    var Ruta = $(this).data('ruta');
    
    $(".modal-body #eIdMenu").val( idMenu );
    $(".modal-body #eNombreMenu").val( Nombre );
    $(".modal-body #eTipoMenu").val( Tipo );
    $(".modal-body #eDependencia").val( Dependencia );
    $(".modal-body #eRuta").val( Ruta );
   
});


$('.contenido').on("click", ".open-Delete", function () {
    if (!$(".contenido").hasClass(".abrir")){
        $('.contenido').removeClass('abrir');
    }
    var idUsuario = $(this).data('id');
    var Nombre = $(this).data('nombre');
    var Apaterno = $(this).data('apaterno');
    var Amaterno = $(this).data('amaterno');
    var Email = $(this).data('email');
    var Contrasenia = $(this).data('contrasenia');
    $(".modal-body #dIdUsuario").val( idUsuario );
    $(".modal-body #dNombre").val( Nombre );
    $(".modal-body #dApaterno").val( Apaterno );
    $(".modal-body #dAmaterno").val( Amaterno );
    $(".modal-body #dEmail").val( Email );
    $(".modal-body #dContrasenia").val( Contrasenia );
   
});

$('.contenido').on("click", ".open-Delete", function () {
    if (!$(".contenido").hasClass(".abrir")){
        $('.contenido').removeClass('abrir');
    }
    var idMenu = $(this).data('id');
    var Nombre = $(this).data('nombre');
    var Tipo = $(this).data('tipo');
    var Dependencia = $(this).data('dependencia');
    var Ruta = $(this).data('ruta');
     
    $(".modal-body #dIdMenu").val( idMenu );
    $(".modal-body #dNombreMenu").val( Nombre );
    $(".modal-body #dTipoMenu").val( Tipo );
    $(".modal-body #dDependencia").val( Dependencia );
    $(".modal-body #dRuta").val( Ruta );
   
});


$('.contenido').on("click", ".open-Create", function () {
    if (!$(".contenido").hasClass(".abrir")){
        $('.contenido').removeClass('abrir');
    }
    /*$(".modal-body #midUsuario").val('0' );*/
});

$("#submitFormEditUser").on('click', function() {
        $("#contact_form_EditUser").submit();
    });
    
$("#submitFormCreateUser").on('click', function() {
    $("#contact_form_CreateUser").submit();
});

$("#resetFormCreateUser").on('click', function() {
    $("#contact_form_CreateUser").trigger("reset");
});
    
$("#submitFormDeleteUser").on('click', function() {
    $("#contact_form_DeleteUser").submit();
});

$("#submitFormEditMenu").on('click', function() {
        $("#contact_form_EditMenu").submit();
    });
    
$("#submitFormCreateMenu").on('click', function() {
    $("#contact_form_CreateMenu").submit();
});

$("#resetFormCreateMenu").on('click', function() {
    $("#contact_form_CreateMenu").trigger("reset");
});
    
$("#submitFormDeleteMenu").on('click', function() {
    $("#contact_form_DeleteMenu").submit();
});


        
    

$('.menu-bar').on('click', function(){
    $('.contenido').toggleClass('abrir');
});