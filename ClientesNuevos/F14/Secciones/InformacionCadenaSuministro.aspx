<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InformacionCadenaSuministro.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.InformacionCadenaSuministro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

       <link href="../../Scripts/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../../template/assets/css/style.css" rel="stylesheet" />

    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
    <script src="../JS/InfoComJS.js"></script>
    <script src="../../Scripts/JS/ajax.js"></script>
    <script src="../JsClienteNuevo.js"></script>

    <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <!-- fieldset Información de programa de cadena de suministro-->
        <fieldset >
            <legend style="font-size:25px;">Información de cadena de suministro</legend>
            <div class="container">
                <div class="row">
                    <div class="col-4">
                        <label for="cbCTPATSatuts">C-TPAT status:</label>
                        <select name="cbCTPATSatuts" id="cbCTPATSatuts" class="form-select" style="font-size:14px;">
                            <option value="0">Ninguno</option>
                            <option value="1">Certificado no validado</option>
                            <option value="2">Certificado validado</option>
                        </select>
                    </div>
                    
                </div>

                <div class="row" id="divFecha" style="display:none;">
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
                        </label><br />
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
                <div class="row" id="divCertificado" style="display:none;">
                    <div class="col">
                        <label for="txtDescripcion">Descripción:</label>
                        <textarea id="txtDescripcion" name="txtDescripcion" class="form-control"></textarea>
                    </div>
                    <div class="col">
                        <label for="txtCodCrtificado">Codigo de certificacion:</label>
                        <input type="text" name="txtCodCrtificado" value="" id="txtCodCrtificado" class="form-control" />
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col">
                        <label>¿Puede proporcionar copia del certificado?</label>
                        <br />
                        <div class="form-check form-check-inline">
                            <input type="radio" name="radPropCertificado" value="si" id="radPropCertificadoSi" class="form-check-input" />
                            <label for="radPropCertificadoSi">Si</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input type="radio" name="radPropCertificado" value="no" id="radPropCertificadoNo" class="form-check-input" />
                            <label for="radPropCertificadoNo">No</label>
                        </div>
                    </div>
                </div>
                <div class="row" id="divDropZone" style="display:none;">
                    <div class="col">
                        <div id="dropzone">
                            <input type="file" id="btnFile" accept=".pdf" class="form-group" />
                        </div>
                    </div>
                </div>


            </div>

        </fieldset>
        <hr />
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

</asp:Content>
