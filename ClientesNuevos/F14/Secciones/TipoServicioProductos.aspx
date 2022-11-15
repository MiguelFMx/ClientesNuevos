<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TipoServicioProductos.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.TipoServicioProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Servicio y producto</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <div class="row">
            <div id="wizard" class="form_wizard wizard_horizontal">
                <ul class="wizard_steps">
                    <li>
                        <asp:HyperLink ID="step1" runat="server" NavigateUrl="~/F14/Secciones/InformacionCompania.aspx" CssClass="done">
                            <asp:Label ID="lblstep1" runat="server" Text="1" CssClass="step_no"></asp:Label>
                            <asp:Label ID="lblDesc1" runat="server" Text="Paso 1"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub1" runat="server" Text="Información de la compañia" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step2" runat="server" CssClass="done" NavigateUrl="~/F14/Secciones/AgentesAduanales.aspx">
                            <asp:Label ID="lblstep2" runat="server" Text="2" CssClass="step_no"></asp:Label>
                            <asp:Label ID="lblDesc2" runat="server" Text="Paso 2"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub2" runat="server" Text="Información de agentes aduanales" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step3" runat="server" NavigateUrl="~/F14/Secciones/CompaniaFilial.aspx" CssClass="done">
                            <asp:Label ID="lblstep3" runat="server" Text="3" CssClass="step_no"></asp:Label>
                            <asp:Label ID="lblDesc3" runat="server" Text="Paso 3"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub3" runat="server" Text="Informacion de compañia filial" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step4" runat="server" NavigateUrl="#" CssClass="selected">
                            <asp:Label ID="lblstep4" runat="server" Text="4" CssClass="step_no"></asp:Label>

                            <asp:Label ID="lblDesc4" runat="server" Text="Paso 4"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub4" runat="server" Text="Tipo de servicio requerido" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step5" runat="server" NavigateUrl="~/F14/Secciones/InformacionCadenaSuministro.aspx">
                            <asp:Label ID="lblstep5" runat="server" Text="5" CssClass="step_no"></asp:Label>
                            <asp:Label ID="lblDesc5" runat="server" Text="Paso 5"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub5" runat="server" Text="Acreditación en programa de seguridad" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                </ul>
            </div>

        </div>

        <br />

        <div class="row">
            <div class="col">
                <span id="errorServicio"></span>
            </div>
        </div>
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
                                                <label class="form-check-label" for="chkRntaCajas">
                                                    Cajas
                                                </label>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkRentaSD">
                                                <label class="form-check-label" for="chkRentaSD">
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
                    <div class="card">
                        <div class="table-responsive">
                            <table class="table table-hover" id="tProductos">
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
                        </div>
                    </div>
                </fieldset>

            </div>
        </div>

        <hr />
        <br />
        <div class="row">

            <div class="col" style="display: flex; justify-content: flex-end">
                <asp:Panel runat="server" ID="pUser">
                    <asp:LinkButton ID="btnAnterior" runat="server" CssClass="btn btn-warning" ForeColor="White" OnClick="btnAnterior_Click"><i class="bi bi-chevron-left"></i> Anterior</asp:LinkButton>
                &nbsp;&nbsp;
                <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-secondary"
                    data-bs-toggle="tooltip"
                    data-bs-placement="top"
                    title="Guardar y salir" OnClick="btnHome_Click"> <i class="bi bi-house-door"></i> </asp:LinkButton>&nbsp;&nbsp;
                <button id="btnContinuar" class="btn btn-primary" type="button">Siguiente <i class="bi bi-chevron-right"></i></button>
            
                </asp:Panel>
                
            <asp:Panel ID="pAdmin" runat="server" Visible="false">
                    <asp:LinkButton ID="btnAdminBack" runat="server" CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnAdminBack_Click"
                    data-bs-toggle="tooltip"
                    data-bs-placement="top"
                    title="Atras"><i class="bi bi-arrow-left-short"></i></asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="btnAdminH" runat="server" CssClass="btn btn-secondary" OnClick="btnAdminH_Click"
                    data-bs-toggle="tooltip"
                    data-bs-placement="top"
                    title="Salir"> <i class="bi bi-house-door"></i> </asp:LinkButton>&nbsp;&nbsp;

                <asp:LinkButton ID="btnAdminSave" runat="server" OnClick="btnAdminSave_Click" CssClass="btn btn-success">Editar<i class="bi bi-chevron-right"></i> </asp:LinkButton>

                <asp:LinkButton ID="btnAdminNext" runat="server" CssClass="btn btn-secondary" OnClick="btnAdminNext_Click"
                    data-bs-toggle="tooltip"
                    data-bs-placement="top"
                    title="Atras"><i class="bi bi-arrow-right-short"></i></asp:LinkButton>&nbsp;&nbsp;
                </asp:Panel>
            
            </div>
        </div>
    </div>


    <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../JS/tiposervicioJS.js"></script>
</asp:Content>
