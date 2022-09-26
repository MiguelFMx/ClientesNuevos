<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompaniaFilial.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.CompaniaFilial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <%-- <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <div class="row">
            <div class="col">
                <div class="progress" hidden>
                    <div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Warning example" style="width: 50%" aria-valuenow="7" aria-valuemin="0" aria-valuemax="100">50%</div>
                </div>

                <div id="wizard" class="form_wizard wizard_horizontal">
                    <ul class="wizard_steps">
                        <li>
                            <a href="InformacionCompania.aspx" class="done">
                                <span class="step_no">1</span>
                                <span class="step_descr">Paso 1<br />
                                    <small>Información de la compañia</small>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="AgentesAduanales.aspx" class="done">
                                <span class="step_no">2</span>
                                <span class="step_descr">Paso 2<br />
                                    <small>Información de agentes aduanales</small>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="CompaniaFilial.aspx" class="selected">
                                <span class="step_no">3</span>
                                <span class="step_descr">Paso 3<br />
                                    <small>Informacion de compañia filial</small>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="TipoServicioProductos.aspx" class="">
                                <span class="step_no">4</span>
                                <span class="step_descr">Paso 4<br />
                                    <small>Tipo de servicio requerido</small>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="InformacionCadenaSuministro.aspx" class="">
                                <span class="step_no">5</span>
                                <span class="step_descr">Paso 5<br />
                                    <small>Acreditación en programa de seguridad</small>
                                </span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <br />
        <div class="card border-primary">
            <div class="card-header cabezal">
                <div class="row">
                    <div class="col-auto">
                        <h4>Información de compañia filial
                    <span style="font-size: 15px;">
                        <i class="bi bi-question-circle"
                            data-bs-toggle="tooltip"
                            data-bs-placement="bottom"
                            title="Compañia filial es considerada cualquier empresa subcontratada para realizar cualquier servicio de transporte,
                            almacenaje o resguardo de unidades de transporte internacional. Si no cuenta con una compañia filial de clic en continuar"></i>
                    </span>
                        </h4>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">


                    <div class="row">
                        <div class="col">
                            <label for="txtNombreCompaniaFilial" class="form-label">Nombre de la compañia:</label>
                            <!--<input type="text" name="name" value="" id="txtNombreCompaniaFilial" class="form-control " />-->
                            <asp:TextBox ID="txtNombreCompaniaFilial" runat="server" CssClass="form-control"></asp:TextBox>
                            <span id="NombreCompaniaFilial" style="color:red;"></span>
                        </div>
                        <div class="col">
                            <label for="txtNombrComFilial" class="form-label">Nombre comercial:</label>
                            <%--<input type="text" name="name" value="" id="txtNombrComFilial" class="form-control" />--%>
                            <asp:TextBox ID="txtNombrComFilial" runat="server" CssClass="form-control"></asp:TextBox>
                            <span id="NombrComFilial" style="color:red;"></span>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-9">
                            <label for="txtDirecFiscalComFilial" class="form-label">Dirección fiscal:</label>
                            <%--<input type="text" name="name" value="" id="txtDirecFiscalComFilial" class="form-control" />--%>
                            <asp:TextBox ID="txtDirecFiscalComFilial" runat="server" CssClass="form-control"></asp:TextBox>
                            <span id="DirecFiscalComFilial" style="color:red;"></span>
                            
                        </div>

                        <div class="col-3">

                            <label for="txtRfcComFilial" class="form-label">RFC:</label>
                            <%--<input type="text" name="name" value="" id="txtRfcComFilial" class="form-control " />--%>
                            <asp:TextBox ID="txtRfcComFilial" runat="server" CssClass="form-control"></asp:TextBox>
                            <span id="RfcComFilial" style="color:red;"></span>

                        </div>
                    </div>

                    <div class="row">
                        <div class="col">
                            <label for="cbPaisComFilial" class="form-label">Pais:</label>
                            <%--<select id="cbPaisComFilial" class="form-select">
                                <option value="...">...</option>
                            </select>--%>
                            <asp:DropDownList ID="ddPaisComFilial" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddPaisComFilial_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>

                        </div>
                        <div class="col">
                            <label for="cboEstadoComFilial" class="form-label">Estado:</label>
                            <%--<select id="cboEstadoComFilial" class="form-select">
                                <option value="value">...</option>
                            </select>--%>
                            <asp:DropDownList ID="ddEstadoComFilial" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddEstadoComFilial_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="col">
                            <label for="cbCiudadComFilial" class="form-label">Ciudad:</label>
                            <%--<select id="cbCiudadComFilial" class="form-select">
                                <option value="value">...</option>
                            </select>--%>
                            <asp:DropDownList ID="ddCiudadComFilial" runat="server" CssClass="form-select"></asp:DropDownList>
                        </div>
                        <div class="col">
                            <label for="txtCPComFIlial" class="form-label">CP:</label>
                            <%--<input type="text" name="name" value="" id="txtCPComFIlial" class="form-control" />--%>
                            <asp:TextBox ID="txtCPComFIlial" runat="server" CssClass="form-control"></asp:TextBox>
                            <span id="CPComFIlial" style="color:red;"></span>

                        </div>
                    </div>

                </div>
            </div>
            <div class="card-header cabezal">
                <div class="row">
                    <div class="col">
                        <h5>Contacto</h5>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="row">
                        <div class="col-6">
                            <label for="txtNombrContFilial" class="form-label">Nombre:</label>
                            <%--<input type="text" name="name" value="" id="txtNombrContFilial" class="form-control" />--%>
                            <asp:TextBox ID="txtNombrContFilial" runat="server" CssClass="form-control"></asp:TextBox>
                            <span id="NombrContFilial" style="color:red;"></span>

                        </div>

                        <div class="col-3">
                            <label for="txtPuestoContFilial" class="form-label">Puesto:</label>
                            <%--<input type="text" name="name" value="" id="txtPuestoContFilial" class="form-control" />--%>
                            <asp:TextBox ID="txtPuestoContFilial" runat="server" CssClass="form-control"></asp:TextBox>
                            <span id="PuestoContFilial" style="color:red;"></span>

                        </div>
                        <div class="col-3">
                            <label for="txtCorreoContFilial" class="form-label">Correo:</label>
                            <%--<input type="email" name="name" value="" id="txtCorreoContFilial" class="form-control" />--%>
                            <asp:TextBox ID="txtCorreoContFilial" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                            <span id="CorreoContFilial" style="color:red;"></span>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <label for="txtTelContFilial" class="form-label">Telefono:</label>
                            <%--<input type="tel" name="name" value="" id="txtTelContFilial" class="form-control" />--%>
                            <asp:TextBox ID="txtTelContFilial" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                            <span id="TelContFilial" style="color:red;"></span>

                        </div>
                        <div class="col-2">
                            <label for="txtExtContFilial" class="form-label">Extension:</label>
                            <%--<input type="text" name="name" value="" id="txtExtContFilial" class="form-control" />--%>
                            <asp:TextBox ID="txtExtContFilial" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-4">
                            <label for="txtCelContFilial" class="form-label">Celular:</label>
                            <%--<input type="tel" name="name" value="" id="txtCelContFilial" class="form-control" />--%>
                            <asp:TextBox ID="txtCelContFilial" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                            <span id="CelContFilial" style="color:red;"></span>

                        </div>
                    </div>
                </div>
            </div>
            <div class="card-footer">
                <div class="row">
                    <div class="col-10"></div>
                    <div class="col">
                        <button type="button" name="btnAgregarComFilial" class=" btn btn-primary" id="btnAgregarComFilial">Registrar compañia</button>
                    </div>
                </div>
            </div>
        </div>

        <br />
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="table-responsive">
                        <table class="table table-hover" id="tComFil">

                            <thead class="cabezal">
                                <tr>
                                    <th hidden></th>
                                    <th>Nombre compañia</th>
                                    <th>Nombr comercial</th>
                                    <th>Direccion</th>
                                    <th>RFC</th>
                                    <th>Pais</th>
                                    <th>Estado</th>
                                    <th>Ciudad</th>
                                    <th>CP</th>
                                    <th>Contacto</th>
                                    <th>Puesto</th>
                                    <th>Correo</th>
                                    <th>Telefono</th>
                                    <th>Ext</th>
                                    <th>Celular</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                               
                            </tbody>
                            <tfoot></tfoot>

                        </table>
                    </div>
                </div>

            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-9"></div>
            <div class="col" style="display:flex; justify-content:flex-end;">
                <asp:LinkButton ID="btnAnterior" runat="server" CssClass="btn btn-warning" ForeColor="White" OnClick="btnAnterior_Click"><i class="bi bi-chevron-left"></i> Anterior</asp:LinkButton>&nbsp;&nbsp;
                <button id="btnHomie" class="btn btn-secondary" type="button"><i class="bi bi-house-door"></i></button>
                <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-secondary" 
                    data-bs-toggle="tooltip"
                            data-bs-placement="top"
                            title="Guardar y salir" OnClick="btnHome_Click"                    
                    Visible="false"> <i class="bi bi-house-door"></i> </asp:LinkButton>&nbsp;&nbsp;
                <button id="btnContinuar" class="btn btn-primary" type="button">Siguiente<i class="bi bi-chevron-right"></i></button>
            </div>
        </div>

        </div>
   
    <script type="text/javascript">
        $(document).ready(function () {
            llenarTabla();
           /* fillComboPais($('#cbPaisComFilial'));*/


        });

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../JS/ComFilialJS.js"></script>
</asp:Content>
