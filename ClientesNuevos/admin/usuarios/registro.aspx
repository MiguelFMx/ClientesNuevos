<%@ Page Title="Registro" Language="C#" MasterPageFile="~/admin/Admint.Master" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="ClientesNuevos.admin.usuarios.registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Registrar usuario</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <section>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card shadow-sm">
                    <div class="card-header cabezal">
                        <h5>Informacion</h5>
                    </div>
                    <div class="card-body px-4 text-secondary">
                        <%-- Empresa --%>
                        <div class="pb-3">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lblEmpresa" runat="server" Text="Empresa" CssClass="form-label"></asp:Label>
                                    <asp:DropDownList ID="ddEmpresa" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddEmpresa_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                    <asp:Label Text="" ForeColor="red" runat="server" ID="lblErrEmpresa" />

                                </ContentTemplate>
                                <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="ddEmpresa" EventName="selectedindexchanged" />

                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                        <%-- RFC --%>
                        <div class="pb-2">
                            <asp:Label ID="lblRFC" runat="server" Text="RFC:" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtRFC" runat="server" CssClass="form-control" autocomplete="username"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtRFC" runat="server" ErrorMessage="*Llene este campo" ValidationGroup="registro"></asp:RequiredFieldValidator>
                        </div>
                        <%-- Pass --%>
                        <div>
                            <asp:Label ID="lblPass" runat="server" Text="Contraseña:" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" Text="Hungar0s*"></asp:TextBox>
                            <asp:Label ID="lblError" runat="server" Text=""></asp:Label>

                        </div>

                        <%-- Boton --%>
                        <div class="text-center">
                            <asp:HyperLink ID="hlExiste" runat="server" Visible="false" ForeColor="Red"></asp:HyperLink><br />
                            <asp:Button ID="btnAddUser" runat="server" Text="Registrar" CssClass="btn btn-success px-4 mt-2" OnClick="btnAddUser_Click" ValidationGroup="registro" />
                            <asp:Button ID="btnNuevo" runat="server" Text="Nuevo registro" CssClass="btn btn-success px-4 mt-2" OnClick="btnNuevo_Click" Visible="false" />

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate>
                <asp:Panel ID="Panel_roles" runat="server" Enabled="true">
                    <div class="card shadow-sm">
                        <div class="card-header cabezal">
                            <h5>Asignacion de roles</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-5">
                                    <asp:Label ID="lblSubdominio" runat="server" Text="Subdominio" CssClass="form-label"></asp:Label>
                                    <asp:DropDownList ID="ddSubdominio" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="Seleccione una empresa" Value="0" />
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-5">
                                    <asp:Label ID="lblRol" runat="server" Text="Rol" CssClass="form-label"></asp:Label>
                                    <asp:DropDownList ID="ddRol" runat="server" CssClass="form-select"></asp:DropDownList>
                                </div>
                                <div class="col-md-2 mt-3">
                                    <asp:Button ID="btnAgregar" runat="server" Text="Add" CssClass="btn btn-success btn-sm" CausesValidation="false" OnClientClick="return false;" />
                                </div>
                            </div>
                            <label id="lblResultado"></label>
                        </div>
                        <div class="px-4">
                            <div class="table-responsive">

                                <asp:Table ID="myTable" runat="server" Width="100%" CssClass="table">
                                    <asp:TableRow TableSection="TableHeader" CssClass="cabezal">
                                        <asp:TableCell>RFC</asp:TableCell>
                                        <asp:TableCell>Subdominio</asp:TableCell>
                                        <asp:TableCell>Rol</asp:TableCell>
                                        <asp:TableCell></asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow TableSection="TableBody">
                                        <asp:TableCell ColumnSpan="4">No se han asignado roles</asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                    </ContentTemplate></asp:UpdatePanel>
            </div>
        </div>
    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../template/asset/JS/usuariosJS.js"></script>

</asp:Content>
