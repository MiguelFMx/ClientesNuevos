﻿<%@ Page Title="Programa de seguridad" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InformacionCadenaSuministro.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.InformacionCadenaSuministro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .hiddencol {
            display: none;
        }
    </style>

    <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>

    <link href="../../template/assets/css/paginacion.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <div class="row">
            <div id="wizard" class="form_wizard wizard_horizontal">
                <ul class="wizard_steps">
                    <li>
                        <asp:HyperLink ID="step1" runat="server" NavigateUrl="~/F14/Secciones/InformacionCompania.aspx" CssClass="done">
                            <asp:Label ID="lblstep1" runat="server" Text="1" CssClass="step_no"></asp:Label>
                            <asp:Label ID="lblDesc1" runat="server" Text="<%$Resources:AgentesAduanales, lblPaso1 %>"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub1" runat="server" Text="<%$Resources:AgentesAduanales, lblDesc1 %>" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step2" runat="server" CssClass="done" NavigateUrl="~/F14/Secciones/AgentesAduanales.aspx">
                            <asp:Label ID="lblstep2" runat="server" Text="2" CssClass="step_no"></asp:Label>
                            <asp:Label ID="lblDesc2" runat="server" Text="<%$Resources:AgentesAduanales, lblPaso2 %>"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub2" runat="server" Text="<%$Resources:AgentesAduanales, lblDesc2 %>" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step3" runat="server" NavigateUrl="~/F14/Secciones/CompaniaFilial.aspx" CssClass="done">
                            <asp:Label ID="lblstep3" runat="server" Text="3" CssClass="step_no"></asp:Label>
                            <asp:Label ID="lblDesc3" runat="server" Text="<%$Resources:AgentesAduanales, lblPaso3 %>"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub3" runat="server" Text="<%$Resources:AgentesAduanales, lblDesc3 %>" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step4" runat="server" NavigateUrl="~/F14/Secciones/TipoServicioProductos.aspx" CssClass="done">
                            <asp:Label ID="lblstep4" runat="server" Text="4" CssClass="step_no"></asp:Label>

                            <asp:Label ID="lblDesc4" runat="server" Text="<%$Resources:AgentesAduanales, lblPaso4 %>"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub4" runat="server" Text="<%$Resources:AgentesAduanales, lblDesc4 %>" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step5" runat="server" NavigateUrl="#" CssClass="selected">
                            <asp:Label ID="lblstep5" runat="server" Text="5" CssClass="step_no"></asp:Label>
                            <asp:Label ID="lblDesc5" runat="server" Text="<%$Resources:AgentesAduanales, lblPaso5 %>"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub5" runat="server" Text="<%$Resources:AgentesAduanales, lblDesc5 %>" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                </ul>
            </div>

        </div>

        <br />
        <span id="errorRadio"></span>
        <!--============================================================== Alert ======================================================================= -->
        <asp:Panel ID="pAlert" runat="server" Visible="false">
            <div class="row">
                <div class="col">
                    <div class="alert alert-success" role="alert">
                        <div class="row">
                            <div class="col">
                                <h5 class="alert-heading"><i class="bi bi-check-circle-fill"></i>Exito</h5>
                            </div>
                            <div class="col" style="display: flex; justify-content: flex-end;">
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" />
                            </div>
                        </div>
                        <div class="row">
                            <asp:Label ID="lblExito" runat="server" Text="Se ha registrado la información con exito"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <!-- ============================= fieldset Información de programa de cadena de suministro=================================================== -->
        <div class="row">
            <div class="col">
                <div class="card rounded-0">
                    <div class="card-header cabezal rounded-0">
                        <span>
                            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:AgentesAduanales, lblDesc5 %>"></asp:Literal></span>
                    </div>
                    <div class="card-body">

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-4">
                                        <label for="ddstatus" class="form-label">C-TPAT status</label>

                                        <asp:DropDownList ID="ddstatus" runat="server" CssClass="form-select rounded-0" AutoPostBack="True" OnSelectedIndexChanged="ddstatus_SelectedIndexChanged">
                                            <asp:ListItem Value="0" Text="<%$Resources:Certificacion, lblNinguno %>"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="<%$Resources:Certificacion, lblCertificadoNoVal %>"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="<%$Resources:Certificacion, lblCertificadoValidado %>"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row" id="divFecha" runat="server" >
                                    <div class="col-4">
                                        <label for="txtCTPATCuenta">C-TPAT SVI</label>
                                        <%--<input type="text" name="txtCTPATSVI" value="" id="txtCTPATSVI" class="form-control" />--%>
                                        <asp:TextBox ID="txtCTPATCuenta" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:Label ID="lblcuentaVal" Visible="false" runat="server" CssClass="text-danger" Text="*Llene este campo"></asp:Label>
                                    </div>
                                    <div class="col-4">
                                        <asp:Label ID="Label1" CssClass="form-label" runat="server" Text="<%$Resources:Certificacion,lblFecha %>"></asp:Label>
                                        <asp:TextBox ID="dtFechaVal" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                        <asp:Label ID="lblfechaVal" Visible="false" runat="server" CssClass="text-danger" Text="*El año no puede ser menor del 2000"></asp:Label>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <hr />
                        <div class="row">
                            <div class="col">
                                <asp:HiddenField ID="hfOpcion" runat="server" />
                                <asp:Label ID="lblPregunta" runat="server" Text="<%$Resources:Certificacion, lblPregunta %>"></asp:Label>
                                <br />
                                <div class="form-check form-check-inline">
                                    <input type="radio" name="radCertificado" value="si" id="radCertificadoSi" class="form-check-input" runat="server" />
                                    <asp:Label ID="lblSI" runat="server" Text="<%$Resources:Certificacion, lblSI %>"></asp:Label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="radio" name="radCertificado" value="no" id="radCertificadoNo" class="form-check-input" runat="server" />
                                    <label for="radCertificadoNo">No</label>
                                </div>
                                <asp:Label Text="<%$Resources:Certificacion, lblErrorOpcion %>" ID="lblOpciones" ForeColor="Red" Visible="false" runat="server" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col d-flex justify-content-end">
                                <asp:LinkButton ID="btnRgistrar" runat="server" CssClass="btn btn-success" OnClick="btnRgistrar_Click">
                                    <asp:Literal ID="Literal3" runat="server" Text="<%$Resources:InformacionCompania,lblRegistrar  %>"></asp:Literal></asp:LinkButton>
                                <asp:LinkButton ID="btnAdminSave" runat="server" Visible="false" OnClick="btnAdminSave_Click1"
                                    CssClass="btn btn-success">registrar</asp:LinkButton>
                            </div>
                        </div>
                        <hr />

                        <asp:Panel ID="pV2" runat="server" Visible="false">

                            <div class="row">

                                <div class="col-md">
                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="lblDescripcion" runat="server" Text="<%$Resources:Certificacion,lblDescripcion %>" CssClass="form-label"></asp:Label>
                                            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<%$Resources:Certificacion, lblErrorDesc %>" ControlToValidate="txtDescripcion" ValidationGroup="documento"></asp:RequiredFieldValidator>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                </div>
                                <div class="col-md">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <ContentTemplate>
                                            <asp:Label ID="lblCodigo" runat="server" Text="<%$Resources:Certificacion, lblCodigo %>" CssClass="form-label"></asp:Label>
                                            <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<%$Resources:Certificacion,lblErrorDesc %>" ControlToValidate="txtCodigo" ValidationGroup="documento"></asp:RequiredFieldValidator>
                                        
                                    <asp:HiddenField ID="hfID" runat="server" />
                                    <asp:HiddenField ID="hfRuta" runat="server" />

                                        </ContentTemplate>
                                    </asp:UpdatePanel>

                                </div>
                                <div class="col-md">
                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                        <ContentTemplate>
                                    <asp:Label ID="lblCertificado" runat="server" Text="<%$Resources:Certificacion,lblCertificado %>" CssClass="form-label"></asp:Label>
                                    <asp:FileUpload ID="fileCertificado" runat="server" CssClass="form-control" accept="application/pdf"/>
                                             </ContentTemplate>
                                        <Triggers>
                                            <asp:PostBackTrigger  ControlID="btnAdd"/>
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>

                            </div>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div class="row">

                                        <div class="col" style="display: flex; justify-content: flex-end;">
                                            <asp:LinkButton ID="btnAdd" CausesValidation="true" ValidationGroup="documento" runat="server" CssClass="btn btn-success btn-small" OnClick="btnAdd_Click">Registrar programa de seguridad</asp:LinkButton>
                                            <asp:Label ID="lblEditando" runat="server" Text="Editar registro:" Visible="false" CssClass="mt-2 me-1"></asp:Label>
                                            <asp:LinkButton ID="btnEditar" runat="server" CssClass="btn btn-success" OnClick="btnEditar_Click" Visible="false"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                            &nbsp;
                                    <asp:LinkButton ID="btnCancelar" runat="server" CssClass="btn btn-danger" OnClick="btnCancelar_Click" Visible="false"><i class="bi bi-x-lg"></i></asp:LinkButton>
                                        </div>
                                    </div>

                            
                                    <div class="row">
                                        <asp:Label ID="lblSucces" runat="server" Text=""></asp:Label>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col">
                                            <div class="card rounded-0">
                                                <div class="table-responsive">
                                                    <asp:GridView ID="gvProgramas" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"
                                                        OnRowEditing="gvProgramas_RowEditing"
                                                        OnRowCancelingEdit="gvProgramas_RowCancelingEdit"
                                                        OnRowDeleting="gvProgramas_RowDeleting" OnRowUpdating="gvProgramas_RowUpdating"
                                                        AllowPaging="True" PageSize="4" AllowSorting="True" PagerSettings-Mode="NextPreviousFirstLast" OnPageIndexChanging="gvProgramas_PageIndexChanging" PagerStyle-CssClass="pagination-ys" OnSorting="gvProgramas_Sorting" ShowHeaderWhenEmpty="true">
                                                        <Columns>
                                                            <asp:BoundField DataField="ID" HeaderText="id" SortExpression="ID" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol">
                                                                <HeaderStyle CssClass="hiddencol" />
                                                                <ItemStyle CssClass="hiddencol" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="ID_compania" HeaderText="ID_compania" SortExpression="ID_compania" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol">
                                                                <HeaderStyle CssClass="hiddencol" />
                                                                <ItemStyle CssClass="hiddencol" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="Descripcion" HeaderText="<%$Resources:Certificacion, lblPrograma %>" SortExpression="Descripcion" HeaderStyle-CssClass="cabezal">
                                                                <HeaderStyle BackColor="#0169C2" ForeColor="White"></HeaderStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="codigo_certificacion" HeaderText="<%$Resources:Certificacion, lblCodigo %>" SortExpression="codigo_certificacion" HeaderStyle-CssClass="cabezal">
                                                                <HeaderStyle BackColor="#0169C2" ForeColor="White"></HeaderStyle>
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="ruta" HeaderText="url">
                                                                <HeaderStyle CssClass="hiddencol"></HeaderStyle>
                                                                <ItemStyle CssClass="hiddencol"></ItemStyle>
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="<%$Resources:Certificacion, lblCertificado %>">
                                                                <HeaderStyle BackColor="#0169C2" ForeColor="White"></HeaderStyle>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="btnVer" runat="server" OnClick="btnVer_Click1">Ver</asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="<%$Resources:Certificacion, lblEditar %>" HeaderStyle-CssClass="cabezal">
                                                                <HeaderStyle BackColor="#0169C2" ForeColor="White"></HeaderStyle>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="btnEdit" runat="server" OnClick="btnEdit_Click" CssClass="btn btn-warning"><i class="bi bi-pencil-square"></i></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="<%$Resources:Certificacion, lblEliminar %>" HeaderStyle-CssClass="cabezal" InsertVisible="False">
                                                                <HeaderStyle BackColor="#0169C2" ForeColor="White"></HeaderStyle>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton runat="server" Text="Eliminar" CommandName="Delete" CausesValidation="False" ID="LinkButton1" CssClass="btn btn-danger"><i class="bi bi-trash"></i></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <PagerSettings Mode="NumericFirstLast" PageButtonCount="3" />
                                                        <EmptyDataTemplate>
                                                            <div class="d-flex justify-content-center">
                                                                <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Certificacion, lblNodata %>"></asp:Literal>
                                                            </div>
                                                        </EmptyDataTemplate>
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>

                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger  ControlID="btnEditar" />                                    
                                </Triggers>
                            </asp:UpdatePanel>
                        </asp:Panel>

                    </div>
                </div>

            </div>
        </div>
        <br />
        <div class="row">
            <div class="col">
            </div>
            <div class="col" style="display: flex; justify-content: flex-end;">
                <asp:Panel ID="pUser" runat="server">

                    <asp:LinkButton ID="btnAnterior" runat="server" CssClass="btn btn-warning text-white" OnClick="btnAnterior_Click"><i class="bi bi-chevron-left"></i> <asp:Literal ID="Literal4" Text="<%$Resources:InformacionCompania, lblBtnAtras %>" runat="server"></asp:Literal></asp:LinkButton>

                    <button type="button" class="btn btn-secondary" id="btnHome" hidden
                        data-bs-toggle="tooltip"
                        data-bs-placement="top"
                        title="Guardar y salir">
                        <i class="bi bi-house-door"></i>
                    </button>

                    <asp:LinkButton ID="btnCasa" runat="server" OnClick="btnCasa_Click"
                        data-bs-toggle="tooltip"
                        data-bs-placement="top"
                        title="Guardar y salir" CssClass="btn btn-secondary">
                        <i class="bi bi-house-door"></i></asp:LinkButton>

                    <button id="btnContinuar" type="button" class="btn btn-success" hidden>Continuar <i class="bi bi-chevron-double-right"></i></button>

                    <asp:LinkButton ID="btnModal" runat="server" CssClass="btn btn-primary" OnClick="btnModal_Click">
                        <asp:Literal ID="Literal5" Text="<%$Resources:InformacionCompania,lblBtnFinish %>" runat="server"></asp:Literal><i class="bi bi-chevron-double-right"></i></asp:LinkButton>
                    <button id="btnModalJS" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" hidden>Continuar<i class="bi bi-chevron-double-right"></i></button>

                </asp:Panel>

                <asp:Panel ID="pAdmin" runat="server" Visible="false">
                    <asp:LinkButton ID="btnAdminBack" runat="server" CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnAdminBack_Click"
                        data-bs-toggle="tooltip"
                        data-bs-placement="top"
                        title="Atras"><i class="bi bi-arrow-left-short"></i></asp:LinkButton>

                    <asp:LinkButton ID="btnAdminH" runat="server" CssClass="btn btn-primary" OnClick="btnAdminH_Click"
                        data-bs-toggle="tooltip"
                        data-bs-placement="top"
                        title="Salir"> <i class="bi bi-house-door"></i> </asp:LinkButton>

                    <asp:LinkButton ID="btnAdminNext" runat="server" CssClass="btn btn-success"
                        OnClick="btnAdminNext_Click">finalizar <i class="bi bi-check-circle"></i></asp:LinkButton>
                </asp:Panel>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Listo!</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

                    </div>
                    <div class="modal-body">
                        Acaba de finalizar el llenado de adminision de cliente nuevo.
                        <br />
                        ¿Desea continuar con el registro?
                        <br />
                        <small>Si selecciona "no" volvera a la pantalla de inicio.</small>
                    </div>
                    <div class="modal-footer">
                        <asp:LinkButton ID="btnOpcionSi" runat="server" CssClass="btn btn-success" OnClick="btnOpcionSi_Click">Si</asp:LinkButton>
                        <asp:LinkButton ID="btnOpcionNo" runat="server" CssClass="btn btn-secondary" OnClick="btnOpcionNo_Click">No</asp:LinkButton>

                    </div>
                </div>
            </div>
        </div>
    </div>






</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <%--<script src="../JS/InfoComJS.js"></script>--%>
    <script src="../../Scripts/bootstrap.bundle.min.js"></script>
    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/umd/popper.min.js"></script>
    <script src="../../Scripts/sweetalert2.all.min.js"></script>
    <script src="../JS/cadenaDeSuministrosJS.js"></script>

</asp:Content>
