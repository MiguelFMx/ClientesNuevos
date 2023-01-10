<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MapeoFlujo.aspx.cs" Inherits="ClientesNuevos.F43.MapeoFlujo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Mapeo de flujo</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <asp:HiddenField ID="hfLocalizacion" runat="server" />
        <div class="row">
            <div class="col">
                <h4>
                    <asp:Literal ID="Literal1" runat="server" Text="<%$Resources: Mapeoflujo, lblTitulo %>"></asp:Literal>
                </h4>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <span id="error"></span>
            </div>
        </div>
        <div class="row">
            <asp:HiddenField ID="hfRol" runat="server" />
            <div class="col">
                <div class="card border-warning">
                    <div class="table-responsive-xxl">
                        <table class="table table-hover" id="tMapeo">
                            <thead style="text-align: center">

                                <tr class="table-warning">
                                    <th colspan="9">
                                        <asp:Literal ID="Literal2" runat="server" Text="<%$Resources: Mapeoflujo, lblsubtitulo %>"></asp:Literal>
                                    </th>
                                </tr>
                                <tr style="text-align: left;">
                                    <td colspan="5">
                                        <asp:Label ID="lblCLientelabel" runat="server" Text="<%$Resources: Carpetilla, lblCompania %>" Font-Bold="True"></asp:Label>
                                        <asp:Label ID="lblCliente" runat="server" Text=":"></asp:Label>
                                    </td>
                                    <td colspan="1"></td>
                                    <td colspan="3">
                                        <asp:Label ID="Label1" runat="server" Text="<%$Resources: Mapeoflujo, lblDate %>" Font-Bold="True"></asp:Label>
                                        <asp:Label ID="lblFecha" runat="server" Text="" Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="table-warning" >
                                    <th>#</th>
                                    <th>
                                        <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:Mapeoflujo,lblProveedor %>"></asp:Literal>
                                    <span>
                                        <i class="bi bi-question-circle"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="bottom"
                                            title="Proveedor: Nombre de socio de negocio que provee el servicio"></i>
                                    </span>
                                    </th>
                                    <th>
                                        <asp:Literal ID="Literal5" runat="server" Text="<%$Resources: Mapeoflujo, lblProceso %>"></asp:Literal>
                                    <span>
                                        <i class="bi bi-question-circle"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="bottom"
                                            title="proceso: Parte del proceso de importación/exportación de mercancía que elabora el cliente"></i>
                                    </span>
                                    </th>
                                    <th>
                                        <asp:Literal ID="Literal4" runat="server" Text="<%$Resources: Mapeoflujo, lblMC %>"></asp:Literal>
                                    <span>
                                        <i class="bi bi-question-circle"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="bottom"
                                            title="Movimiento de carga: Aclarar si en esta parte del proceso se hace algún movimiento de carga"></i>
                                    </span>
                                    </th>
                                    <th width="20%">
                                        <asp:Literal ID="Literal6" runat="server" Text="<%$Resources: Mapeoflujo, lblDetalles %>"></asp:Literal>
                                    <span>
                                        <i class="bi bi-question-circle"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="bottom"
                                            title="Detalles del proveedor: Anotar información relevante del proveedor. Por ejemplo: dirección, nombre de contacto, años trabajando con ellos, etc."></i>
                                    </span>
                                    </th>
                                    <th width="5%">
                                        <asp:Literal ID="Literal7" runat="server" Text="<%$Resources: Mapeoflujo, lblDias %>"></asp:Literal>
                                    <span>
                                        <i class="bi bi-question-circle"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="bottom"
                                            title="Días en reposo: Anotar los días en reposo de la carga. Días en reposo son los días que la carga se encuentra sin movimiento. En caso de no aplicar poner N/A"></i>
                                    </span>
                                    </th>
                                    <th>
                                        <asp:Literal ID="Literal8" runat="server" Text="<%$Resources: Mapeoflujo,lblModo %>"></asp:Literal>
                                    <span>
                                        <i class="bi bi-question-circle"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="bottom"
                                            title="Modo de transporte: Escriba el modo (o los modos de transporte) para mover las cargas. Por jemplo: avión, tractocamión, barco, etc."></i>
                                    </span>
                                    </th>
                                    <th>
                                        <asp:Literal ID="Literal9" runat="server" Text="<%$Resources: Mapeoflujo, lblPregunta %>"></asp:Literal></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody style="border-color: #d9c790;">
                            </tbody>
                            <tfoot style="border-color: #d9c790;">
                                <tr>
                                    <td colspan="6"></td>
                                    <td colspan="2">
                                        <span>Auditor:</span>
                                        <input type="text" name="txtAuditor" value="" id="txtAuditor" class="form-control" />
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <hr />
        <div class="row">
            <div class="col" style="display: flex; justify-content: flex-end;">
                <asp:Panel ID="pUser" runat="server">
                    <button class="btn btn-secondary" id="btnHome" data-bs-toggle="tooltip"
                        data-bs-placement="top"
                        title="Guardar y salir" type="button">
                        <i class="bi bi-house-door"></i>
                    </button>
                    &nbsp;&nbsp;
                <button class="btn btn-success" id="btnContinuar" type="button">
                    <asp:Literal ID="Literal10" runat="server" Text="<%$Resources: InformacionCompania, lblBtnContinuar %>"></asp:Literal> <i class="bi bi-chevron-double-right"></i></button>
                </asp:Panel>

                <asp:Panel ID="pAdmin" runat="server" Visible="false">
                    <asp:LinkButton ID="btnBackAdmin" runat="server" CssClass="btn btn-secondary" OnClick="btnBackAdmin_Click"><i class="bi bi-arrow-left"></i></asp:LinkButton>
                    <asp:LinkButton ID="btnHomeAdmin" runat="server" CssClass="btn btn-primary" OnClick="btnHomeAdmin_Click"><i class="bi bi-house-door"></i></asp:LinkButton>
                    <asp:LinkButton ID="btnActAdmin" runat="server" CssClass="btn btn-success" OnClientClick="return false;">Actualizar</asp:LinkButton>


                </asp:Panel>
            </div>
        </div>
    </div>
    <script type="text/javascript">


</script>
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptsContent" ID="content3" runat="server">
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
    <script src="../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../Scripts/JS/jquery-ui.min.js"></script>
    <script src="../Scripts/umd/popper.min.js"></script>
    <script src="../Scripts/sweetalert2.all.min.js"></script>
    <script src="../admin/template/vendors/nprogress/nprogress.js"></script>
    <script src="MapeoFlujoJS.js"></script>
</asp:Content>
