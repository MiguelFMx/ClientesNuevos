<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompaniaFilial.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.CompaniaFilial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <%-- <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>--%>
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
                            <asp:HyperLink ID="step3" runat="server" NavigateUrl="#" CssClass="selected">
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

        <br />
        <div class="card border-primary">
            <div class="card-header cabezal">
                <div class="row">
                    <div class="col-auto">
                        <h4>Información de compañia filial
                    <span style="font-size: 15px;">
                        <i class="bi bi-question-circle"
                            data-bs-toggle="tooltip"
                            data-bs-placement="bottom"
                            title="Compañia filial es considerada cualquier empresa subcontratada para realizar cualquier servicio de transporte,
                            almacenaje o resguardo de unidades de transporte internacional. Si no cuenta con una compañia filial de clic en continuar"></i>
                    </span>
                        </h4>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="row">
                        <div class="col-sm">
                            <label for="txtNombreCompaniaFilial" class="form-label">Nombre de la compañia:</label>
                            <!--<input type="text" name="name" value="" id="txtNombreCompaniaFilial" class="form-control " />-->
                            <asp:TextBox ID="txtNombreCompaniaFilial" runat="server" CssClass="form-control"></asp:TextBox>
                            <span id="NombreCompaniaFilial" style="color: red;"></span>
                        </div>
                        <div class="col-sm">
                            <label for="txtNombrComFilial" class="form-label">Nombre comercial:</label>
                            <%--<input type="text" name="name" value="" id="txtNombrComFilial" class="form-control" />--%>
                            <asp:TextBox ID="txtNombrComFilial" runat="server" CssClass="form-control"></asp:TextBox>
                            <span id="NombrComFilial" style="color: red;"></span>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-9">
                            <label for="txtDirecFiscalComFilial" class="form-label">Dirección fiscal:</label>
                            <%--<input type="text" name="name" value="" id="txtDirecFiscalComFilial" class="form-control" />--%>
                            <asp:TextBox ID="txtDirecFiscalComFilial" runat="server" CssClass="form-control"></asp:TextBox>
                            <span id="DirecFiscalComFilial" style="color: red;"></span>

                        </div>

                        <div class="col-md-3">

                            <label for="txtRfcComFilial" class="form-label">RFC:</label>
                            <%--<input type="text" name="name" value="" id="txtRfcComFilial" class="form-control " />--%>
                            <asp:TextBox ID="txtRfcComFilial" runat="server" CssClass="form-control"></asp:TextBox>
                            <span id="RfcComFilial" style="color: red;"></span>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <label for="cbPaisComFilial" class="form-label">Pais:</label>
                            <%--<select id="cbPaisComFilial" class="form-select">
                                <option value="...">...</option>
                            </select>--%>
                            <asp:DropDownList ID="ddPaisComFilial" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddPaisComFilial_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>

                        </div>
                        <div class="col-md-3">
                            <label for="cboEstadoComFilial" class="form-label">Estado:</label>
                            <%--<select id="cboEstadoComFilial" class="form-select">
                                <option value="value">...</option>
                            </select>--%>
                            <asp:DropDownList ID="ddEstadoComFilial" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddEstadoComFilial_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="col-md-3">
                            <label for="cbCiudadComFilial" class="form-label">Ciudad:</label>
                            <%--<select id="cbCiudadComFilial" class="form-select">
                                <option value="value">...</option>
                            </select>--%>
                            <asp:DropDownList ID="ddCiudadComFilial" runat="server" CssClass="form-select"></asp:DropDownList>
                        </div>
                        <div class="col-md-3">
                            <label for="txtCPComFIlial" class="form-label">CP:</label>
                            <%--<input type="text" name="name" value="" id="txtCPComFIlial" class="form-control" />--%>
                            <asp:TextBox ID="txtCPComFIlial" runat="server" CssClass="form-control"></asp:TextBox>
                            <span id="CPComFIlial" style="color: red;"></span>

                        </div>
                    </div>

                </div>
            </div>
            <div class="card-header cabezal">
                <div class="row">
                    <div class="col">
                        <h5>Contacto</h5>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="txtNombrContFilial" class="form-label">Nombre:</label>
                            <%--<input type="text" name="name" value="" id="txtNombrContFilial" class="form-control" />--%>
                            <asp:TextBox ID="txtNombrContFilial" runat="server" CssClass="form-control"></asp:TextBox>
                            <span id="NombrContFilial" style="color: red;"></span>

                        </div>

                        <div class="col-md-3">
                            <label for="txtPuestoContFilial" class="form-label">Puesto:</label>
                            <%--<input type="text" name="name" value="" id="txtPuestoContFilial" class="form-control" />--%>
                            <asp:TextBox ID="txtPuestoContFilial" runat="server" CssClass="form-control"></asp:TextBox>
                            <span id="PuestoContFilial" style="color: red;"></span>

                        </div>
                        <div class="col-md-3">
                            <label for="txtCorreoContFilial" class="form-label">Correo:</label>
                            <%--<input type="email" name="name" value="" id="txtCorreoContFilial" class="form-control" />--%>
                            <asp:TextBox ID="txtCorreoContFilial" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                            <span id="CorreoContFilial" style="color: red;"></span>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label for="txtTelContFilial" class="form-label">Telefono:</label>
                            <%--<input type="tel" name="name" value="" id="txtTelContFilial" class="form-control" />--%>
                            <asp:TextBox ID="txtTelContFilial" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                            <span id="TelContFilial" style="color: red;"></span>

                        </div>
                        <div class="col-md-2">
                            <label for="txtExtContFilial" class="form-label">Extension:</label>
                            <%--<input type="text" name="name" value="" id="txtExtContFilial" class="form-control" />--%>
                            <asp:TextBox ID="txtExtContFilial" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-4">
                            <label for="txtCelContFilial" class="form-label">Celular:</label>
                            <%--<input type="tel" name="name" value="" id="txtCelContFilial" class="form-control" />--%>
                            <asp:TextBox ID="txtCelContFilial" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                            <span id="CelContFilial" style="color: red;"></span>

                        </div>
                    </div>
                </div>
            </div>
            <div class="card-footer">
                <div class="row">
                    <div class="col-10"></div>
                    <div class="col">
                        <button type="button" name="btnAgregarComFilial" class=" btn btn-primary" id="btnAgregarComFilial">Registrar compañia</button>
                    </div>
                </div>
            </div>
        </div>

        <br />
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="table-responsive">
                        <table class="table table-hover" id="tComFil">

                            <thead class="cabezal">
                                <tr>
                                    <th hidden></th>
                                    <th>Nombre compañia</th>
                                    <th>Nombr comercial</th>
                                    <th>Direccion</th>
                                    <th>RFC</th>
                                    <th>Pais</th>
                                    <th>Estado</th>
                                    <th>Ciudad</th>
                                    <th>CP</th>
                                    <th>Contacto</th>
                                    <th>Puesto</th>
                                    <th>Correo</th>
                                    <th>Telefono</th>
                                    <th>Ext</th>
                                    <th>Celular</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot></tfoot>

                        </table>
                    </div>
                </div>

            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col" style="display: flex; justify-content: flex-end;">
                <asp:Panel ID="pUsrControl" runat="server">
                    <asp:LinkButton ID="btnAnterior" runat="server" CssClass="btn btn-warning" ForeColor="White" OnClick="btnAnterior_Click"><i class="bi bi-chevron-left"></i> Anterior</asp:LinkButton>&nbsp;&nbsp;
                <button id="btnHomie" class="btn btn-secondary" type="button"><i class="bi bi-house-door"></i></button>
                    <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-secondary"
                        data-bs-toggle="tooltip"
                        data-bs-placement="top"
                        title="Guardar y salir" OnClick="btnHome_Click"
                        Visible="false"> <i class="bi bi-house-door"></i> </asp:LinkButton>&nbsp;&nbsp;
                <button id="btnContinuar" class="btn btn-primary" type="button">Siguiente<i class="bi bi-chevron-right"></i></button>
                </asp:Panel>

                <asp:Panel ID="pAdminControl" runat="server" Visible="false">
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

    <script type="text/javascript">
        $(document).ready(function () {
            llenarTabla();
            /* fillComboPais($('#cbPaisComFilial'));*/


        });

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../JS/ComFilialJS.js"></script>
</asp:Content>
