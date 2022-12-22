<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="user_index.aspx.cs" Inherits="ClientesNuevos.usuario.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <div class="row">
            <div class="col">
            <div class="col">
                <asp:Panel ID="AlertResultado" runat="server" Visible="False">
                    <div class="alert alert-success" role="alert">
                        <div class="row">
                            <div class="col" style="display: flex; justify-content: center;">
                                <asp:Label ID="lblAlert" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="col-2" style="display: flex; justify-content: flex-end;">
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>

            <!-----------------------------------Nombre de la empresa---------------------------------- -->
            <div class="row">
                <div class="col">
                    <asp:Label ID="lblcomp" runat="server" Text="Compañia:"></asp:Label>
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
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
            <div class="row" style="margin-bottom: 1em;">
                <div class="col">
                    <div class="card border-primary">
                        <div class="table-responsive">
                            <asp:Table ID="Table1" runat="server" CssClass="table table-hover">
                                <asp:TableHeaderRow TableSection="TableHeader" CssClass="cabezal">
                                    <asp:TableHeaderCell>Documento</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Estatus</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Fecha de entrega</asp:TableHeaderCell>
                                    <asp:TableHeaderCell>Acciones</asp:TableHeaderCell>
                                </asp:TableHeaderRow>

                                <%-- Cambio  --%>

                                <%-- =========================Acta constitutiva ================== --%>
                                <asp:TableRow ID="row_AC">
                                    <asp:TableCell>Acta constitutiva</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblAC_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>

                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblAC_fecha" runat="server" Text="--/--/----"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtAC" runat="server" Visible="false"></asp:TextBox>
                                        <div class="btn-group" role="group" aria-label="ac-group">
                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="Acta constitutiva"><i class="bi bi-upload"></i></button>
                                            <asp:LinkButton ID="AC_borrar" runat="server" CssClass="btn btn-danger disabled" Enabled="false"  OnClick="Borrar_Click"><i class="bi bi-trash"></i></asp:LinkButton>

                                            <asp:LinkButton ID="AC_ver" runat="server" CssClass="btn btn-secondary disabled" Enabled="false" OnClick="Ver_Click"><i class="bi bi-eye"></i></asp:LinkButton>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <%-- ============== W9 =========================================== --%>
                                <asp:TableRow ID="row_W9">
                                    <asp:TableCell>W9</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblW9_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>

                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblW9_fecha" runat="server" Text="--/--/----"></asp:Label>

                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtW9" runat="server" Visible="false"></asp:TextBox>

                                        <div class="btn-group" role="group" aria-label="w9-group">
                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="W9"><i class="bi bi-upload"></i></button>
                                            <asp:LinkButton ID="W9_borrar" runat="server" CssClass="btn btn-danger disabled" Enabled="false" OnClick="Borrar_Click"><i class="bi bi-trash"></i></asp:LinkButton>

                                            <asp:LinkButton ID="W9_ver" runat="server" CssClass="btn btn-secondary disabled" Enabled="false" OnClick="Ver_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <%-- ============RFC============================================== --%>
                                <asp:TableRow ID="row_RFC">
                                    <asp:TableCell>RFC</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblRFC_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblRFC_fecha" runat="server" Text="--/--/----"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtRFC" runat="server" Visible="false"></asp:TextBox>

                                        <div class="btn-group" role="group" aria-label="rfc-group">
                                            <button type="button" id="btnActualizar" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="RFC"><i class="bi bi-upload"></i></button>
                                            <asp:LinkButton ID="RFC_borrar" runat="server" CssClass="btn btn-danger disabled" OnClick="Borrar_Click" Enabled="false"><i class="bi bi-trash"></i></asp:LinkButton>
                                            <asp:LinkButton ID="RFC_ver" runat="server" CssClass="btn btn-secondary disabled" OnClick="Ver_Click" Enabled="false"><i class="bi bi-eye"></i></asp:LinkButton>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <%-- ================CURP=============================== --%>
                                <asp:TableRow ID="row_CURP">
                                    <asp:TableCell>
                                        CURP
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblCURP_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblCURP_fecha" runat="server" Text="--/--/----"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtCURP" runat="server" Visible="false"></asp:TextBox>

                                        <div class="btn-group" role="group" aria-label="curp-group">
                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="CURP"><i class="bi bi-upload"></i></button>
                                            <asp:LinkButton ID="CURP_borrar" runat="server" CssClass="btn btn-danger disabled" Enabled="false" OnClick="Borrar_Click"><i class="bi bi-trash"></i></asp:LinkButton>
                                            <asp:LinkButton ID="CURP_ver" runat="server" CssClass="btn btn-secondary disabled" Enabled="false" OnClick="Ver_Click"><i class="bi bi-eye"></i></asp:LinkButton>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <%-- =============== CNAP ============================= --%>
                                <asp:TableRow ID="row_CNAP">
                                    <asp:TableCell>Carta de no antecedentes penales</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblCNAP_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblCNAP_fecha" runat="server" Text="--/--/----"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtCNAP" runat="server" Visible="false"></asp:TextBox>

                                        <div class="btn-group" role="group" aria-label="cnap-group">
                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="Carta de no antecedentes penales"><i class="bi bi-upload"></i></button>
                                            <asp:LinkButton ID="CNAP_borrar" runat="server" Enabled="false" CssClass="btn btn-danger disabled" OnClick="Borrar_Click"><i class="bi bi-trash"></i></asp:LinkButton>

                                            <asp:LinkButton ID="CNAP_ver" runat="server" Enabled="false" CssClass="btn btn-secondary disabled" OnClick="Ver_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <%-- ============================= Comprobante de domicilio ============ --%>
                                <asp:TableRow ID="row_CompDom">
                                    <asp:TableCell>Comprobante de domicilio</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblCompDom_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblCompDom_fecha" runat="server" Text="--/--/----"></asp:Label>

                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtCompDom" runat="server" Visible="false"></asp:TextBox>

                                        <div class="btn-group" role="group" aria-label="cp-group">
                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="Comprobante de domicilio"><i class="bi bi-upload"></i></button>
                                            <asp:LinkButton ID="CompDom_borrar" runat="server" CssClass="btn btn-danger disabled" Enabled="false" OnClick="Borrar_Click"><i class="bi bi-trash"></i></asp:LinkButton>
                                            <asp:LinkButton ID="CompDom_ver" runat="server" CssClass="btn btn-secondary disabled" Enabled="false" OnClick="Ver_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <%-- ============== Identificacion de representante legal =========== --%>
                                <asp:TableRow ID="row_IRL">
                                    <asp:TableCell>Identificacion de representante legal</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblIRL_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblIRL_fecha" runat="server" Text="--/--/----"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtIRL" runat="server" Visible="false"></asp:TextBox>

                                        <div class="btn-group" role="group" aria-label="irl-group">
                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="Identificacion de representante legal"><i class="bi bi-upload"></i></button>
                                            <asp:LinkButton ID="IRL_borrar" runat="server" CssClass="btn btn-danger disabled" Enabled="false" OnClick="Borrar_Click"><i class="bi bi-trash"></i></asp:LinkButton>                                           
                                            <asp:LinkButton ID="IRL_ver" runat="server" CssClass="btn btn-secondary disabled" Enabled="false" OnClick="Ver_Click"><i class="bi bi-eye"></i></asp:LinkButton>
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <%-- ============== Poder de representante legal ============================= --%>
                                <asp:TableRow ID="row_PRL">
                                    <asp:TableCell>Poder de representante legal</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblPRL_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>

                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblPRL_fecha" runat="server" Text="--/--/----"></asp:Label>

                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtPRL" runat="server" Visible="false"></asp:TextBox>

                                        <div class="btn-group" role="group" aria-label="prl-group">
                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="Poder de representante legal"><i class="bi bi-upload"></i></button>
                                            <asp:LinkButton ID="PRL_borrar" runat="server" CssClass="btn btn-danger disabled" Enabled="false" OnClick="Borrar_Click"><i class="bi bi-trash"></i></asp:LinkButton>                                            
                                            <asp:LinkButton ID="PRL_ver" runat="server" CssClass="btn btn-secondary disabled" Enabled="false" OnClick="Ver_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <%-- ==================== Opinion positiva===================== --%>
                                <asp:TableRow ID="row_OP">
                                    <asp:TableCell>Opinion positiva</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblOP_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblOP_fecha" runat="server" Text="--/--/----"></asp:Label>

                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtOP" runat="server" Visible="false"></asp:TextBox>

                                        <div class="btn-group" role="group" aria-label="op-group">
                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="Opinion positiva"><i class="bi bi-upload"></i></button>
                                            <asp:LinkButton ID="OP_borrar" runat="server" CssClass="btn btn-danger disabled" Enabled="false" OnClick="Borrar_Click"><i class="bi bi-trash"></i></asp:LinkButton>                                            
                                            <asp:LinkButton ID="OP_ver" runat="server" CssClass="btn btn-secondary disabled" Enabled="false" OnClick="Ver_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <%-- ===================== CTPAT============================= --%>
                                <asp:TableRow ID="row_CTPAT">
                                    <asp:TableCell>Certificacion C-TPAT</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblCTPAT_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>

                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblCTPAT_fecha" runat="server" Text="--/--/----"></asp:Label>
                                        
                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtCTPAT" runat="server" Visible="false"></asp:TextBox>

                                        <div class="btn-group" role="group" aria-label="ctpat-group">
                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="Certificación C-TPAT"><i class="bi bi-upload"></i></button>
                                            <asp:LinkButton ID="CTPAT_borrar" runat="server" CssClass="btn btn-danger disabled" Enabled="false" OnClick="Borrar_Click"><i class="bi bi-trash"></i></asp:LinkButton>                                            
                                            <asp:LinkButton ID="CTPAT_ver" runat="server" CssClass="btn btn-secondary disabled" Enabled="false" OnClick="Ver_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                                <%-- ============ OEA ==================================== --%>
                                <asp:TableRow ID="row_OEA">
                                    <asp:TableCell>Certificacion OEA</asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblOEA_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>

                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:Label ID="lblOEA_fecha" runat="server" Text="--/--/----"></asp:Label>

                                    </asp:TableCell>
                                    <asp:TableCell>
                                        <asp:TextBox ID="txtOEA" runat="server" Visible="false"></asp:TextBox>

                                        <div class="btn-group" role="group" aria-label="oea-group">
                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#UploadDoc" data-bs-type="Certificación OEA"><i class="bi bi-upload"></i></button>
                                            <asp:LinkButton ID="OEA_borrar" runat="server" CssClass="btn btn-danger disabled" Enabled="false" OnClick="Borrar_Click"><i class="bi bi-trash"></i></asp:LinkButton>                                            
                                            <asp:LinkButton ID="OEA_ver" runat="server" CssClass="btn btn-secondary disabled" Enabled="false" OnClick="Ver_Click"><i class="bi bi-eye"></i></asp:LinkButton>

                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>

                        </div>
                    </div>
                </div>
            </div>
                    </ContentTemplate>
            </asp:UpdatePanel>
            <!--Formularios-->
            <div class="row">
                <div class="col">
                    <div class="card border-primary">
                        <div class="table-responsive">
                            <table class="table table-hover">
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
                                        <td>Admision de cliente nuevo (F-14)</td>
                                        <td>
                                            <asp:Label ID="lblF14_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>

                                        </td>
                                        <td>

                                            <asp:Label ID="lblF14_fecha" runat="server" Text="--/--/----"></asp:Label>

                                        </td>
                                        <td>
                                            <asp:Button ID="btnRegistro" runat="server" Text="Llenar formulario" CssClass="btn btn-success" OnClick="btnRegistro_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Mapeo de flujo de carga (F-43)</td>
                                        <td>
                                            <asp:Label ID="lblF43_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>

                                        </td>
                                        <td>
                                            <asp:Label ID="lblF43_fecha" runat="server" Text="--/--/----"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Button ID="btnMapeo" runat="server" Text="Llenar formulario" CssClass="btn btn-success" OnClick="btnMapeo_Click" />
                                            <%--<button id="btnMapeo" class="btn btn-success btn-sm" type="button">Llenar formulario</button>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Evaluacion de seguridad (F-5)</td>
                                        <td>
                                            <asp:Label ID="lblF5_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblF5_fecha" runat="server" Text="--/--/----"></asp:Label>
                                        </td>
                                        <td>
                                            <%--<button id="btnEvaluacion" class="btn btn-success btn-sm" type="button">Llenar formulario</button>--%>
                                            <asp:Button ID="btnEvaluacion" CssClass="btn btn-success " runat="server" Text="Llenar formulario" OnClick="btnEvaluacion_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Carta compromiso (F-12)</td>
                                        <td>
                                            <asp:Label ID="lblF12_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblF12_fecha" runat="server" Text="--/--/----"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Button ID="btnCartaCompromiso" CssClass="btn btn-success " runat="server" Text="Llenar formulario" OnClick="btnCartaCompromiso_Click" Enabled ="false" />

                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Criterios minimos de seguridad C-TPAT (F-20)</td>
                                        <td>
                                            <asp:Label ID="lblF20_estatus" runat="server" Text="pendiente" CssClass="etiqueta pendiente"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblF20_fecha" runat="server" Text="--/--/----"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Button ID="btnCriteriosMinimos" CssClass="btn btn-success " runat="server" Text="    Leer criterios    " OnClick="btnCriteriosMinimos_Click" />

                                        </td>
                                    </tr>
                                </tbody>
                                <tfoot></tfoot>
                            </table>
                        </div>
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
                                <asp:Label ID="lblErr" runat="server" Text="" ForeColor="red"></asp:Label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="btnCancelarFile">Cancelar</button>
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" UseSubmitBehavior="False" Visible="False" />
                            <button type="button" class="btn btn-success" id="btnPrueba">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
    </div>

    
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../Scripts/sweetalert2.all.min.js"></script>
    <script src="indexJS.js"></script>
</asp:Content>
