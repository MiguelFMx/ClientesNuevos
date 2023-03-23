<%@ Page Title="Reportes" Language="C#" MasterPageFile="~/admin/AdminTemplate.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="ClientesNuevos.admin.Reportes" %>

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
        <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
            <div class="card rounded-4 shadow h-100">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <div class="number">
                                <p class="text-sm-right mb-0 text-uppercase font-weight-bold">
                                    Clientes/Proveedores activos
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
                <div class="card-footer">
                    <asp:HyperLink ID="hlClientesA" NavigateUrl="~/admin/consulta/consulta.aspx?type=3" CssClass="btn btn-secondary btn-sm" runat="server">Detalles</asp:HyperLink>
                </div>
            </div>
        </div>
        <!--Clientes inactivos -->
        <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
            <div class="card rounded-4 shadow">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <div class="number">
                                <p class="text-sm-right mb-0 text-uppercase font-weight-bold">
                                    Clientes/proveedores inactivos
                                </p>
                                <br />
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
                <div class="card-footer">
                    <asp:HyperLink ID="hlClientesI" NavigateUrl="~/admin/consulta/consulta.aspx?type=4" CssClass="btn btn-secondary btn-sm" runat="server">Detalles</asp:HyperLink>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
            <div class="card rounded-4 shadow">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <div class="number">
                                <p class="text-sm-right mb-0 text-uppercase font-weight-bold">
                                    Directorio
                                </p>
                                <br />
                                <h5 class="font-weight-bolder">
                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                </h5>

                            </div>
                        </div>
                        <div class="col-4">
                            <div class="icon icon-shape bg-gradient-warning text-center rounded-circle">
                                <i class="bi bi-book"></i>
                            </div>
                        </div>
                    </div>
                    <br />
                </div>
                <div class="card-footer">
                    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/admin/consulta/contactos.aspx" CssClass="btn btn-secondary btn-sm" runat="server">Ver</asp:HyperLink>
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
                                    <asp:HyperLink ID="hlActOP" NavigateUrl="~/admin/consulta/consulta.aspx?type=5" CssClass="btn btn-secondary btn-sm me-1" runat="server">Detalles</asp:HyperLink>
                                    <asp:Button ID="Button1" CssClass="btn btn-primary btn-sm" runat="server" OnClientClick="return false;" Text="Crear aviso" data-bs-toggle="modal" data-bs-target="#CrearCorreo" />

                                    <%--<asp:Button ID="btnDetSin" runat="server" Text="Detalles" CssClass="btn btn-secondary btn-sm" />--%>
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
                                    <asp:HyperLink ID="hlSinOP" NavigateUrl="~/admin/consulta/consulta.aspx?type=6" CssClass="btn btn-secondary btn-sm me-1" runat="server">Detalles</asp:HyperLink>
                                    <button id="btnSInOp" type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#EmailSinOPModal">
                                        Crear solicitud
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <!--======== Modal para enviar correos  ls personas que no tienenn ctualizada la  OP =======-->
    <div class="modal fade" id="CrearCorreo" tabindex="-1" aria-labelledby="CorreoLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header cabezal">
                    <h5 class="modal-title" id="CorreoLabel">Redactar correo</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col">

                                    <div class="row" style="font-size: 12px;">
                                        <div class="col pt-1">
                                            <asp:Label ID="Label7" runat="server" Text="Mostrar"></asp:Label>
                                            <asp:DropDownList ID="ddCorreo" AutoPostBack="true" runat="server" CssClass="form-select-sm" OnSelectedIndexChanged="ddCorreo_SelectedIndexChanged">
                                                <asp:ListItem Text="6" Value="6" />
                                                <asp:ListItem Text="12" Value="12" />
                                                <asp:ListItem Text="24" Value="24" />
                                                <asp:ListItem Text="50" Value="50" />
                                                <asp:ListItem Text="100" Value="100" />

                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-auto">
                                            <div class="input-group">
                                                <asp:TextBox ID="txtBuscarCorreo" runat="server" CssClass="form-control-sm" Placeholder="Buscar..." BorderStyle="Solid" BorderColor="#999999" BorderWidth="1px"></asp:TextBox>
                                                <asp:LinkButton ID="btnBuscarCorreo" CssClass="btn text-center btn-secondary" data-accion="buscar" runat="server" OnClick="btnBuscarCorreo_Click"><i class="bi bi-search"></i></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>

                                    <%-- ============================================================= --%>
                                    <div style="height: 380px; overflow-y: auto;">
                                        <asp:ListView ID="lvCorreo" runat="server" DataKeyNames="RFC"
                                            GroupPlaceholderID="itemPlaceholder"
                                            OnItemCommand="lvCorreo_ItemCommand"
                                            OnSelectedIndexChanging="lvCorreo_SelectedIndexChanging"
                                            OnPagePropertiesChanging="lvCorreo_PagePropertiesChanging">
                                            <EmptyDataTemplate>
                                                No se han encontrado contactos.
                                            </EmptyDataTemplate>

                                            <ItemSeparatorTemplate>
                                            </ItemSeparatorTemplate>
                                            <ItemTemplate>
                                                <li style="background-color: #f6f6f6; color: #333333; font-size: 12px; padding-bottom: 10px;">
                                                    <asp:Label Text='<%# Eval("Compania") %>' runat="server" ID="ID_companiaLabel" /><br />
                                                    <asp:Label Text='<%# Eval("Nombre") %>' runat="server" ID="NombreLabel" /><br />
                                                    <asp:Label Text='<%# Eval("Correo") %>' runat="server" ID="CorreoLabel" /><br />
                                                    <asp:LinkButton ID="SMailbtn" runat="Server" Text="Seleccionar" CommandName="Mail" CommandArgument='<%# Eval("Correo") %>' />
                                                </li>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <ul runat="server" id="itemPlaceholderContainer" style="list-style: none;">
                                                    <li runat="server" id="itemPlaceholder" />
                                                </ul>
                                                <div style="text-align: center; background-color: #3c447a; color: #fff;">
                                                    <asp:DataPager runat="server" ID="DataPager2" PageSize="5">
                                                        <Fields>
                                                            <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" ButtonCssClass="btn btn-sm btn-secondary" PreviousPageText='<i class="bi bi-chevron-left"></i>' />
                                                            <asp:NumericPagerField ButtonType="Link" NumericButtonCssClass="btn btn-sm btn-secondary" CurrentPageLabelCssClass="btn btn-sm btn-dark" NextPreviousButtonCssClass="btn btn-sm btn-secondary" NextPageText='<i class="bi bi-chevron-double-right"></i>' PreviousPageText='<i class="bi bi-chevron-double-left"></i>'></asp:NumericPagerField>
                                                            <asp:NextPreviousPagerField ButtonCssClass="btn btn-sm btn-secondary" ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" NextPageText='<i class="bi bi-chevron-right"></i>' PreviousPageText='<i class="bi bi-chevron-left"></i>' />

                                                        </Fields>
                                                    </asp:DataPager>

                                                    <asp:Label Text="xd" ID="lblCountConOP" runat="server" />

                                                </div>
                                            </LayoutTemplate>

                                        </asp:ListView>
                                    </div>

                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <asp:Label ID="lblPara" runat="server" Text="Para" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtPara" CssClass="form-control" TextMode="MultiLine" Rows="4" Font-Size="Small" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label4" runat="server" Text="Asunto" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtAsuntos" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label5" runat="server" Text="Mensaje" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtMensajes" runat="server" CssClass="form-control" Font-Size="Small" TextMode="MultiLine" Rows="10"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
                <div class="modal-footer">
                    <a href="#" hidden id="anchorMail"></a>
                    <button type="button" class="btn btn-sm btn-success" id="btnSendAll"><i class="bi bi-forward"></i>enviar correo</button>
                    <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>

    <asp:UpdatePanel ID="upScript" runat="server"></asp:UpdatePanel>
    <!-- ==================Modal======================= -->
    <div class="modal fade" id="EmailSinOPModal" tabindex="-1" aria-labelledby="EmailModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header cabezal">
                    <h4 class="modal-title fs-5" id="EmailSInOPModalLabel">Redactar correo</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col">
                                    <div class="row">
                                        <div class="col">

                                            <div class="row" style="font-size: 12px;">
                                                <div class="col pt-1">
                                                    <asp:Label ID="Label8" runat="server" Text="Mostrar"></asp:Label>
                                                    <asp:DropDownList ID="ddSinOP" AutoPostBack="true" runat="server" CssClass="form-select-sm" OnSelectedIndexChanged="ddSinOP_SelectedIndexChanged">
                                                        <asp:ListItem Text="6" Value="6" />
                                                        <asp:ListItem Text="12" Value="12" />
                                                        <asp:ListItem Text="24" Value="24" />
                                                        <asp:ListItem Text="50" Value="50" />
                                                        <asp:ListItem Text="100" Value="100" />

                                                    </asp:DropDownList>
                                                </div>
                                                <div class="col-auto">
                                                    <div class="input-group">
                                                        <asp:TextBox ID="txtBuscarSinOP" runat="server" CssClass="form-control-sm" Placeholder="Buscar..." BorderStyle="Solid" BorderColor="#999999" BorderWidth="1px"></asp:TextBox>
                                                        <asp:LinkButton ID="btnBuscarSinOP" CssClass="btn text-center btn-secondary" data-accion="buscar" runat="server" OnClick="btnBuscarSinOP_Click"><i class="bi bi-search"></i></asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>

                                            <%-- ============================================================= --%>
                                            <div style="height: 380px; overflow-y: auto;">
                                                <asp:ListView ID="lvSinOP" runat="server" DataKeyNames="RFC"
                                                    GroupPlaceholderID="itemPlaceholder"
                                                    OnItemCommand="lvSinOP_ItemCommand"
                                                    OnSelectedIndexChanging="lvSinOP_SelectedIndexChanging"
                                                    OnPagePropertiesChanging="lvSinOP_PagePropertiesChanging">
                                                    <EmptyDataTemplate>
                                                        No se han encontrado contactos.
                                                    </EmptyDataTemplate>

                                                    <ItemSeparatorTemplate>
                                                    </ItemSeparatorTemplate>
                                                    <ItemTemplate>
                                                        <li style="background-color: #f6f6f6; color: #333333; font-size: 12px; padding-bottom: 10px;">
                                                            <asp:Label Text='<%# Eval("Compania") %>' runat="server" ID="ID_companiaLabel" /><br />
                                                            <asp:Label Text='<%# Eval("Nombre") %>' runat="server" ID="NombreLabel" /><br />
                                                            <asp:Label Text='<%# Eval("Correo") %>' runat="server" ID="CorreoLabel" /><br />
                                                            <asp:LinkButton ID="SMailbtn" runat="Server" Text="Seleccionar" CommandName="Mail" CommandArgument='<%# Eval("Correo") %>' />
                                                        </li>
                                                    </ItemTemplate>
                                                    <LayoutTemplate>
                                                        <ul runat="server" id="itemPlaceholderContainer" style="list-style: none;">
                                                            <li runat="server" id="itemPlaceholder" />
                                                        </ul>
                                                        <div style="text-align: center; background-color: #3c447a; color: #fff;">
                                                            <asp:DataPager runat="server" ID="DataPagerSinOP" PageSize="5">
                                                                <Fields>
                                                                    <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" ButtonCssClass="btn btn-sm btn-secondary" PreviousPageText='<i class="bi bi-chevron-left"></i>' />
                                                                    <asp:NumericPagerField ButtonType="Link" NumericButtonCssClass="btn btn-sm btn-secondary" CurrentPageLabelCssClass="btn btn-sm btn-dark" NextPreviousButtonCssClass="btn btn-sm btn-secondary" NextPageText='<i class="bi bi-chevron-double-right"></i>' PreviousPageText='<i class="bi bi-chevron-double-left"></i>'></asp:NumericPagerField>
                                                                    <asp:NextPreviousPagerField ButtonCssClass="btn btn-sm btn-secondary" ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" NextPageText='<i class="bi bi-chevron-right"></i>' PreviousPageText='<i class="bi bi-chevron-left"></i>' />

                                                                </Fields>
                                                            </asp:DataPager>

                                                            <asp:Label Text="xd" ID="lblCountConOP" runat="server" />

                                                        </div>
                                                    </LayoutTemplate>

                                                </asp:ListView>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <asp:Label ID="Label6" runat="server" Text="Para:" CssClass="form-label">
                                        </asp:Label><asp:TextBox ID="txtDestinatarios" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" placeholder="Seleccione correos de la lista"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label2" runat="server" Text="Asunto" CssClass="form-label">
                                        </asp:Label><asp:TextBox ID="txtAsuntoSinOP" runat="server" CssClass="form-control" placeholder="Asunto"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label3" runat="server" Text="Mensaje"></asp:Label>
                                        <asp:TextBox ID="txtBodySinOP" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="8"
                                            placeholder="Mensaje para solicitar que se suba la opinion positiva"></asp:TextBox>
                                    </div>
                                </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" id="btnEnviarCorreoSinOP" class="btn btn-primary btn-sm">Enviar correos</button>
                <a href="#" id="anchorSinOp" hidden>mensaje</a>
            </div>
        </div>
    </div>

    <script src="../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/DataTables/datatables.min.js"></script>
    <script src="../Scripts/sweetalert2.all.min.js"></script>
    <script src="template/asset/JS/ReportesJS.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
