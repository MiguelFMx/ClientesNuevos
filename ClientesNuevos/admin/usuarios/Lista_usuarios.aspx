<%@ Page Title="Lista de usuarios" Language="C#" MasterPageFile="~/admin/AdminTemplate.Master" AutoEventWireup="true" CodeBehind="Lista_usuarios.aspx.cs" Inherits="ClientesNuevos.admin.usuarios.Lista_usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col">
            <div class="card rounded-0">
                <div class="card-header cabezal rounded-0">
                    <h5>Usuarios registrados</h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="tUsuariosDet" class="table">
                            <thead>
                                <tr>
                                    <th hidden>Id</th>
                                    <th>RFC</th>
                                    <th>Roles</th>
                                    <th>Fecha de registro</th>
                                    <th>Status</th>
                                    <th>Inicio sesión</th>

                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-end">
                        <asp:HyperLink ID="hlRegistro" runat="server" CssClass="btn btn-secondary btn-sm" NavigateUrl="~/admin/usuarios/registro.aspx"><i class="bi bi-person-plus"></i> Crear usuario</asp:HyperLink>
                    </div>
                </div>
            </div>
            <br />
            <div class="row" id="sinrol" hidden>
                <div class="col">
                    <div class="card rounded-0">
                        <div class="card-header cabezal rounded-0">
                            <h5>Usuarios sin roles asignados</h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table id="tSinCredencial" class="table">
                                    <thead>
                                        <tr>
                                            <th hidden>Id</th>
                                            <th>RFC</th>
                                            <th>Fecha de registro</th>
                                            <th>Status</th>
                                            <th>Acciones</th>
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
    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/DataTables/datatables.min.js"></script>
    <script src="../template/vendors/nprogress/nprogress.js"></script>
    <script src="../../Scripts/sweetalert2.all.min.js"></script>
    <script src="../template/asset/JS/lstUsuarios.js"></script>
</asp:Content>
