<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgentesAduanales.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.AgentesAduanales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Agentes aduanales</title>



    <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col">
                <asp:Panel ID="AlertResultado" runat="server" Visible="False">
                    <div class="alert alert-success" role="alert">
                        <div class="row">
                            <div class="col-10" style="display: flex; justify-content: center;">
                                <asp:Label ID="lblAlert" runat="server" Text=""></asp:Label>

                            </div>
                            <div class="col-2" style="display: flex; justify-content: flex-end;">
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <asp:Label ID="lblResultado" runat="server" Text=""></asp:Label>

                <div class="row">
                    <div id="wizard" class="form_wizard wizard_horizontal">
                        <ul class="wizard_steps">
                            <li>
                                <asp:HyperLink ID="step1" runat="server" CssClass="done" NavigateUrl="~/F14/Secciones/InformacionCompania.aspx">
                                    <asp:Label ID="lblstep1" runat="server" Text="1" CssClass="step_no"></asp:Label>
                                    <asp:Label ID="lblDesc1" runat="server" Text="Paso 1"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblsub1" runat="server" Text="Información de la compañia" Font-Size="Smaller"></asp:Label>
                                </asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="step2" runat="server" NavigateUrl="#" CssClass="selected">
                                    <asp:Label ID="lblstep2" runat="server" Text="2" CssClass="step_no"></asp:Label>
                                    <asp:Label ID="lblDesc2" runat="server" Text="Paso 2"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblsub2" runat="server" Text="Información de agentes aduanales" Font-Size="Smaller"></asp:Label>
                                </asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="step3" runat="server" NavigateUrl="~/F14/Secciones/CompaniaFilial.aspx">
                                    <asp:Label ID="lblstep3" runat="server" Text="3" CssClass="step_no"></asp:Label>
                                    <asp:Label ID="lblDesc3" runat="server" Text="Paso 3"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblsub3" runat="server" Text="Informacion de compañia filial" Font-Size="Smaller"></asp:Label>
                                </asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="step4" runat="server" NavigateUrl="~/F14/Secciones/TipoServicioProductos.aspx">
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
            </div>
        </div>
        <br />
        <!---------------------------------------- fieldset Agente aduanal; ---------------------------------------------------------------------------------->
        <fieldset>
            <legend style="font-size: 25px;" id="lblTitulo">Agente aduanal mexicano </legend>

            <div class="container">
                <div class="row">
                    <div class="col-md">
                        <div class="card h-100">
                            <h5 class="card-header cabezal">Información</h5>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm">
                                        <label for="txtNombreCompaniaAA" class="form-label">Nombre de la compañia:</label>
                                        <%--<input type="text" name="txtNombreCompaniaAA" value="" id="txtNombreCompaniaAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtNombreCompaniaAA" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-sm">
                                        <label for="txtNoPatAA" class="form-label">Numero de patente:</label>
                                        <%--<input type="text" name="txtNoPatAA" value="" id="txtNoPatAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtNoPatAA" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm">
                                        <label for="txtNombrComAA" class="form-label">Nombre comercial:</label>
                                        <%--<input type="text" name="txtNombrComAA" value="" id="txtNombrComAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtNombrComAA" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-sm">
                                        <label for="txtRFCTaxAA" id="lblRFCTaxAAA" class="form-label">RFC:</label>
                                        <br />
                                        <%--<input type="text" name="txtRFCTaxAA" value="" id="txtRFCTaxAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtRFCTaxAA" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="txtDirecAA" class="form-label">Dirección:</label>
                                        <%--<textarea name="txtDirecAA" id="txtDirecAA" class="form-control"></textarea>--%>
                                        <asp:TextBox ID="txtDirecAA" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">



                                    <div class="col-md">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <label for="txtEstadoAA" class="form-label">Estado:</label>
                                                <asp:DropDownList ID="ddEstadoAA" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddEstadoAA_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ddEstadoAA" EventName="selectedindexchanged" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                    <div class="col-md">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <label for="txtCiudadAA" class="form-label">Ciudad:</label>

                                                <asp:DropDownList ID="ddCiudadAA" runat="server" CssClass="form-select"></asp:DropDownList>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>

                                    <div class="col-md">
                                        <label for="txtCPAA" id="lblCPAA" class="form-label">Codgio Postal:</label>
                                        <%--<input type="text" name="txtCPAA" value="" id="txtCPAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtCPAA" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="card h-100">
                            <h5 class="cabezal card-header ">Contacto</h5>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm">
                                        <label for="txtNombrContAA" class="form-label">Nombre:</label>
                                        <%--<input type="text" name="txtNombrContAA" value="" id="txtNombrContAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtNombrContAA" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-sm">
                                        <label for="txtpuestoContAA" class="form-label">Puesto:</label>
                                        <%--<input type="text" name="txtpuestoContAA" value="" id="txtpuestoContAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtpuestoContAA" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="txtCorreoContAA" class="form-label">Correo:</label>
                                        <%--<input type="email" name="txtCorreoContAA" value="" id="txtCorreoContAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtCorreoContAA" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md">
                                        <label for="txtTelContAA" class="form-label">Telefono:</label>
                                        <%--<input type="tel" name="txtTelContAA" value="" id="txtTelContAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtTelContAA" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                                    </div>
                                    <div class="col-md">
                                        <label for="txtExtxContAA" class="form-label">Extension:</label>
                                        <%--<input type="text" name="txtExtxContAA" value="" id="txtExtxContAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtExtxContAA" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                    </div>
                                    <div class="col-md">
                                        <label for="txtCelContAA" class="form-label">Celular:</label>
                                        <%--<input type="tel" name="name" value="" id="txtCelContAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtCelContAA" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
        </fieldset>

        <!----------------------------------------------------------Agente aduanal americano--------------------------------------------------------------->
        <fieldset>
            <legend style="font-size: 25px;" id="">Agente aduanal americano </legend>

            <div class="container">
                <div class="row">
                    <div class="col-md">
                        <div class="card h-100">
                            <h5 class="card-header cabezal">Información</h5>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm">
                                        <label for="txtNombreCompaniaAAm" class="form-label">Nombre de la compañia:</label>
                                        <%--<input type="text" name="txtNombreCompaniaAA" value="" id="txtNombreCompaniaAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtNombreCompaniaAAm" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-sm">
                                        <label for="txtNoPatAAm" class="form-label">Numero de patente:</label>
                                        <%--<input type="text" name="txtNoPatAA" value="" id="txtNoPatAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtNoPatAAm" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md">
                                        <label for="txtNombrComAAm" class="form-label">Nombre comercial:</label>
                                        <%--<input type="text" name="txtNombrComAA" value="" id="txtNombrComAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtNombrComAAm" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-md">
                                        <label for="txtTaxAAm" id="lblRFCTaxAAAm" class="form-label">Tax ID:</label>
                                        <br />
                                        <%--<input type="text" name="txtRFCTaxAA" value="" id="txtRFCTaxAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtRFCTaxAAm" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="txtDirecAAm" class="form-label">Dirección:</label>
                                        <%--<textarea name="txtDirecAA" id="txtDirecAAm" class="form-control"></textarea>--%>
                                        <asp:TextBox ID="txtDirecAAm" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md">
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                            <ContentTemplate>
                                                <label for="cbEstadoAAm" class="form-label">Estado:</label>
                                                <asp:DropDownList ID="ddEstadoAAm" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddEstadoAAm_SelectedIndexChanged"></asp:DropDownList>

                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="ddEstadoAAm" EventName="selectedindexchanged" />
                                            </Triggers>
                                        </asp:UpdatePanel>

                                    </div>
                                    <div class="col-md">
                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                            <ContentTemplate>
                                                <label for="cbCiudadAAm" class="form-label">Ciudad:</label>

                                                <asp:DropDownList ID="ddCiudadAAm" runat="server" CssClass="form-select"></asp:DropDownList>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                    <div class="col-md">
                                        <label for="txtCPAAm" id="lblCPAAm" class="form-label">Zip code:</label>
                                        <%--<input type="text" name="txZCPAA" value="" id="txtCPAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtCPAAm" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="card  h-100">
                            <h5 class="cabezal card-header ">Contacto</h5>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm">
                                        <label for="txtNombrContAAm" class="form-label">Nombre:</label>
                                        <%--<input type="text" name="txtNombrContAA" value="" id="txtNombrContAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtNombrContAAm" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-sm">
                                        <label for="txtpuestoContAAm" class="form-label">Puesto:</label>
                                        <%--<input type="text" name="txtpuestoContAAm" value="" id="txtpuestoContAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtpuestoContAAm" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="txtCorreoContAAm" class="form-label">Correo:</label>
                                        <%--<input type="email" name="txtCorreoContAAm" value="" id="txtCorreoContAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtCorreoContAAm" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md">
                                        <label for="txtTelContAAm" class="form-label">Telefono:</label>
                                        <%--<input type="tel" name="txtTelContAAm" value="" id="txtTelContAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtTelContAAm" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                                    </div>
                                    <div class="col-md">
                                        <label for="txtExtContAAm" class="form-label">Extension:</label>
                                        <%--<input type="text" name="txtExtContAAm" value="" id="txtExtxContAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtExtContAAm" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                    </div>
                                    <div class="col-md">
                                        <label for="txtCelContAAm" class="form-label">Celular:</label>
                                        <%--<input type="tel" name="name" value="" id="txtCelContAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtCelContAAm" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>

        <hr />
        <div class="row">
            <div class="col" style="display: flex; justify-content: flex-end;">

                <asp:Panel ID="pUser" runat="server">
                    <asp:LinkButton ID="btnAnterior" runat="server" CssClass="btn btn-warning" ForeColor="White" OnClick="btnAnterior_Click"><i class="bi bi-chevron-left"></i> Anterior</asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-secondary"
                    data-bs-toggle="tooltip"
                    data-bs-placement="top"
                    title="Guardar y salir" OnClick="btnHome_Click"> <i class="bi bi-house-door"></i> </asp:LinkButton>&nbsp;&nbsp;

                <asp:LinkButton ID="btnSiguiente" runat="server" CssClass="btn btn-primary" OnClick="btnSiguiente_Click">Siguiente<i class="bi bi-chevron-right"></i></asp:LinkButton>
                    <!-- <button id="btnContinuar" class="btn btn-success" type="button">Siguiente<i class="bi bi-chevron-right"></i></button> -->
                    <%--<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Continuar</button>--%>
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

                    <asp:LinkButton ID="btnAdminSave" runat="server" OnClick="btnAdminSave_Click"
                        CssClass="btn btn-success">Editar<i class="bi bi-chevron-right"></i> </asp:LinkButton>

                    <asp:LinkButton ID="btnAdminSaltar" runat="server" OnClick="btnAdminSaltar_Click"
                        CssClass="btn btn-secondary" Visible="false" CausesValidation="false">saltar</asp:LinkButton>

                    <asp:LinkButton ID="btnAdminNext" runat="server" CssClass="btn btn-secondary" OnClick="btnAdminNext_Click"
                        data-bs-toggle="tooltip"
                        data-bs-placement="top"
                        title="siguiente"><i class="bi bi-arrow-right-short"></i></asp:LinkButton>
                </asp:Panel>
            </div>
        </div>


        <!-- Modal-->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>
                            ¿Desea continuar con el registro?
                            <br />
                            Si su respuesta es no, podrá continuar cuando lo desee.
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="btnNo">No</button>
                        <asp:Button ID="btnTest" runat="server" Text="Si" CssClass="btn btn-primary" OnClick="btnTest_Click" UseSubmitBehavior="False" />

                    </div>
                </div>
            </div>
        </div>

    </div>


    <script type="text/javascript">
        $(document).ready(function () {
            fillComboEstado(142, $('#cbEstadoAA'));
            fillComboEstado(231, $('#cbEstadoAAm'));

            $("#cbEstadoAAm").change(function () {
                var EstadoSeleccionado = $('#cbEstadoAAm option:selected').val();

                fillComboCiudad(EstadoSeleccionado, $('#cbCiudadAA'));
            });

            $("#cbEstadoAA").change(function () {
                var EstadoSeleccionado = $('#cbEstadoAA option:selected').val();

                fillComboCiudad(EstadoSeleccionado, $('#cbCiudadAAm'));
            });

            $('#btnContinuar').click(function () {
                window.location.href = 'CompaniaFilial.aspx';
            });

            $('#btnNo').click(function () {
                window.location.href = "../../usuario/Index.aspx";
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/bootstrap.bundle.min.js"></script>
    <script src="../../Scripts/umd/popper.min.js"></script>
    <script src="../JS/InfoComJS.js"></script>
</asp:Content>
