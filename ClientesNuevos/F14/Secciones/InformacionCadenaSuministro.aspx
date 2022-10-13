<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InformacionCadenaSuministro.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.InformacionCadenaSuministro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



    <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <div class="row">
            <div id="wizard" class="form_wizard wizard_horizontal">
                <ul class="wizard_steps">
                    <li>
                        <asp:HyperLink ID="step1" runat="server" NavigateUrl="~/F14/Secciones/InformacionCompania.aspx" CssClass="done">
                            <asp:Label ID="lblstep1" runat="server" Text="1" CssClass="step_no"></asp:Label>
                            <asp:Label ID="lblDesc1" runat="server" Text="Paso 1"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub1" runat="server" Text="Información de la compañia" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step2" runat="server" CssClass="done" NavigateUrl="~/F14/Secciones/AgentesAduanales.aspx">
                            <asp:Label ID="lblstep2" runat="server" Text="2" CssClass="step_no"></asp:Label>
                            <asp:Label ID="lblDesc2" runat="server" Text="Paso 2"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub2" runat="server" Text="Información de agentes aduanales" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step3" runat="server" NavigateUrl="~/F14/Secciones/CompaniaFilial.aspx" CssClass="done">
                            <asp:Label ID="lblstep3" runat="server" Text="3" CssClass="step_no"></asp:Label>
                            <asp:Label ID="lblDesc3" runat="server" Text="Paso 3"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub3" runat="server" Text="Informacion de compañia filial" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step4" runat="server" NavigateUrl="~/F14/Secciones/TipoServicioProductos.aspx" CssClass="done">
                            <asp:Label ID="lblstep4" runat="server" Text="4" CssClass="step_no"></asp:Label>

                            <asp:Label ID="lblDesc4" runat="server" Text="Paso 4"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub4" runat="server" Text="Tipo de servicio requerido" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step5" runat="server" NavigateUrl="#" CssClass="selected">
                            <asp:Label ID="lblstep5" runat="server" Text="5" CssClass="step_no"></asp:Label>
                            <asp:Label ID="lblDesc5" runat="server" Text="Paso 5"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub5" runat="server" Text="Acreditación en programa de seguridad" Font-Size="Smaller"></asp:Label>
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
                <div class="card">
                    <div class="card-header cabezal">
                        <span>Información de cadena de suministro</span>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-4">
                                <label for="ddCTPATstatus">C-TPAT status:</label>
                                <select name="cbCTPATSatuts" id="cbCTPATSatuts" class="form-select" style="font-size: 14px;">
                                    <option value="0">Ninguno</option>
                                    <option value="1">Certificado no validado</option>
                                    <option value="2">Certificado validado</option>
                                </select>

                            </div>

                        </div>
                        <div class="row" id="divFecha" style="display: none;">
                            <div class="col-4">
                                <label for="txtCTPATCuenta">Numero de cuenta:</label>
                                <%--<input type="text" name="txtCTPATSVI" value="" id="txtCTPATSVI" class="form-control" />--%>
                                <asp:TextBox ID="txtCTPATCuenta" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-4">
                                <label for="dtFechaVal">Fecha de validacion:</label>
                                <%--<input type="date" name="" value="" id="dtFechaVal" class="form-control" />--%>
                                <asp:TextBox ID="dtFechaVal" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col">
                                <label>
                                    ¿Esta Certificado en C-TPAT o equivalente/WCO acreditado en programa de seguridad de comercio exterior?
                                </label>
                                <br />
                                <div class="form-check form-check-inline">
                                    <input type="radio" name="radCertificado" value="si" id="radCertificadoSi" class="form-check-input" />
                                    <label for="radCertificadoSi">Si</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input type="radio" name="radCertificado" value="no" id="radCertificadoNo" class="form-check-input" />
                                    <label for="radCertificadoNo">No</label>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row" id="divCertificado" style="display: none;">
                            <div class="row">
                                <div class="col">
                                    <span id="error"></span>

                                    <div class="card">
                                        <div class="table-responsive">
                                            <table class="table table-hover" id="tProgramaDeSeguridad">
                                                <thead class="cabezal">
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Descripción</th>
                                                        <th>Código de certificación</th>
                                                        <th>¿Puede proporcionar el certificado?</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody></tbody>
                                                <tfoot></tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <asp:Panel ID="pV2" runat="server">
                            <div class="row">
                                <div class="col-md">
                                    <asp:Label ID="lblDescripcion" runat="server" Text="Descripcion:" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md">
                                    <asp:Label ID="lblCodigo" runat="server" Text="Codigo:" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-md">
                                    <asp:Label ID="lblCertificado" runat="server" Text="Certificado:" CssClass="form-label"></asp:Label>
                                    <asp:FileUpload ID="fileCertificado" runat="server" CssClass="form-control" />
                                </div>

                            </div>
                            <br />
                            <div class="row">
                                <div class="col" style="display: flex; justify-content: flex-end;">
                                    <asp:LinkButton ID="btnAdd" runat="server" CssClass="btn btn-success btn-small"><i class="bi bi-plus-circle"></i> Agregar</asp:LinkButton>
                                </div>
                            </div>
                            <div class="row">
                                <asp:Label ID="lblSucces" runat="server" Text="..."></asp:Label>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="card">
                                        <div class="table-responsive">
                                            <asp:GridView ID="gvProgramas" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" OnRowEditing="gvProgramas_RowEditing" OnRowCancelingEdit="gvProgramas_RowCancelingEdit">
                                                <Columns>
                                                    <asp:BoundField DataField="ID" HeaderText="id" SortExpression="ID"  ></asp:BoundField>
                                                    <asp:BoundField DataField="Descripcion" HeaderText="Programa de seguridad" SortExpression="Descripcion" HeaderStyle-CssClass="cabezal">
                                                        <HeaderStyle BackColor="#0169C2" ForeColor="White"></HeaderStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="codigo_certificacion" HeaderText="Codigo de certificaci&#243;n" SortExpression="codigo_certificacion" HeaderStyle-CssClass="cabezal">
                                                        <HeaderStyle BackColor="#0169C2" ForeColor="White"></HeaderStyle>                                                        
                                                    </asp:BoundField>
                                                                                                      
                                                    <asp:TemplateField HeaderText="Certificado">
                                                        <HeaderStyle BackColor="#0169C2" ForeColor="White"></HeaderStyle>
                                                       <ItemTemplate>
                                                           <asp:LinkButton ID="btnVer" runat="server" OnClick="btnVer_Click1">Ver</asp:LinkButton>
                                                       </ItemTemplate>
                                                    </asp:TemplateField>


                                                    <asp:TemplateField ShowHeader="False">
                                                        <EditItemTemplate>
                                                            <asp:LinkButton runat="server" Text="Actualizar" CommandName="Update" CausesValidation="True" ID="LinkButton1" CssClass="btn btn-success"><i class="bi bi-check-lg"></i></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" CausesValidation="False" ID="LinkButton2" CssClass="btn btn-danger"><i class="bi bi-x-lg"></i></asp:LinkButton>

                                                        </EditItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" CausesValidation="False" ID="LinkButton1" CssClass="btn btn-warning"><i class="bi bi-pencil-square"></i></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Eliminar" CommandName="Delete" CausesValidation="False" ID="LinkButton2" CssClass="btn btn-danger"><i class="bi bi-trash"></i></asp:LinkButton>

                                                        </ItemTemplate>

                                                        <HeaderStyle BackColor="#0169C2" ForeColor="White"></HeaderStyle>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>

                        <asp:Label ID="lblError" runat="server" Text="..."></asp:Label>
                    </div>
                </div>

            </div>
        </div>
        <br />
        <div class="row">
            <div class="col">
            </div>
            <div class="col" style="display: flex; justify-content: flex-end;">
                <asp:LinkButton ID="btnAnterior" runat="server" CssClass="btn btn-warning text-white" OnClick="btnAnterior_Click"><i class="bi bi-chevron-left"></i> Anterior</asp:LinkButton>
                &nbsp;&nbsp;
                <button type="button" class="btn btn-secondary" id="btnHome"
                    data-bs-toggle="tooltip"
                    data-bs-placement="top"
                    title="Guardar y salir">
                    <i class="bi bi-house-door"></i>
                </button>
                &nbsp;&nbsp;
                <button id="btnContinuar" type="button" class="btn btn-success">Continuar <i class="bi bi-chevron-double-right"></i></button>
            </div>
        </div>

    </div>
    <script type="text/javascript">

        $(document).ready(function () {
            getEstatus();
        });




    </script>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <%--<script src="../JS/InfoComJS.js"></script>--%>
    <script src="../JS/cadenaDeSuministrosJS.js"></script>

</asp:Content>
