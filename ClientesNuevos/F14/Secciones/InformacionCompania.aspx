<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InformacionCompania.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.ImformacionCompania" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Información</title>


    <link href="../../template/assets/css/style.css" rel="stylesheet" />

    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
    <script src="../JS/InfoComJS.js"></script>
    <script src="../../Scripts/JS/ajax.js"></script>

    <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>

    <style type="text/css">
        .hiddencol {
            display: none;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>

                <div class="row">

                    <div class="col">
                        <asp:Panel runat="server" ID="pRegistro" Visible="false">

                            <div class="col-auto">
                                <asp:Label ID="lblRegistro" runat="server" Text="Tipo de registro" CssClass="form-label"></asp:Label>
                            </div>
                            <div class="col-3">
                                <select id="cbTipoDeRegistro" class="form-select" hidden>
                                    <option value="" disabled>...</option>
                                    <option value="cliente">Cliente</option>
                                    <option value="proveedor">Proveedor</option>
                                </select>

                                <asp:DropDownList ID="cbTipoRegistro" runat="server" class="form-select" AutoPostBack="true" OnSelectedIndexChanged="cbTipoRegistro_SelectedIndexChanged">
                                    <asp:ListItem Text="Cliente" Value="cliente" ID="cbClient" />
                                    <asp:ListItem Text="proveedor" Value="proveedor" ID="cbProv" />
                                </asp:DropDownList>
                            </div>

                        </asp:Panel>

                    </div>
                </div>
                <br />

                <div class="row">
                    <div id="wizard" class="form_wizard wizard_horizontal">
                        <ul class="wizard_steps">
                            <li>
                                <asp:HyperLink ID="step1" runat="server" CssClass="selected">
                                    <asp:Label ID="lblstep1" runat="server" Text="1" CssClass="step_no"></asp:Label>
                                    <asp:Label ID="lblDesc1" runat="server" Text="<%$Resources:AgentesAduanales,lblPaso1 %>"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblsub1" runat="server" Text="<%$Resources:AgentesAduanales,lblDesc1 %>" Font-Size="Smaller"></asp:Label>
                                </asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="step2" runat="server" NavigateUrl="~/F14/Secciones/AgentesAduanales.aspx">
                                    <asp:Label ID="lblstep2" runat="server" Text="2" CssClass="step_no"></asp:Label>
                                    <asp:Label ID="lblDesc2" runat="server" Text="<%$Resources:AgentesAduanales,lblPaso2 %>"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblsub2" runat="server" Text="<%$Resources:AgentesAduanales,lblDesc2 %>" Font-Size="Smaller"></asp:Label>
                                </asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="step3" runat="server" NavigateUrl="~/F14/Secciones/CompaniaFilial.aspx">
                                    <asp:Label ID="lblstep3" runat="server" Text="3" CssClass="step_no"></asp:Label>
                                    <asp:Label ID="lblDesc3" runat="server" Text="<%$Resources:AgentesAduanales,lblPaso3 %>"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblsub3" runat="server" Text="<%$Resources:AgentesAduanales,lblDesc3 %>" Font-Size="Smaller"></asp:Label>
                                </asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="step4" runat="server" NavigateUrl="~/F14/Secciones/TipoServicioProductos.aspx">
                                    <asp:Label ID="lblstep4" runat="server" Text="4" CssClass="step_no"></asp:Label>

                                    <asp:Label ID="lblDesc4" runat="server" Text="<%$Resources:AgentesAduanales,lblPaso4 %>"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblsub4" runat="server" Text="<%$Resources:AgentesAduanales,lblDesc4 %>" Font-Size="Smaller"></asp:Label>
                                </asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="step5" runat="server" NavigateUrl="~/F14/Secciones/InformacionCadenaSuministro.aspx">
                                    <asp:Label ID="lblstep5" runat="server" Text="5" CssClass="step_no"></asp:Label>
                                    <asp:Label ID="lblDesc5" runat="server" Text="<%$Resources:AgentesAduanales,lblPaso5 %>"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblsub5" runat="server" Text="Acreditación en programa de seguridad" Font-Size="Smaller"></asp:Label>
                                </asp:HyperLink>
                            </li>
                        </ul>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <!------------------------------------------------- Informacion de compañia------------------------------->
        <fieldset>
            <div class="card rounded-0">
                <div class="card-header cabezal rounded-0">
                    <asp:Label ID="lblTitulo_infoCom" runat="server" Text="<%$Resources:AgentesAduanales,lblDesc1 %>"></asp:Label>
                </div>
                <div class="card-body">
                    <div id="contenedorComp">
                        <div class="row">
                            <div class="col-sm">
                                <asp:Label ID="lblNombreCompania" runat="server" Text="<%$Resources:AgentesAduanales,lblNombreCompania %>" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtNombreCompania" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ErrorMessage="<%$Resources:InformacionCompania,lblErrorNombreEmpresa %>"
                                    ControlToValidate="txtNombreCompania"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm">
                                <asp:Label ID="lblNombreComercial" runat="server" Text="<%$Resources:AgentesAduanales, lblNombreComercial %>" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtNombrCom" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                    ErrorMessage="<%$Resources:InformacionCompania,lblErrorNombreComercial  %>"
                                    ControlToValidate="txtNombrCom"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lblTipoPersona" runat="server" Text="<%$Resources:InformacionCompania, lblRegimen %>" CssClass="form-label"></asp:Label>
                                        <asp:DropDownList ID="ddTipoDePersona" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddTipoDePersona_SelectedIndexChanged">
                                            <asp:ListItem Text="..." />
                                            <asp:ListItem Text="<%$Resources:InformacionCompania, lblPersonaExtranjera %>" Value="2" />
                                            <asp:ListItem Text="<%$Resources:InformacionCompania, lblPersonaMoral %>" Value="0" />
                                            <asp:ListItem Text="<%$Resources: InformacionCompania, lblPersonaFisica %>" Value="1" />
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="ddTipoDePersona" EventName="selectedindexchanged" />
                                    </Triggers>
                                </asp:UpdatePanel>


                            </div>

                            <div class="col-md">
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lblRFC" runat="server" Text="<%$Resources:InformacionCompania,lblRFC %>" CssClass="form-label"></asp:Label>

                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <asp:TextBox ID="txtRfc" Style="text-transform: uppercase" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="<%$Resources:InformacionCompania, lblErrorRFC %>"
                                    ControlToValidate="txtRfc"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                    ErrorMessage="Solo letras y numeros" ControlToValidate="txtRfc" ValidationExpression="^[0-9A-Z]+$">                                   
                                </asp:RegularExpressionValidator>

                                <span id="sExtiste" style="color: red;"></span>
                            </div>
                            <div class="col-md">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>


                                        <asp:Label ID="lblCURP" runat="server" Style="text-transform: uppercase" Text="CURP" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtCURP" runat="server" CssClass="form-control"></asp:TextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="col-md">
                                <asp:Label ID="lblAnosNegocio" runat="server" Text="<%$Resources:InformacionCompania, lblAnioNegocio %>" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtAnosNegocio" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                    ErrorMessage="<%$Resources:InformacionCompania, lblErrorAnios %>"
                                    ControlToValidate="txtAnosNegocio"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-8">
                                <asp:Label ID="lblDirecFiscal" runat="server" Text="<%$Resources:InformacionCompania, lblDireccionFiscal %>" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtDirecFiscal" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ErrorMessage="<%$Resources:InformacionCompania, lblErrorDireccion %>"
                                    ControlToValidate="txtDirecFiscal"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblCP" runat="server" Text="<%$Resources:InformacionCompania, lblCP %>" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtCP" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                    ErrorMessage="<%$Resources:InformacionCompania,lblErrorCP %>"
                                    ControlToValidate="txtCP"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <br />
                        <asp:UpdatePanel ID="UP_Ubicacion" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-sm">
                                        <asp:Label ID="lblPais" runat="server" Text="<%$Resources:InformacionCompania,lblPais %>" CssClass="form-label"></asp:Label>
                                        <asp:DropDownList ID="ddPais" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddPais_SelectedIndexChanged" AutoPostBack="True">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-sm">
                                        <asp:Label ID="lblEstado" runat="server" Text="<%$Resources:AgentesAduanales, lblEstado %>" CssClass="form-label"></asp:Label>
                                        <asp:DropDownList ID="ddEstado" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddEstado_SelectedIndexChanged">
                                            <asp:ListItem Text="..." />
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-sm">
                                        <asp:Label ID="lblCiudad" runat="server" Text="<%$Resources:AgentesAduanales, lblCiudad %>" CssClass="form-label"></asp:Label>

                                        <asp:DropDownList ID="ddCiudad" runat="server" CssClass="form-select">
                                            <asp:ListItem Text="..." />

                                        </asp:DropDownList>

                                        <asp:Button ID="btnPrueba" runat="server" Text="prueba" OnClick="btnPrueba_Click" Visible="false" />
                                        <asp:Label ID="lblresultado" runat="server" Text="Label" Visible="false"></asp:Label>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <br />
                    </div>
                </div>
            </div>

            <hr />

            <div class="row">
                <!--------------------------------------------Datos de facturacion--------------------------------------------------------->
                <div class="col-md">

                    <asp:UpdatePanel ID="UPDatosFra" runat="server">
                        <ContentTemplate>
                            <div class="card rounded-0">
                                <div class="card-header cabezal rounded-0">
                                    <div class="col">
                                        <h6 style="font-weight: bold;">
                                            <asp:Label ID="lblTitulo_DatosFra" runat="server" Text="<%$Resources:InformacionCompania,lblDatosFra %>"></asp:Label>
                                        </h6>

                                        <div class="form-check ">
                                            <asp:CheckBox ID="chkDireccionIgual" runat="server" OnCheckedChanged="chkDireccionIgual_CheckedChanged" AutoPostBack="True" />
                                            <asp:Label ID="lblDireccionIgual" runat="server" Text="<%$Resources:InformacionCompania,lblDireccionIgual %>" Font-Size="13px" CssClass="form-check-label"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                                <asp:Panel runat="server" ID="pFra" Enabled="False" BackColor="#E9ECEF">
                                    <div class="card-body" id="DirFra">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:Label ID="lblDirecFacturacion" runat="server" Text="<%$Resources:InformacionCompania, lblDirFra %>" CssClass="form-label"></asp:Label>
                                                <asp:TextBox ID="txtDirecFacturacion" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RFValidator_DirFra" ForeColor="Red" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDirecFacturacion" Enabled="false"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <asp:Label ID="lblPaisFact" runat="server" Text="<%$Resources:InformacionCompania, lblPais %>" CssClass="form-label"></asp:Label>
                                                <asp:DropDownList ID="ddPaisFra" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddPaisFra_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RFValidator_PaisFra" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddPaisFra" ForeColor="Red" Enabled="false"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col">
                                                <asp:Label ID="lblEstadoFra" runat="server" Text="<%$Resources:AgentesAduanales, lblEstado %>" CssClass="form-label"></asp:Label>
                                                <asp:DropDownList ID="ddEstadoFra" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddEstadoFra_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RFValidator_EstadoFra" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddEstadoFra" Enabled="false"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <asp:Label ID="lblCiudadFact" runat="server" Text="<%$Resources: AgentesAduanales, lblCiudad %>" CssClass="form-label"></asp:Label>
                                                <asp:DropDownList ID="ddCiudadFra" runat="server" CssClass="form-select"></asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RFValidator_CiudadFra" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddCiudadFra" Enabled="false"></asp:RequiredFieldValidator>
                                            </div>

                                            <div class="col">
                                                <asp:Label ID="lblCPFact" runat="server" Text="<%$Resources:InformacionCompania, lblCP %>" CssClass="form-label"></asp:Label>
                                                <asp:TextBox ID="txtCPFra" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ControlToValidate="txtCPFra" Enabled="false" ID="RFValidator_CPFra" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <br />
                                        </div>
                                    </div>
                                </asp:Panel>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <!-- ===============================================Datos bancarios=================================================== -->
                <div class="col-md">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="card rounded-0">
                                <div class="card-header cabezal rounded-0">
                                    <h6>
                                        <asp:Label ID="lblTitulo_DatosBancarios" runat="server" Text="<%$Resources:InformacionCompania, lblDatosBancarios %>"></asp:Label>
                                    </h6>

                                    <div class="form-check ">
                                        <asp:CheckBox ID="chNTS" runat="server" OnCheckedChanged="chNTS_CheckedChanged" AutoPostBack="True" />
                                        <asp:Label ID="lblNTS" runat="server" Text="Trabajamos por medio de Nogales Trasportation Service (NTS)" Font-Size="10px" CssClass="form-check-label"></asp:Label>
                                    </div>
                                    <div class="form-check ">
                                        <asp:CheckBox ID="chHTS" runat="server" OnCheckedChanged="chHTS_CheckedChanged" AutoPostBack="True" />
                                        <asp:Label ID="lblHTS" runat="server" Text="Trabajamos por medio Hungaros Freight Systems" Font-Size="10px" CssClass="form-check-label"></asp:Label>
                                    </div>
                                </div>
                                <asp:Panel runat="server" ID="pDatosBancarios">

                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-5">
                                                <asp:Label ID="lblMetodoPago" runat="server" Text="<%$Resources:InformacionCompania, lblMetodoPago %>" CssClass="form-label"></asp:Label>
                                                <asp:DropDownList ID="ddMetodoPago" runat="server" CssClass="form-select" AutoPostBack="False">
                                                    <asp:ListItem Text="..." Value="0" Selected="False" />
                                                    <asp:ListItem Text="PUE-Pago en Una sola Exhibición" Value="PUE" Selected="False" />
                                                    <asp:ListItem Text="PPD-Pago en Parcialidades o Diferido" Value="PPD" Selected="False" />
                                                </asp:DropDownList>

                                            </div>
                                            <div class="col-md-4">

                                                <asp:Label ID="lblFormaPago" runat="server" Text="<%$Resources:informacionCompania,lblFormaPago %>" CssClass="form-label"></asp:Label>
                                                <asp:DropDownList ID="ddFormaPago" runat="server" CssClass="form-select">
                                                </asp:DropDownList>

                                            </div>
                                            <div class="col-md-3">
                                                <asp:Label ID="lblMoneda" runat="server" Text="<%$Resources:InformacionCompania, lblMoneda %>"></asp:Label>
                                                <asp:DropDownList ID="ddMoneda" runat="server" CssClass="form-select">
                                                    <asp:ListItem Text="..." Value="x" />
                                                    <asp:ListItem Text="MXN" Value="MXN" />
                                                    <asp:ListItem Text="USD" Value="USD" />
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">

                                                <asp:Label ID="lblUsoCFDI" runat="server" Text="Uso de CFDI:" CssClass="form-label"></asp:Label>
                                                <asp:DropDownList ID="ddUsoCFDI" runat="server" CssClass="form-select">
                                                    <asp:ListItem Text="Seleccione el regimen al que pertenece" Value="" />
                                                </asp:DropDownList>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <asp:Label ID="lblBanco" runat="server" Text="<%$Resources:InformacionCompania,lblBanco %>"></asp:Label>
                                                <asp:TextBox ID="txtBanco" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                                    ErrorMessage="<%$Resources:InformacionCompania, lblErrorBanco %>"
                                                    ControlToValidate="txtBanco"
                                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col">
                                                <asp:Label ID="lblRFCBanco" runat="server" Text="<%$Resources:InformacionCompania,lblRFCBAnco %>"></asp:Label>
                                                <asp:TextBox ID="txtBancoRFC" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                                                    ErrorMessage="<%$Resources:InformacionCompania,lblErrorRFCBanco %>"
                                                    ControlToValidate="txtBancoRFC"
                                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="row" style="padding-bottom: 1.3rem;">
                                            <div class="col">
                                                <asp:Label ID="lblNoCuenta" runat="server" Text="<%$Resources:InformacionCompania, lblNoCuenta %>" CssClass="form-label"></asp:Label>
                                                <asp:TextBox ID="txtNoCuenta" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                                    ErrorMessage="<%$Resources: InformacionCompania, lblErrorNoCuenta %>"
                                                    ControlToValidate="txtNoCuenta"
                                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <div class="col">
                                                <asp:Label ID="lblClaveBancaria" runat="server" Text="<%$Resources:InformacionCompania,lblClabe %>"></asp:Label>
                                                <asp:TextBox ID="txtClaveBancaria" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                                                    ErrorMessage="<%$Resources:InformacionCompania, lblErrorClabe %>"
                                                    ControlToValidate="txtClaveBancaria"
                                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                            
                                                </asp:RequiredFieldValidator>
                                                <asp:Button Text="pruebaBanco" runat="server" ID="btnBanco" OnClick="btnBanco_Click" Visible="false" />
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>

                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <hr />

            <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <div class="col-md-6">
                            <div id="contactoCompania1" class="card rounded-0">
                                <h6 class="card-header cabezal rounded-0">
                                    <asp:Label ID="Label1" runat="server" Text="<%$Resources:InformacionCompania,lblDatosContacto %>"></asp:Label>

                                    <asp:Label ID="Label2" runat="server" Text="">
                                 <span><i class="bi bi-question-circle"
                                    data-bs-toggle="tooltip"
                                    data-bs-placement="bottom"
                                    title= "Llene los campos requeridos y a continuacion, haga clic en el boton 'agreagar contacto'"
                                     ></i></span>
                                    </asp:Label>

                                    <asp:Label ID="Label3" runat="server" Visible="false">
                                <span><i class="bi bi-question-circle"
                                    data-bs-toggle="tooltip"
                                    data-bs-placement="bottom"
                                    title="Fill the requested fields and then click on the button 'Add contact' "></i></span>
                                    </asp:Label>
                                </h6>
                                <div class="card-body">


                                    <div class="row">
                                        <div class="col-sm">
                                            <asp:HiddenField ID="hfIDComp" runat="server" />
                                            <asp:HiddenField ID="hfIdC" runat="server" />
                                            <asp:Label ID="Label4" runat="server" Text="<%$Resources:AgentesAduanales,lblNombreC %>"></asp:Label>
                                            <asp:TextBox ID="txtNombreC" runat="server" CssClass="form-control"></asp:TextBox>

                                        </div>
                                        <div class="col-sm">
                                            <asp:Label ID="Label5" runat="server" Text="<%$Resources:AgentesAduanales,lblPuestoC %>"></asp:Label>
                                            <asp:TextBox Visible="false" ID="txtPuestoC" runat="server" CssClass="form-control"></asp:TextBox>
                                            <asp:DropDownList ID="ddTipoContacto" CssClass="form-select" runat="server">
                                                <asp:ListItem Text="Contabilidad" Value="Contabilidad" />
                                                <asp:ListItem Text="Facturacion" Value="Facturacion" />
                                                <asp:ListItem Text="Gerencia" Value="Gerencia" />
                                                <asp:ListItem Text="Operaciones" Value="Operaciones" />
                                                <asp:ListItem Text="Referencia" Selected Value="Referencia" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <asp:Label ID="Label6" runat="server" Text="<%$Resources:AgentesAduanales,lblCorreo %>" CssClass="form-label"></asp:Label>
                                            <asp:TextBox ID="txtCorreoC" runat="server" CssClass="form-control"></asp:TextBox>


                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <div class="form-check">
                                                <asp:CheckBox ID="chFactura" runat="server" CssClass="form-check" Text="<%$Resources:InformacionCompania,lblCheckbox %>" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-4">
                                            <asp:Label ID="Label8" runat="server" Text="<%$Resources:AgentesAduanales, lblTelefono %>" CssClass="form-label"></asp:Label>
                                            <asp:TextBox ID="txtTelC" runat="server" CssClass="form-control" placeholder="(000) 000-0000" TextMode="Phone"></asp:TextBox>



                                        </div>
                                        <div class="col-sm-4">
                                            <asp:Label ID="Label9" runat="server" Text="Extension"></asp:Label>
                                            <asp:TextBox ID="txtExt" runat="server" TextMode="Phone" CssClass="form-control"></asp:TextBox>

                                        </div>

                                        <div class="col-sm-4">
                                            <asp:Label ID="Label10" runat="server" Text="<%$Resources:AgentesAduanales, lblCelular %>"></asp:Label>

                                            <asp:TextBox ID="txtCelC" runat="server" CssClass="form-control" placeholder="(000) 000-0000" data-mask="(000) 000-0000" TextMode="Phone"></asp:TextBox>


                                        </div>
                                        <asp:Label ID="lblRes" runat="server" Text=""></asp:Label>
                                    </div>

                                    <br />
                                    <div class="row">
                                        <div class="col">
                                            <asp:Panel ID="Panel_Contacto" runat="server" Visible="false">
                                                <asp:Label ID="Label7" runat="server" Text="<%$Resources:InformacionCompania, lblEditContacto %>"></asp:Label>
                                                <asp:LinkButton ID="btnAproveC" runat="server" CssClass="btn btn-success btn-sm" OnClick="btnAproveC_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                                <asp:LinkButton ID="btnCancelC" runat="server" CssClass="btn btn-danger btn-sm" OnClick="btnCancelC_Click"><i class="bi bi-x-lg"></i></asp:LinkButton>

                                            </asp:Panel>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="row">
                                        <div class="col d-flex justify-content-end">
                                            <asp:Button ID="btnRegistrarC" runat="server" Text="<%$Resources:InformacionCompania, lblBotonRegistrar %>" CssClass="btn btn-primary" OnClick="btnRegistrarC_Click" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card">
                                <div class="table-responsive">

                                    <asp:GridView ID="gvContactos" runat="server" ShowHeaderWhenEmpty="True" CssClass="table table-hover table-bordered" AutoGenerateColumns="false" HeaderStyle-CssClass="cabezal" EmptyDataText="No hay registros">
                                        <Columns>
                                            <asp:BoundField HeaderText="ID" DataField="ID">
                                                <HeaderStyle CssClass="hiddencol"></HeaderStyle>
                                                <ItemStyle CssClass="hiddencol"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField HeaderText="<%$Resources:AgentesAduanales,lblNombreC %>" DataField="Nombre"></asp:BoundField>
                                            <asp:BoundField HeaderText="<%$Resources:AgentesAduanales,lblPuestoC %>" DataField="Puesto"></asp:BoundField>
                                            <asp:BoundField HeaderText="<%$Resources:AgentesAduanales,lblCorreo %>" DataField="Correo"></asp:BoundField>
                                            <asp:BoundField HeaderText="<%$Resources:AgentesAduanales,lblTelefono %>" DataField="Telefono"></asp:BoundField>
                                            <asp:TemplateField HeaderText="Ext.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblExtG" runat="server" Text='<%# Eval("Extension").Equals("&nbsp;") ? "" : Eval("Extension") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField HeaderText="<%$Resources:AgentesAduanales,lblCelular %>" DataField="Celular"></asp:BoundField>
                                            <asp:TemplateField HeaderText="<%$Resources:AgentesAduanales, lblFra %>">
                                                <ItemTemplate>
                                                    <%# Eval("Tipo").Equals("Fra") ? "<div class='form-check'><input class='form-check-input' type='checkbox' value='' id='flexCheckCheckedDisabled' checked disabled></div>" : "" %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Tipo" HeaderText="fra">
                                                <HeaderStyle CssClass="hiddencol"></HeaderStyle>
                                                <ItemStyle CssClass="hiddencol"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ID_compania" HeaderText="idcomp">
                                                <HeaderStyle CssClass="hiddencol"></HeaderStyle>
                                                <ItemStyle CssClass="hiddencol"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Extension" HeaderText="ext2">
                                                <HeaderStyle CssClass="hiddencol"></HeaderStyle>
                                                <ItemStyle CssClass="hiddencol"></ItemStyle>
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="<%$Resources:AgentesAduanales, lblAcciones %>">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnEditarC" runat="server" CssClass="btn btn-warning btn-sm text-white" OnClick="btnEditarC_Click"><i class="bi bi-pencil-square"></i></asp:LinkButton><asp:LinkButton ID="btnDelC" runat="server" CssClass="btn btn-danger btn-sm" OnClick="btnDelC_Click"><i class="bi bi-trash"></i></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>

                                </div>
                            </div>

                        </div>


                    </div>
                </ContentTemplate>
                <Triggers>
                </Triggers>
            </asp:UpdatePanel>

        </fieldset>


        <br />
        <hr />
        <div class="row">
            <asp:Label ID="lblRegf14" runat="server" Text=""></asp:Label>
            <div class="col">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#EB1414" />
                <br />
                <asp:Label Text="" runat="server" ID="lblSinContacto" ForeColor="#EB1414" />
            </div>
        </div>
        <div class="row">
            <br />
            <div class="col" style="display: flex; justify-content: flex-end;">
                <asp:Panel ID="pUserControl" runat="server">
                    <div class="row">
                        <div class="col">
                            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                <ContentTemplate>
                                    <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-secondary" OnClick="btnHome_Click"
                                        data-bs-toggle="tooltip"
                                        data-bs-placement="top"
                                        title="Guardar y salir"> <i class="bi bi-house-door"></i></asp:LinkButton>


                                    <asp:LinkButton ID="bntNext" runat="server" OnClick="btnNext_Click" CssClass="btn btn-primary">
                                        <asp:Label ID="lbl_btnNext" runat="server" Text="<%$Resources:InformacionCompania,lblBtnContinuar %>"></asp:Label><i class="bi bi-chevron-right"></i>
                                    </asp:LinkButton>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    &nbsp;&nbsp;

                    
                    

                </asp:Panel>
                <asp:Label ID="lblAct" runat="server" Text=""></asp:Label>
                <%-- ========================= Botonones de administrador: solo visibles si eres admin =========== --%>
                <asp:Panel ID="pAdminControl" runat="server" Visible="false">
                    <div class="row">
                        <div class="col">
                            <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                <ContentTemplate>
                                    <asp:LinkButton ID="btnAdminBack" runat="server" CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnAdminBack_Click"
                                        data-bs-toggle="tooltip"
                                        data-bs-placement="top"
                                        title="Atras"><i class="bi bi-arrow-left-short"></i></asp:LinkButton>

                                    <asp:LinkButton ID="btnAdminH" runat="server" CssClass="btn btn-primary" OnClick="btnAdminH_Click"
                                        data-bs-toggle="tooltip"
                                        data-bs-placement="top"
                                        title="Salir"> <i class="bi bi-house-door"></i> </asp:LinkButton>


                                    <asp:LinkButton ID="btnAdinSave" runat="server" CssClass="btn btn-success" OnClick="btnAdinSave_Click">Editar</asp:LinkButton>



                                    <asp:LinkButton ID="btnAdminNext" runat="server" CssClass="btn btn-secondary" OnClick="btnAdminNext_Click"
                                        data-bs-toggle="tooltip"
                                        data-bs-placement="top"
                                        title="Siguiente" CausesValidation="False"><i class="bi bi-arrow-right-short"></i></asp:LinkButton>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </asp:Panel>
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

                $('#MainContent_txtTelC').mask('(000) 000-0000', { placeholder: "(000) 000-0000" });
                $('#MainContent_txtCelC').mask('(000) 000-0000', { placeholder: "(000) 000-0000" });

               //CargarContactos();
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
    <script src="../../Scripts/bootstrap.bundle.min.js"></script>
    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/jquery.mask.js"></script>
    <script src="../../Scripts/umd/popper.min.js"></script>
    <script src="../../Scripts/sweetalert2.all.min.js"></script>

</asp:Content>
