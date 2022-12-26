<%@ Page Title="Compañia filial" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompaniaFilial.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.CompaniaFilial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .hiddencol {
            display: none;
        }
    </style>
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
                        <asp:HyperLink ID="step3" runat="server" NavigateUrl="#" CssClass="selected">
                            <asp:Label ID="lblstep3" runat="server" Text="3" CssClass="step_no"></asp:Label>
                            <asp:Label ID="lblDesc3" runat="server" Text="<%$Resources:AgentesAduanales, lblPaso3 %>"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub3" runat="server" Text="<%$Resources:AgentesAduanales, lblDesc3 %>" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step4" runat="server" NavigateUrl="~/F14/Secciones/TipoServicioProductos.aspx">
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
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="card border-primary">
                    <div class="card-header cabezal">
                        <div class="row">
                            <div class="col-auto">
                                <h4>
                                    <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:AgentesAduanales, lblDesc3 %>"></asp:Literal>
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
                                    <asp:HiddenField ID="hfID" runat="server" />
                                    <asp:Label ID="lblNombreCompanaiFilal" CssClass="form-label" runat="server" Text="<%$Resources:AgentesAduanales,lblNombreCompania %>"></asp:Label>
                                    <asp:TextBox ID="txtNombreCompaniaFilial" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Este campo es obligatorio." CssClass="text-danger" ControlToValidate="txtNombreCompaniaFilial"></asp:RequiredFieldValidator>

                                    <span id="NombreCompaniaFilial" style="color: red;"></span>
                                </div>
                                <div class="col-sm">
                                    <asp:Label ID="lblNombreComFilial" CssClass="form-label" runat="server" Text="<%$Resources:AgentesAduanales,lblNombreComercial %>"></asp:Label>
                                    <asp:TextBox ID="txtNombrComFilial" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Este campo es obligatorio." CssClass="text-danger" ControlToValidate="txtNombrComFilial"></asp:RequiredFieldValidator>

                                    <span id="NombrComFilial" style="color: red;"></span>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-9">
                                    <asp:Label ID="lblDirecFiscalComFilial" runat="server" Text="<%$Resources:InformacionCompania,lblDireccionFiscal %>"></asp:Label>
                                    <asp:TextBox ID="txtDirecFiscalComFilial" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*Este campo es obligatorio." CssClass="text-danger" ControlToValidate="txtDirecFiscalComFilial"></asp:RequiredFieldValidator>

                                    <span id="DirecFiscalComFilial" style="color: red;"></span>

                                </div>

                                <div class="col-md-3">

                                    <asp:Label ID="lblRFC" CssClass="form-label" runat="server" Text="RFC"></asp:Label>
                                    <asp:TextBox ID="txtRfcComFilial" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Este campo es obligatorio." CssClass="text-danger" ControlToValidate="txtRfcComFilial"></asp:RequiredFieldValidator>

                                    <span id="RfcComFilial" style="color: red;"></span>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-3">
                                    <asp:Label ID="lblPais" runat="server" Text="<%$Resources:InformacionCompania, lblPais %>"></asp:Label>
                                    <asp:DropDownList ID="ddPaisComFilial" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddPaisComFilial_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    <asp:Label ID="lblEstado" runat="server" CssClass="form-label" Text="<%$Resources:AgentesAduanales, lblEstado %>"></asp:Label>
                                    <asp:DropDownList ID="ddEstadoComFilial" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddEstadoComFilial_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    <asp:Label ID="lblCiudad" runat="server" CssClass="form-label" Text="<%$Resources:AgentesAduanales,lblCiudad %>"></asp:Label>
                                    <asp:DropDownList ID="ddCiudadComFilial" runat="server" CssClass="form-select"></asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    <asp:Label ID="lblCPComFilial" runat="server" CssClass="form-label" Text="<%$Resources:InformacionCompania, lblCP %>"></asp:Label>
                                    <asp:TextBox ID="txtCPComFIlial" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*Este campo es obligatorio." CssClass="text-danger" ControlToValidate="txtCPComFIlial"></asp:RequiredFieldValidator>
                                    <span id="CPComFIlial" style="color: red;"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-header cabezal">
                        <div class="row">
                            <div class="col">
                                <h5>
                                    <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:AgentesAduanales,lblContacto %>"></asp:Literal>
                        <span style="font-size: 15px;">
                            <i class="bi bi-question-circle"
                                data-bs-toggle="tooltip"
                                data-bs-placement="bottom"
                                title="Datos del contacto principal de la compañia filial."></i>
                        </span>
                                </h5>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="txtNombrContFilial" class="form-label">Nombre:</label>
                                    <asp:TextBox ID="txtNombrContFilial" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="validador1" runat="server" ErrorMessage="*Este campo es obligatorio." CssClass="text-danger" ControlToValidate="txtNombrContFilial"></asp:RequiredFieldValidator>
                                    <span id="NombrContFilial" style="color: red;"></span>

                                </div>

                                <div class="col-md-3">
                                    <label for="txtPuestoContFilial" class="form-label">Puesto:</label>
                                    <asp:TextBox ID="txtPuestoContFilial" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                        ErrorMessage="*Este campo es obligatorio." CssClass="text-danger" ControlToValidate="txtPuestoContFilial"></asp:RequiredFieldValidator>

                                    <span id="PuestoContFilial" style="color: red;"></span>

                                </div>
                                <div class="col-md-3">
                                    <label for="txtCorreoContFilial" class="form-label">Correo:</label>
                                    <asp:TextBox ID="txtCorreoContFilial" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Este campo es obligatorio." CssClass="text-danger" ControlToValidate="txtCorreoContFilial"></asp:RequiredFieldValidator>

                                    <span id="CorreoContFilial" style="color: red;"></span>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="txtTelContFilial" class="form-label">Telefono:</label>
                                    <asp:TextBox ID="txtTelContFilial" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Este campo es obligatorio." CssClass="text-danger" ControlToValidate="txtTelContFilial"></asp:RequiredFieldValidator>

                                    <span id="TelContFilial" style="color: red;"></span>

                                </div>
                                <div class="col-md-2">
                                    <label for="txtExtContFilial" class="form-label">Extension:</label>
                                    <asp:TextBox ID="txtExtContFilial" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <label for="txtCelContFilial" class="form-label">Celular:</label>
                                    <asp:TextBox ID="txtCelContFilial" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Este campo es obligatorio." CssClass="text-danger" ControlToValidate="txtCelContFilial"></asp:RequiredFieldValidator>

                                    <span id="CelContFilial" style="color: red;"></span>

                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblRes" runat="server" Text=""></asp:Label>

                            </div>
                            <div class="col d-flex justify-content-end">
                                <asp:Panel ID="pEdit" runat="server" Visible="false">
                                    <div class="row">
                                        <div class="col">
                                            <asp:Label ID="Label1" runat="server" Text="Actualizar registro:"></asp:Label>
                                            <asp:LinkButton ID="btnAccept" runat="server" CssClass="btn btn-success btn-sm" OnClick="btnAccept_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                            <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-danger btn-sm" OnClick="btnCancel_Click"><i class="bi bi-x-lg"></i></asp:LinkButton>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Button ID="btnAddCF" runat="server" Text="Agregar" CssClass="btn btn-success" OnClick="btnAddCF_Click" />
                                <button type="button" name="btnAgregarComFilial" class=" btn btn-primary" id="btnAgregarComFilial" hidden>Registrar compañia</button>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col">
                        <div class="card">
                            <div class="table-responsive">
                                <asp:GridView ID="gvComFil" runat="server" AutoGenerateColumns="false" AllowPaging="true" CssClass="table table-hover"
                                    HeaderStyle-CssClass="cabezal" EmptyDataText="No data" ShowHeaderWhenEmpty="True">
                                    <Columns>
                                        <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol">
                                            
                                            <HeaderStyle CssClass="hiddencol" />
                                            <ItemStyle CssClass="hiddencol" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ID_compania" HeaderText="ID_compania">
                                            <HeaderStyle CssClass="hiddencol" />
                                            <ItemStyle CssClass="hiddencol" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Nombre" HeaderText="Nombre"></asp:BoundField>
                                        <asp:BoundField DataField="Nombre_comercial" HeaderText="Nombre comercial"></asp:BoundField>
                                        <asp:BoundField DataField="RFC" HeaderText="RFC"></asp:BoundField>
                                        <asp:BoundField DataField="Direccion" HeaderText="Direccion"></asp:BoundField>
                                        <asp:BoundField DataField="Pais" HeaderText="Pais"></asp:BoundField>
                                        <asp:BoundField DataField="Estado" HeaderText="Estado"></asp:BoundField>
                                        <asp:BoundField DataField="Ciudad" HeaderText="Ciudad"></asp:BoundField>
                                        <asp:BoundField DataField="CP" HeaderText="CP"></asp:BoundField>
                                        <asp:BoundField DataField="Nombre_contacto" HeaderText="Contacto"></asp:BoundField>
                                        <asp:BoundField DataField="Puesto_contacto" HeaderText="Puesto"></asp:BoundField>
                                        <asp:BoundField DataField="Correo" HeaderText="Correo"></asp:BoundField>
                                        <asp:BoundField DataField="Telefono" HeaderText="Telefono"></asp:BoundField>
                                        <asp:BoundField DataField="Extension" HeaderText="Extension"></asp:BoundField>
                                        <asp:BoundField DataField="Celular" HeaderText="Celular"></asp:BoundField>
                                        <asp:TemplateField HeaderText="Acciones">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-warning text-white btn-sm" OnClick="btnEdit_Click" CausesValidation="false"><i class="bi bi-pencil-square"></i></asp:LinkButton><asp:LinkButton ID="btnDel" runat="server" CssClass="btn btn-danger btn-sm" OnClick="btnDel_Click" CausesValidation="false"><i class="bi bi-trash-fill"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>

                                </asp:GridView>
                            </div>
                        </div>

                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <hr />
        <div class="row">
            <div class="col" style="display: flex; justify-content: flex-end;">
                <asp:Panel ID="pUsrControl" runat="server">
                    <asp:LinkButton ID="btnAnterior" runat="server" CssClass="btn btn-warning" ForeColor="White" OnClick="btnAnterior_Click" CausesValidation="false"><i class="bi bi-chevron-left"></i> Anterior</asp:LinkButton>&nbsp;&nbsp;
                <button id="btnHomie" class="btn btn-secondary" type="button"><i class="bi bi-house-door"></i></button>
                    <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-secondary"
                        data-bs-toggle="tooltip"
                        data-bs-placement="top"
                        title="Guardar y salir" OnClick="btnHome_Click"
                        Visible="false"> <i class="bi bi-house-door"></i> </asp:LinkButton>&nbsp;&nbsp;
                <button id="btnContinuar" class="btn btn-primary" type="button">Siguiente<i class="bi bi-chevron-right"></i></button>
                </asp:Panel>

                <asp:Panel ID="pAdminControl" runat="server" Visible="false">
                    <asp:LinkButton ID="btnAdminBack" runat="server" CssClass="btn btn-secondary " CausesValidation="False" OnClick="btnAdminBack_Click"
                        data-bs-toggle="tooltip"
                        data-bs-placement="top"
                        title="Atras"><i class="bi bi-arrow-left-short"></i></asp:LinkButton>

                    <asp:LinkButton ID="btnAdminH" runat="server" CssClass="btn btn-primary " OnClick="btnAdminH_Click"
                        data-bs-toggle="tooltip"
                        data-bs-placement="top"
                        title="Salir" CausesValidation="False"> <i class="bi bi-house-door"></i> </asp:LinkButton>

                    <asp:LinkButton ID="btnAdminSave" runat="server" OnClick="btnAdminSave_Click" CssClass="btn btn-success">Editar<i class="bi bi-chevron-right"></i> </asp:LinkButton>
                    <asp:LinkButton ID="btnAdminSaltar" runat="server" CssClass="btn btn-secondary" OnClick="btnAdminSaltar_Click" Visible="false" CausesValidation="false">saltar</asp:LinkButton>

                    <asp:LinkButton ID="btnAdminNext" runat="server" CssClass="btn btn-secondary" OnClick="btnAdminNext_Click"
                        data-bs-toggle="tooltip"
                        data-bs-placement="top"
                        title="Siguiente" CausesValidation="False"><i class="bi bi-arrow-right-short"></i></asp:LinkButton>
                </asp:Panel>
            </div>
        </div>

    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            //llenarTabla();
            /* fillComboPais($('#cbPaisComFilial'));*/


        });

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/bootstrap.bundle.min.js"></script>
    <script src="../../Scripts/umd/popper.min.js"></script>
    <script src="../JS/ComFilialJS.js"></script>
</asp:Content>
