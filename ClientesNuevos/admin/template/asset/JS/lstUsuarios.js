﻿/// <reference path="../../../../scripts/js/ajax.js" />
/// <reference path="../../../../scripts/sweetalert2.all.min.js" />


$(document).ready(function () {
    cargarUsuarios();

    $(document).on('click','#btnEliminar',function () {
        let id = $(this).closest('tr').find('.id').text();
        //Eliminar

        Swal.fire({

            text: "¿Está seguro de que desea eliminar este usuario de forma permanente?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            cancelButtonText:'Cancelar',
            confirmButtonText: 'Si'
        }).then((result) => {
            if (result.isConfirmed) {
                //SI
                swal.fire({
                    showConfirmButton: false,
                    text: 'Eliminando usuario',
                    allowOutsideClick: false,
                    willOpen: () => {
                        Swal.showLoading()
                        $.ajax({
                            type: "POST",
                            url: "../usuarios/wsUsuarios.asmx/BorrarUsuario",
                            data: "{id:'" + id + "'}",
                            dataType: "json",
                            async: false,
                            contentType: "application/json; charset=utf-8",
                            success: function (result) {
                                swal.fire({
                                    text: result.d,
                                    icon: 'success',
                                    timer: 3000
                                }).then((res) => {
                                    document.location.reload();
                                })

                            },
                            failure: function (XMLHttpRequest, textStatus, errorThrown) {
                                if (errorThrown !== "") {
                                    alert("Error en Post: " + errorThrown);
                                }
                            }
                        });
                    }
                })

            }
        })


    });

    var tablaUser = $('#tUsuariosDet').DataTable();

    cargarSinRol();
    var tablaSin = $('#tSinCredencial').DataTable();

    
});

function cargarSinRol() {
    let tabla = $('#tSinCredencial tbody');
    var RFC = '';
    var Fecha = '';
    var status = '';
    var accioones = '';
    GetAjax("../wsAdminIndex.asmx/ObtnerSinRol", "", false, function (lstRol) {
        if (lstRol.length > 0) {
            $('#sinrol').show();

            tabla.empty();
            for (var i = 0; i < lstRol.length; i++) {
                if (lstRol[i].Status == 'activo') {
                    estatus = "<label class='etiqueta'>" + lstRol[i].Status + "</label>"
                } else {
                    estatus = "<label class='etiqueta peligro'>" + lstRol[i].Status + "</label>"

                }
                tabla.append(
                    "<tr>" +
                    "<td hidden><span class='id'>" + lstRol[i].Id + "</span></td>" +
                    "<td>" + lstRol[i].RFC + "</td>" +
                    "<td>" + lstRol[i].Fecha + "</td>" +
                    "<td>" + estatus + "</td>" +
                    "<td>" +
                    "<a href='EditarUsuario.aspx?id=" + lstRol[i].Id + "' class='btn btn-secondary btn-sm'><i class='bi bi-pencil-square'></i></a>" +
                    "<button type='button' id='btnEliminar' class='btn btn-danger btn-sm ms-1'><i class='bi bi-trash'></i></button>" +
                    "</td>" +
                    "</tr>"
                );
            }
        } 
    });
    
}


function cargarUsuarios() {
    let tablas = $('#tUsuariosDet tbody');
    var RFC = '';
    var detalles = '';
    var login = '';
    var estatus;
    var lstLogin;

    GetAjax("../wsAdminIndex.asmx/Obtener_UD", "", false, function (lstUser) {
          if (lstUser.length > 0) {
            tablas.empty();
              for (var i = 0; i < lstUser.length; i++) {
                  lstLogin = new Array();
                RFC = lstUser[i].RFC;

               
                  login = "<select class='form-select-sm border-0'>" + LoadLogins(RFC) +"</select>";
               

                if (lstUser[i].Status == 'activo') {
                    estatus = "<label class='etiqueta'>" + lstUser[i].Status +"</label>"
                } else {
                    estatus = "<label class='etiqueta peligro'>" + lstUser[i].Status + "</label>"

                }

                if (i == lstUser.length - 1) {
                    detalles += "<span class='badge rounded-pill bg-secondary'>" + lstUser[i].Detalles + "</span>";

                    tablas.append(
                        "<tr>" +
                        "<td hidden><span class='id'>" + lstUser[i].Id + "</span></td>" +
                        "<td>" + lstUser[i].RFC + "</td>" +
                        "<td >" + detalles + "</td>" +
                        "<td>" + lstUser[i].Fecha + "</td>" +
                        "<td>" + estatus + "</td>" +
                        "<td>" + login  + "</td>"+
                        "<td>" +
                        "<a href='EditarUsuario.aspx?id=" + lstUser[i].Id + "' class='btn btn-secondary btn-sm'><i class='bi bi-pencil-square'></i></a>"+
                        "<button type='button' id='btnEliminar' class='btn btn-danger btn-sm ms-1'><i class='bi bi-trash'></i></button>" +
                        "</td>" +
                        "</tr>"
                    );
                }
                else if (RFC != lstUser[i + 1].RFC) {
                    detalles += "<span class='badge rounded-pill text-bg-primary'>" + lstUser[i].Detalles + "</span>";

                    tablas.append(
                        "<tr>" +
                        "<td hidden><span class='id'>" + lstUser[i].Id + "</span></td>" +
                        "<td>" + lstUser[i].RFC + "</td>" +
                        "<td >" + detalles + "</td>" +
                        "<td>" + lstUser[i].Fecha + "</td>" +
                        "<td>" + estatus + "</td>" +
                        "<td>" + login + "</td>" +
                        "<td>" +
                        "<a href='EditarUsuario.aspx?id=" + lstUser[i].Id + "' class='btn btn-secondary btn-sm'><i class='bi bi-pencil-square'></i></a>" +
                        "<button type='button' id='btnEliminar' class='btn btn-danger btn-sm ms-1'><i class='bi bi-trash'></i></button>" +
                        "</td>" +
                        "</tr>"
                    );

                    detalles = "";
                }                
                else {
                    detalles += "<span class='badge bg-secondary'>" + lstUser[i].Detalles + "</span>";

                }
            }
        }
    });
}
//ListaLogin(string id)
function LoadLogins(rfc) {
    var ddopciones = '';

    GetAjax("../wsAdminIndex.asmx/ListaLogin", "'id':'" + rfc + "'", false, function (lista) {

        if (lista.length > 0) {
            for (var i = 0; i < lista.length; i++) {
                if (i == 0) {
                    ddopciones += "<option value='" + lista[i].no_login + "'>último inicio : " + lista[i].fecha + "</option>";

                } else {
                    ddopciones += "<option value='" + lista[i].no_login + "' disabled>" +i + ": " + lista[i].fecha + "</option>";

                }
            }
        } else {
            ddopciones = "<option value='0' selected disabled>sin inicio de sesión</option>";

        }

    });

    return ddopciones;
}