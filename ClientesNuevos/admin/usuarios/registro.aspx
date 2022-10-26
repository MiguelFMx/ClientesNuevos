<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admint.Master" AutoEventWireup="true" CodeBehind="registro.aspx.cs" Inherits="ClientesNuevos.admin.usuarios.registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Registrar usuario</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <section>
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <div class="card-header">
                        <h5 class="text-secondary">Informacion</h5>
                    </div>
                    <div class="card-body px-4 text-secondary">
                        <%-- RFC --%>
                        <div class="pb-4">
                            <asp:Label ID="lblRFC" runat="server" Text="RFC:" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtRFC" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <%-- User --%>
                        <div class="pb-4">
                            <asp:Label ID="lblUser" runat="server" Text="Usuario:" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtUser" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <%-- Pass --%>
                        <div class="pb-4">
                            <asp:Label ID="lblPass" runat="server" Text="Contraseña:" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        </div>
                        <%-- Empresa --%>
                        <div class="pb-4">
                            <asp:Label ID="lblEmpresa" runat="server" Text="Empresa" CssClass="form-label"></asp:Label>
                            <asp:DropDownList ID="ddEmpresa" runat="server" CssClass="form-select"></asp:DropDownList>
                        </div>
                        <%-- Boton --%>
                        <div class="text-center">
                            <asp:Button ID="btnAddUser" runat="server" Text="Registrar" CssClass="btn btn-success px-4" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h5 class="text-secondary">Detalles</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-5">
                                <asp:Label ID="lblSubdominio" runat="server" Text="Subdominio" CssClass="form-label"></asp:Label>
                                <asp:DropDownList ID="ddSubdominio" runat="server" CssClass="form-select"></asp:DropDownList>
                            </div>
                            <div class="col-md-5">
                                <asp:Label ID="lblRol" runat="server" Text="Rol" CssClass="form-label"></asp:Label>
                                <asp:DropDownList ID="ddRol" runat="server" CssClass="form-select"></asp:DropDownList>
                            </div>
                            <div class="col-md-2 mt-3">
                                <asp:Button ID="btnAddRol" runat="server" Text="Agregar" CssClass="btn btn-success" />
                            </div>
                        </div>
                    </div>
                        <div class="px-4">
                            <div class="table-responsive">
                                <asp:GridView ID="gvRoles" runat="server" CssClass="table" BorderStyle="None">
                                </asp:GridView>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
