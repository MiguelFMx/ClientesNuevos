<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InformacionCadenaSuministro.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.InformacionCadenaSuministro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



    <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        
        <div class="row">
            <div class="col">
                <div class="progress" hidden>
                    <div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Warning example" style="width: 100%" aria-valuenow="7" aria-valuemin="0" aria-valuemax="100">100%</div>
                </div>

                <div id="wizard" class="form_wizard wizard_horizontal" hidden>
                    <ul class="wizard_steps">
                        <li>
                            <a href="#" class="done">
                                <span class="step_no">1</span>
                                <span class="step_descr">Paso 1<br />
                                    <small>Información de la compañia</small>
                                </span>
                            </a>
                        </li>
                        <li class="remove">
                            <a href="#" class="done">
                                <span class="step_no">2</span>
                                <span class="step_descr">Paso 2<br />
                                    <small>Información de agentes aduanales</small>
                                </span>
                            </a>
                        </li>
                        <li class="remove">
                            <a href="#" class="done">
                                <span class="step_no">3</span>
                                <span class="step_descr">Paso 3<br />
                                    <small>Informacion de compañia filial</small>
                                </span>
                            </a>
                        </li>
                        <li class="remove">
                            <a href="#" class="done">
                                <span class="step_no">4</span>
                                <span class="step_descr">Paso 4<br />
                                    <small>Tipo de servicio requerido</small>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="selected">
                                <span class="step_no" id="paso">5</span>
                                <span class="step_descr" id="descripcion">Paso 5<br />
                                    <small>Acreditación en programa de seguridad</small>
                                </span>
                            </a>
                        </li>
                    </ul>
                </div>
                 <div id="wizard2" class="form_wizard wizard_horizontal" hidden>
                    <ul class="wizard_steps">
                        <li>
                            <a href="#" class="done">
                                <span class="step_no">1</span>
                                <span class="step_descr">Paso 1<br />
                                    <small>Información de la compañia</small>
                                </span>
                            </a>
                        </li>
                        
                        <li>
                            <a href="#" class="selected">
                                <span class="step_no" >2</span>
                                <span class="step_descr" >Paso 2<br />
                                    <small>Acreditación en programa de seguridad</small>
                                </span>
                            </a>
                        </li>
                    </ul>
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

    

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../JS/InfoComJS.js"></script>
    <script src="../JS/cadenaDeSuministrosJS.js"></script>

</asp:Content>
