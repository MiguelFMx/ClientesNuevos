<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MapeoFlujo.aspx.cs" Inherits="ClientesNuevos.F43.MapeoFlujo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Mapeo de flujo</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col">
                <h4>Mapeo de flujo de carga y socios</h4>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <span id="error"></span>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="card border-warning">
                    <div class="table-responsive-xxl">
                        <table class="table table-hover" id="tMapeo">
                            <thead style="text-align: center">

                                <tr class="table-warning">
                                    <th colspan="9">Identificacion de clientes y procesos</th>
                                </tr>
                                <tr style="text-align: left;">
                                    <td colspan="5">
                                        <asp:Label ID="lblCliente" runat="server" Text="Cliente: " Font-Bold="True"></asp:Label>
                                    </td>
                                    <td colspan="1"></td>
                                    <td colspan="3">
                                        <asp:Label ID="lblFecha" runat="server" Text="Fecha: " Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="table-warning" style="font-size: 13px;">
                                    <th>#</th>
                                    <th>Proveedor
                                    <span>
                                        <i class="bi bi-question-circle"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="bottom"
                                            title="Proveedor: Nombre de socio de negocio que provee el servicio"></i>
                                    </span>
                                    </th>
                                    <th>Proceso
                                    <span>
                                        <i class="bi bi-question-circle"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="bottom"
                                            title="proceso: Parte del proceso de importación/exportación de mercancía que elabora el cliente"></i>
                                    </span>
                                    </th>
                                    <th>Movimiento
                                        <br />
                                        de carga
                                    <span>
                                        <i class="bi bi-question-circle"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="bottom"
                                            title="Movimiento de carga: Aclarar si en esta parte del proceso se hace algún movimiento de carga"></i>
                                    </span>
                                    </th>
                                    <th>Detalles
                                        <br />
                                        de proveedor
                                    <span>
                                        <i class="bi bi-question-circle"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="bottom"
                                            title="Detalles del proveedor: Anotar información relevante del proveedor. Por ejemplo: dirección, nombre de contacto, años trabajando con ellos, etc."></i>
                                    </span>
                                    </th>
                                    <th>Dias en que el cargamento esta en reposo
                                    <span>
                                        <i class="bi bi-question-circle"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="bottom"
                                            title="Días en reposo: Anotar los días en reposo de la carga. Días en reposo son los días que la carga se encuentra sin movimiento. En caso de no aplicar poner N/A"></i>
                                    </span>
                                    </th>
                                    <th>Modo
                                        <br />
                                        de transporte
                                    <span>
                                        <i class="bi bi-question-circle"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="bottom"
                                            title="Modo de transporte: Escriba el modo (o los modos de transporte) para mover las cargas. Por jemplo: avión, tractocamión, barco, etc."></i>
                                    </span>
                                    </th>
                                    <th>Si la entidad maneja la carga fisicamente,¿quién lo selecciona como proveedor?</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody style="border-color:#d9c790;">
                            </tbody>
                            <tfoot style="border-color:#d9c790;">
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
            <div class="col-9">
            </div>
            <div class="col">
                <button class="btn btn-secondary" id="btnHome" data-bs-toggle="tooltip"
                        data-bs-placement="top"
                        title="Guardar y salir" type="button" ><i class="bi bi-house-door"></i></button>
                &nbsp;&nbsp;
                <button class="btn btn-success" id="btnContinuar" type="button">Continuar <i class="bi bi-chevron-double-right"></i></button>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        
    </script>
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptsContent" ID="content3" runat="server">
    <script src="MapeoFlujoJS.js"></script>
</asp:Content>