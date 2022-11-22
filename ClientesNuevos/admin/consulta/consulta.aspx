<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admint.Master" AutoEventWireup="true" CodeBehind="consulta.aspx.cs" Inherits="ClientesNuevos.admin.reportes.consulta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col"></div>
    </div>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header cabezal">
                    <h4>
                        <asp:Label ID="lblConsulta" runat="server" Text="Consulta"></asp:Label></h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <h4><asp:Label Text="..." ID="lblTipo" runat="server" /></h4>
                    <hr />
                        </div>
                    </div>
                    <div class="row pt-3">
                        <div class="table-responsive">
                            <table id="tConsulta" class="table table-hover">
                                <thead></thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/bootstrap.bundle.min.js"></script>
    <script src="../../Scripts/umd/popper.min.js"></script>
    <script src="../../Scripts/DataTables/datatables.min.js"></script>
    <script src="../template/asset/JS/consultaJS.js"></script>
</asp:Content>
