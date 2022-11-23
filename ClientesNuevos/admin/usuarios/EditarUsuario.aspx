<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admint.Master" AutoEventWireup="true" CodeBehind="EditarUsuario.aspx.cs" Inherits="ClientesNuevos.admin.usuarios.EditarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Editar</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <asp:HiddenField ID="hfID" runat="server" />
                        <asp:Label ID="lblRFC" runat="server" Text="RFC/W9:" CssClass="form-label"></asp:Label>
                        <asp:TextBox ID="txtRFC" runat="server" CssClass="form-control"></asp:TextBox>

                        <br />
                        <asp:Label ID="lblFecha" runat="server" Text="Registrado el "></asp:Label>
                    </div>
                    <div class="col d-flex justify-content-end mt-4">
                        <asp:Label ID="lblStatus" runat="server" Text="Status:" CssClass="form-label mt-1 me-1"></asp:Label>
                        <label class="switch">
                            <asp:CheckBox ID="chkEstatus" runat="server" AutoPostBack="True" OnCheckedChanged="chkEstatus_CheckedChanged" />
                            <span class="slider round"></span>
                        </label>
                        <asp:Label ID="lblEstado" runat="server" Text="---" CssClass="form-label mt-1 ms-2"></asp:Label>


                    </div>

                </div>
                <div class="row">
                    <div class=" d-flex justify-content-end">
                    <asp:Label ID="lblNewStatus" Text="text" runat="server" />
                    </div>
                </div>
            </div>
        </div>

        <div class="card mt-4">
            <div class="card-body">
                <div class="row">
                    <div class="col">
                        <div class="form-group mb-3">
                            <asp:HiddenField ID="hfIDRol" runat="server" />
                            <asp:Label ID="lblDom" runat="server" Text="Dominio" CssClass="form-label"></asp:Label>
                            <asp:DropDownList ID="ddDominio" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddDominio_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="form-group mb-3">
                            <asp:Label ID="lblSubdom" runat="server" Text="Subdominio" CssClass="form-label"></asp:Label>
                            <asp:DropDownList ID="ddSubdom" runat="server" CssClass="form-select"></asp:DropDownList>
                        </div>
                        <div class="form-group mb-3">
                            <asp:Label ID="lblRol" runat="server" Text="Rol" CssClass="form-label"></asp:Label>
                            <asp:DropDownList ID="ddRol" runat="server" CssClass="form-select"></asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblRolNew" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn btn-primary btn-sm" OnClick="btnAdd_Click"><i class="bi bi-plus-circle"></i> Registrar rol</asp:LinkButton>
                        </div>

                    </div>
                    <div class="col">
                        <div class="card">
                            <div class="table-responsive">
                                <asp:GridView ID="gvRoles" runat="server" CssClass="table table-hover" ShowHeaderWhenEmpty="True" EmptyDataText="No hay roles" AutoGenerateColumns="False" HeaderStyle-CssClass="cabezal" AllowPaging="True" PageSize="5">
                                    <Columns>
                                        <asp:BoundField DataField="Id" HeaderText="ID">
                                            <HeaderStyle CssClass="hiddencol" />
                                            <ItemStyle CssClass="hiddencol" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="RFC" HeaderText="RFC">
                                            <HeaderStyle CssClass="hiddencol" />
                                            <ItemStyle CssClass="hiddencol" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Rol" HeaderText="Rol"></asp:BoundField>
                                        <asp:BoundField DataField="Dominio" HeaderText="Dominio"></asp:BoundField>
                                        <asp:BoundField DataField="Subdominio" HeaderText="Subdominio"></asp:BoundField>
                                        <asp:TemplateField HeaderText="Accion">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-warning btn-sm text-white" OnClick="btnEdit_Click"><i class="bi bi-pencil-square"></i></asp:LinkButton><asp:LinkButton ID="btnDel" CssClass="btn btn-danger btn-sm" runat="server" OnClick="btnDel_Click"><i class="bi bi-trash"></i></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <asp:Label ID="lblRolEdit" runat="server" Text=""></asp:Label>

                    </div>
                </div>
            </div>
        </div>
    </div>
     <div class="row">
        <div class="col">
        <a href="../usuarios/Lista_usuarios.aspx" class="btn btn-secondary mb-3 d-flex" style="position: fixed; bottom: 3px;"><i class="bi bi-chevron-left"></i>Regresar</a>
            <asp:HyperLink ID="hlLista" runat="server" CssClass="btn btn-sm btn-secondary" NavigateUrl="~/admin/usuarios/Lista_usuarios.aspx">Regresar</asp:HyperLink>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
