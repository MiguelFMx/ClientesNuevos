<%@ Page Title="Configuracion" Language="C#" MasterPageFile="~/admin/Admint.Master" AutoEventWireup="true" CodeBehind="configuracion.aspx.cs" Inherits="ClientesNuevos.admin.configuracion.configuracion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Configuracion</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-header">
                            Periodo en el que se deben actualizar los documentos
                        </div>
                        <div class="card-body">
                            <%-- Carta de no antecedentes penales --%>
                            <div class="row m-2">
                                <div class="col">
                                    <asp:Label ID="lblCNAP" runat="server" Text="Carta de no antecedentes penales"></asp:Label>
                                    <div class="row">
                                        <div class="col-auto">
                                            <asp:Label ID="lblLapso" runat="server" Text="Tipo de actualizacion"></asp:Label>
                                            <asp:DropDownList ID="ddLapso" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddLapso_SelectedIndexChanged" CssClass="form-select-sm">
                                                <asp:ListItem Text="Anual" Value="anual"></asp:ListItem>
                                                <asp:ListItem Text="Mensual" Value="mensual"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-auto">
                                            <asp:Label ID="lblcantidad" runat="server" Text="Cada"></asp:Label>
                                            <asp:DropDownList ID="ddTiempo" runat="server" CssClass="form-select-sm">
                                                <asp:ListItem Text="0" />
                                            </asp:DropDownList>
                                            <asp:Label ID="lbltiempo" runat="server" Text="..."></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <%-- Comprobante de domicilio --%>
                                    <div class="row m-2">
                                        <asp:Label ID="lblcompdom" runat="server" Text="Comprobante de domicilio"></asp:Label>
                                        <div class="row">
                                            <div class="col-auto">
                                                <asp:Label ID="Label2" runat="server" Text="Tipo de actualizacion"></asp:Label>
                                                <asp:DropDownList ID="ddLapso_compdom" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddLapso_compdom_SelectedIndexChanged" CssClass="form-select-sm">
                                                    <asp:ListItem Text="Anual" Value="anual"></asp:ListItem>
                                                    <asp:ListItem Text="Mensual" Value="mensual"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-auto">
                                                <asp:Label ID="Label3" runat="server" Text="Cada"></asp:Label>
                                                <asp:DropDownList ID="ddTiempo_compdom" runat="server" CssClass="form-select-sm">
                                                    <asp:ListItem Text="0" />
                                                </asp:DropDownList>
                                                <asp:Label ID="lbltiempo_compdom" runat="server" Text="..."></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <%-- Certificacion ctpat --%>
                            <hr class="mt-3" />
                            <div class="row m-2">
                                <div class="col">
                                    <asp:Label ID="Label1" runat="server" Text="Certificación C-TPAT"></asp:Label>
                                    <div class="row">
                                        <div class="col-auto">
                                            <asp:Label ID="Label4" runat="server" Text="Tipo de actualizacion"></asp:Label>
                                            <asp:DropDownList ID="ddLapso_ctpat" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddLapso_ctpat_SelectedIndexChanged" CssClass="form-select-sm">
                                                <asp:ListItem Text="Anual" Value="anual"></asp:ListItem>
                                                <asp:ListItem Text="Mensual" Value="mensual"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-auto">
                                            <asp:Label ID="Label5" runat="server" Text="Cada"></asp:Label>
                                            <asp:DropDownList ID="ddTiempo_ctpat" runat="server" CssClass="form-select-sm">
                                                <asp:ListItem Text="0" />
                                            </asp:DropDownList>
                                            <asp:Label ID="lblTiempo_ctpat" runat="server" Text="..."></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <%-- certificacion OEA --%>
                                    <div class="row m-2">
                                        <asp:Label ID="Label7" runat="server" Text="Certificación OEA"></asp:Label>
                                        <div class="row">
                                            <div class="col-auto">
                                                <asp:Label ID="Label8" runat="server" Text="Tipo de actualizacion"></asp:Label>
                                                <asp:DropDownList ID="ddLapso_oea" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddLapso_oea_SelectedIndexChanged" CssClass="form-select-sm">
                                                    <asp:ListItem Text="Anual" Value="anual"></asp:ListItem>
                                                    <asp:ListItem Text="Mensual" Value="mensual"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-auto">
                                                <asp:Label ID="Label9" runat="server" Text="Cada"></asp:Label>
                                                <asp:DropDownList ID="ddTiempo_oea" runat="server" CssClass="form-select-sm">
                                                    <asp:ListItem Text="0" />
                                                </asp:DropDownList>
                                                <asp:Label ID="lblTiempo_oea" runat="server" Text="..."></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <hr class="mt-3" />

                            <div class="row m-2">
                                <div class="col">
                                    <%-- Opinion positiva --%>
                                    <asp:Label ID="Label11" runat="server" Text="Opinión positiva"></asp:Label>
                                    <div class="row">
                                        <div class="col-auto">
                                            <asp:Label ID="Label12" runat="server" Text="Tipo de actualizacion"></asp:Label>
                                            <asp:DropDownList ID="ddLapso_op" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddLapso_op_SelectedIndexChanged" CssClass="form-select-sm">
                                                <asp:ListItem Text="Anual" Value="anual"></asp:ListItem>
                                                <asp:ListItem Text="Mensual" Value="mensual"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-auto">
                                            <asp:Label ID="Label13" runat="server" Text="Cada"></asp:Label>
                                            <asp:DropDownList ID="ddTiempo_op" runat="server" CssClass="form-select-sm">
                                                <asp:ListItem Text="0" />
                                            </asp:DropDownList>
                                            <asp:Label ID="lblTiempo_op" runat="server" Text="..."></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <%-- Ev. in-situ --%>
                                    <div class="row m-2">
                                        <asp:Label ID="Label6" runat="server" Text="Evaluación in-situ"></asp:Label>
                                        <div class="row">
                                            <div class="col-auto">
                                                <asp:Label ID="Label10" runat="server" Text="Tipo de actualizacion"></asp:Label>
                                                <asp:DropDownList ID="ddLapso_IS" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddLapso_IS_SelectedIndexChanged" CssClass="form-select-sm">
                                                    <asp:ListItem Text="Anual" Value="anual"></asp:ListItem>
                                                    <asp:ListItem Text="Mensual" Value="mensual"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-auto">
                                                <asp:Label ID="Label14" runat="server" Text="Cada"></asp:Label>
                                                <asp:DropDownList ID="ddTiempo_is" runat="server" CssClass="form-select-sm">
                                                    <asp:ListItem Text="0" />
                                                </asp:DropDownList>
                                                <asp:Label ID="lblTiempo_is" runat="server" Text="..."></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <div class="card-footer">
                            <div class="row py-2">
                                <div class="col">
                                    <asp:Button ID="btnGuardarCambios" runat="server" Text="Guardar cambios" CssClass="btn btn-primary btn-sm" OnClick="btnGuardarCambios_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mt-3">
                        <div class="card">
                            <div class="card-header">
                                Administracion de roles
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <!-- Formulario-->
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <asp:Label ID="lblRol" runat="server" Text="Ingrese en nombre de rol:" CssClass="form-label"></asp:Label>
                                            <asp:TextBox ID="txtRol" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:HiddenField ID="hfRol" runat="server" />
                                        </div>
                                        <br />
                                        <div id="botones">

                                            <asp:Label ID="lblTest_Rol" runat="server" Text="" CssClass="text-secondary"></asp:Label>
                                            <br />

                                            <asp:Panel ID="Panel_ROl" runat="server" Visible="false">
                                                <asp:Label ID="Label15" runat="server" Text="Actualizar rol:"></asp:Label>
                                                <asp:LinkButton ID="btnAprove_Rol" runat="server" CssClass="btn btn-success btn-sm ms-2" OnClick="btnAprove_Rol_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                                <asp:LinkButton ID="btnCancel_Rol" runat="server" CssClass="btn btn-danger btn-sm" OnClick="btnCancel_Rol_Click"><i class="bi bi-x-lg"></i></asp:LinkButton>
                                            </asp:Panel>

                                            <asp:LinkButton ID="btnRol" runat="server" CssClass="btn btn-primary btn-sm" OnClick="btnRol_Click">Registrar rol</asp:LinkButton>
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="table-responsive rounded-2">
                                            <asp:GridView ID="gvRoles" runat="server" CssClass="table table-hover" HeaderStyle-CssClass="cabezal" AutoGenerateColumns="False" AllowPaging="True" PageSize="3" OnPageIndexChanging="gvRoles_PageIndexChanging">
                                                <Columns>
                                                    <asp:BoundField HeaderText="ID" DataField="Id" HeaderStyle-Width="30%"></asp:BoundField>
                                                    <asp:BoundField HeaderText="Rol" DataField="Rol" HeaderStyle-Width="50%"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Acciones">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnEditar" runat="server" CssClass="btn btn-warning btn-sm text-white" OnClick="btnEditar_Click"><i class="bi bi-pencil-square"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="btnEliminar" runat="server" CssClass="btn btn-danger btn-sm" OnClick="btnEliminar_Click"><i class="bi bi-trash"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mt-3">
                        <div class="card">
                            <div class="card-header">
                                Administracion de subdominios
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="form-group">
                                            <asp:Label ID="lblEmpresa" runat="server" Text="Empresa" CssClass="form-label"></asp:Label>
                                            <asp:DropDownList ID="ddEmpresa" runat="server" CssClass="form-select"></asp:DropDownList>
                                            <asp:HiddenField ID="hfSubdom" runat="server" />
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lblSubdominio" runat="server" Text="Subdominio" CssClass="form-label"></asp:Label>
                                            <asp:TextBox ID="txtSubdom" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group mt-4">
                                            <asp:Label ID="lblTest_Subdominio" runat="server" Text="" CssClass="text-secondary"></asp:Label>
                                            <br />

                                            <asp:Panel ID="Panel_Sub" runat="server" Visible="false">
                                                <asp:Label ID="Label16" runat="server" Text="Actualizar subdominio:"></asp:Label>
                                                <asp:LinkButton ID="btnAprove_Sub" runat="server" CssClass="btn btn-success btn-sm ms-2" OnClick="btnAprove_Sub_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                                <asp:LinkButton ID="btnCancel_Sub" runat="server" CssClass="btn btn-danger btn-sm" OnClick="btnCancel_Sub_Click"><i class="bi bi-x-lg"></i></asp:LinkButton>
                                            </asp:Panel>

                                            <asp:Button ID="btnAddSub" runat="server" Text="Registrar subdominio" CssClass="btn btn-primary btn-sm" OnClick="bntAddSub_Click" />
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="table-responsive rounded-3">
                                            <asp:GridView ID="gvSubdominio" runat="server" CssClass="table table-hover" HeaderStyle-CssClass="cabezal" AutoGenerateColumns="false" AllowPaging="True" PageSize="3">
                                                <Columns>
                                                    <asp:BoundField HeaderText="Id" DataField="Id"></asp:BoundField>
                                                    <asp:BoundField HeaderText="Dominio" DataField="Dominio"></asp:BoundField>
                                                    <asp:BoundField HeaderText="Subdominio" DataField="subdominio"></asp:BoundField>
                                                    <asp:BoundField HeaderText="Fecha de registro" DataField="fecha_registro" DataFormatString="{0: dd/MM/yyyy}"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Acciones">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnEditSubdom" runat="server" CssClass="btn btn-warning btn-sm text-white" OnClick="btnEditSubdom_Click"><i class="bi bi-pencil-square"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="btnDelSubdom" runat="server" CssClass="btn btn-danger btn-sm" OnClick="btnDelSubdom_Click"><i class="bi bi-trash-fill"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>

                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mt-3">
                        <div class="card">
                            <div class="card-header">
                                Administracion de empresas
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-5">

                                        <div class="form-group">
                                            <asp:Label ID="Label18" runat="server" Text="Empresa" CssClass="form-label"></asp:Label>
                                            <asp:TextBox ID="txtEmpresa" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:HiddenField ID="hfEmpresa" runat="server" />
                                        </div>
                                        <div class="form-group mt-4">
                                            <asp:Label ID="lblTest_Empresa" runat="server" Text="" CssClass="text-secondary"></asp:Label>
                                            <br />

                                            <asp:Panel ID="Panel_Empresa" runat="server" Visible="false">
                                                <asp:Label ID="Label20" runat="server" Text="Actualizar empresa:"></asp:Label>
                                                <asp:LinkButton ID="btnAprove_Empresa" runat="server" CssClass="btn btn-success btn-sm ms-2" OnClick="btnAprove_Empresa_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                                <asp:LinkButton ID="btnCancel_Empresa" runat="server" CssClass="btn btn-danger btn-sm" OnClick="btnCancel_Empresa_Click"><i class="bi bi-x-lg"></i></asp:LinkButton>
                                            </asp:Panel>

                                            <asp:Button ID="btnAddEmpresa" runat="server" Text="Registrar empresa" CssClass="btn btn-primary btn-sm" OnClick="btnAddEmpresa_Click" />
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="table-responsive rounded-3">
                                            <asp:GridView ID="gvEmpresas" runat="server" CssClass="table table-hover" HeaderStyle-CssClass="cabezal" AutoGenerateColumns="false" AllowPaging="True" PageSize="3">
                                                <Columns>
                                                    <asp:BoundField HeaderText="Id" DataField="ID_Empresa" HeaderStyle-Width="30%"></asp:BoundField>
                                                    <asp:BoundField HeaderText="Empresa" DataField="Nombre" HeaderStyle-Width="50%"></asp:BoundField>
                                                    <asp:TemplateField HeaderText="Acciones">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="btnEditEmpresa" runat="server" CssClass="btn btn-warning btn-sm text-white" OnClick="btnEditEmpresa_Click"><i class="bi bi-pencil-square"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="btnDelEmpresa" runat="server" CssClass="btn btn-danger btn-sm" OnClick="btnDelEmpresa_Click"><i class="bi bi-trash-fill"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>

                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mt-3">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>                          
                        <div class="card">
                            <div class="card-header">
                                Servicio de correo
                            </div>
                            <div class="card-body">
                                <div class="form-group mt-2">
                                    <div class="row">
                                        <div class="col">
                                            <asp:Label ID="lblRemitente" runat="server" Text="Remitente" CssClass="form-label"></asp:Label>
                                            <asp:TextBox ID="txtRemitente" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                        </div>
                                        <div class="col">
                                            <asp:Label ID="lblCorreo" runat="server" Text="Correo" CssClass="form-label"></asp:Label>
                                            <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control form-control-sm" TextMode="Email"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                                <div class="form-group mt-2">
                                    <div class="row">
                                        <div class="col">
                                    <asp:Label ID="lblSMTP" runat="server" Text="Host SMTP"></asp:Label>
                                    <asp:TextBox ID="txtHostSMTP" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>

                                        </div>
                                        <div class="col">
                                    <asp:Label ID="lblPort" runat="server" Text="Puerto SMTP"></asp:Label>

                                    <asp:TextBox ID="txtPort" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mt-2">
                                    <div class="row">
                                        <div class="col">
                                            <asp:Label ID="lblusername" runat="server" Text="Usuario" CssClass="form-label"></asp:Label>
                                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                                        </div>
                                        <div class="col">
                                             <asp:Label ID="lblPassword" runat="server" Text="Contraseña" CssClass="form-label"></asp:Label>
                                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control form-control-sm" TextMode="Password"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <asp:LinkButton ID="btnProbarCon" runat="server" OnClick="btnProbarCon_Click">probar conexión</asp:LinkButton>
                                    <asp:Literal ID="literalTest" runat="server"></asp:Literal>
                                </div>
                            </div>
                            <div class="card-footer">
                                <asp:Button ID="btnSMTP" runat="server" Text="Guardar cambios" CssClass="btn btn-primary btn-sm" OnClick="btnSMTP_Click" />
                            </div>
                        </div>
                                 </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                    <asp:Label ID="lblErr" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
