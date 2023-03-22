<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admint.Master" AutoEventWireup="true" CodeBehind="editarcontacto.aspx.cs" Inherits="ClientesNuevos.admin.consulta.editarcontacto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col">
                <asp:Label ID="lblID" runat="server" Text="Label" Visible="false"></asp:Label>

                <div class="card">
                    <div class="card-header">
                        Editar contacto
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblEmpresa" runat="server" Text="Empresa" CssClass="form-label"></asp:Label>
                                <asp:DropDownList ID="ddEmpresa" runat="server" CssClass="form-select"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" style="max-width:100%;"></asp:TextBox>
                            </div>                        
                            <div class="col">
                                <asp:Label ID="lblPuesto" runat="server" Text="Puesto:" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtPuesto" runat="server" CssClass="form-control" style="max-width:100%;"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4"> 
                                <asp:Label ID="lblExt" runat="server" Text="Extension:" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtExt" runat="server" CssClass="form-control" style="max-width:100%;"></asp:TextBox>
                            </div>
                            <div class="col-4">
                                <asp:Label ID="lblTel" runat="server" Text="Telefono:" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtTel" runat="server" CssClass="form-control" style="max-width:100%;"></asp:TextBox>
                            </div>
                            <div class="col-4">
                                <asp:Label ID="lblCel" runat="server" Text="Celular:" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtCel" runat="server" CssClass="form-control" style="max-width:100%;"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <asp:Label ID="lblCorreo" runat="server" Text="Correo:" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" style="max-width:50%;"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" id="chTipo" runat="server">
                                    Enviar factura
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="d-flex justify-content-end">
                            <a href="contactos.aspx" class="btn btn-secondary m-1"><i class="bi bi-chevron-left me-1"></i>Regresar</a>
                            <asp:LinkButton ID="btnEditar" runat="server" CssClass="btn btn-warning text-white m-1" OnClick="btnEditar_Click"><i class="bi bi-pencil-square me-1"></i>Editar</asp:LinkButton>
                            <asp:LinkButton ID="btnEliminar" runat="server" CssClass="btn btn-danger m-1" OnClick="btnEliminar_Click"><i class="bi bi-trash me-1"></i>Eliminar</asp:LinkButton>
                        </div>
                    </div>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
