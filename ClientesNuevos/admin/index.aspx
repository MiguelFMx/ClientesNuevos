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
                        <div class="card-header cabezal">
                            <div class="row mt-2">
                                <div class="col">
                                    <h5 >Listado de clientes</h5>
                                </div>
                                <div class="col my-1 me-3 d-flex justify-content-end">
                                    <asp:HyperLink ID="hlNuevoRegistro" runat="server" NavigateUrl="~/F14/Secciones/InformacionCompania.aspx?accion=new" CssClass="btn btn-primary btn-sm"><i class="bi bi-plus-circle"></i> Nuevo registro</asp:HyperLink>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped" id="tClientes">
                                    <thead>
                                        <tr>
                                            <th style="width: 10%;">RFC</th>
                                            <th style="width: 30%;">Empresa</th>
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

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">

    <script src="../Scripts/jquery-3.6.0.js"></script>
    <script src="../Scripts/DataTables/datatables.min.js"></script>

    <script src="index_admin.js"></script>

</asp:Content>
