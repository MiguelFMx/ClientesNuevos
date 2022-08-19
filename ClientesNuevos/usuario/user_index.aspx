<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="user_index.aspx.cs" Inherits="ClientesNuevos.usuario.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <!-----------------------------------Nombre de la empresa---------------------------------- -->
        <div class="row">
            <div class="col">
                <asp:Label ID="lblCompania" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
        <br />
        <!-----------------------------------------------------------------------------Documentos-->
        <div class="row">
            <div class="col">
                <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="card border-primary">
                    <table class="table table-hover table-responsive">
                        <thead class="cabezal">
                            <tr>
                                <th>Documento</th>
                                <th>Estatus</th>
                                <th>Fecha de entrega</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>RFC</td>
                                <td>
                                    <span class="etiqueta pendiente">pendiente</span>
                                </td>
                                <td></td>
                                <td>
                                    <div class="btn-group" role="group" aria-label="rfc-group">
                                        <button type="button" id="btnActualizar" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="RFC"><i class="bi bi-upload"></i></button>
                                        <button type="button" class="btn btn-danger"><i class="bi bi-trash"></i></button>
                                        <button type="button" class="btn btn-warning"><i class="bi bi-eye"></i></button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>CIF</td>
                                <td>
                                    <span class="etiqueta pendiente">pendiente</span>

                                </td>
                                <td></td>
                                <td>
                                    <div class="btn-group" role="group" aria-label="cif-group">
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="Cedula de identificación fiscal"><i class="bi bi-upload"></i></button>
                                        <button type="button" class="btn btn-danger"><i class="bi bi-trash"></i></button>
                                        <button type="button" class="btn btn-secondary"><i class="bi bi-eye"></i></button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>CURP</td>
                                <td>
                                    <span class="etiqueta pendiente">pendiente</span>
                                </td>
                                <td></td>
                                <td>
                                    <div class="btn-group" role="group" aria-label="curp-group">
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="CURP"><i class="bi bi-upload"></i></button>
                                        <button type="button" class="btn btn-danger"><i class="bi bi-trash"></i></button>
                                        <button type="button" class="btn btn-secondary"><i class="bi bi-eye"></i></button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Carta de no antecedentes penales</td>
                                <td>
                                    <span class="etiqueta pendiente">pendiente</span>

                                </td>
                                <td></td>
                                <td>
                                    <div class="btn-group" role="group" aria-label="rfc-group">
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="Carta de no antecedentes penales"><i class="bi bi-upload"></i></button>
                                        <button type="button" class="btn btn-danger"><i class="bi bi-trash"></i></button>
                                        <button type="button" class="btn btn-secondary"><i class="bi bi-eye"></i></button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Comprobante de domicilio</td>
                                <td>
                                    <span class="etiqueta pendiente">pendiente</span>
                                </td>
                                <td></td>
                                <td>
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="Comprobante de domicilio"><i class="bi bi-upload"></i></button>

                                    <div class="btn-group" role="group" aria-label="rfc-group">
                                        <button type="button" class="btn btn-danger"><i class="bi bi-trash"></i></button>
                                        <button type="button" class="btn btn-secondary"><i class="bi bi-eye"></i></button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Identificacion de representante legal</td>
                                <td>
                                    <span class="etiqueta pendiente">pendiente</span>

                                </td>
                                <td></td>
                                <td>
                                    <div class="btn-group" role="group" aria-label="rfc-group">
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="Identificacion de representante legal"><i class="bi bi-upload"></i></button>
                                        <button type="button" class="btn btn-danger"><i class="bi bi-trash"></i></button>
                                        <button type="button" class="btn btn-secondary"><i class="bi bi-eye"></i></button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Poder de representante legal</td>
                                <td>
                                    <span class="etiqueta pendiente">pendiente</span>
                                </td>
                                <td></td>
                                <td>
                                    <div class="btn-group" role="group" aria-label="rfc-group">
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="Poder de representante legal"><i class="bi bi-upload"></i></button>
                                        <button type="button" class="btn btn-danger"><i class="bi bi-trash"></i></button>
                                        <button type="button" class="btn btn-secondary"><i class="bi bi-eye"></i></button>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td>Opinion positiva</td>
                                <td>
                                    <span class="etiqueta pendiente">Pendiente</span>
                                </td>
                                <td></td>
                                <td>
                                    <div class="btn-group" role="group" aria-label="rfc-group">
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="Opinion positiva"><i class="bi bi-upload"></i></button>
                                        <button type="button" class="btn btn-danger"><i class="bi bi-trash"></i></button>
                                        <button type="button" class="btn btn-secondary"><i class="bi bi-eye"></i></button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Crtificación C-TPAT</td>
                                <td>
                                    <span class="etiqueta pendiente">Pendiente</span>
                                </td>
                                <td></td>
                                <td>
                                    <div class="btn-group" role="group" aria-label="rfc-group">
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="Certificación C-TPAT"><i class="bi bi-upload"></i></button>
                                        <button type="button" class="btn btn-danger"><i class="bi bi-trash"></i></button>
                                        <button type="button" class="btn btn-secondary"><i class="bi bi-eye"></i></button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Certificacion OEA</td>
                                <td>
                                    <span class="etiqueta pendiente">Pendiente</span>
                                </td>
                                <td></td>
                                <td>
                                    <div class="btn-group" role="group" aria-label="rfc-group">
                                        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="Certificación OEA"><i class="bi bi-upload"></i></button>
                                        <button type="button" class="btn btn-danger"><i class="bi bi-trash"></i></button>
                                        <button type="button" class="btn btn-secondary"><i class="bi bi-eye"></i></button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot></tfoot>

                    </table>
                </div>
            </div>
        </div>
        <br />
        <!--Formularios-->
        <div class="row">
            <div class="col">
                <div class="card border-primary">
                    <table class="table table-hover table-responsive">
                        <thead class="cabezal">
                            <tr>
                                <th>Formulario</th>
                                <th>Estatus</th>
                                <th>Fecha de actualizacion</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Admision de cliente nuevo</td>
                                <td>
                                    <span class="etiqueta pendiente">pendiente</span>
                                </td>
                                <td>
                                    <label></label>
                                </td>
                                <td>
                                    <button id="btnRegistro" class="btn btn-success btn-sm" type="button">Llenar formulario</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Mapeo de flujo de carga</td>
                                <td>
                                    <span class="etiqueta pendiente">pendiente</span>
                                </td>
                                <td></td>
                                <td>
                                    <button id="btnMapeo" class="btn btn-success btn-sm" type="button">Llenar formulario</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Evaluacion de seguridad</td>
                                <td>
                                    <span class="etiqueta pendiente">pendiente</span>

                                </td>
                                <td></td>
                                <td>
                                    <button id="btnEvaluacion" class="btn btn-success btn-sm" type="button">Llenar formulario</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Carta compromiso</td>
                                <td>
                                    <span class="etiqueta pendiente">pendiente</span>

                                </td>
                                <td></td>
                                <td>
                                    <button id="btnCartaCompromiso" class="btn btn-success btn-sm" type="button">Llenar formulario</button>

                                </td>
                            </tr>
                        </tbody>
                        <tfoot></tfoot>
                    </table>
                </div>
            </div>
        </div>



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
                            <asp:Label ID="lblErr" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="btnCancelarFile">Cancelar</button>
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success" OnClick="btnGuardar_Click" UseSubmitBehavior="False" />
                        <%--<button type="button" class="btn btn-success">Guardar</button>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <script src="indexJS.js"></script>
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptsContent" runat="server">


</asp:Content>
