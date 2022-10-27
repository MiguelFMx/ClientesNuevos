<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admint.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ClientesNuevos.admin.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Index</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- <h1>Wenas admin</h1> -->
    <div class="right_col" role="main" style="min-height: 939px;">
        <div>
            <div class="page-title">
                <div class="title_left">
                </div>
            </div>
            <div class="clearfix"></div>

            <div class="row">
                <div class="col">
                    <div class="card">
                        <div class="card-header">
                            <h5 style="color: #73879C;">Listado de clientes</h5>
                        </div>
                        <div class="card-body">
                            
                            <div class="table-responsive">
                                <table class="table table-striped" id="tClientes">
                                    <thead class="cabezal">
                                        <tr>
                                            <th style="width: 40%;">Empresa</th>
                                            <th style="width: 10%;">Fecha de registro</th>
                                            <th style="width: 20%;">Cumplimiento</th>
                                            <th>Estatus</th>
                                            <th>Accion</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <%--<script src="../Scripts/jquery-3.6.0.js"></script>--%>
    <script src="index_admin.js"></script>
    
</asp:Content>
