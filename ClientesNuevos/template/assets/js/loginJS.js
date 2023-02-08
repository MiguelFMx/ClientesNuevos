NProgress.start();

$(document).ready(function () {
    NProgress.done();
    NProgress.remove();
});

$('#btnPasswordOlvidado1').click(function () {
  
    var existe;
    Swal.fire({
        text: 'Ingrese su RFC/W9 con el que esta registrado',
        input: 'text',
        inputAttributes: {
            autocapitalize: 'off'
        },
        showCancelButton: true,
        confirmButtonText: 'okay',
        showLoaderOnConfirm: true,
        preConfirm: (correo) => {      
            if (correo != '') {

                existe = 'mailto:certificaciones@hungaros.com?cc=sistemas.aux@hungaros.com&subject=Olvide%20mi%20contrasena&body=Solicito%20la%20recuperacion%20de%20mi%20contrasena%0Ami%20RFC%20es:%0A' + correo;
                $('#btnPasswordOlvidado').attr('href', existe);
                $('#btnPasswordOlvidado')[0].click();
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: 'Ingrese el RFC/W9 con el que esta registrado'
                })
            }
          /*  $.ajax({
                url: "wsLogin.asmx/GetMail",
                type: "POST",
                data:  "{'email':'" + correo + "'}" ,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (result) {
                    if (result.d == "1") {
                        $.ajax({
                            url: "wsLogin.asmx/EnviarCorreo",
                            type: "POST",
                            data: "{'email':'" + correo + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            processData: false,
                            success: function (result) {
                                Swal.fire('Se ha enviado un correo con su contraseña')
                            },
                            Error: function (err) {
                                console.log(err.d);
                            }
                        })
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'El correo ' + correo + ' no se encuentra registrado'
                        })
                    }
                },
                Error: function (err) {
                    console.log(err);
                }
            }) */         
        },
        allowOutsideClick: () => !Swal.isLoading()
    }).then((result) => {
        if (result.isConfirmed) {
            if (existe == "1") {
                $.ajax({
                    url: "../../wsLogin.asmx/EnviarCorreo",
                    type: "POST",
                    data: "{'email':'" + correo + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    processData: false,
                    success: function (result) {
                        Swal.fire(result)
                    },
                    Error: function (err) {
                        console.log(err);
                    }
                })
            } 
        }
    });
    


});