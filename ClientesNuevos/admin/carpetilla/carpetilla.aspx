<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="carpetilla.aspx.cs" Inherits="ClientesNuevos.admin.carpetilla.carpetilla1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="right_col" role="main" style="min-height: 939px;">
        <div class="page-title">
            <div class="title_left">
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col"></div>
            <div class="col-md-10 col-sm-10 col-xs-10s">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>
                            <asp:Label ID="lblCompania" runat="server" Text="Carpetilla de " Font-Size="20px"></asp:Label>

                        </h2>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="table-responsive">
                                <asp:Table ID="tDocumentos" runat="server" CssClass="table table-striped  table-hover">
                                    <asp:TableHeaderRow CssClass="cabezal" HorizontalAlign="Center" TableSection="TableHeader">
                                        <asp:TableHeaderCell>Documento</asp:TableHeaderCell>
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
                                            <asp:TextBox ID="txtAC" runat="server" Visible="true"></asp:TextBox>

                                            <asp:LinkButton ID="btnVer_AC" runat="server" CssClass="btn btn-secondary "
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Ver" OnClick="btnAC_Click"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnActualizar_AC" CssClass="btn btn-warning" runat="server" ForeColor="White"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Solicitar actualizacion" OnClick="btnAC_Click"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnCheck_AC" CssClass="btn btn-success" runat="server"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Aprovar" OnClick="btnAC_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
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
                                            <asp:TextBox ID="txtRFC" runat="server" Visible="true"></asp:TextBox>

                                            <asp:LinkButton ID="btnVer_RFC" runat="server" CssClass="btn btn-secondary "
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Ver" OnClick="btnRFC_Click"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnActualizar_RFC" CssClass="btn btn-warning" runat="server" ForeColor="White"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Solicitar actualizacion" OnClick="btnRFC_Click"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnCheck_RFC" CssClass="btn btn-success" runat="server"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Aprovar" OnClick="btnRFC_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
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
                                            <asp:TextBox ID="txtCURP" runat="server" Visible="true"></asp:TextBox>

                                            <asp:LinkButton ID="btnVer_CURP" runat="server" CssClass="btn btn-secondary"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Ver" OnClick="btnClick"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnActualizar_CURP" CssClass="btn btn-warning" runat="server" ForeColor="White"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Solicitar actualizacion" OnClick="btnClick"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnCheck_CURP" CssClass="btn btn-success" runat="server"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Aprovar" OnClick="btnClick"><i class="bi bi-check-lg"></i></asp:LinkButton>
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
                                            <asp:TextBox ID="txtCNAP" runat="server" Visible="true"></asp:TextBox>

                                            <asp:LinkButton ID="btnVer_CNAP" runat="server" CssClass="btn btn-secondary"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Ver" OnClick="btnCNAP_Click"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnActualizar_CNAP" CssClass="btn btn-warning" runat="server" ForeColor="White"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Solicitar actualizacion" OnClick="btnCNAP_Click"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnCheck_CNAP" CssClass="btn btn-success" runat="server"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Aprovar" OnClick="btnCNAP_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
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
                                            <asp:TextBox ID="txtCompDom" runat="server" Visible="true"></asp:TextBox>

                                            <asp:LinkButton ID="btnVer_CompDom" runat="server" CssClass="btn btn-secondary"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Ver" OnClick="btnCompDom_Click"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnActualizar_CompDom" CssClass="btn btn-warning" runat="server" ForeColor="White"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Solicitar actualizacion" OnClick="btnCompDom_Click"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnCheck_CompDom" CssClass="btn btn-success" runat="server"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Aprovar" OnClick="btnCompDom_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
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
                                            <asp:TextBox ID="txtIRL" runat="server" Visible="true"></asp:TextBox>

                                            <asp:LinkButton ID="btnVer_IRL" runat="server" CssClass="btn btn-secondary"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Ver" OnClick="btnIRL_Click"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnActualizar_IRL" CssClass="btn btn-warning" runat="server" ForeColor="White"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Solicitar actualizacion" OnClick="btnIRL_Click"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnCheck_IRL" CssClass="btn btn-success" runat="server"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Aprovar" OnClick="btnIRL_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
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
                                            <asp:TextBox ID="txtPRL" runat="server" Visible="true"></asp:TextBox>

                                            <asp:LinkButton ID="btnVer_PRL" runat="server" CssClass="btn btn-secondary"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Ver" OnClick="btnPRL_Click"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnActualizar_PRL" CssClass="btn btn-warning" runat="server" ForeColor="White"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Solicitar actualizacion" OnClick="btnPRL_Click"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnCheck_PRL" CssClass="btn btn-success" runat="server"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Aprovar" OnClick="btnPRL_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
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
                                            <asp:TextBox ID="txtCTPAT" runat="server" Visible="true"></asp:TextBox>

                                            <asp:LinkButton ID="btnVer_CTPAT" runat="server" CssClass="btn btn-secondary"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Ver" OnClick="btnCTPAT_Click"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnActualizar_CTPAT" CssClass="btn btn-warning" runat="server" ForeColor="White"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Solicitar actualizacion" OnClick="btnCTPAT_Click"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnCheck_CTPAT" CssClass="btn btn-success" runat="server"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Aprovar" OnClick="btnCTPAT_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
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
                                            <asp:TextBox ID="txtOEA" runat="server" Visible="true"></asp:TextBox>

                                            <asp:LinkButton ID="btnVer_OEA" runat="server" CssClass="btn btn-secondary"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Ver" OnClick="btnOEA_Click"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnActualizar_OEA" CssClass="btn btn-warning" runat="server" ForeColor="White"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Solicitar actualizacion" OnClick="btnOEA_Click"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnCheck_OEA" CssClass="btn btn-success" runat="server"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Aprovar" OnClick="btnOEA_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
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
                                            <asp:TextBox ID="txtOP" runat="server" Visible="true"></asp:TextBox>

                                            <asp:LinkButton ID="btnVer_OP" runat="server" CssClass="btn btn-secondary"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Ver" OnClick="btnOP_Click"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnActualizar_OP" CssClass="btn btn-warning" runat="server" ForeColor="White"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Solicitar actualizacion" OnClick="btnOP_Click"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnCheck_OP" CssClass="btn btn-success" runat="server"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Aprovar" OnClick="btnOP_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
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
                                            <asp:TextBox ID="txtW9" runat="server" Visible="true"></asp:TextBox>

                                            <asp:LinkButton ID="btnVer_W9" runat="server" CssClass="btn btn-secondary"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Ver" OnClick="btnF43_Click"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnActualizar_W9" CssClass="btn btn-warning" runat="server" ForeColor="White"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Solicitar actualizacion" OnClick="btnF43_Click"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnCheck_W9" CssClass="btn btn-success" runat="server"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Aprovar" OnClick="btnF43_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
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

                                            <asp:LinkButton ID="btnVer_F5" runat="server" CssClass="btn btn-secondary"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Ver" OnClick="btnF5_Click"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnActualizar_F5" CssClass="btn btn-warning" runat="server" ForeColor="White"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Solicitar actualizacion" OnClick="btnF5_Click"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnCheck_F5" CssClass="btn btn-success" runat="server"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Aprovar" OnClick="btnF5_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
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
                                            <asp:LinkButton ID="btnVer_F14" runat="server" CssClass="btn btn-secondary"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Ver" OnClick="btnF14_Click"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnActualizar_F14" CssClass="btn btn-warning" runat="server" ForeColor="White"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Solicitar actualizacion" OnClick="btnF14_Click"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnCheck_F14" CssClass="btn btn-success" runat="server"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Aprovar" OnClick="btnF14_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
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
                                            <asp:LinkButton ID="btnVer_F12" runat="server" CssClass="btn btn-secondary"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Ver" OnClick="btnF12_Click"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnActualizar_F12" CssClass="btn btn-warning" runat="server" ForeColor="White"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Solicitar actualizacion" OnClick="btnF12_Click"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnCheck_F12" CssClass="btn btn-success" runat="server"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Aprovar" OnClick="btnF12_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
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
                                            <asp:LinkButton ID="btnVer_F43" runat="server" CssClass="btn btn-secondary"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Ver" OnClick="btnF43_Click"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnActualizar_F43" CssClass="btn btn-warning" runat="server" ForeColor="White"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Solicitar actualizacion" OnClick="btnF43_Click"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                            <asp:LinkButton ID="btnCheck_F43" CssClass="btn btn-success" runat="server"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Aprovar" OnClick="btnF43_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
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
                                            <asp:LinkButton ID="btnCheck_F16" CssClass="btn btn-success" runat="server"
                                                data-bs-toggle="tooltip"
                                                data-bs-placement="top"
                                                title="Aprovar" OnClick="btnCheck_F16_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
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
            <div class="col"></div>

        </div>
        <asp:Label ID="lblPrueba" runat="server" Text="..."></asp:Label>
        <div class="row">
            <div class="col" style="display: flex; justify-content: flex-start">
                <asp:LinkButton ID="btnRegresar" runat="server" CssClass="btn btn-secondary" OnClick="btnRegresar_Click"><i class="bi bi-chevron-left"></i>Regresar</asp:LinkButton>
            </div>
        </div>


    </div>




</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">

    <script type="text/javascript">

        $(document).ready(function () {
            const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
            const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
        });

    </script>

</asp:Content>
