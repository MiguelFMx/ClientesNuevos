<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admint.Master" AutoEventWireup="true" CodeBehind="Lista_usuarios.aspx.cs" Inherits="ClientesNuevos.admin.usuarios.Lista_usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col">
            <div class="card">
                <div class="table-responsive">
                    <table id="tUsuarios" class="table">
                        <thead>
                            <tr>
                                <th>RFC</th>
                                <th>Empresa</th>
                                <th>Fecha de registro</th>
                                <%-- Subdominio y Roles --%>
                                <th>Detalles</th> 
                                <th>Acciones</th>
                            </tr> 
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="5"> No hay registros</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
