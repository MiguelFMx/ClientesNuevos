<%@ Page Title="Directorio" Language="C#" MasterPageFile="~/admin/Admint.Master" AutoEventWireup="true" CodeBehind="Directorio.aspx.cs" Inherits="ClientesNuevos.admin.consulta.Directorio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
    
    <div class="row">
        <div class="col"></div>
    </div>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header cabezal">
                    <h5>Directorio</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <div class="table-responsive">
                                <table id="tDirectorio" class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>RFC</th>
                                            <th>Socio comercial</th>
                                            <th>Nombre</th>
                                            <th>Puesto</th>
                                            <th width="15%">Correo</th>
                                            <th>Telefono</th>
                                            <th>Ext</th>
                                            <th>Celular</th>
                                            <th>Tipo</th>
                                            <th>Accion</th>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row pt-2">
        <div class="col">

            <button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#MailModal">
                nuevo correo
            </button>

            <%--<asp:LinkButton ID="bntNuevoCorreo" runat="server" CausesValidation="false" CssClass="btn btn-secondary btn-sm"><i class="bi bi-envelope"></i> enviar correo</asp:LinkButton>--%>
        </div>
    </div>

</div>
    <!-- Modal -->



    <div class="modal fade" id="CorreoIndividual" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true"
        data-bs-backdrop="static" data-bs-keyboard="false" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header cabezal">
                    <h1 class="modal-title fs-5" id="CorreoIndividuallLabel">Nuevo correo</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="txtCorreo" class="col-form-label">Nombre:</label>
                        <input type="text" class="form-control" id="txtRemitente">
                        <label for="txtAsunto" class="col-form-label">Para:</label>

                        <input type="text" class="form-control" id="txtCorreo">
                    </div>
                    <div class="mb-3">
                        <label for="txtAsunto" class="col-form-label">Asunto:</label>
                        <input type="text" class="form-control" id="txtAsunto">
                    </div>
                    <div class="mb-3">
                        <label for="txtCuerpo" class="col-form-label">Mensaje:</label>
                        <textarea class="form-control" id="txtCuerpo"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">cancelar</button>
                    <button type="button" class="btn btn-primary" id="btnSend">enviar correo</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal correo -->
    <div class="modal" id="MailModal" tabindex="-1" aria-labelledby="MailModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="MailModalLabel">Enviar multiples correos</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                       
                    <div class="row">
                        <div class="col-5">
                            <br />
                            <div class="card">
                                <div class="card-body">
                                    <div id="Directorio" style="max-height: 500px; overflow-y: auto;"></div>
                                    <div class="row"  style="max-height: 500px; overflow-y: auto;">
                                        <table id="tDir" class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Informacion</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-7">
                            <div class="row">
                                <div class="col">
                                    <label id="lblAsuntoAll" for="txtAsuntoAll" class="form-label">Asunto:</label>
                                    <input type="text" name="txtAsuntoAll" class="form-control" value="" id="txtAsuntoAll" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label id="lblBody" for="txtBody" class="form-label">Mensaje:</label>
                                    <textarea id="txtBody" class="form-control" rows="10"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" id="btnSendAll">Enviar</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/bootstrap.bundle.min.js"></script>
    <script src="../../Scripts/umd/popper.min.js"></script>
    <script src="../../Scripts/DataTables/datatables.min.js"></script>
    <script src="../template/vendors/nprogress/nprogress.js"></script>
    <script src="../../Scripts/sweetalert2.all.min.js"></script>
    <script src="../template/asset/JS/DorectorioJS.js"></script>
</asp:Content>
