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
                            <asp:Label ID="lblDesc1" runat="server" Text="<%$Resources:AgentesAduanales, lblPaso1 %>"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub1" runat="server" Text="<%$Resources:AgentesAduanales, lblDesc1 %>" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step2" runat="server" CssClass="done" NavigateUrl="~/F14/Secciones/AgentesAduanales.aspx">
                            <asp:Label ID="lblstep2" runat="server" Text="2" CssClass="step_no"></asp:Label>
                            <asp:Label ID="lblDesc2" runat="server" Text="<%$Resources:AgentesAduanales, lblPaso2 %>"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub2" runat="server" Text="<%$Resources:AgentesAduanales, lblDesc2 %>" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step3" runat="server" NavigateUrl="~/F14/Secciones/CompaniaFilial.aspx" CssClass="done">
                            <asp:Label ID="lblstep3" runat="server" Text="3" CssClass="step_no"></asp:Label>
                            <asp:Label ID="lblDesc3" runat="server" Text="<%$Resources:AgentesAduanales, lblPaso3 %>"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub3" runat="server" Text="<%$Resources:AgentesAduanales, lblDesc3 %>" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step4" runat="server" NavigateUrl="#" CssClass="selected">
                            <asp:Label ID="lblstep4" runat="server" Text="4" CssClass="step_no"></asp:Label>

                            <asp:Label ID="lblDesc4" runat="server" Text="<%$Resources:AgentesAduanales, lblPaso4 %>"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub4" runat="server" Text="<%$Resources:AgentesAduanales, lblDesc4 %>" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step5" runat="server" NavigateUrl="~/F14/Secciones/InformacionCadenaSuministro.aspx">
                            <asp:Label ID="lblstep5" runat="server" Text="5" CssClass="step_no"></asp:Label>
                            <asp:Label ID="lblDesc5" runat="server" Text="<%$Resources:AgentesAduanales, lblPaso5 %>"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub5" runat="server" Text="<%$Resources:AgentesAduanales, lblDesc5 %>" Font-Size="Smaller"></asp:Label>
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
                    <div class="card rounded-0">
                        <div class="card-header cabezal rounded-0">
                            <h5>
                                <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:AgentesAduanales, lblDesc4 %>"></asp:Literal></h5>
                        </div>
                        <div class="card-body">

                            <section id="Almacenaje">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="chkAlmacenaje">
                                          
                                            <asp:Label ID="lblAlmacenaje" runat="server" CssClass="form-check-label"  Text="<%$Resources:Servicios, lblAlmacenaje %>"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" id="opcionesAlmacenaje" style="padding-left: 40px; display: none;">
                                    <ul style="list-style: none">
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkADAlmacenaje">
                                                
                                                <asp:Label ID="lblAlmacenDeposito" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblAlmacenDeposito %>"></asp:Label>
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
                                               
                                                <asp:Label ID="lblMpA" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblMaterialPeligroso %>"></asp:Label>

                                            </div>
                                            <div>
                                                <ul style="list-style: none; display: none;" id="MPAlmacenaje">
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="" id="chkMPQuimicosAlmacenaje">
                                                                <asp:Label ID="lblQuimicosA" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblQuimicos %>"></asp:Label>
                                                            
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="" id="chkMPCarbonAlmacenaje">
                                                                <asp:Label ID="lblCarbon" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblCarbon %>"></asp:Label>
                                                            
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkTransbordoAlmacenaje">
                                               
                                                <asp:Label ID="lblTransbordoA" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblTransbordo %>"></asp:Label>

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
                                              <asp:Label ID="lblExportacion" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblExportacion %>"></asp:Label>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="row row-cols-4" id="opcionesExpo" style="padding-left: 40px; display: none;">
                                    <ul style="list-style: none">
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkExpoCS">
                                                   <asp:Label ID="lblCSE" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblCargaSeca %>"></asp:Label>
                                                
                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkFrrExpo">
                                                 <asp:Label ID="lblFerroE" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblFerrocarril %>"></asp:Label>

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
                                                 <asp:Label ID="lblMPe" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblMaterialPeligroso %>"></asp:Label>

                                            </div>
                                            <div>
                                                <ul style="list-style: none; display: none;" id="MPExpo">
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="" id="chkMPQuimicosExpo">
                                                            <asp:Label ID="lblQuimicosE" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblQuimicos %>"></asp:Label>
                                                       </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="" id="chkMPCarbonExpo">
                                                                <asp:Label ID="lblCarbonE" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblCarbon %>"></asp:Label>
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
                                            <asp:Label ID="lblImpo" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblImportacion %>"></asp:Label>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="row row-cols-4" id="opcionesImpo" style="padding-left: 40px; display: none;">
                                    <ul style="list-style: none">
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkImpoCS">
                                                 <asp:Label ID="lblCSI" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblCargaSeca %>"></asp:Label>

                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkFrrImpo">
                                                 <asp:Label ID="lblFerroI" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblFerrocarril %>"></asp:Label>

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
                                                   <asp:Label ID="lblMPI" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblMaterialPeligroso %>"></asp:Label>
                                                
                                            </div>
                                            <div>
                                                <ul style="list-style: none; display: none" id="MPImpo">
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="" id="chkMPQuimicosImpo">
                                                                <asp:Label ID="lblQuimicosI" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblQuimicos %>"></asp:Label>
                                                            
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="" id="chkMPCarbonImpo">
                                                            <asp:Label ID="lblCarbonI" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblCarbon %>"></asp:Label>

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
                                            <asp:Label ID="lblRE" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblRentaEquipo %>"></asp:Label>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="row" id="opcionesRenta" style="padding-left: 40px; display: none;">
                                    <ul style="list-style: none">
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkRntaCajas">
                                                <asp:Label ID="lblCajas" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblCajas %>"></asp:Label>
                                                
                                            </div>
                                        </li>
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkRentaSD">
                                                 <asp:Label ID="lblSD" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblServicioDedicado %>"></asp:Label>
                                                
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
                                               <asp:Label ID="lblTransport" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblTransportacion %>"></asp:Label>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="row " id="opcionesTransport" style="padding-left: 40px; display: none;">
                                    <ul style="list-style: none">
                                        <li>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="chkTransportCS">
                                                 <asp:Label ID="lblCSTransport" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblCargaSeca %>"></asp:Label>
                                               
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
                                                <asp:Label ID="lblMPTransport" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblMaterialPeligroso %>"></asp:Label>

                                            </div>
                                            <div>
                                                <ul style="list-style: none; display: none;" id="MPTransport">
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="" id="chkMPQuimicosTransport">
                                                             <asp:Label ID="lblQuimicosTransport" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblQuimicos %>"></asp:Label>

                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="" id="chkMPCarbonTransport">
                                                                <asp:Label ID="lblCarbonTransport" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblCarbon %>"></asp:Label>
                                                            
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
                                             <asp:Label ID="lblAAMex" CssClass="form-check-label" runat="server" Text="<%$Resources:AgentesAduanales, lblAgenteMexicano %>"></asp:Label>
                                            
                                        </div>
                                    </div>
                                </div>
                            </section>

                            <section id="Logistica">
                                <div class="row">
                                    <div class="col">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="chkLogistica">
                                             <asp:Label ID="lblLogistica" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblLogistica %>"></asp:Label>
                                            
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <section id="Otro">
                                <div class="row">
                                    <div class="col">
                                        <input class="form-check-input" type="checkbox" value="" id="chkOtro">
                                          <asp:Label ID="lblOtro" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblOtro %>"></asp:Label>

                                    </div>

                                </div>
                                <div class="row " id="textoOtro" style="padding-left: 40px; display: none;">
                                 <asp:Label ID="lblPregunta" CssClass="form-check-label" runat="server" Text="<%$Resources:Servicios, lblPregunta %>"></asp:Label>

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
                    <legend style="font-size: 20px;">
                        <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Servicios,lblInfoProd %>"></asp:Literal></legend>
                    <div class="card rounded-0">
                        <div class="table-responsive">
                            <table class="table table-hover" id="tProductos">
                                <thead class="cabezal">
                                    <tr>
                                        <th>#</th>
                                        <th>
                                            <asp:Literal ID="Literal3" Text="<%$Resources:Servicios, lblDescripcion %>" runat="server"></asp:Literal></th>
                                        <th>
                                            <asp:Literal ID="Literal4" runat="server" Text="<%$Resources:Servicios, lblComentarios %>"></asp:Literal></th>
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
                    <asp:LinkButton ID="btnAnterior" runat="server" CssClass="btn btn-warning" ForeColor="White" OnClick="btnAnterior_Click"><i class="bi bi-chevron-left"></i> <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:InformacionCompania,lblBtnAtras %>"></asp:Literal></asp:LinkButton>
                &nbsp;&nbsp;
                <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-secondary"
                    data-bs-toggle="tooltip"
                    data-bs-placement="top"
                    title="Guardar y salir" OnClick="btnHome_Click"> <i class="bi bi-house-door"></i> </asp:LinkButton>&nbsp;&nbsp;
                <button id="btnContinuar" class="btn btn-primary" type="button"><asp:Literal ID="Literal7" runat="server" Text="<%$Resources:InformacionCompania, lblBtnContinuar %>"></asp:Literal> <i class="bi bi-chevron-right"></i></button>
            
                </asp:Panel>
                
            <asp:Panel ID="pAdmin" runat="server" Visible="false">
                    <asp:LinkButton ID="btnAdminBack" runat="server" CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnAdminBack_Click"
                    data-bs-toggle="tooltip"
                    data-bs-placement="top"
                    title="Atras"><i class="bi bi-arrow-left-short"></i></asp:LinkButton>
                <asp:LinkButton ID="btnAdminH" runat="server" CssClass="btn btn-primary" OnClick="btnAdminH_Click"
                    data-bs-toggle="tooltip"
                    data-bs-placement="top"
                    title="Salir"> <i class="bi bi-house-door"></i> </asp:LinkButton>

                <input id="btnAdminGuardar" runat="server" type="button" value="Editar" class="btn btn-success"/>

                <asp:LinkButton ID="btnAdminSaltar" runat="server" CssClass="btn btn-secondary" OnClick="btnAdminSaltar_Click" Visible="false">saltar</asp:LinkButton>

                <asp:LinkButton ID="btnAdminNext" runat="server" CssClass="btn btn-secondary" OnClick="btnAdminNext_Click"
                    data-bs-toggle="tooltip"
                    data-bs-placement="top"
                    title="siguiente"><i class="bi bi-arrow-right-short"></i></asp:LinkButton>
                </asp:Panel>
            
            </div>
        </div>
    </div>


    <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../JS/tiposervicioJS.js"></script>
</asp:Content>
