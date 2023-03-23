<%@ Page Title="Directorio" Language="C#" MasterPageFile="~/admin/AdminTemplate.Master" AutoEventWireup="true" CodeBehind="contactos.aspx.cs" Inherits="ClientesNuevos.admin.consulta.contactos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .contacto {
            background-color: #fff;
            color: black !important;
            width: 22.3vw;
            height: 13.5rem;
            font-size: 12px;
        }

            .contacto:hover {
                box-shadow: 0 0.5rem 1rem #042a6d83 !important;
                color: white !important;
                background-color: #3c447a;
            }

        .btntool {
            background: none;
            border: none;
            color: gray;
            border-radius: 10px;
            margin: 5px;
            padding: 5px 13px;
            transition: 0.3s ease;
        }

            .btntool i {
                font-size: 15px;
            }

            .btntool:hover {
                background: #6c757d;
                color: white;
            }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>
                <div class="card rounded-0">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="Label1" runat="server" Text="Mostrar"></asp:Label>
                                <asp:DropDownList ID="ddCantidad" AutoPostBack="true" runat="server" CssClass="form-select-sm" OnSelectedIndexChanged="ddCantidad_SelectedIndexChanged">
                                    <asp:ListItem Text="6" Value="6" />
                                    <asp:ListItem Text="12" Value="12" />
                                    <asp:ListItem Text="24" Value="24" />
                                    <asp:ListItem Text="50" Value="50" />
                                    <asp:ListItem Text="100" Value="100" />

                                </asp:DropDownList>
                                <asp:Label ID="Label2" runat="server" Text="registros"></asp:Label>
                            </div>
                            <div class="col-auto">
                                <button type="button" title="Crear correo" style="transform: translate(25px,-2px);" class="btntool" data-bs-toggle="modal" data-bs-target="#CrearCorreo">
                                    <i class="bi bi-envelope"></i>Crear correo
                                </button>
                                <button type="button" title="Nuevo contacto" style="transform: translate(21px,-2px);" class="btntool" data-bs-toggle="modal" data-bs-target="#ResgitrarContacto">
                                    <i class="bi bi-telephone-plus"></i>Nuevo contacto
                                </button>
                            </div>
                            <div class="col-auto">
                                <div class="input-group">
                                    <asp:TextBox ID="txtBusqueda" runat="server" CssClass="form-control" Placeholder="Buscar..."></asp:TextBox>
                                    <asp:LinkButton ID="btnBusqueda" CssClass="btn text-center btn-secondary" data-accion="buscar" runat="server" OnClick="btnBusqueda_Click"><i class="bi bi-search"></i></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="row pt-4">
            <div class="col">
                <div class="card rounded-0">
                    <div class="card-body">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:ListView ID="lstContactos" runat="server" 
                                    OnPagePropertiesChanging="lstContactos_PagePropertiesChanging"
                                    DataKeyNames="ID" GroupItemCount="3" GroupPlaceholderID="GroupPlaceHolderlst"
                                    OnItemCommand="lstContactos_ItemCommand">

                                    <AlternatingItemTemplate>
                                        <td runat="server" class="p-2">
                                            <div class="card contacto rounded-0">
                                                <div class="card-body">

                                                    <div class="row">
                                                        <div class="col text-center">
                                                            <span>
                                                                <%# Eval("Nombre") %>
                                                                <br />
                                                                <label style="font-size: small"><%# (Eval("Puesto").ToString()!= "")?"("+Eval("Puesto")+")" : "" %></label>
                                                            </span>
                                                        </div>
                                                        <div class="col-auto">
                                                            <asp:LinkButton ID="btnAIT" runat="server" CommandName="Editar" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-warning btn-sm text-white">
                                                                    <i class="bi bi-pencil-square"></i>
                                                            </asp:LinkButton>
                                                        </div>
                                                    </div>

                                                    <div class="pt-2">
                                                        <span><i class="bi bi-building"></i>&nbsp; <%# Eval("Nombre_comp") %></span>
                                                        <br />
                                                        <span><i class="bi bi-envelope-fill"></i>&nbsp; <a href="mailto:<%# Eval("Correo") %>"><%# Eval("Correo") %></a></span>

                                                        <br />
                                                        <span><i class="bi bi-telephone-fill pe-2"></i>
                                                            <label><%# (Eval("Extension").ToString() != "") ?  "Ext(" + Eval("Extension") + ")" : "" %><%# (Eval("Telefono").ToString() != "")? Eval("Telefono") : "-" %></label></span>

                                                        <br />
                                                        <span><i class="bi bi-phone-fill"></i>&nbsp; <%# (Eval("Celular").ToString() != "") ? Eval("Celular") : "-" %></span>
                                                        <br />
                                                    </div>
                                                    <asp:Label CssClass="text-secondary" Text='<%# (Eval("Tipo").ToString() == "Fra") ? "Facturacion" : "Compañia" %>' runat="server" ID="TipoLabel" /><br />

                                                </div>
                                            </div>
                                        </td>
                                    </AlternatingItemTemplate>
                                    <EditItemTemplate>
                                        <td runat="server" style="background-color: #999999;">ID:
                                     <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel1" /><br />
                                            ID_compania:
                                     <asp:TextBox Text='<%# Bind("ID_compania") %>' runat="server" ID="ID_companiaTextBox" /><br />
                                            Nombre:
                                     <asp:TextBox Text='<%# Bind("Nombre") %>' runat="server" ID="NombreTextBox" /><br />
                                            Puesto:
                                     <asp:TextBox Text='<%# Bind("Puesto") %>' runat="server" ID="PuestoTextBox" /><br />
                                            Telefono:
                                     <asp:TextBox Text='<%# Bind("Telefono") %>' runat="server" ID="TelefonoTextBox" /><br />
                                            Extension:
                                     <asp:TextBox Text='<%# Bind("Extension") %>' runat="server" ID="ExtensionTextBox" /><br />
                                            Tipo:
                                     <asp:TextBox Text='<%# Bind("Tipo") %>' runat="server" ID="TipoTextBox" /><br />
                                            Celular:
                                     <asp:TextBox Text='<%# Bind("Celular") %>' runat="server" ID="CelularTextBox" /><br />
                                            Correo:
                                     <asp:TextBox Text='<%# Bind("Correo") %>' runat="server" ID="CorreoTextBox" /><br />
                                            <asp:Button runat="server" CommandName="Update" Text="Actualizar" ID="UpdateButton" /><br />
                                            <asp:Button runat="server" CommandName="Cancel" Text="Cancelar" ID="CancelButton" /><br />
                                        </td>
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                                            <tr style="background-color: #5D7B9D; color: white;">
                                                <td>No se han devuelto datos.
                                                </td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                    <EmptyItemTemplate>
                                        <td runat="server" />
                                    </EmptyItemTemplate>
                                    <GroupTemplate>
                                        <tr runat="server" id="itemPlaceholderContainer">
                                            <td runat="server" id="itemPlaceholder"></td>
                                        </tr>
                                    </GroupTemplate>
                                    <InsertItemTemplate>
                                        <td runat="server" style="">ID_compania:
                                     <asp:TextBox Text='<%# Bind("ID_compania") %>' runat="server" ID="ID_companiaTextBox" /><br />
                                            Nombre:
                                     <asp:TextBox Text='<%# Bind("Nombre") %>' runat="server" ID="NombreTextBox" /><br />
                                            Puesto:
                                     <asp:TextBox Text='<%# Bind("Puesto") %>' runat="server" ID="PuestoTextBox" /><br />
                                            Telefono:
                                     <asp:TextBox Text='<%# Bind("Telefono") %>' runat="server" ID="TelefonoTextBox" /><br />
                                            Extension:
                                     <asp:TextBox Text='<%# Bind("Extension") %>' runat="server" ID="ExtensionTextBox" /><br />
                                            Tipo:
                                     <asp:TextBox Text='<%# Bind("Tipo") %>' runat="server" ID="TipoTextBox" /><br />
                                            Celular:
                                     <asp:TextBox Text='<%# Bind("Celular") %>' runat="server" ID="CelularTextBox" /><br />
                                            Correo:
                                     <asp:TextBox Text='<%# Bind("Correo") %>' runat="server" ID="CorreoTextBox" /><br />
                                            <asp:Button runat="server" CommandName="Insert" Text="Insertar" ID="InsertButton" /><br />
                                            <asp:Button runat="server" CommandName="Cancel" Text="Borrar" ID="CancelButton" /><br />
                                        </td>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <td runat="server" class="p-2">
                                            <div class="card contacto rounded-0">
                                                <div class="card-body">

                                                    <div class="row">
                                                        <div class="col text-center">
                                                            <span>
                                                                <label class="nombre"><%# Eval("Nombre") %></label>
                                                                <br />
                                                                <label class="puesto" style="font-size: small"><%# (Eval("Puesto").ToString()!= "")?"("+Eval("Puesto")+")" : "" %></label>
                                                            </span>
                                                        </div>
                                                        <div class="col-auto">
                                                            <asp:LinkButton ID="btnIT" runat="server" CommandName="Editar" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-warning btn-sm text-white">
                                                                    <i class="bi bi-pencil-square"></i>
                                                            </asp:LinkButton>
                                                        </div>
                                                    </div>
                                                    <div class="pt-2">
                                                        <span><i class="bi bi-building"></i>&nbsp; <%# Eval("Nombre_comp") %></span>
                                                        <br />

                                                        <span><i class="bi bi-envelope-fill"></i>&nbsp; <a href="mailto:<%# Eval("Correo") %>"><%# (Eval("Correo").ToString() != "")? Eval("Correo") : "-" %></a></span>
                                                        <br />
                                                        <span><i class="bi bi-telephone-fill pe-2"></i>
                                                            <label><%# (Eval("Extension").ToString() != "") ?  "Ext(" + Eval("Extension") + ")" : "" %><%# (Eval("Telefono").ToString() != "")? Eval("Telefono") : "-" %></label></span>
                                                        <br />
                                                        <span><i class="bi bi-phone-fill"></i>&nbsp; <%# (Eval("Celular").ToString() != "") ? Eval("Celular") : "-" %></span>
                                                        <br />
                                                    </div>
                                                    <asp:Label CssClass="text-secondary" Text='<%# (Eval("Tipo").ToString() == "Fra") ? "Facturacion" : "Compañia" %>' runat="server" ID="TipoLabel" /><br />
                                                </div>
                                            </div>
                                        </td>

                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <div class="table-responsive">
                                            <table runat="server">
                                                <tr runat="server">
                                                    <td runat="server">
                                                        <table runat="server" id="groupPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                                                            <tr runat="server" id="GroupPlaceHolderlst"></tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr runat="server">
                                                    <td runat="server" class="p-2" style="text-align: center; background-color: #fff; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
                                                        <asp:DataPager runat="server" PageSize="6" ID="DataPager1" PagedControlID="lstContactos">
                                                            <Fields>
                                                                <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" ButtonCssClass="btn btn-sm btn-secondary" PreviousPageText='<i class="bi bi-chevron-left"></i>' />
                                                                <asp:NumericPagerField ButtonType="Link" NumericButtonCssClass="btn btn-sm btn-secondary" CurrentPageLabelCssClass="btn btn-sm btn-dark" NextPreviousButtonCssClass="btn btn-sm btn-secondary" NextPageText='<i class="bi bi-chevron-double-right"></i>' PreviousPageText='<i class="bi bi-chevron-double-left"></i>'></asp:NumericPagerField>
                                                                <asp:NextPreviousPagerField ButtonCssClass="btn btn-sm btn-secondary" ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" NextPageText='<i class="bi bi-chevron-right"></i>' PreviousPageText='<i class="bi bi-chevron-left"></i>' />

                                                            </Fields>
                                                        </asp:DataPager>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>

                                    </LayoutTemplate>
                                    <SelectedItemTemplate>
                                        <td runat="server" style="background-color: #E2DED6; font-weight: bold; color: #333333;">ID:
                                     <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel" /><br />
                                            ID_compania:
                                     <asp:Label Text='<%# Eval("ID_compania") %>' runat="server" ID="ID_companiaLabel" /><br />
                                            Nombre:
                                     <asp:Label Text='<%# Eval("Nombre") %>' runat="server" ID="NombreLabel" /><br />
                                            Puesto:
                                     <asp:Label Text='<%# Eval("Puesto") %>' runat="server" ID="PuestoLabel" /><br />
                                            Telefono:
                                     <asp:Label Text='<%# Eval("Telefono") %>' runat="server" ID="TelefonoLabel" /><br />
                                            Extension:
                                     <asp:Label Text='<%# Eval("Extension") %>' runat="server" ID="ExtensionLabel" /><br />
                                            Tipo:
                                     <asp:Label Text='<%# Eval("Tipo") %>' runat="server" ID="TipoLabel" /><br />
                                            Celular:
                                     <asp:Label Text='<%# Eval("Celular") %>' runat="server" ID="CelularLabel" /><br />
                                            Correo:
                                     <asp:Label Text='<%# Eval("Correo") %>' runat="server" ID="CorreoLabel" /><br />
                                        </td>




                                    </SelectedItemTemplate>

                                </asp:ListView>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
  
    </div>

    <%-- =================================== Modal =========================================== --%>

    <div class="modal fade" id="ResgitrarContacto" tabindex="-1" aria-labelledby="RegistrolLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header cabezal">
                    <h5 class="modal-title" id="RegistrolLabel">Nuevo contacto</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-6">
                            <asp:Label ID="lblSocios" runat="server" Text="Cliente/Proveedor" CssClass="form-label"></asp:Label>
                            <asp:DropDownList ID="ddSocios" runat="server" CssClass="form-select form-select-sm">
                                <asp:ListItem Text="..." />
                            </asp:DropDownList>
                        </div>
                        <asp:HiddenField ID="hfID" runat="server" />
                    </div>
                    <div class="row mt-2">
                        <div class="col-sm">
                            <asp:Label ID="Label4" runat="server" Text="<%$Resources:AgentesAduanales,lblNombreC %>"></asp:Label>
                            <asp:TextBox ID="txtNombreC" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            <span id="ErrorContacto" style="color: red; display: none">*Este campo es necesario</span>
                        </div>
                        <div class="col-sm">
                            <asp:Label ID="Label5" runat="server" Text="<%$Resources:AgentesAduanales,lblPuestoC %>"></asp:Label>
                            <asp:TextBox ID="txtPuestoC" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            <span id="ErrorPuesto" style="color: red; display: none">*Este campo es necesario</span>

                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col">
                            <asp:Label ID="Label6" runat="server" Text="<%$Resources:AgentesAduanales,lblCorreo %>" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtCorreoC" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                            <span id="ErrorCorreo" style="color: red; display: none">*Este campo es necesario</span>

                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col">
                            <div class="form-check">
                                <asp:CheckBox ID="chFactura" runat="server" CssClass="form-check" Text="<%$Resources:InformacionCompania,lblCheckbox %>" />
                            </div>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-sm-4">
                            <asp:Label ID="Label8" runat="server" Text="<%$Resources:AgentesAduanales, lblTelefono %>" CssClass="form-label"></asp:Label>
                            <asp:TextBox ID="txtTelC" runat="server" CssClass="form-control form-control-sm" placeholder="ex. 6311001010" TextMode="Phone"></asp:TextBox>

                        </div>
                        <div class="col-sm-4">
                            <asp:Label ID="Label9" runat="server" Text="Extension"></asp:Label>
                            <asp:TextBox ID="txtExt" runat="server" TextMode="Phone" CssClass="form-control form-control-sm"></asp:TextBox>
                        </div>
                        <div class="col-sm-4">
                            <asp:Label ID="Label10" runat="server" Text="<%$Resources:AgentesAduanales, lblCelular %>"></asp:Label>
                            <asp:TextBox ID="txtCelC" runat="server" CssClass="form-control form-control-sm" placeholder="ex. 6311001010" TextMode="Phone"></asp:TextBox>
                        </div>
                        <span id="ErrorNumero" style="color: red; display: none">*Es necesario un número de teléfono o celular</span>
                    </div>
                </div>
                <div class="modal-footer">
                    <div id="registro">
                        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary btn-sm" id="btnRegistrarC">Registrar</button>
                    </div>
                    <div id="edicion" style="display: none;">
                        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary btn-sm" id="btnEditarContacto">Editar</button>
                        <button type="button" class="btn btn-danger btn-sm" id="btnEliminarContacto">Eliminar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="modal fade" id="CrearCorreo" tabindex="-1" aria-labelledby="CorreoLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header cabezal">
                    <h5 class="modal-title" id="CorreoLabel">Nuevo contacto</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col" >
                                    
                                            <div class="row" style="font-size:12px;">
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
                                    <div style="height: 460px; overflow-y: auto;">
                                    <asp:ListView ID="lvCorreo" runat="server" DataKeyNames="ID"
                                        GroupPlaceholderID="itemPlaceholder"
                                        OnItemCommand="lvCorreo_ItemCommand"
                                        OnSelectedIndexChanging="lvCorreo_SelectedIndexChanging"
                                        OnPagePropertiesChanging="lvCorreo_PagePropertiesChanging">
                                        <EmptyDataTemplate>
                                            No se han devuelto datos.
                                        </EmptyDataTemplate>

                                        <ItemSeparatorTemplate>
                                        </ItemSeparatorTemplate>
                                        <ItemTemplate>
                                            <li style="background-color: #f6f6f6; color: #333333; font-size: 12px; padding-bottom: 10px;">
                                                <asp:Label Text='<%# Eval("Nombre_comp") %>' runat="server" ID="ID_companiaLabel" /><br />
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
                                        <asp:Label ID="lblAsunto" runat="server" Text="Asunto" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtAsunto" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label3" runat="server" Text="Mensaje" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtMensaje" runat="server" CssClass="form-control" Font-Size="Small" TextMode="MultiLine" Rows="10"></asp:TextBox>
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


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/umd/popper.min.js"></script>
    <script src="../template/vendors/nprogress/nprogress.js"></script>
    <script src="../template/asset/JS/TemplateJS.js"></script>
    <script src="../../Scripts/sweetalert2.all.min.js"></script>
    <script src="../template/asset/JS/contactosJS.js"></script>



</asp:Content>
