<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InformacionCompania.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.ImformacionCompania" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Información</title>


    <link href="../../template/assets/css/style.css" rel="stylesheet" />

    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
    <script src="../JS/InfoComJS.js"></script>
    <script src="../../Scripts/JS/ajax.js"></script>

    <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <div class="row">

            <div class="col">
                <div class="col-auto">
                    <label for="cbTipoDeRegistro" class="form-label">Tipo de registro</label>
                </div>
                <div class="col-3">
                    <select id="cbTipoDeRegistro" class="form-select" hidden>
                        <option value="" selected disabled>...</option>
                        <option value="cliente">Cliente</option>
                        <option value="proveedor">Proveedor</option>
                    </select>

                    <asp:DropDownList ID="cbTipoRegistro" runat="server" class="form-select" AutoPostBack="true" OnSelectedIndexChanged="cbTipoRegistro_SelectedIndexChanged">
                        <asp:ListItem Text="Cliente" Value="cliente" />
                        <asp:ListItem Text="proveedor" Value="proveedor" />
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col">
                <div class="progress" hidden>
                    <div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Warning example" style="width: 0%" aria-valuenow="7" aria-valuemin="0" aria-valuemax="100"></div>
                </div>

                <div id="wizard" class="form_wizard wizard_horizontal">
                    <ul class="wizard_steps">
                        <li>                          
                            <asp:HyperLink ID="step1" runat="server">
                                <asp:Label ID="lblstep1" runat="server" Text="1" CssClass="step_no"></asp:Label>
                                <asp:Label ID="lblDesc1" runat="server" Text="">
                                    Paso 1 <br />   
                                    <small>Información de la compañia</small>
                                </asp:Label>
                            </asp:HyperLink>
                        </li>
                        <li>
                            <asp:HyperLink ID="step2" runat="server" NavigateUrl="~/F14/Secciones/AgentesAduanales.aspx">
                                <asp:Label ID="lblstep2" runat="server" Text="2" CssClass="step_no"></asp:Label>
                                <asp:Label ID="lblDesc2" runat="server" Text="">
                                    Paso 2 <br />   
                                    <small>Información de agentes aduanales</small>
                                </asp:Label>
                            </asp:HyperLink>
                        </li>
                        <li>
                            <asp:HyperLink ID="step3" runat="server" NavigateUrl="~/F14/Secciones/CompaniaFilial.aspx">
                                <asp:Label ID="lblstep3" runat="server" Text="3" CssClass="step_no"></asp:Label>
                                <asp:Label ID="lblDesc3" runat="server" Text="">
                                    Paso 3 <br />   
                                    <small>Informacion de compañia filial</small>
                                </asp:Label>
                            </asp:HyperLink>
                        </li>
                        <li>
                            <asp:HyperLink ID="step4" runat="server" NavigateUrl="~/F14/Secciones/TipoServicioProductos.aspx">
                                <asp:Label ID="lblstep4" runat="server" Text="4" CssClass="step_no"></asp:Label>
                                <asp:Label ID="lbldesc4" runat="server" Text="">
                                    Paso 4 <br />   
                                    <small>Tipo de servicio requerido</small>
                                </asp:Label>
                            </asp:HyperLink>
                        </li>
                        <li>
                            <asp:HyperLink ID="step5" runat="server" NavigateUrl="~/F14/Secciones/InformacionCadenaSuministro.aspx">
                                <asp:Label ID="lblstep5" runat="server" Text="5" CssClass="step_no"></asp:Label>
                                <asp:Label ID="lblDesc5" runat="server" Text="">
                                    <asp:Label ID="lblsub5" runat="server" Text="Paso 5"></asp:Label> <br />   
                                    <small>Acreditación en programa de seguridad</small>
                                </asp:Label>
                            </asp:HyperLink>
                        </li>
                    </ul>
                </div>
                <div id="wizard2" class="form_wizard wizard_horizontal" hidden>
                    <ul class="wizard_steps">
                        <li>
                            <a href="#" class="selected">
                                <span class="step_no">1</span>
                                <span class="step_descr">Paso 1<br />
                                    <small>Información de la compañia</small>
                                </span>
                            </a>
                        </li>

                        <li>
                            <a href="InformacionCadenaSuministro.aspx" class="">
                                <span class="step_no">2</span>
                                <span class="step_descr">Paso 2<br />
                                    <small>Acreditación en programa de seguridad</small>
                                </span>
                            </a>
                        </li>
                    </ul>
                </div>

            </div>
        </div>

        <br />
        <!------------------------------------------------- Informacion de compañia------------------------------->
        <fieldset>
            <div class="card border-primary">
                <div class="card-header cabezal">Información de la compañia</div>
                <div class="card-body">
                    <div id="contenedorComp">
                        <div class="row">
                            <div class="col">
                                <label for="txtNombreCompania" style="margin-bottom: 9px;">Nombre de la compañia:</label>
                                <asp:TextBox ID="txtNombreCompania" runat="server" CssClass="form-control" AutoPostBack="True"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ErrorMessage="*campo obligatorio"
                                    ControlToValidate="txtNombreCompania"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="col">
                                <label for="txtNombrCom" class="form-label">Nombre comercial:</label>
                                <asp:TextBox ID="txtNombrCom" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ErrorMessage="*campo obligatorio"
                                    ControlToValidate="txtNombrCom"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col" style="margin-top: -8px;">
                                <label for="cbTipoDePersona" class="form-label">Tipo de persona</label>

                                <asp:DropDownList ID="ddTipoDePersona" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddTipoDePersona_SelectedIndexChanged">
                                    <asp:ListItem Text="..." Value="2" />
                                    <asp:ListItem Text="Moral" Value="0" />
                                    <asp:ListItem Text="Fisica" Value="1" />
                                </asp:DropDownList>
                            </div>
                            <div class="col">
                                <label for="txtRfc">RFC:</label>
                                <asp:TextBox ID="txtRfc" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="*campo obligatorio"
                                    ControlToValidate="txtRfc"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="col">
                                <label for="txtCURP">CURP:</label>
                                <asp:TextBox ID="txtCURP" runat="server" CssClass="form-control"></asp:TextBox>

                            </div>
                            <div class="col">
                                <label for="txtAnosNegocio">Años de negocio:</label>
                                <asp:TextBox ID="txtAnosNegocio" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ErrorMessage="*campo obligatorio"
                                    ControlToValidate="txtAnosNegocio"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-8">
                                <label for="txtDirecFiscal">Dirección fiscal:</label>
                                <asp:TextBox ID="txtDirecFiscal" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ErrorMessage="*campo obligatorio"
                                    ControlToValidate="txtDirecFiscal"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="col-4">
                                <label for="txtCP">CP:</label>
                                <asp:TextBox ID="txtCP" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                    ErrorMessage="*campo obligatorio"
                                    ControlToValidate="txtCP"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col">
                                <label for="cbPais">Pais:</label>
                                <asp:DropDownList ID="ddPais" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddPais_SelectedIndexChanged" AutoPostBack="True">
                                </asp:DropDownList>
                            </div>
                            <div class="col">
                                <label for="cboEstado">Estado:</label>
                                <asp:DropDownList ID="ddEstado" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddEstado_SelectedIndexChanged">
                                    <asp:ListItem Text="..." Value="0" Enabled="false" />
                                </asp:DropDownList>
                            </div>
                            <div class="col">
                                <label for="cbCiudad">Ciudad:</label>

                                <asp:DropDownList ID="ddCiudad" runat="server" AutoPostBack="True" CssClass="form-select" OnSelectedIndexChanged="ddCiudad_SelectedIndexChanged"></asp:DropDownList>

                                <asp:Button ID="btnPrueba" runat="server" Text="prueba" OnClick="btnPrueba_Click" Visible="false" />
                                <asp:Label ID="lblresultado" runat="server" Text="Label" Visible="false"></asp:Label>
                            </div>
                        </div>
                        <br />
                    </div>
                </div>
            </div>
            <hr />

            <div class="row">
                <!--------------------------------------------Datos de facturacion--------------------------------------------------------->
                <div class="col">
                    <div class="card border-primary">
                        <div class="card-header cabezal">
                            <div class="col">
                                <h6 style="font-weight: bold;">Datos de facturacion</h6>

                                <div class="form-check ">
                                    <asp:CheckBox ID="chkDireccionIgual" runat="server" OnCheckedChanged="chkDireccionIgual_CheckedChanged" AutoPostBack="True" />

                                    <label class="form-check-label" for="chkDireccionIgual" style="font-size: 13px;">
                                        Direccion de facturacion es diferente a direccion fiscal
                                    </label>
                                </div>
                            </div>
                        </div>
                        <asp:Panel runat="server" ID="pFra" Enabled="False" BackColor="#E9ECEF">
                            <div class="card-body" id="DirFra">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="txtDirecFacturacion">Dirección facturación:</label>
                                        <asp:TextBox ID="txtDirecFacturacion" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="cbPaisFact">Pais:</label>
                                        <asp:DropDownList ID="ddPaisFra" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddPaisFra_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
                                    <div class="col">
                                        <label for="cbEstadoFact">Estado:</label>
                                        <asp:DropDownList ID="ddEstadoFra" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddEstadoFra_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="cbCiudadFact">Ciudad:</label>
                                        <asp:DropDownList ID="ddCiudadFra" runat="server" CssClass="form-select"></asp:DropDownList>
                                    </div>
                                    <div class="col">
                                        <label for="txtCPFacturacion">CP:</label>
                                        <asp:TextBox ID="txtCPFra" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <br />
                                </div>

                            </div>

                        </asp:Panel>
                    </div>
                </div>
                <!-- ============================Datos bancarios======================================= -->
                <div class="col">
                    <div class="card border-primary">
                        <h6 class="card-header cabezal">Datos bancarios </h6>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-5">
                                    <label for="cbMetodoPago">Metodo de pago</label>
                                    <asp:DropDownList ID="ddMetodoPago" runat="server" CssClass="form-select" AutoPostBack="False">
                                        <asp:ListItem Text="..." Value="0" Selected="False" />
                                        <asp:ListItem Text="PUE-Pago en Una sola Exhibición" Value="PUE" Selected="False" />
                                        <asp:ListItem Text="PPD-Pago en Parcialidades o Diferido" Value="PPD" Selected="False" />
                                    </asp:DropDownList>

                                </div>
                                <div class="col-4">
                                    <label for="cbFormaPago">Forma de pago</label>
                                    <asp:DropDownList ID="ddFormaPago" runat="server" CssClass="form-select">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-3">
                                    <label for="cbMoneda">Moneda</label>
                                    <asp:DropDownList ID="ddMoneda" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="..." Value="x" />
                                        <asp:ListItem Text="MXN" Value="MXN" />
                                        <asp:ListItem Text="USD" Value="USD" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="cbUsoCFDI">Uso de CFDI</label>
                                    <asp:DropDownList ID="ddUsoCFDI" runat="server" CssClass="form-select">
                                        <asp:ListItem Text="Seleccione el regimen al que pertenece" Value="" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="txtBanco">Nombre del banco</label>
                                    <asp:TextBox ID="txtBanco" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                        ErrorMessage="*campo obligatorio"
                                        ControlToValidate="txtBanco"
                                        Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="col">
                                    <label for="txtBanco">RFC del banco</label>
                                    <asp:TextBox ID="txtBancoRFC" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                        ErrorMessage="*campo obligatorio"
                                        ControlToValidate="txtBancoRFC"
                                        Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                    </asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="row" style="padding-bottom: 1.3rem;">
                                <div class="col">
                                    <label for="txtNoCuenta">Numero de cuenta</label>
                                    <asp:TextBox ID="txtNoCuenta" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                        ErrorMessage="*campo obligatorio"
                                        ControlToValidate="txtNoCuenta"
                                        Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="col">
                                    <label for="txtClaveBancaria">Clave bancaria</label>
                                    <asp:TextBox ID="txtClaveBancaria" runat="server" CssClass="form-control" MaxLength="18"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                                        ErrorMessage="*campo obligatorio"
                                        ControlToValidate="txtClaveBancaria"
                                        Display="Dynamic" ValidateRequestMode="Enabled">
                                    </asp:RequiredFieldValidator>
                                    <asp:Button Text="pruebaBanco" runat="server" ID="btnBanco" OnClick="btnBanco_Click" Visible="false" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                <!-- ==============================================Datos de contacto=========================================================== -->
                <div class="col-6">
                    <div id="contactoCompania" class="card border-primary">
                        <h6 class="card-header cabezal">Datos de contacto 
                            <span><i class="bi bi-question-circle"
                                data-bs-toggle="tooltip"
                                data-bs-placement="bottom"
                                title="Llene los campos necesarios y haga clic en el boton 'Registrar contacto' "></i></span></h6>
                        <div class="card-body">

                            <div class="row">
                                <div class="col">
                                    <label for="txtNombrCont">Nombre:</label>
                                    <%--<asp:TextBox ID="txtNombrCont" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                    <input type="text" name="name" value="" id="txtNombrCont" class="form-control" />
                                    <span id="sNombre" style="color: red;"></span>
                                </div>
                                <div class="col">
                                    <label for="txtpustoCont">Puesto:</label>
                                    <%--<asp:TextBox ID="txtpuestoCont" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                    <input type="text" name="name" value="" id="txtpuestoCont" class="form-control" />
                                    <span id="sPuesto" style="color: red;"></span>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <label for="txtCorreoCont">Correo:&nbsp;</label>
                                    <%--<asp:TextBox ID="txtCorreoCont" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>--%>
                                    <input type="email" name="name" value="" id="txtCorreoCont" class="form-control" />
                                    <span id="sCorreo" style="color: red;"></span>

                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="cbContactoFactura">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            Enviar factura
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-5">
                                    <label for="txtTelCont">Telefono:</label>
                                    <%--<asp:TextBox ID="txtTelCont" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>--%>
                                    <input type="tel" name="name" value="" id="txtTelCont" class="form-control" />
                                    <span id="sTelefono" style="color: red;"></span>


                                </div>
                                <div class="col-3">
                                    <label for="txtFaxCont">Extensión:</label>
                                    <%--<asp:TextBox ID="txtExtCont" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>--%>
                                    <input type="number" name="name" value="" id="txtExtCont" class="form-control" />

                                </div>

                                <div class="col-4">
                                    <label for="txtCelCont">Celular:</label>
                                    <%--<asp:TextBox ID="txtCelCont" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>--%>
                                    <input type="tel" name="name" value="" id="txtCelCont" class="form-control" />
                                    <span id="sCelular" style="color: red;"></span>

                                </div>
                            </div>
                            <br />
                        </div>
                        <div class="card-footer">
                            <div class="row">
                                <div class="col"></div>
                                <div class="col"></div>
                                <div class="col">
                                    <input type="button" class="btn btn-primary btn-sm" id="btnContactoCompania" value="Agregar contacto" hidden />
                                    <%--<asp:Button ID="btnAgregarContacto" runat="server" Text="Agregar" />--%>
                                    <button id="btnContact" type="button" class="btn btn-primary">Registrar contacto</button>
                                    <button id="btnCargar" type="button" style="display: none">cargar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="card">
                        <div class="table-responsive">
                            <table class="table  table-sm" id="tContactoCom" >
                                <caption>Contactos registrados</caption>
                                <thead class="cabezal">
                                    <tr>
                                        <th hidden></th>
                                        <th>Nombre</th>
                                        <th>Puesto</th>
                                        <th>Correo</th>
                                        <th>Telefono</th>
                                        <th>Ext</th>
                                        <th>Celular</th>
                                        <th>Fra.</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody class="table-bordered border-primary">
                                </tbody>
                                <tfoot></tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>


        <br />
        <hr />
        <div class="row">
            <br />
            <div class="col" style="display: flex; justify-content: flex-end;">
                <%--<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalOpciones">
                    ojo
                </button>--%>
                <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-secondary" OnClick="btnHome_Click"
                    data-bs-toggle="tooltip"
                    data-bs-placement="top"
                    title="Guardar y salir"> <i class="bi bi-house-door"></i> </asp:LinkButton>&nbsp;&nbsp;

                <%--<button id="btnContinuar" class="btn btn-success" type="button">Siguiente<i class="bi bi-chevron-right"></i></button>--%>
                <%--<asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-success" OnClick="btnNext_Click" UseSubmitBehavior="False" />--%>
                <asp:LinkButton ID="btnAdNext" runat="server" OnClick="btnNext_Click" CssClass="btn btn-primary" Visible="false">Siguiente <i class="bi bi-chevron-right"></i> </asp:LinkButton>

                <asp:LinkButton ID="bntNext" runat="server" OnClick="btnNext_Click" CssClass="btn btn-primary">Siguiente <i class="bi bi-chevron-right"></i> </asp:LinkButton>
            </div>
            <br />
        </div>


        <!--=========Modal=============================================================================================================================
        <div class="modal fade" tabindex="-1" id="modalOpciones" >
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><i class="bi bi-info-circle"></i> Esta por terminar la primer parte del registro</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>¿Desea continuar con el registro?</p>
                        <p>Si selecciona "Guardar y contnuar" podrá seguir con el registro</p>
                        <p>Si selecciona "Guardar y salir" será enviado al inicio</p>
                        
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnSiguiente" runat="server" Text="Guardar y continuar" CssClass="btn btn-primary" />
                        <asp:Button ID="btnSalir" runat="server" Text="Guardar y salir" CssClass="btn btn-primary" />

                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>

                    </div>
                </div>
            </div>
        </div>
        <!--=========Modal============================================================================================================================= -->

    </div>



    <script type="text/javascript">

        $(document).ready(() => {
            if (sessionStorage.getItem('ctipo') == 'proveedor') {
                $('#wizard2').prop('hidden', false);
            } else if (sessionStorage.getItem('ctipo') == 'cliente') {
                $('#wizard').prop('hidden', false);
            }


            CargarContactos();
        });

        fillComboPais($("#cbPais"));
        fillComboPais($("#cbPaisFact"));
        fillFP();


        $('#btnContinuar').click(function () {
            switch (sessionStorage.getItem('ctipo')) {
                case 'cliente':
                    window.location.href = 'AgentesAduanales.aspx';
                    break;
                case 'proveedor':
                    window.location.href = 'InformacionCadenaSuministro.aspx';

                    break;
                default:
                    alert('selecciona un tipo de registro');
                    break;
            }
        });

    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
