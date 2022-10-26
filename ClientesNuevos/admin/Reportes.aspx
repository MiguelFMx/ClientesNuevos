<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admint.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="ClientesNuevos.admin.Reportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .stat {
            align-items: center;
            background: #d3e2f7;
            border-radius: 50%;
            display: flex;
            height: 40px;
            justify-content: center;
            width: 40px;
        }

        .redondo {
            border-radius: 50%;
        }

        .stat2 {
        }

        .icon-shape {
            width: 48px;
            height: 48px;
            background-position: 50%;
            border-radius: 0.75rem;
            font-size: 33px;
            color: white;
        }
        .icon-shape2 {
            width: 38px;
            height: 38px;
            background-position: 50%;
            border-radius: 0.75rem;
            font-size: 27px;
            color: white;
        }

        .bg-gradient-primary {
            background-image: linear-gradient(310deg,#09b51e,#55e767);
        }

        .bg-gradient-danger {
            background-image: linear-gradient(310deg,#ff0000,#fb4b4b);
        }
        .bg-gradient-warning {
            background-image: linear-gradient(310deg,#afc110,#fbf74b);
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <!--Clientes activos -->
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
            <div class="card rounded-4 shadow h-100">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <div class="number">
                                <p class="text-sm-right mb-0 text-uppercase font-weight-bold">
                                    Clientes activos
                                </p>
                                <br />
                                <h5 class="font-weight-bolder">
                                    <asp:Label ID="lblActivos" runat="server" Text="0"></asp:Label>
                                </h5>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="icon icon-shape bg-gradient-primary text-center rounded-circle ">
                                <i class="bi bi-person-check"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Clientes inactivos -->
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
            <div class="card rounded-4 shadow">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <div class="number">
                                <p class="text-sm-right mb-0 text-uppercase font-weight-bold">
                                    Clientes inactivos
                                </p>
                                <h5 class="font-weight-bolder">
                                    <asp:Label ID="lblInactivos" runat="server" Text="0"></asp:Label>
                                </h5>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="icon icon-shape bg-gradient-danger text-center rounded-circle">
                                <i class="bi bi-person-x"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="row mt-3">
        <div class="col">
            <div class="card shadow rounded-4">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <div class="card rounded-4">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-8">

                                            <p class="text-sm-right mb-0 text-uppercase font-weight-bold">
                                                Clientes sin actualizar opinion positiva                                                    
                                            </p>
                                            <br />
                                            <h5 class="font-weight-bolder">
                                                <asp:Label ID="lblOP" runat="server" Text="0"></asp:Label>

                                            </h5>
                                        </div>
                                        <div class="col-4 d-flex justify-content-end">
                                            <div class="icon icon-shape2 bg-gradient-warning text-center rounded-circle ">
                                                <i class="bi bi-exclamation-circle"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer d-flex justify-content-end">
                                    <asp:Button ID="btnDetSin" runat="server" Text="Detalles" CssClass="btn btn-secondary btn-sm" />
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <%--  --%>
                            <div class="card h-100 rounded-4">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-8">

                                            <p class="text-sm-right mb-0 text-uppercase font-weight-bold">
                                                Clientes sin entregar opinion positiva                                                    
                                            </p>
                                            <br />
                                            <h5 class="font-weight-bolder">
                                                <asp:Label ID="lblSinOP" runat="server" Text="0"></asp:Label>


                                            </h5>
                                        </div>
                                        <div class="col-4 d-flex justify-content-end">
                                            <div class="icon icon-shape2 bg-gradient-danger text-center rounded-circle ">
                                               <i class="bi bi-file-earmark-excel"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer d-flex justify-content-end">
                                    <asp:Button ID="btnDet" runat="server" Text="Detalles" CssClass="btn btn-secondary btn-sm" />
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
</asp:Content>
