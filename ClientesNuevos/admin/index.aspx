<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ClientesNuevos.admin.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Index</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- <h1>Wenas admin</h1> -->
    <div class="right_col" role="main" style="min-height: 939px;">
        <div>
            <div class="page-title">
                <div class="title_left">
                </div>
            </div>
            <div class="clearfix"></div>

            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Listado de clientes</h2>

                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            
                                <div class="table-responsive">
                                    <table class="table" id="tClientes">
                                        <thead class="cabezal">
                                            <tr>
                                                <th style="width: 40%;">Empresa</th>
                                                <th style="width: 10%;">Fecha de registro</th>
                                                <th style="width: 20%;">Progreso</th>
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
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="index_admin.js"></script>
</asp:Content>
