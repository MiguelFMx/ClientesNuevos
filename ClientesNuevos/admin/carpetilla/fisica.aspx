<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="fisica.aspx.cs" Inherits="ClientesNuevos.admin.carpetilla.fisica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        
        <div class="row" style="padding:1em 0 1em 0;">
            <div class="col">
                <asp:Label ID="lblCompania" runat="server" Text="Carpetilla de " Font-Size="20px"></asp:Label>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <div class="card">

                        <table class="table table-striped table-bordered">
                            <thead class="cabezal" style="text-align: center;">
                                <tr>
                                    <th>Documento</th>
                                    <th>Estatus</th>
                                    <th>Fecha</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>RFC</td>
                                    <td>
                                        <div style="display: flex; justify-content: center">
                                            <asp:Label ID="lblRFC_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblRFC_fecha" runat="server" Text="--/--/----"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnVer_Acta" runat="server" CssClass="btn btn-secondary btn-sm"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Ver"><i class="bi bi-folder2-open"></i></asp:LinkButton>
                                        <asp:LinkButton ID="btnActualizar_Acta" CssClass="btn btn-warning btn-sm" runat="server" ForeColor="White"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>
                                        <asp:LinkButton ID="btnCheck_Acta" CssClass="btn btn-success btn-sm" runat="server"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Aprovar"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>CURP</td>
                                    <td>
                                        <div style="display: flex; justify-content: center">
                                            <asp:Label ID="lblCURP_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblCURP_fecha" runat="server" Text="--/--/----"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnVer_CURP" runat="server" CssClass="btn btn-secondary btn-sm"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Ver" OnClick="btnClick"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnActualizar_CURP" CssClass="btn btn-warning btn-sm" runat="server" ForeColor="White"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Solicitar actualizacion" OnClick="btnClick"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnCheck_CURP" CssClass="btn btn-success btn-sm" runat="server"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Aprovar" OnClick="btnClick"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Carta de no antecedentes penales</td>
                                    <td>
                                        <div style="display: flex; justify-content: center">
                                            <asp:Label ID="lblCNAP_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblCNAP_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>

                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnVer_CNAP" runat="server" CssClass="btn btn-secondary btn-sm"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Ver"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnActualizar_CNAP" CssClass="btn btn-warning btn-sm" runat="server" ForeColor="White"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnCheck_CNAP" CssClass="btn btn-success btn-sm" runat="server"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Aprovar"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Comprobante de domicilio</td>
                                    <td>
                                        <div style="display: flex; justify-content: center">
                                            <asp:Label ID="lblCompDom_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblCompDom_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>

                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnVer_CompDom" runat="server" CssClass="btn btn-secondary btn-sm"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Ver"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnActualizar_CompDom" CssClass="btn btn-warning btn-sm" runat="server" ForeColor="White"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnCheck_CompDom" CssClass="btn btn-success btn-sm" runat="server"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Aprovar"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                    </td>

                                </tr>
                                <tr>
                                    <td>Identificacion de representante legal</td>
                                    <td>
                                        <div style="display: flex; justify-content: center">
                                            <asp:Label ID="lblIRL_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblIRL_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnVer_IRL" runat="server" CssClass="btn btn-secondary btn-sm"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Ver"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnActualizar_IRL" CssClass="btn btn-warning btn-sm" runat="server" ForeColor="White"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnCheck_IRL" CssClass="btn btn-success btn-sm" runat="server"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Aprovar"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                    </td>

                                </tr>
                                <tr>
                                    <td>Poder del representante legal</td>
                                    <td>
                                        <div style="display: flex; justify-content: center">
                                            <asp:Label ID="lblPRL_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblPRL_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>

                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnVer_PRL" runat="server" CssClass="btn btn-secondary btn-sm"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Ver"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnActualizar_PRL" CssClass="btn btn-warning btn-sm" runat="server" ForeColor="White"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnCheck_PRL" CssClass="btn btn-success btn-sm" runat="server"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Aprovar"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Certificación C-TPAT</td>
                                    <td>
                                        <div style="display: flex; justify-content: center">
                                            <asp:Label ID="lblCTPAT_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblCTPAT_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>

                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnVer_CTPAT" runat="server" CssClass="btn btn-secondary btn-sm"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Ver"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnActualizar_CTPAT" CssClass="btn btn-warning btn-sm" runat="server" ForeColor="White"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnCheck_CTPAT" CssClass="btn btn-success btn-sm" runat="server"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Aprovar"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Certificación OEA</td>
                                    <td>
                                        <div style="display: flex; justify-content: center">
                                            <asp:Label ID="lblOEA_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblOEA_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>

                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnVer_OEA" runat="server" CssClass="btn btn-secondary btn-sm"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Ver"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnActualizar_OEA" CssClass="btn btn-warning btn-sm" runat="server" ForeColor="White"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnCheck_OEA" CssClass="btn btn-success btn-sm" runat="server"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Aprovar"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Opinion positiva</td>
                                    <td>
                                        <div style="display: flex; justify-content: center">
                                            <asp:Label ID="lblOP_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblOP_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>

                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnVer_OP" runat="server" CssClass="btn btn-secondary btn-sm"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Ver"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnActualizar_OP" CssClass="btn btn-warning btn-sm" runat="server" ForeColor="White"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnCheck_OP" CssClass="btn btn-success btn-sm" runat="server"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Aprovar"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Evaluación de seguridad(F-5)</td>
                                    <td>
                                        <div style="display: flex; justify-content: center">
                                            <asp:Label ID="lblF5_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblF5_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>

                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnVer_F5" runat="server" CssClass="btn btn-secondary btn-sm"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Ver"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnActualizar_F5" CssClass="btn btn-warning btn-sm" runat="server" ForeColor="White"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnCheck_F5" CssClass="btn btn-success btn-sm" runat="server"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Aprovar"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Admisión de cliente nuevo(F-14)</td>
                                    <td>
                                        <div style="display: flex; justify-content: center">
                                            <asp:Label ID="lblF14_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblF14_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnVer_F14" runat="server" CssClass="btn btn-secondary btn-sm"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Ver"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnActualizacion_F14" CssClass="btn btn-warning btn-sm" runat="server" ForeColor="White"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnCheck_F14" CssClass="btn btn-success btn-sm" runat="server"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Aprovar"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                    </td>

                                </tr>
                                <tr>
                                    <td>Evaluación In-situ(F-16)</td>
                                    <td>
                                        <div style="display: flex; justify-content: center">
                                            <asp:Label ID="lblF16_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblF16_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Politica de seguridad C-TPAT (F-12)</td>
                                    <td>
                                        <div style="display: flex; justify-content: center">
                                            <asp:Label ID="lblF12_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblF12_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnVer_F12" runat="server" CssClass="btn btn-secondary btn-sm"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Ver"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnActualizar_F12" CssClass="btn btn-warning btn-sm" runat="server" ForeColor="White"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnCheck_F12" CssClass="btn btn-success btn-sm" runat="server"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Aprovar"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Criterios minimos de seguridad C-TPAT (F-20)</td>
                                    <td>
                                        <div style="display: flex; justify-content: center">
                                            <asp:Label ID="lblF20_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblF20_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Mapeo de flujo de carga(F-43)</td>
                                    <td>
                                        <div style="display: flex; justify-content: center">
                                            <asp:Label ID="lblF43_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblF43_fecha" runat="server" Text="--/--/----" CssClass=""></asp:Label>

                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnVer_F43" runat="server" CssClass="btn btn-secondary btn-sm"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Ver"><i class="bi bi-folder2-open"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnActuaizar_F43" CssClass="btn btn-warning btn-sm" runat="server" ForeColor="White"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Solicitar actualizacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                                        <asp:LinkButton ID="btnCheck_F43" CssClass="btn btn-success btn-sm" runat="server"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="top"
                                            title="Aprovar"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <asp:Label ID="lblPrueba" runat="server" Text="..."></asp:Label>
        <div class="row">
            <div class="col" style="display: flex; justify-content: flex-start">
                <asp:LinkButton ID="btnRegresar" runat="server" CssClass="btn btn-secondary" OnClick="btnRegresar_Click"><i class="bi bi-chevron-left"></i>Regresar</asp:LinkButton>
            </div>
        </div>
    </div>

    <script type="text/javascript">

        $(document).ready(function () {
            const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
            const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
        });

    </script>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
