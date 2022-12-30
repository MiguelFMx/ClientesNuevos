
NProgress.start();

$(document).ready(function () {
    cookies();

    GetData();

    var tab = $('#tClientes').DataTable();

    NProgress.done();
    NProgress.remove();
});



function GetData() {

    GetAjax("wsAdminIndex.asmx/Obtener_registros", "", false, function (result) {
        let table = $('#tClientes tbody');
        let tipo = "";
        let estado = "";
        table.empty();
        for (var i = 0; i < result.length; i++) {
            if (result[i].Tipo_persona == '0') {
                tipo = "moral";
            } else if (result[i].Tipo_persona == '1') {
                tipo = "fisica";
            } else {
                tipo = "extranjero";
            }

            if (result[i].Estatus == 'activo') {
                estado = '<span class="etiqueta">Activo</span>';
            } else {
                estado = '<span class="etiqueta peligro" style="padding: 0 1.7em;">Inactivo</span>';
            }
            table.append(
                "<tr>" +
                "<td>" + result[i].RFC + "</td>" +
               /* "<td>" + tipo + "</td>" +*/
                "<td><a>" + result[i].Nombre_comp + "</a><br/><small  style='color:#73879C;'>" + result[i].Nombre_comercial + "</small></td>" +
                "<td>" + result[i].Fecha_registro.substring(0, 10) + "</td>" +
                "<td class='project_progress'>" + 
                "<div class='progress progress_sm'>"+
                "<div class='progress-bar bg-warning' role='progressbar' aria-label='progreso' style='width: " + result[i].Progreso + "%;' aria-valuenow='" + result[i].Progreso+"' aria-valuemin='0' aria-valuemax='100'></div>"+
                "</div>" +
                "<small>" + result[i].Progreso + "% completo</small>" +
                "</td>" +
                "<td>"+estado+"</td>"+
                //"<td><button name='view' class='btn btn-primary'>ver</button></td>" +
                "<td><a href='carpetilla/carpetilla.aspx?id=" + result[i].RFC+"&type="+tipo+"' class='btn btn-secondary btn-sm'>View</a></td>" +

                "</tr>"
            );
        }
    });

    
}

function dtTabla() {
    let tabla = $('#tClientes');

    let table = new DataTable(tabla, {
        language: { url: '../Scripts/DataTables/es-ES.json' }
    });
}


$('#btn').click(function () {
    GetData();
});



function cookies() {
    var lista = document.cookie.split(";");
    var busca;
    var micookie = '';
    for (i in lista) {
        busca = lista[i].search("ignore");
        if (busca > -1) { micookie = lista[i] }
    }
    if (micookie=='') {
        CambioDePass();
    }


}

function CambioDePass() {
    GetAjax("wsAdminIndex.asmx/CambioPass", "", false, function (res) {
        if (res == "0") {
            Swal.fire({
                text: "Es necesario que cambie su contraseña",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Cambiar contraseña',
                cancelButtonText: 'Ignorar'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = '../usuario/user_config.aspx';
                } else {
                    document.cookie = "ignore=si";
                }
            })
        }
    });
}