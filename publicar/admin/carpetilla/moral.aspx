<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="moral.aspx.cs" Inherits="ClientesNuevos.admin.carpetilla.carpetilla" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <h3>Carpetilla</h3>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <asp:Label ID="lblCompania" runat="server" Text="Compania"></asp:Label>
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
                                    <td>Acta constitutiva</td>
                                    <td>
                                        <div style="display: flex; justify-content: center">
                                            <asp:Label ID="lblEstatus_Acta" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblFecha_Acta" runat="server" Text="..."></asp:Label>
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
                                    <td>CIF</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Comprobante de domicilio</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Identificación d representante legal</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <td>Poder del representante legal</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <td>Mapeo de flujo de carga(F-43)</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <td>Admisión de cliente nuevo(F-14)</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Evaluación de seguridad(F-5)</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>

                                </tr>
                                <tr>
                                    <td>Cartificación C-TPAT</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Certificación OEA</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Opinión positiva</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Evaluación In-situ(F-16)</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Politica de seguridad C-TPAT (F-12)</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>Criterios minimos de seguridad C-TPAT (F-20)</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
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
