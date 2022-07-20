<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InformacionCadenaSuministro.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.InformacionCadenaSuministro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

       <link href="../../Scripts/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../../template/assets/css/style.css" rel="stylesheet" />

    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>

    <script src="../../Scripts/JS/ajax.js"></script>
    <script src="../JS/InfoComJS.js"></script>

    <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        
        <div class="row">
            <div class="col">
                <div class="progress">
                    <div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Warning example" style="width: 100%" aria-valuenow="7" aria-valuemin="0" aria-valuemax="100">100%</div>
                </div>
            </div>
        </div>
        <br />
        <!-- fieldset Información de programa de cadena de suministro-->
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-header cabezal">
                        <span>Información de cadena de suministro</span>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-4">
                                <label for="cbCTPATSatuts">C-TPAT status:</label>
                                <select name="cbCTPATSatuts" id="cbCTPATSatuts" class="form-select" style="font-size: 14px;">
                                    <option value="0">Ninguno</option>
                                    <option value="1">Certificado no validado</option>
                                    <option value="2">Certificado validado</option>
                                </select>
                            </div>

                        </div>

                        <div class="row" id="divFecha" style="display: none;">
                            <div class="col-4">
                                <label for="txtCTPATSVI">Numero SVI:</label>
                                <input type="text" name="txtCTPATSVI" value="" id="txtCTPATSVI" class="form-control" />
                            </div>
                            <div class="col-4">
                                <label for="dtFechaVal">Fecha de validacion:</label>
                                <input type="date" name="" value="" id="dtFechaVal" class="form-control" />
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col">
                                <label>
                                    ¿Esta Certificado en C-TPAT o equivalente/WCO acreditado en programa de seguridad de comercio exterior?
                                </label>
                                <br />
                                <div class="form-check form-check-inline">
                                    <input type="radio" name="radCertificado" value="si" id="radCertificadoSi" class="form-check-input" />
                                    <label for="radCertificadoSi">Si</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="radio" name="radCertificado" value="no" id="radCertificadoNo" class="form-check-input" />
                                    <label for="radCertificadoNo">No</label>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row" id="divCertificado" style="display: none;">
                            <div class="row">
                                <div class="col">

                                    <table class="table table-hover" id="tProgramaDeSeguridad">
                                        <thead class="cabezal">
                                            <tr>
                                                <th>Descripción</th>
                                                <th>Código de certificación</th>
                                                <th>¿Puede proporcionar el certificado?</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                        <tfoot></tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-10"></div>
            <div class="col" >
                <button id="btnContinuar" type="button" class="btn btn-success">Continuar <i class="bi bi-chevron-double-right"></i></button>
            </div>
        </div>

    </div>


    <script type="text/javascript">

        $(document).ready(function () {
            $("#cbCTPATSatuts").change(function () {
                var status = $('#cbCTPATSatuts option:selected').val();

                switch (status) {
                    case '0':
                        $('#divFecha').hide('fast');
                        break;
                    case '1':
                        $('#divFecha').show('fast');
                        break;
                    case '2':
                        $('#divFecha').show('fast');
                        break;
                }

            });
        });
        $('input[type=radio][name=radCertificado]').change(function () {
            if (this.value == 'si') {
                $('#divCertificado').show('fast');
            }
            else if (this.value == 'no' ) {
                $('#divCertificado').hide('fast');

            }
        });

        

        $('input[type=radio][name=radPropCertificado]').change(function () {
            if (this.value == 'si') {
                $('#divDropZone').show('fast');
            }
            else if (this.value == 'no') {
                $('#divDropZone').hide('fast');

            }
        });
    </script>

    
    <script src="../JS/cadenaDeSuministrosJS.js"></script>

</asp:Content>
