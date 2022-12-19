NProgress.start();

$(document).ready(function () {
    NProgress.done();
    NProgress.remove();
});

$('#btnPasswordOlvidado').click(function () {
  
    var existe;
    Swal.fire({
        title: 'Ingrese un correo',
        input: 'text',
        inputAttributes: {
            autocapitalize: 'off'
        },
        showCancelButton: true,
        confirmButtonText: 'Buscar',
        showLoaderOnConfirm: true,
        preConfirm: (correo) => {
            $.ajax({
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
            })
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