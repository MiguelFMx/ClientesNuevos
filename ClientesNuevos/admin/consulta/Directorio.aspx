<%@ Page Title="Directorio" Language="C#" MasterPageFile="~/admin/Admint.Master" AutoEventWireup="true" CodeBehind="Directorio.aspx.cs" Inherits="ClientesNuevos.admin.consulta.Directorio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header cabezal">
                    <h5>Directorio</h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="tDirectorio" class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="display: none">ID</th>
                                    <th>Nombre comercial
                                        <br />
                                        <small class="text-secondary">RFC</small></th>
                                    <th>Nombre
                                        <br />
                                        <small class="text-secondary">Puesto</small>
                                    </th>
                                    <th width="10%">Correo</th>
                                    <th>Telefono</th>
                                    <th>Ext</th>
                                    <th>Celular</th>
                                    <th>Tipo</th>
                                    <th width="10%">Accion</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer d-flex justify-content-end">
                    <button type="button" class="btn btn-secondary btn-sm me-1" data-bs-toggle="modal" data-bs-target="#MailModal">
                        nuevo correo
                    </button>
                    <button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#ResgitrarContacto">
                        registrar contacto
                    </button>

                </div>
            </div>
        </div>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="CorreoIndividual"
        tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true"
        data-bs-backdrop="static" data-bs-keyboard="false">
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
                        <input type="text" class="form-control" id="txtAsunto" required>
                    </div>
                    <div class="mb-3">
                        <label for="txtCuerpo" class="col-form-label">Mensaje:</label>
                        <textarea class="form-control" id="txtCuerpo" required></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">cancelar</button>
                    <button type="button" class="btn btn-primary" id="btnSend">enviar correo <i class="bi bi-forward"></i></button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal correo -->
    <div class="modal" id="MailModal" tabindex="-1" aria-labelledby="MailModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog modal-xl ">
            <div class="modal-content">
                <div class="modal-header cabezal">
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
                                    <div class="row" style="max-height: 500px; overflow-y: auto;">
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
                                    <input type="text" name="txtAsuntoAll" class="form-control" value="" id="txtAsuntoAll" required />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label id="lblBody" for="txtBody" class="form-label">Mensaje:</label>
                                    <textarea id="txtBody" class="form-control" rows="10" required></textarea>
                                </div>
                            </div>
                            <label id="lblRes"></label>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" id="btnSendAll">Enviar <i class="bi bi-forward-fill"></i></button>
                </div>
            </div>
        </div>
    </div>

    <!-- modal registro -->
    <div class="modal fade" id="ResgitrarContacto" tabindex="-1" aria-labelledby="RegistrolLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
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

    <!--Modal de edicion -->
    <div class="modal fade" id="editarContacto" tabindex="-1" aria-labelledby="EditarLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title" id="EditarLabel">Editar contacto</span>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" id="txtTest" />
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/umd/popper.min.js"></script>
    <script src="../../Scripts/DataTables/datatables.min.js"></script>
    <script src="../template/vendors/nprogress/nprogress.js"></script>
    <script src="../template/asset/JS/TemplateJS.js"></script>
    <script src="../../Scripts/sweetalert2.all.min.js"></script>
    <script src="../template/asset/JS/DorectorioJS.js"></script>
</asp:Content>
