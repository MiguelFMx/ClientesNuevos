/// <reference path="../../../../scripts/datatables/datatables.min.js" />
/// <reference path="../../../../scripts/sweetalert2.all.min.js" />


$(document).ready(function () {
    ObtenerCorreosOP();

    var tabla = $('#tCorreos').DataTable();

    var tabla2 = $('#tCorreosSinOP').DataTable();

    $('#btnEnviarCorreo').click(function () {
        var txtAsunto = $('#MainContent_txtAsunto');
        var txtMensaje = $('#MainContent_txtMensaje');
        var correo = new Array();

        $('.form-check').each(function () {
                let checked = $(this).find($('[name=check]'));
                let mailTemp = $(this).find($('[name=correo]'));

                if (checked.is(':checked')) {
                    correo.push(mailTemp.html());
                }
        });
        if (correo.length > 0 && txtAsunto.val() != '' && txtMensaje.val() != '') {

            var listaMail = 'mailto:';
            for (var i = 0; i < correo.length; i++) {
                listaMail += correo[i] + ";";
            }
            listaMail = listaMail.substring(0, listaMail.length - 1);
            listaMail += "?subject=" + txtAsunto.val() + "&body=" + txtMensaje.val();
            $('#lbcorreo').attr("href", listaMail);

            $('#lbcorreo')[0].click();

        } else {
            if (correo.length == 0) {
                //----alerta de error
                swal.fire({
                    title: "Error",
                    html: "Oh no! <br> Seleccione un correo",
                    icon: "error"
                });
            } else if (txtAsunto.val() == "") {
                swal.fire({
                    title: "Error",
                    html: "Oh no! <br> Escriba el asunto del correo",
                    icon: "error"
                });
            } else if (txtMensaje.val() == "") {
                swal.fire({
                    title: "Error",
                    html: "Oh no! <br> Escriba el cuerpo del correo",
                    icon: "error"
                });
            } else {
                swal.fire({
                    title: "Error",
                    html: "Oh no! <br> Falta de datos",
                    icon: "error"
                });
            }
        }

        //var email = [];
        //var aux = 0;

        //if (txtAsunto.val() == '' || txtMensaje.val() == '') {
        //    swal.fire(
        //        "Error ",
        //        "Falta de datos",
        //        "error"
        //    )
        //} else {
        //    $('.form-check').each(function () {
        //        let checked = $(this).find($('[name=check]'));
        //        let mailTemp = $(this).find($('[name=correo]'));
        //        let contactTemp = $(this).find($('[name=contacto]'));

        //        if (checked.is(':checked')) {
        //            correo.push(mailTemp.html() + ';' + contactTemp.html());
        //            aux++;

        //        }
        //    });
        //    /*
        //    if (aux > 0) {
        //        swal.fire({
        //            showConfirmButton: false,
        //            title: 'Enviando correo',
        //            allowOutsideClick: false,
        //            willOpen: () => {
        //                Swal.showLoading();
        //                $.ajax({
        //                    type: "POST",
        //                    url: "wsReportes.asmx/EnviarCorreos",
        //                    data: JSON.stringify({ Info: correo, asunto: txtAsunto.val(), cuerpo: txtMensaje.val() }),
        //                    dataType: "json",
        //                    async: false,
        //                    contentType: "application/json; charset=utf-8",
        //                    success: function (result) {
        //                        swal.fire({
        //                            text: result.d,
        //                            icon: 'success',
        //                            timer: 3000
        //                        }).then((res) => {
        //                            //document.location.reload();
        //                            $('.form-check').each(function () {
        //                                let checked = $(this).find($('[name=check]'));

        //                                if (checked.is(':checked')) {
        //                                    checked.prop('checked', false);
        //                                }
        //                            });
        //                        })

        //                    },
        //                    failure: function (XMLHttpRequest, textStatus, errorThrown) {
        //                        if (errorThrown !== "") {
        //                            alert("Error en Post: " + errorThrown);
        //                        }
        //                    }
        //                });
        //            }
        //        });
        //    } else {
        //        swal.fire(
        //            "Error ",
        //            "Seleccione al menos un correo",
        //            "error"
        //        )
        //    }        */
        //}
    });

    $('#btnEnviarCorreoSinOP').click(function () {
        
        var txtAsunto = $('#MainContent_txtAsuntoSinOP');
        var txtMensaje = $('#MainContent_txtBodySinOP');
        var correo = new Array();
            $('.form-check').each(function () {
                let checked = $(this).find($('[name=check]'));
                let mailTemp = $(this).find($('[name=correo]'));

                if (checked.is(':checked')) {
                    correo.push(mailTemp.html());
                }
            });
        if (correo.length > 0 && txtAsunto.val() != "" && txtMensaje.val() != "") {
            var _listaMail = 'mailto:';
            for (var i = 0; i < correo.length; i++) {
                _listaMail += correo[i] + ";";
            }
            _listaMail = _listaMail.substring(0, _listaMail.length - 1);
            _listaMail += "?subject=" + txtAsunto.val() + "&body=" + txtMensaje.val();

            //Le implemento un cambio de href al boton oculto
            $("#anchorMail").attr("href", _listaMail);

            $("#anchorMail")[0].click();
        } else {

        }
            
       

    });


    //    $('#btnEnviarCorreoSinOP').click(function () {
    //        var txtAsunto = $('#MainContent_txtAsuntoSinOP');
    //        var txtMensaje = $('#MainContent_txtBodySinOP');
    //        var correo = [];
    //        var email = [];
    //        var aux = 0;

    //        if (txtAsunto.val() == '' || txtMensaje.val() == '') {
    //            swal.fire(
    //                "Error ",
    //                "Falta de datos",
    //                "error"
    //            )
    //        } else {

    //            $('.form-check').each(function () {
    //                let checked = $(this).find($('[name=check]'));
    //                let mailTemp = $(this).find($('[name=correo]'));
    //                let contactTemp = $(this).find($('[name=contacto]'));

    //                if (checked.is(':checked')) {
    //                    correo.push(mailTemp.html() + ';' + contactTemp.html());
    //                    aux++;
    //                }
    //            });
    //            if (aux > 0) {
    //                swal.fire({
    //                    showConfirmButton: false,
    //                    title: 'Enviando correo',
    //                    allowOutsideClick: false,
    //                    willOpen: () => {
    //                        Swal.showLoading();
    //                        $.ajax({
    //                            type: "POST",
    //                            url: "wsReportes.asmx/EnviarCorreos",
    //                            data: JSON.stringify({ Info: correo, asunto: txtAsunto.val(), cuerpo: txtMensaje.val() }),
    //                            dataType: "json",
    //                            async: false,
    //                            contentType: "application/json; charset=utf-8",
    //                            success: function (result) {
    //                                swal.fire({
    //                                    text: result.d,
    //                                    icon: 'success',
    //                                    timer: 3000
    //                                }).then((res) => {
    //                                    $('.form-check').each(function () {
    //                                        let checked = $(this).find($('[name=check]'));

    //                                        if (checked.is(':checked')) {
    //                                            checked.prop('checked', false);
    //                                        }
    //                                    });
    //                                })

    //                            },
    //                            failure: function (XMLHttpRequest, textStatus, errorThrown) {
    //                                if (errorThrown !== "") {
    //                                    alert("Error en Post: " + errorThrown);
    //                                }
    //                            }
    //                        });
    //                    }
    //                });
    //            } else {
    //                swal.fire(
    //                    "Error ",
    //                    "Seleccione al menos un correo",
    //                    "error"
    //                )  
    //            }
    //        }
    //    });


    });


    function ObtenerCorreosOP() {
        //GetCorreosOP
        var tabla = $('tCorreos tbody');

        GetAjax("wsReportes.asmx/GetCorreosOP", "", false, function (correo) {
            if (correo.length > 0) {
                tabla.empty;
                for (var i = 0; i < correo.length; i++) {
                    if (correo[i].OP == 'si') {
                        $('#tCorreos tbody').append(
                            "<tr>" +
                            "<td>" +
                            "<div class='row'>" +
                            "<div class='col'>" +
                            "<div class='form-check'>" +
                            "<input class='form-check-input' type='checkbox' value='' id='flexCheckDefault' name='check'>" +
                            "<label class='form-check-label' for='flexCheckDefault'>" +
                            "<span><label name='contacto'>" + correo[i].Nombre + "</label> (" + correo[i].Puesto + ")<br>" +
                            "<small><label name='correo'>" + correo[i].Correo + "</label></small><br>" +
                            "<small>" + correo[i].Compania + "</small>" +
                            "</span>" +
                            "</label>" +
                            "</div>" +
                            "</div>" +
                            "</td>" +
                            "</tr>"
                        );
                    } else {
                        $('#tCorreosSinOP tbody').append(
                            "<tr>" +
                            "<td>" +
                            "<div class='row'>" +
                            "<div class='col'>" +
                            "<div class='form-check'>" +
                            "<input class='form-check-input' type='checkbox' value='' id='flexCheckDefault' name='check'>" +
                            "<label class='form-check-label' for='flexCheckDefault'>" +
                            "<span><label name='contacto'>" + correo[i].Nombre + "</label> (" + correo[i].Puesto + ")<br>" +
                            "<small><label name='correo'>" + correo[i].Correo + "</label></small><br>" +
                            "<small>" + correo[i].Compania + "</small>" +
                            "</span>" +
                            "</label>" +
                            "</div>" +
                            "</div>" +
                            "</td>" +
                            "</tr>"
                        );
                    }
                }
            }
        });

    }
