<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgentesAduanales.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.AgentesAduanales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Agentes aduanales</title>



    <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col">
                <asp:Panel ID="AlertResultado" runat="server" Visible="False">
                    <div class="alert alert-success" role="alert">
                        <div class="row">
                            <div class="col-10" style="display: flex; justify-content:center;">
                                <asp:Label ID="lblAlert" runat="server" Text=""></asp:Label>

                            </div>
                            <div class="col-2" style="display: flex; justify-content: flex-end;">
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>

                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <asp:Label ID="lblResultado" runat="server" Text="Label"></asp:Label>
                <div class="progress" hidden>
                    <div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Warning example" style="width: 25%" aria-valuenow="7" aria-valuemin="0" aria-valuemax="100">25%</div>
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
                            <a href="#" class="selected">
                                <span class="step_no">2</span>
                                <span class="step_descr">Paso 2<br />
                                    <small>Información de agentes aduanales</small>
                                </span>
                            </a>
                        </li>
                        <li>
                            <a href="CompaniaFilial.aspx" class="">
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
        <!---------------------------------------- fieldset Agente aduanal; ---------------------------------------------------------------------------------->
        <fieldset>
            <legend style="font-size: 25px;" id="lblTitulo">Agente aduanal mexicano </legend>

            <div class="container">
                <div class="row">
                    <div class="col">


                        <div class="card h-100">
                            <h5 class="card-header cabezal">Información</h5>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <label for="txtNombreCompaniaAA" class="form-label">Nombre de la compañia:</label>
                                        <%--<input type="text" name="txtNombreCompaniaAA" value="" id="txtNombreCompaniaAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtNombreCompaniaAA" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <label for="txtNoPatAA" class="form-label">Numero de patente:</label>
                                        <%--<input type="text" name="txtNoPatAA" value="" id="txtNoPatAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtNoPatAA" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="txtNombrComAA" class="form-label">Nombre comercial:</label>
                                        <%--<input type="text" name="txtNombrComAA" value="" id="txtNombrComAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtNombrComAA" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <label for="txtRFCTaxAA" id="lblRFCTaxAAA" class="form-label">RFC:</label>
                                        <br />
                                        <%--<input type="text" name="txtRFCTaxAA" value="" id="txtRFCTaxAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtRFCTaxAA" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="txtDirecAA" class="form-label">Dirección:</label>
                                        <%--<textarea name="txtDirecAA" id="txtDirecAA" class="form-control"></textarea>--%>
                                        <asp:TextBox ID="txtDirecAA" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="txtEstadoAA" class="form-label">Estado:</label>
                                        <%--<select id="cbEstadoAA" class="form-select">
                                                <option value="value">...</option>
                                            </select>--%>
                                        <asp:DropDownList ID="ddEstadoAA" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddEstadoAA_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                    </div>
                                    <div class="col">
                                        <label for="txtCiudadAA" class="form-label">Ciudad:</label>
                                        <%--<select id="cbCiudadAA" class="form-select">
                                                <option value="value">...</option>
                                            </select>--%>
                                        <asp:DropDownList ID="ddCiudadAA" runat="server" CssClass="form-select"></asp:DropDownList>
                                    </div>
                                    <div class="col">
                                        <label for="txtCPAA" id="lblCPAA" class="form-label">Codgio Postal:</label>
                                        <%--<input type="text" name="txtCPAA" value="" id="txtCPAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtCPAA" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card h-100">
                            <h5 class="cabezal card-header ">Contacto</h5>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <label for="txtNombrContAA" class="form-label">Nombre:</label>
                                        <%--<input type="text" name="txtNombrContAA" value="" id="txtNombrContAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtNombrContAA" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <label for="txtpuestoContAA" class="form-label">Puesto:</label>
                                        <%--<input type="text" name="txtpuestoContAA" value="" id="txtpuestoContAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtpuestoContAA" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="txtCorreoContAA" class="form-label">Correo:</label>
                                        <%--<input type="email" name="txtCorreoContAA" value="" id="txtCorreoContAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtCorreoContAA" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <label for="txtTelContAA" class="form-label">Telefono:</label>
                                        <%--<input type="tel" name="txtTelContAA" value="" id="txtTelContAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtTelContAA" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <label for="txtExtxContAA" class="form-label">Extension:</label>
                                        <%--<input type="text" name="txtExtxContAA" value="" id="txtExtxContAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtExtxContAA" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <label for="txtCelContAA" class="form-label">Celular:</label>
                                        <%--<input type="tel" name="name" value="" id="txtCelContAA" class="form-control" />--%>
                                        <asp:TextBox ID="txtCelContAA" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
        </fieldset>

        <!----------------------------------------------------------Agente aduanal americano--------------------------------------------------------------->
        <fieldset>
            <legend style="font-size: 25px;" id="">Agente aduanal americano </legend>

            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="card h-100">
                            <h5 class="card-header cabezal">Información</h5>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <label for="txtNombreCompaniaAAm" class="form-label">Nombre de la compañia:</label>
                                        <%--<input type="text" name="txtNombreCompaniaAA" value="" id="txtNombreCompaniaAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtNombreCompaniaAAm" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <label for="txtNoPatAAm" class="form-label">Numero de patente:</label>
                                        <%--<input type="text" name="txtNoPatAA" value="" id="txtNoPatAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtNoPatAAm" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col">
                                        <label for="txtNombrComAAm" class="form-label">Nombre comercial:</label>
                                        <%--<input type="text" name="txtNombrComAA" value="" id="txtNombrComAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtNombrComAAm" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <label for="txtTaxAAm" id="lblRFCTaxAAAm" class="form-label">Tax ID:</label>
                                        <br />
                                        <%--<input type="text" name="txtRFCTaxAA" value="" id="txtRFCTaxAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtRFCTaxAAm" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="txtDirecAAm" class="form-label">Dirección:</label>
                                        <%--<textarea name="txtDirecAA" id="txtDirecAAm" class="form-control"></textarea>--%>
                                        <asp:TextBox ID="txtDirecAAm" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">

                                    <div class="col">
                                        <label for="cbEstadoAAm" class="form-label">Estado:</label>
                                        <%--<select id="cbEstadoAAm" class="form-select">
                                            <option value="value">...</option>
                                        </select>--%>
                                        <asp:DropDownList ID="ddEstadoAAm" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddEstadoAAm_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
                                    <div class="col">
                                        <label for="cbCiudadAAm" class="form-label">Ciudad:</label>
                                        <%--<select id="cbCiudadAAm" class="form-select">
                                            <option value="value">...</option>
                                        </select>--%>
                                        <asp:DropDownList ID="ddCiudadAAm" runat="server" CssClass="form-select"></asp:DropDownList>
                                    </div>
                                    <div class="col">
                                        <label for="txtCPAAm" id="lblCPAAm" class="form-label">Zip code:</label>
                                        <%--<input type="text" name="txZCPAA" value="" id="txtCPAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtCPAAm" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card  h-100">
                            <h5 class="cabezal card-header ">Contacto</h5>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col">
                                        <label for="txtNombrContAAm" class="form-label">Nombre:</label>
                                        <%--<input type="text" name="txtNombrContAA" value="" id="txtNombrContAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtNombrContAAm" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <label for="txtpuestoContAAm" class="form-label">Puesto:</label>
                                        <%--<input type="text" name="txtpuestoContAAm" value="" id="txtpuestoContAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtpuestoContAAm" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="txtCorreoContAAm" class="form-label">Correo:</label>
                                        <%--<input type="email" name="txtCorreoContAAm" value="" id="txtCorreoContAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtCorreoContAAm" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <label for="txtTelContAAm" class="form-label">Telefono:</label>
                                        <%--<input type="tel" name="txtTelContAAm" value="" id="txtTelContAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtTelContAAm" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <label for="txtExtContAAm" class="form-label">Extension:</label>
                                        <%--<input type="text" name="txtExtContAAm" value="" id="txtExtxContAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtExtContAAm" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <label for="txtCelContAAm" class="form-label">Celular:</label>
                                        <%--<input type="tel" name="name" value="" id="txtCelContAAm" class="form-control" />--%>
                                        <asp:TextBox ID="txtCelContAAm" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>

        <hr />
        <div class="row">
            <div class="col" style="display: flex; justify-content: flex-end;">
                <asp:LinkButton ID="btnAnterior" runat="server" CssClass="btn btn-warning" ForeColor="White" OnClick="btnAnterior_Click"><i class="bi bi-chevron-left"></i> Anterior</asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-secondary"
                    data-bs-toggle="tooltip"
                    data-bs-placement="top"
                    title="Guardar y salir" OnClick="btnHome_Click"> <i class="bi bi-house-door"></i> </asp:LinkButton>&nbsp;&nbsp;

                <asp:LinkButton ID="btnSiguiente" runat="server" CssClass="btn btn-primary" OnClick="btnSiguiente_Click">Siguiente<i class="bi bi-chevron-right"></i></asp:LinkButton>
               <!-- <button id="btnContinuar" class="btn btn-success" type="button">Siguiente<i class="bi bi-chevron-right"></i></button> -->
                <%--<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Continuar</button>--%>
            </div>
        </div>


        <!-- Modal-->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>
                            ¿Desea continuar con el registro?
                            <br />
                            Si su respuesta es no, podrá continuar cuando lo desee.
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="btnNo">No</button>
                        <asp:Button ID="btnTest" runat="server" Text="Si" CssClass="btn btn-primary" OnClick="btnTest_Click" UseSubmitBehavior="False" />

                    </div>
                </div>
            </div>
        </div>

    </div>


    <script type="text/javascript">
        $(document).ready(function () {
            fillComboEstado(142, $('#cbEstadoAA'));
            fillComboEstado(231, $('#cbEstadoAAm'));

            $("#cbEstadoAAm").change(function () {
                var EstadoSeleccionado = $('#cbEstadoAAm option:selected').val();

                fillComboCiudad(EstadoSeleccionado, $('#cbCiudadAA'));
            });

            $("#cbEstadoAA").change(function () {
                var EstadoSeleccionado = $('#cbEstadoAA option:selected').val();

                fillComboCiudad(EstadoSeleccionado, $('#cbCiudadAAm'));
            });

            $('#btnContinuar').click(function () {
                window.location.href = 'CompaniaFilial.aspx';
            });

            $('#btnNo').click(function () {
                window.location.href = "../../usuario/Index.aspx";
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../JS/InfoComJS.js"></script>
</asp:Content>
