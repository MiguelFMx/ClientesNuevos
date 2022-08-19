<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TipoServicioProductos.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.TipoServicioProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Servicio y producto</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <div class="row">
            <div class="col">
                <div class="progress" hidden>
                    <div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Warning example" style="width: 75%" aria-valuenow="7" aria-valuemin="0" aria-valuemax="100">75%</div>
                </div>
                <div id="wizard" class="form_wizard wizard_horizontal">
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
                            <a href="#" class="done">
                                <span class="step_no">2</span>
                                <span class="step_descr">Paso 2<br />
                                    <small>Información de agentes aduanales</small>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="done">
                                <span class="step_no">3</span>
                                <span class="step_descr">Paso 3<br />
                                    <small>Informacion de compañia filial</small>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="selected">
                                <span class="step_no">4</span>
                                <span class="step_descr">Paso 4<br />
                                    <small>Tipo de servicio requerido</small>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <span class="step_no">5</span>
                                <span class="step_descr">Paso 5<br />
                                    <small>Acreditación en programa de seguridad</small>
                                </span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <br />
        <div class="row" id="ServicioRqurido">
            <div class="row">
                <div class="col">
                    <div class="card border-primary">
                        <div class="card-header cabezal">
                            <h5>Tipo de servicio requerido</h5>
                        </div>
                        <div class="card-body">

                            <section id="Almacenaje">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="chkAlmacenaje">
                                            <label class="form-check-label" for="chkAlmacenaje">
                                                Almacenaje
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" id="opcionesAlmacenaje" style="padding-left: 40px; display: none;">
                                    <ul style="list-style: none">
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkADAlmacenaje">
                                                <label class="form-check-label" for="chkADAlmacenaje">
                                                    Almacen de deposito
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkIBAlmacenaje">
                                                <label class="form-check-label" for="chkIBAlmacenaje">
                                                    In-bonds
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkMPAlmacenaje">
                                                <label class="form-check-label" for="chkMPAlmacenaje">
                                                    Material peligroso
                                                </label>
                                            </div>
                                            <div>
                                                <ul style="list-style: none; display: none;" id="MPAlmacenaje">
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="" id="chkMPQuimicosAlmacenaje">
                                                            <label class="form-check-label" for="chkMPQuimicosExpo">
                                                                Quimicos
                                                            </label>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="" id="chkMPCarbonAlmacenaje">
                                                            <label class="form-check-label" for="chkMPCarbonExpo">
                                                                Carbon
                                                            </label>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkTransbordoAlmacenaje">
                                                <label class="form-check-label" for="chkTransbordoAlmacenaje">
                                                    Transbordo
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </section>

                            <section id="Exportacion">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="chkExportacion">
                                            <label class="form-check-label" for="chkExportacion">
                                                Exportación
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row row-cols-4" id="opcionesExpo" style="padding-left: 40px; display: none;">
                                    <ul style="list-style: none">
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkExpoCS">
                                                <label class="form-check-label" for="chkExpoCS">
                                                    Carga seca
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkFrrExpo">
                                                <label class="form-check-label" for="chkFrrExpo">
                                                    Ferrocarril
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkIBExpo">
                                                <label class="form-check-label" for="chkIBExpo">
                                                    In-bonds
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkMPExpo">
                                                <label class="form-check-label" for="chkMPExpo">
                                                    Material peligroso
                                                </label>
                                            </div>
                                            <div>
                                                <ul style="list-style: none; display: none;" id="MPExpo">
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="" id="chkMPQuimicosExpo">
                                                            <label class="form-check-label" for="chkMPQuimicosExpo">
                                                                Quimicos
                                                            </label>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="" id="chkMPCarbonExpo">
                                                            <label class="form-check-label" for="chkMPCarbonExpo">
                                                                Carbon
                                                            </label>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                            </section>

                            <section id="Importacion">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="chkImportacion">
                                            <label class="form-check-label" for="chkImportacion">
                                                Importación
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row row-cols-4" id="opcionesImpo" style="padding-left: 40px; display: none;">
                                    <ul style="list-style: none">
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkImpoCS">
                                                <label class="form-check-label" for="chkImpoCS">
                                                    Carga seca
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkFrrImpo">
                                                <label class="form-check-label" for="chkFrrImpo">
                                                    Ferrocarril
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkIBImpo">
                                                <label class="form-check-label" for="chkIBImpo">
                                                    In-bonds
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkMPImpo">
                                                <label class="form-check-label" for="chkMPImpo">
                                                    Material peligroso
                                                </label>
                                            </div>
                                            <div>
                                                <ul style="list-style: none; display: none" id="MPImpo">
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="" id="chkMPQuimicosImpo">
                                                            <label class="form-check-label" for="chkMPQuimicosImpo">
                                                                Quimicos
                                                            </label>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="" id="chkMPCarbonImpo">
                                                            <label class="form-check-label" for="chkMPCarbonImpo">
                                                                Carbon
                                                            </label>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>

                                    </ul>
                                </div>

                            </section>

                            <section id="RentaEquipo">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="chkRE">
                                            <label class="form-check-label" for="chkRE">
                                                Renta de equipo
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" id="opcionesRenta" style="padding-left: 40px; display: none;">
                                    <ul style="list-style: none">
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkRntaCajas">
                                                <label class="form-check-label" for="chkExpoCS">
                                                    Cajas
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkRentaSD">
                                                <label class="form-check-label" for="chkExpoCS">
                                                    Servicio dedicado
                                                </label>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </section>

                            <section id="Transportacion">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="chkTransportacion">
                                            <label class="form-check-label" for="chkTransportacion">
                                                Transportación
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row " id="opcionesTransport" style="padding-left: 40px; display: none;">
                                    <ul style="list-style: none">
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkTransportCS">
                                                <label class="form-check-label" for="chkTransportCS">
                                                    Carga seca
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkIBTransport">
                                                <label class="form-check-label" for="chkIBTransport">
                                                    In-bonds
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkMPTransport">
                                                <label class="form-check-label" for="chkMPTransport">
                                                    Material peligroso
                                                </label>
                                            </div>
                                            <div>
                                                <ul style="list-style: none; display: none;" id="MPTransport">
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="" id="chkMPQuimicosTransport">
                                                            <label class="form-check-label" for="chkMPQuimicosTransport">
                                                                Quimicos
                                                            </label>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="" id="chkMPCarbonTransport">
                                                            <label class="form-check-label" for="chkMPCarbonTransport">
                                                                Carbon
                                                            </label>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                            </section>

                            <section id="AgnciaAduanalMexicana">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="chkAgnciaAduanalMexicana">
                                            <label class="form-check-label" for="chkAgnciaAduanalMexicana">
                                                Agencia aduanal mexicana
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </section>

                            <section id="Logistica">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="chkLogistica">
                                            <label class="form-check-label" for="chkLogistica">
                                                Logistica
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <section id="Otro">
                                <div class="row">
                                    <div class="col">
                                        <input class="form-check-input" type="checkbox" value="" id="chkOtro">
                                        <label class="form-check-label" for="chkOtro">
                                            Otro
                                        </label>
                                    </div>

                                </div>
                                <div class="row " id="textoOtro" style="padding-left: 40px; display: none;">
                                    <label class="form-check-label" for="chkOtro">¿Cúal?</label>
                                    <div class="col-3">
                                        <input type="text" name="txtOtro" id="txtOtro" value="" class="form-control" />
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr />
        <br />
        <div class="row" id="InfoProd">
            <div class="col">
                <span id="error"></span>
                <fieldset>
                    <legend style="font-size: 20px;">Información de productos</legend>

                    <table class="table table-responsive table-hover" id="tProductos">
                        <thead class="cabezal">
                            <tr>
                                <th>#</th>
                                <th>Descripción de mercancia</th>
                                <th>Comentarios</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody id="tbodyProductos">
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </fieldset>
                <button type="button" id="btnProd">Productos</button>
            </div>
        </div>
    </div>
    <hr />
    <br />
    <div class="row">
        <div class="col-8">
            <button id="btnTest" type="button">test </button>

        </div>
        <div class="col" style="display: flex; justify-content: flex-end">
            <asp:LinkButton ID="btnAnterior" runat="server" CssClass="btn btn-warning" ForeColor="White" OnClick="btnAnterior_Click"><i class="bi bi-chevron-left"></i> Anterior</asp:LinkButton>
            &nbsp;&nbsp;
                <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-secondary"
                    data-bs-toggle="tooltip"
                    data-bs-placement="top"
                    title="Guardar y salir" OnClick="btnHome_Click"> <i class="bi bi-house-door"></i> </asp:LinkButton>&nbsp;&nbsp;
                <button id="btnContinuar" class="btn btn-primary" type="button">Siguiente <i class="bi bi-chevron-right"></i></button>
        </div>
    </div>
    

    <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
        $('#btnContinuar').click(function () {
            window.location.href = 'InformacionCadenaSuministro.aspx';
        });
    </script>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../JS/tiposervicioJS.js"></script>
</asp:Content>
