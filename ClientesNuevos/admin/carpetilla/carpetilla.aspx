<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admint.Master" AutoEventWireup="true" CodeBehind="carpetilla.aspx.cs" Inherits="ClientesNuevos.admin.carpetilla.carpetilla1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Carpetilla</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="lblPrueba" runat="server" Text="..."></asp:Label>
    <link href="../../template/assets/css/dropzone.css" rel="stylesheet" />
    <div class="row">
        <div class="col-md-4 mb-3">
            <div class="row">
                <div class="col">
                    <div class="card shadow-sm">
                        <div class="card-header cabezal">
                            <h5>Informacion</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <asp:Label ID="label" runat="server" Text="Nombre completo:" CssClass="text-secondary"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblNombreComp" runat="server" Text="..."></asp:Label>
                                </div>
                            </div>

                            <div class="row pt-2">
                                <div class="col">
                                    <asp:Label ID="Label1" runat="server" Text="Fecha de registro:" CssClass="text-secondary"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblFechaReg" runat="server" Text="..."></asp:Label>
                                </div>
                            </div>
                            <div class="row pt-2">
                                <asp:Label ID="Label2" runat="server" Text="Direccion:" CssClass="text-secondary"></asp:Label>
                                <br />
                                <asp:Label ID="lblDireccion" runat="server" Text="..."></asp:Label>
                            </div>
                            <div class="row pt-2">
                                <asp:Label ID="label4" runat="server" Text="Ubicación:" CssClass="text-secondary"></asp:Label>
                                <br />
                                <asp:Label ID="lblUbicacion" runat="server" Text="..."></asp:Label>
                            </div>

                            <div class="row pt-4">
                                <div class="col">
                                    <asp:Label ID="label5" runat="server" Text="Porcentaje de cumplimiento:" CssClass="text-secondary"></asp:Label>
                                    <div class="progress">
                                        <div runat="server" class="progress-bar bg-warning" id="pbProgress" role="progressbar" aria-label="Warning example" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <asp:Label ID="lblPorcentaje" runat="server" Text="..." CssClass="" Font-Size="Smaller"></asp:Label>
                                </div>
                            </div>

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col">
                                            <asp:Label ID="lblStatus" runat="server" Text="Status:" CssClass="form-label mt-1 me-1"></asp:Label>

                                            <label class="switch"
                                                title="Activar o desactivar">
                                                <asp:CheckBox ID="chkEstatus" runat="server" Checked="true" AutoPostBack="True" OnCheckedChanged="chkEstatus_CheckedChanged" />
                                                <span class="slider round"></span>
                                            </label>

                                        </div>
                                        <div class="col">
                                            <div class="d-flex justify-content-end">
                                                <asp:Label ID="lblEstatusA" runat="server" Text="activo" CssClass="etiqueta"></asp:Label>
                                            </div>
                                        </div>
                                        <asp:Label ID="lblCambio" runat="server" Text=""></asp:Label>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <br />
                            <div class="row">
                                <div class="col">
                                    <div id="Rol">
                                    </div>
                                    <div id="Regimen">
                                        <asp:HiddenField ID="hfRegimen" runat="server" />
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-md-8">

                    <div class="row">
                        <div class="col">

                            <div class="card">
                                <div class="card-header cabezal">
                                    <h5>
                                        <asp:Label ID="lblCompania" runat="server" Text="Carpetilla de "></asp:Label>
                                    </h5>
                                </div>

                                <div class="card-body">
                                    <div class="table-responsive">
                                        <asp:Table ID="tDocumentos" runat="server" CssClass="table table-striped  table-hover">
                                            <asp:TableHeaderRow  HorizontalAlign="Center" TableSection="TableHeader">
                                                <asp:TableHeaderCell Width="30%">Documento</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Estatus</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Fecha</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Opciones</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <%--<!-- =============================================================Acta constitutiva======================================== -->--%>
                                            <asp:TableRow ID="row_AC">
                                                <asp:TableCell>
                                    Acta constitutiva
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <div style="display: flex; justify-content: center">
                                                        <asp:Label ID="lblAC_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                                    </div>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblAC_fecha" runat="server" Text="--/--/----"></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtAC" runat="server" Visible="false"></asp:TextBox>

                                                    <asp:LinkButton ID="btnVer_AC" runat="server" Enabled="false" CssClass="btn btn-secondary btn-sm me-1"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Ver" OnClick="btnAC_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnActualizar_AC" CssClass="btn btn-warning btn-sm me-1" runat="server" ForeColor="White"
                                                        data-bs-toggle="modal"
                                                        data-bs-placement="top"
                                                        data-bs-target="#CorreoAct"
                                                        data-bs-type="Acta constitutiva"
                                                        title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnCheck_AC" CssClass="btn btn-success btn-sm" runat="server"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Aprobar" OnClick="btnAC_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>

                                                    <button type="button" class="btn btn-primary btn-sm text-white" data-bs-toggle="modal" title="Subir archivo" data-bs-target="#UploadDoc" data-bs-type="Acta constitutiva" style="margin-left: 1px;"><i class="bi bi-upload"></i></button>

                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <%--============================================================= RFC========================================--%>
                                            <asp:TableRow ID="row_RFC">
                                                <asp:TableCell>RFC</asp:TableCell>
                                                <asp:TableCell>
                                                    <div style="display: flex; justify-content: center">
                                                        <asp:Label ID="lblRFC_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                                    </div>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblRFC_fecha" runat="server" Text="--/--/----"></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtRFC" runat="server" Visible="false"></asp:TextBox>

                                                    <asp:LinkButton ID="btnVer_RFC" Enabled="false" runat="server" CssClass="btn btn-secondary btn-sm me-1"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Ver" OnClick="btnRFC_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnActualizar_RFC" CssClass="btn btn-warning btn-sm me-1" runat="server" ForeColor="White"
                                                        data-bs-toggle="modal"
                                                        data-bs-placement="top"
                                                        data-bs-target="#CorreoAct"
                                                        data-bs-type="RFC"
                                                        title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnCheck_RFC" CssClass="btn btn-success btn-sm" runat="server"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Aprobar" OnClick="btnRFC_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>

                                                    <button type="button" class="btn btn-primary btn-sm text-white" data-bs-toggle="modal" title="Subir archivo" data-bs-target="#UploadDoc" data-bs-type="RFC"><i class="bi bi-upload" style="margin-left: 1px;"></i></button>

                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <%--<!-- ============================================================= CURP======================================== -->--%>
                                            <asp:TableRow ID="row_CURP">
                                                <asp:TableCell>
                                    CURP
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <div style="display: flex; justify-content: center">
                                                        <asp:Label ID="lblCURP_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                                    </div>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblCURP_fecha" runat="server" Text="--/--/----"></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtCURP" runat="server" Visible="false"></asp:TextBox>

                                                    <asp:LinkButton ID="btnVer_CURP" Enabled="false" runat="server" CssClass="btn btn-secondary btn-sm me-1"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Ver" OnClick="btnClick"><i class="bi bi-eye"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnActualizar_CURP" CssClass="btn btn-warning btn-sm me-1" runat="server" ForeColor="White"
                                                        data-bs-toggle="modal"
                                                        data-bs-placement="top"
                                                        data-bs-target="#CorreoAct"
                                                        data-bs-type="CURP"
                                                        title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnCheck_CURP" CssClass="btn btn-success btn-sm" runat="server"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Aprobar" OnClick="btnClick"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                                    <button type="button" class="btn btn-primary btn-sm text-white" data-bs-toggle="modal" style="margin-left: 1px;" title="Subir archivo" data-bs-target="#UploadDoc" data-bs-type="CURP"><i class="bi bi-upload"></i></button>

                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <%--<!-- ============================================================= Carta de no antecedentes======================================== -->--%>
                                            <asp:TableRow ID="row_CNAP">
                                                <asp:TableCell>
                                    Carta de no antecedentes penales
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <div style="display: flex; justify-content: center">
                                                        <asp:Label ID="lblCNAP_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                                    </div>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblCNAP_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtCNAP" runat="server" Visible="false"></asp:TextBox>

                                                    <asp:LinkButton ID="btnVer_CNAP" Enabled="false" runat="server" CssClass="btn btn-secondary btn-sm me-1"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Ver" OnClick="btnCNAP_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnActualizar_CNAP" CssClass="btn btn-warning btn-sm me-1" runat="server" ForeColor="White"
                                                        data-bs-toggle="modal"
                                                        data-bs-placement="top"
                                                        data-bs-target="#CorreoAct"
                                                        data-bs-type="Carta de no antecedentes penales"
                                                        title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnCheck_CNAP" CssClass="btn btn-success btn-sm" runat="server"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Aprobar" OnClick="btnCNAP_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>

                                                    <button type="button" class="btn btn-primary btn-sm text-white" data-bs-toggle="modal" style="margin-left: 1px;" title="Subir archivo" data-bs-target="#UploadDoc" data-bs-type="Carta de no antecedentes penales"><i class="bi bi-upload"></i></button>

                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <%--<!-- =============================================================Comprobante de domicilio======================================== -->--%>
                                            <asp:TableRow ID="row_CompDom">
                                                <asp:TableCell>
                                    Comprobante de domicilio
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <div style="display: flex; justify-content: center">
                                                        <asp:Label ID="lblCompDom_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                                    </div>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblCompDom_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtCompDom" runat="server" Visible="false"></asp:TextBox>

                                                    <asp:LinkButton ID="btnVer_CompDom" Enabled="false" runat="server" CssClass="btn btn-secondary btn-sm me-1"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Ver" OnClick="btnCompDom_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnActualizar_CompDom" CssClass="btn btn-warning btn-sm me-1" runat="server" ForeColor="White"
                                                        data-bs-toggle="modal"
                                                        data-bs-placement="top"
                                                        data-bs-target="#CorreoAct"
                                                        data-bs-type="Comprobante de domicilio"
                                                        title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnCheck_CompDom" CssClass="btn btn-success btn-sm" runat="server"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Aprobar" OnClick="btnCompDom_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>

                                                    <button type="button" class="btn btn-primary btn-sm text-white" data-bs-toggle="modal" style="margin-left: 1px;" title="Subir archivo" data-bs-target="#UploadDoc" data-bs-type="Comprobante de domicilio"><i class="bi bi-upload"></i></button>

                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <%--<!-- =============================================================Identificacion de representante legal======================================== -->--%>
                                            <asp:TableRow ID="row_IRL">
                                                <asp:TableCell>Identificación de representante legal</asp:TableCell>
                                                <asp:TableCell>
                                                    <div style="display: flex; justify-content: center">
                                                        <asp:Label ID="lblIRL_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                                    </div>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblIRL_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtIRL" runat="server" Visible="false"></asp:TextBox>

                                                    <asp:LinkButton ID="btnVer_IRL" Enabled="false" runat="server" CssClass="btn btn-secondary btn-sm me-1"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Ver" OnClick="btnIRL_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnActualizar_IRL" CssClass="btn btn-warning btn-sm me-1" runat="server" ForeColor="White"
                                                        data-bs-toggle="modal"
                                                        data-bs-placement="top"
                                                        data-bs-target="#CorreoAct"
                                                        data-bs-type="Identificación de representante legal"
                                                        title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnCheck_IRL" CssClass="btn btn-success btn-sm" runat="server"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Aprobar" OnClick="btnIRL_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>

                                                    <button type="button" class="btn btn-primary btn-sm text-white" data-bs-toggle="modal" style="margin-left: 1px;" title="Subir archivo" data-bs-target="#UploadDoc" data-bs-type="Identificacion de representante legal"><i class="bi bi-upload"></i></button>

                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <%--<!-- =============================================================poder de representante legal======================================== -->--%>
                                            <asp:TableRow ID="row_PRL">
                                                <asp:TableCell>
                                   Poder del representante legal
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <div style="display: flex; justify-content: center">
                                                        <asp:Label ID="lblPRL_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                                    </div>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblPRL_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtPRL" runat="server" Visible="false"></asp:TextBox>

                                                    <asp:LinkButton ID="btnVer_PRL" Enabled="false" runat="server" CssClass="btn btn-secondary btn-sm me-1"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Ver" OnClick="btnPRL_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnActualizar_PRL" CssClass="btn btn-warning btn-sm me-1" runat="server" ForeColor="White"
                                                        data-bs-toggle="modal"
                                                        data-bs-placement="top"
                                                        data-bs-target="#CorreoAct"
                                                        data-bs-type="Poder del representante legal"
                                                        title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnCheck_PRL" CssClass="btn btn-success btn-sm" runat="server"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Aprobar" OnClick="btnPRL_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>

                                                    <button type="button" class="btn btn-primary btn-sm text-white" data-bs-toggle="modal" style="margin-left: 1px;" title="Subir archivo" data-bs-target="#UploadDoc" data-bs-type="Poder de representante legal"><i class="bi bi-upload"></i></button>

                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <%--<!-- =============================================================Certificacion ctpat======================================== -->--%>
                                            <asp:TableRow ID="row_CTPAT">
                                                <asp:TableCell>
                                   Certificación C-TPAT
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <div style="display: flex; justify-content: center">
                                                        <asp:Label ID="lblCTPAT_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                                    </div>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblCTPAT_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtCTPAT" runat="server" Visible="false"></asp:TextBox>

                                                    <asp:LinkButton ID="btnVer_CTPAT" Enabled="false" runat="server" CssClass="btn btn-secondary btn-sm me-1"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Ver" OnClick="btnCTPAT_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnActualizar_CTPAT" CssClass="btn btn-warning btn-sm me-1" runat="server" ForeColor="White"
                                                        data-bs-toggle="modal"
                                                        data-bs-placement="top"
                                                        data-bs-target="#CorreoAct"
                                                        data-bs-type="Certificación de C-TPAT"
                                                        title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnCheck_CTPAT" CssClass="btn btn-success btn-sm" runat="server"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Aprobar" OnClick="btnCTPAT_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>

                                                    <button type="button" class="btn btn-primary btn-sm text-white" data-bs-toggle="modal" style="margin-left: 1px;" title="Subir archivo" data-bs-target="#UploadDoc" data-bs-type="Certificación C-TPAT"><i class="bi bi-upload"></i></button>

                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <%--<!-- =============================================================Certificacion OEA======================================== -->--%>
                                            <asp:TableRow ID="row_OEA">
                                                <asp:TableCell>Certificación OEA</asp:TableCell>
                                                <asp:TableCell>
                                                    <div style="display: flex; justify-content: center">
                                                        <asp:Label ID="lblOEA_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                                    </div>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblOEA_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtOEA" runat="server" Visible="false"></asp:TextBox>

                                                    <asp:LinkButton ID="btnVer_OEA" Enabled="false" runat="server" CssClass="btn btn-secondary btn-sm me-1"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Ver" OnClick="btnOEA_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnActualizar_OEA" CssClass="btn btn-warning btn-sm me-1" runat="server" ForeColor="White"
                                                        data-bs-toggle="modal"
                                                        data-bs-placement="top"
                                                        data-bs-target="#CorreoAct"
                                                        data-bs-type="(F-14) Admision de cliente"
                                                        title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnCheck_OEA" CssClass="btn btn-success btn-sm" runat="server"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Aprobar" OnClick="btnOEA_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>

                                                    <button type="button" class="btn btn-primary btn-sm text-white" data-bs-toggle="modal" style="margin-left: 1px;" title="Subir archivo" data-bs-target="#UploadDoc" data-bs-type="Certificación OEA"><i class="bi bi-upload"></i></button>

                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <%--<!-- =============================================================Opinion positiva======================================== -->--%>
                                            <asp:TableRow ID="row_OP">
                                                <asp:TableCell>Opinion positiva</asp:TableCell>
                                                <asp:TableCell>
                                                    <div style="display: flex; justify-content: center">
                                                        <asp:Label ID="lblOP_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                                    </div>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblOP_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtOP" runat="server" Visible="false"></asp:TextBox>

                                                    <asp:LinkButton ID="btnVer_OP" Enabled="false" runat="server" CssClass="btn btn-secondary btn-sm me-1"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Ver" OnClick="btnOP_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnActualizar_OP" CssClass="btn btn-warning btn-sm me-1" runat="server" ForeColor="White"
                                                        data-bs-toggle="modal"
                                                        data-bs-placement="top"
                                                        data-bs-target="#CorreoAct"
                                                        data-bs-type="Opinion positiva"
                                                        title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnCheck_OP" CssClass="btn btn-success btn-sm" runat="server"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Aprobar" OnClick="btnOP_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>

                                                    <button type="button" class="btn btn-primary btn-sm text-white" data-bs-toggle="modal" style="margin-left: 1px;" title="Subir archivo" data-bs-target="#UploadDoc" data-bs-type="Opinion positiva"><i class="bi bi-upload"></i></button>

                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <%--<!-- =============================================================W9======================================== -->--%>
                                            <asp:TableRow ID="row_W9">
                                                <asp:TableCell>W9</asp:TableCell>
                                                <asp:TableCell>
                                                    <div style="display: flex; justify-content: center">
                                                        <asp:Label ID="lblW9_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                                    </div>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblW9_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtW9" runat="server" Visible="false"></asp:TextBox>

                                                    <asp:LinkButton ID="btnVer_W9" Enabled="false" runat="server" CssClass="btn btn-secondary btn-sm me-1"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Ver" OnClick="btnW9_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnActualizar_W9" CssClass="btn btn-warning btn-sm me-1" runat="server" ForeColor="White"
                                                        data-bs-toggle="modal"
                                                        data-bs-placement="top"
                                                        data-bs-target="#CorreoAct"
                                                        data-bs-type="W9"
                                                        title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnCheck_W9" CssClass="btn btn-success btn-sm" runat="server"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Aprobar" OnClick="btnW9_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>

                                                    <button type="button" class="btn btn-primary btn-sm text-white" data-bs-toggle="modal" style="margin-left: 1px;" title="Subir archivo" data-bs-target="#UploadDoc" data-bs-type="W9"><i class="bi bi-upload"></i></button>

                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <%--<!-- ===========================================================Evaluacion de seguridad F5 ======================================== -->--%>
                                            <asp:TableRow ID="row_F5">
                                                <asp:TableCell>Evaluación de seguridad(F-5)</asp:TableCell>
                                                <asp:TableCell>
                                                    <div style="display: flex; justify-content: center">
                                                        <asp:Label ID="lblF5_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                                    </div>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblF5_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>

                                                    <asp:LinkButton ID="btnVer_F5" Enabled="false" runat="server" CssClass="btn btn-secondary btn-sm me-1"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Ver" OnClick="btnF5_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnActualizar_F5" CssClass="btn btn-warning btn-sm me-1" runat="server" ForeColor="White"
                                                        data-bs-toggle="modal"
                                                        data-bs-placement="top"
                                                        data-bs-target="#CorreoAct"
                                                        data-bs-type="(F-5) Evaluacion de seguridad"
                                                        title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnCheck_F5" CssClass="btn btn-success btn-sm me-1" runat="server"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Aprobar" OnClick="btnF5_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <%--<!-- =============================================================Adminision de cliente nuevo F14======================================== -->--%>
                                            <asp:TableRow ID="F14">
                                                <asp:TableCell>
                                    Admisión de cliente nuevo(F-14)
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <div style="display: flex; justify-content: center">
                                                        <asp:Label ID="lblF14_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                                    </div>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblF14_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:LinkButton ID="btnVer_F14" Enabled="false" runat="server" CssClass="btn btn-secondary btn-sm me-1"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Ver" OnClick="btnF14_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnActualizar_F14" CssClass="btn btn-warning btn-sm me-1" runat="server" ForeColor="White"
                                                        data-bs-toggle="modal"
                                                        data-bs-placement="top"
                                                        data-bs-target="#CorreoAct"
                                                        data-bs-type="(F-14) Admision de cliente"
                                                        title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnCheck_F14" CssClass="btn btn-success btn-sm me-1" runat="server"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Aprobar" OnClick="btnF14_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <%--<!-- =========================================================Politica de seguridad C-TPAT (F-12)=========================================== -->--%>
                                            <asp:TableRow ID="row_F12">
                                                <asp:TableCell>Politica de seguridad C-TPAT (F-12)</asp:TableCell>
                                                <asp:TableCell>
                                                    <div style="display: flex; justify-content: center">
                                                        <asp:Label ID="lblF12_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                                    </div>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblF12_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:LinkButton ID="btnVer_F12" Enabled="false" runat="server" CssClass="btn btn-secondary btn-sm me-1"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Ver" OnClick="btnF12_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnActualizar_F12" CssClass="btn btn-warning btn-sm me-1" runat="server" ForeColor="White"
                                                        data-bs-toggle="modal"
                                                        data-bs-placement="top"
                                                        data-bs-target="#CorreoAct"
                                                        data-bs-type="(F-12) Política de seguridad C-TPAT"
                                                        title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnCheck_F12" CssClass="btn btn-success btn-sm me-1" runat="server"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Aprobar" OnClick="btnF12_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <%--<!-- =========================================================Mapeo de flujo de carga(F-43)======================================== -->--%>
                                            <asp:TableRow>
                                                <asp:TableCell>Mapeo de flujo de carga(F-43)</asp:TableCell>
                                                <asp:TableCell>
                                                    <div style="display: flex; justify-content: center">
                                                        <asp:Label ID="lblF43_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                                    </div>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblF43_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:LinkButton ID="btnVer_F43"  runat="server" CssClass="btn btn-secondary btn-sm me-1"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Ver" OnClick="btnF43_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnActualizar_F43" CssClass="btn btn-warning btn-sm me-1" runat="server" ForeColor="White"
                                                        data-bs-toggle="modal"
                                                        title="Solicitar actualizacion"
                                                        data-bs-target="#CorreoAct"
                                                        data-bs-type="(F-43) Mapeo de flujo de carga"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                                    <asp:LinkButton ID="btnCheck_F43" CssClass="btn btn-success btn-sm me-1" runat="server"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Aprobar" OnClick="btnF43_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <%--<!-- =============================================================Evaluación In-situ(F-16)======================================== -->--%>
                                            <asp:TableRow>
                                                <asp:TableCell>Evaluación In-situ(F-16)</asp:TableCell>
                                                <asp:TableCell>
                                                    <div style="display: flex; justify-content: center">
                                                        <asp:Label ID="lblF16_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                                    </div>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblF16_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtF16" runat="server" Visible="false"></asp:TextBox>

                                                    <asp:LinkButton ID="btnVer_F16" Enabled="false"  runat="server" CssClass="btn btn-secondary btn-sm"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Ver" OnClick="btnVer_F16_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                                    <button type="button" class="btn btn-warning btn-sm text-white" title="Subir PDF" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="Evaluacion In-situ"><i class="bi bi-upload"></i></button>

                                                    <asp:LinkButton ID="btnCheck_F16" CssClass="btn btn-success btn-sm" runat="server"
                                                        data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        title="Aprobar" OnClick="btnCheck_F16_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>


                                                </asp:TableCell>
                                            </asp:TableRow>
                                            <%--<!-- =============================================================Criterios minimos de seguridad C-TPAT (F-20)======================================== -->--%>
                                            <asp:TableRow>
                                                <asp:TableCell>Criterios minimos de seguridad C-TPAT (F-20)</asp:TableCell>
                                                <asp:TableCell>
                                                    <div style="display: flex; justify-content: center">
                                                        <asp:Label ID="lblF20_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                                    </div>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lblF20_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                                </asp:TableCell>
                                                <asp:TableCell></asp:TableCell>
                                            </asp:TableRow>

                                        </asp:Table>

                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>
                

        </div>
    </div>
    <a href="../index.aspx" class="btn btn-secondary mb-3 d-flex" style="position: fixed; bottom: 3px;"><i class="bi bi-chevron-left"></i>Regresar</a>

    <!------------------------------------------------------------------- Modal --------------------------------------->
    <div class="modal fade" id="UploadDoc" tabindex="-1" aria-labelledby="UploadDocLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="lblUploadDocModal">Subir archivo</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <div class="row">
                        <div class="col">
                            <label id="lblarchivo">Seleccione el archivo correspondiente</label>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col">
                            <div class="drop-zone" id="dropzone">
                                <span class="drop-zone__prompt">Suelte el archivo o haga click aqui</span>
                                <%--<input type="file" name="inputFile" value="" class="drop-zone__input"  id="inputFile" accept="application/pdf"/>--%>
                                <asp:FileUpload ID="inputFile" runat="server" CssClass="drop-zone__input" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <asp:Label ID="lblErr" runat="server" Text="" ForeColor="red"></asp:Label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="btnCancelarFile">Cancelar</button>
                    <button type="button" class="btn btn-success" id="btnPrueba">Guardar</button>

                </div>
            </div>
        </div>
    </div>
    <!------------------------------------------------------------------- Modal correo --------------------------------------->
    <div class="modal fade" id="CorreoAct" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header cabezal">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel"></h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-5">
                            <div class="card h-100 shadow">
                                <h6 class="card-header shadow-sm">Directorio
                                </h6>
                                <div class="card-body">
                                    <div id="contactos"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-7">
                            <div class="card h-100 shadow">
                                <h6 class="card-header shadow-sm">Correo</h6>
                                <div class="card-body">
                                    <div class="form-group">
                                        
                                        <asp:Label ID="lblAsunto" runat="server" Text="Asunto:" CssClass="form-label"></asp:Label>
                                        <asp:Label ID="lblDoc" runat="server" Text="" ForeColor="White"></asp:Label>
                                        <asp:TextBox ID="txtAsunto" runat="server" Text="Solicitud de actualización de datos" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="lblMensaje" runat="server" Text="Mensaje:" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtMensaje" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="10"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">cancelar</button>
                    <button type="button" id="btnEnviar" class="btn btn-primary">enviar</button>

                    <%--<asp:Button ID="btnActMail" runat="server" Text="enviar" CssClass="btn btn-primary" Visible="false"/>--%>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal mensaje -->
    <div class="modal fade" id="ModalAlert" tabindex="-1" aria-labelledby="ModalAlertLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="ModalAlertLabel">Aviso</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <label id="lblAlertModal"></label>
                </div>
                <div class="modal-footer">
                    <%--<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>--%>
                    <button type="button" class="btn btn-primary" id="btnReiniciar">aceptar</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/DataTables/datatables.min.js"></script>
    <script src="../../template/assets/js/dropjs.js"></script>
    <script src="../template/vendors/nprogress/nprogress.js"></script>
    <script src="../../Scripts/sweetalert2.all.min.js"></script>
    <script src="../template/asset/JS/carpetillaJS.js"></script>

</asp:Content>
