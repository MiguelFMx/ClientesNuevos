<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ClientesNuevos.admin.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Index</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- <h1>Wenas admin</h1> -->
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="table-responsive">
                    <table class="table" id="tClientes">
                        <thead>
                            <tr>
                                <%--<th>RFC</th>--%>
                                <%--<th>Tipo de persona</th>--%>
                                <th>Empresa</th>
                                <th>Fecha de registro</th>
                                <th>Progreso</th>
                                <th>Accion</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                        </tbody>
                    </table>
                </div>
            </div>
            <button type="button" id="btn">btn</button>
        </div>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="index_admin.js"></script>
</asp:Content>
