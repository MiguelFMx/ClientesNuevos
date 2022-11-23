<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InformacionCompania.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.ImformacionCompania" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>Información</title>


    <link href="../../template/assets/css/style.css" rel="stylesheet" />

    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>
    <script src="../JS/InfoComJS.js"></script>
    <script src="../../Scripts/JS/ajax.js"></script>

    <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>

    <style type="text/css"> .hiddencol { display: none; } </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server" >

    <div class="container">
        <div class="row">

            <div class="col">
                    <asp:Panel runat="server" ID="pRegistro" Visible="false" >

                <div class="col-auto">
                    <asp:Label ID="lblRegistro" runat="server" Text="Tipo de registro" CssClass="form-label"></asp:Label>
                </div>
                <div class="col-3">
                        <select id="cbTipoDeRegistro" class="form-select" hidden>
                        <option value="" selected disabled>...</option>
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
                            <asp:Label ID="lblDesc1" runat="server" Text="Paso 1"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub1" runat="server" Text="Información de la compañia" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step2" runat="server" NavigateUrl="~/F14/Secciones/AgentesAduanales.aspx">
                            <asp:Label ID="lblstep2" runat="server" Text="2" CssClass="step_no"></asp:Label>
                            <asp:Label ID="lblDesc2" runat="server" Text="Paso 2"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub2" runat="server" Text="Información de agentes aduanales" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step3" runat="server" NavigateUrl="~/F14/Secciones/CompaniaFilial.aspx">
                            <asp:Label ID="lblstep3" runat="server" Text="3" CssClass="step_no"></asp:Label>
                            <asp:Label ID="lblDesc3" runat="server" Text="Paso 3"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub3" runat="server" Text="Informacion de compañia filial" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step4" runat="server" NavigateUrl="~/F14/Secciones/TipoServicioProductos.aspx">
                            <asp:Label ID="lblstep4" runat="server" Text="4" CssClass="step_no"></asp:Label>

                            <asp:Label ID="lblDesc4" runat="server" Text="Paso 4"></asp:Label>
                            <br />
                            <asp:Label ID="lblsub4" runat="server" Text="Tipo de servicio requerido" Font-Size="Smaller"></asp:Label>
                        </asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="step5" runat="server" NavigateUrl="~/F14/Secciones/InformacionCadenaSuministro.aspx">
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
        <!------------------------------------------------- Informacion de compañia------------------------------->
        <fieldset>
            <div class="card border-primary">
                <div class="card-header cabezal">
                    <asp:Label ID="lblTitulo_infoCom" runat="server" Text="Información de la compañia"></asp:Label>
                </div>
                <div class="card-body">
                    <div id="contenedorComp">
                        <div class="row">
                            <div class="col-sm">
                                <asp:Label ID="lblNombreCompania" runat="server" Text="Nombre de la compañia:" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtNombreCompania" runat="server" CssClass="form-control" AutoPostBack="True"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ErrorMessage="*campo obligatorio"
                                    ControlToValidate="txtNombreCompania"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm">
                                <asp:Label ID="lblNombreComercial" runat="server" Text="Nombre comercial:" CssClass="form-label"></asp:Label>
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
                            <div class="col-md">
                                <asp:Label ID="lblTipoPersona" runat="server" Text="Tipo de persona:" CssClass="form-label"></asp:Label>
                                <asp:DropDownList ID="ddTipoDePersona" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddTipoDePersona_SelectedIndexChanged">
                                    <asp:ListItem Text="Extranjero" Value="2" />
                                    <asp:ListItem Text="Moral" Value="0" />
                                    <asp:ListItem Text="Fisica" Value="1" />
                                </asp:DropDownList>
                            </div>
                            <div class="col-md">
                                <asp:Label ID="lblRFC" runat="server" Text="RFC:" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtRfc" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ErrorMessage="*campo obligatorio"
                                    ControlToValidate="txtRfc"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md">
                                <asp:Label ID="lblCURP" runat="server" Text="CURP" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtCURP" runat="server" CssClass="form-control"></asp:TextBox>

                            </div>
                            <div class="col-md">
                                <asp:Label ID="lblAnosNegocio" runat="server" Text="Años de negocio:" CssClass="form-label"></asp:Label>
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
                            <div class="col-md-8">
                                <asp:Label ID="lblDirecFiscal" runat="server" Text="Dirección fiscal:" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtDirecFiscal" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                    ErrorMessage="*campo obligatorio"
                                    ControlToValidate="txtDirecFiscal"
                                    Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                </asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblCP" runat="server" Text="CP:" CssClass="form-label"></asp:Label>
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
                            <div class="col-sm">
                                <asp:Label ID="lblPais" runat="server" Text="Pais:" CssClass="form-label"></asp:Label>
                                <asp:DropDownList ID="ddPais" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddPais_SelectedIndexChanged" AutoPostBack="True">
                                </asp:DropDownList>
                            </div>
                            <div class="col-sm">
                                <asp:Label ID="lblEstado" runat="server" Text="Estado:" CssClass="form-label"></asp:Label>
                                <asp:DropDownList ID="ddEstado" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddEstado_SelectedIndexChanged">
                                    <asp:ListItem Text="..." Value="0" Enabled="false" />
                                </asp:DropDownList>
                            </div>
                            <div class="col-sm">
                                <asp:Label ID="lblCiudad" runat="server" Text="Ciudad:" CssClass="form-label"></asp:Label>

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
                <div class="col-md">
                    <div class="card border-primary">
                        <div class="card-header cabezal">
                            <div class="col">
                                <h6 style="font-weight: bold;">
                                    <asp:Label ID="lblTitulo_DatosFra" runat="server" Text="Datos de facturacion"></asp:Label>
                                </h6>

                                <div class="form-check ">
                                    <asp:CheckBox ID="chkDireccionIgual" runat="server" OnCheckedChanged="chkDireccionIgual_CheckedChanged" AutoPostBack="True" />
                                    <asp:Label ID="lblDireccionIgual" runat="server" Text="Direccion de facturacion es diferente a direccion fiscal" Font-Size="13px" CssClass="form-check-label"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <asp:Panel runat="server" ID="pFra" Enabled="False" BackColor="#E9ECEF">
                            <div class="card-body" id="DirFra">
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Label ID="lblDirecFacturacion" runat="server" Text="Dirección facturación:" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtDirecFacturacion" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="lblPaisFact" runat="server" Text="Pais:" CssClass="form-label"></asp:Label>
                                        <asp:DropDownList ID="ddPaisFra" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddPaisFra_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
                                    <div class="col">
                                        <asp:Label ID="lblEstadoFra" runat="server" Text="Estado:" CssClass="form-label"></asp:Label>
                                        <asp:DropDownList ID="ddEstadoFra" runat="server" CssClass="form-select" AutoPostBack="True" OnSelectedIndexChanged="ddEstadoFra_SelectedIndexChanged"></asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <asp:Label ID="lblCiudadFact" runat="server" Text="Ciudad:" CssClass="form-label"></asp:Label>
                                        <asp:DropDownList ID="ddCiudadFra" runat="server" CssClass="form-select"></asp:DropDownList>
                                    </div>
                                    <div class="col">
                                        <asp:Label ID="lblCPFact" runat="server" Text="CP:" CssClass="form-label"></asp:Label>
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
                <!-- ===============================================Datos bancarios=================================================== -->
                <div class="col-md">
                    <div class="card border-primary">
                        <h6 class="card-header cabezal">
                            <asp:Label ID="lblTitulo_DatosBancarios" runat="server" Text="Datos bancarios"></asp:Label>
                        </h6>
                        <asp:Panel runat="server" ID="pDatosBancarios">

                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-5">
                                        <asp:Label ID="lblMetodoPago" runat="server" Text="Metodo de pago:" CssClass="form-label"></asp:Label>
                                        <asp:DropDownList ID="ddMetodoPago" runat="server" CssClass="form-select" AutoPostBack="False">
                                            <asp:ListItem Text="..." Value="0" Selected="False" />
                                            <asp:ListItem Text="PUE-Pago en Una sola Exhibición" Value="PUE" Selected="False" />
                                            <asp:ListItem Text="PPD-Pago en Parcialidades o Diferido" Value="PPD" Selected="False" />
                                        </asp:DropDownList>

                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblFormaPago" runat="server" Text="Forma de pago:" CssClass="form-label"></asp:Label>
                                        <asp:DropDownList ID="ddFormaPago" runat="server" CssClass="form-select">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:Label ID="lblMoneda" runat="server" Text="Moneda"></asp:Label>
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
                                        <asp:Label ID="lblBanco" runat="server" Text="Nombre del banco:"></asp:Label>
                                        <asp:TextBox ID="txtBanco" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                            ErrorMessage="*campo obligatorio"
                                            ControlToValidate="txtBanco"
                                            Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col">
                                        <asp:Label ID="lblRFCBanco" runat="server" Text="RFC del banco:"></asp:Label>
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
                                        <asp:Label ID="lblNoCuenta" runat="server" Text="Numero de cuenta:" CssClass="form-label"></asp:Label>
                                        <asp:TextBox ID="txtNoCuenta" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                                            ErrorMessage="*campo obligatorio"
                                            ControlToValidate="txtNoCuenta"
                                            Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col">
                                        <asp:Label ID="lblClaveBancaria" runat="server" Text="Clabe bancaria:"></asp:Label>
                                        <asp:TextBox ID="txtClaveBancaria" runat="server" CssClass="form-control" MaxLength="18"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                                            ErrorMessage="*campo obligatorio"
                                            ControlToValidate="txtClaveBancaria"
                                            Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                        </asp:RequiredFieldValidator>
                                        <asp:Button Text="pruebaBanco" runat="server" ID="btnBanco" OnClick="btnBanco_Click" Visible="false" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>

                    </div>
                </div>
            </div>
            <hr />


            <div class="row">
                <div class="col-md-6">
                    <div id="contactoCompania1" class="card border-primary">
                        <h6 class="card-header cabezal">
                            <asp:Label ID="Label1" runat="server" Text="Datos de contacto"></asp:Label>

                            <asp:Label ID="Label2" runat="server" Text="">
                                 <span><i class="bi bi-question-circle"
                                    data-bs-toggle="tooltip"
                                    data-bs-placement="bottom"
                                    title="Llene los campos necesarios y haga clic en el boton 'Registrar contacto' "></i></span>
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
                                    <asp:Label ID="Label4" runat="server" Text="Nombre:"></asp:Label>
                                    <asp:TextBox ID="txtNombreC" runat="server" CssClass="form-control"></asp:TextBox>

                                </div>
                                <div class="col-sm">
                                    <asp:Label ID="Label5" runat="server" Text="Puesto:"></asp:Label>
                                    <asp:TextBox ID="txtPuestoC" runat="server" CssClass="form-control"></asp:TextBox>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col">
                                    <asp:Label ID="Label6" runat="server" Text="Correo:" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="txtCorreoC" runat="server" CssClass="form-control"></asp:TextBox>


                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-check">
                                        <asp:CheckBox ID="chFactura" runat="server" CssClass="form-check" Text="&nbsp;Enviar factura" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="Label8" runat="server" Text="Telefono:" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="txtTelC" runat="server" CssClass="form-control" placeholder="ex. 6311001010" TextMode="Phone"></asp:TextBox>



                                </div>
                                <div class="col-sm-4">
                                    <asp:Label ID="Label9" runat="server" Text="Extensión:"></asp:Label>
                                    <asp:TextBox ID="txtExt" runat="server" TextMode="Phone" CssClass="form-control"></asp:TextBox>

                                </div>

                                <div class="col-sm-4">
                                    <asp:Label ID="Label10" runat="server" Text="Celular:"></asp:Label>

                                    <asp:TextBox ID="txtCelC" runat="server" CssClass="form-control" placeholder="ex. 6311001010" TextMode="Phone"></asp:TextBox>


                                </div>
                                <asp:Label ID="lblRes" runat="server" Text=""></asp:Label>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col">
                                    <asp:Panel ID="Panel_Contacto" runat="server" Visible="false">
                                        <asp:Label ID="Label7" runat="server" Text="Actualizar contacto:"></asp:Label>
                                        <asp:LinkButton ID="btnAproveC" runat="server" CssClass="btn btn-success btn-sm" OnClick="btnAproveC_Click"><i class="bi bi-check-lg"></i></asp:LinkButton>
                                        <asp:LinkButton ID="btnCancelC" runat="server" CssClass="btn btn-danger btn-sm" OnClick="btnCancelC_Click"><i class="bi bi-x-lg"></i></asp:LinkButton>

                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="row">
                                <div class="col d-flex justify-content-end">
                                    <asp:Button ID="btnRegistrarC" runat="server" Text="Registrar contacto" CssClass="btn btn-primary" OnClick="btnRegistrarC_Click" />

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="table-responsive">
                            <asp:GridView ID="gvContactos" runat="server" ShowHeaderWhenEmpty="True" CssClass="table table-hover table-bordered" AutoGenerateColumns="false" HeaderStyle-CssClass="cabezal" Caption="Contactos registrados" EmptyDataText="No hay registros">
                                <Columns>
                                    <asp:BoundField HeaderText="ID" DataField="ID" >
                                        <HeaderStyle CssClass="hiddencol"></HeaderStyle>
                                        <ItemStyle CssClass="hiddencol"></ItemStyle>
                                    </asp:BoundField> 
                                    <asp:BoundField HeaderText="Nombre" DataField="Nombre"></asp:BoundField>
                                    <asp:BoundField HeaderText="Puesto" DataField="Puesto"></asp:BoundField>
                                    <asp:BoundField HeaderText="Correo" DataField="Correo"></asp:BoundField>
                                    <asp:BoundField HeaderText="Telefono" DataField="Telefono"></asp:BoundField>
                                    <asp:TemplateField HeaderText="Ext.">
                                        <ItemTemplate>
                                            <asp:Label ID="lblExtG" runat="server" Text='<%# Eval("Extension").Equals("&nbsp;") ? "" : Eval("Extension") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:BoundField HeaderText="Celular" DataField="Celular"></asp:BoundField>
                                    <asp:TemplateField HeaderText="Facturacion">
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
                                    <asp:TemplateField HeaderText="Acciones">
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
        </fieldset>


        <br />
        <hr />
        <div class="row">
            <br />
            <div class="col" style="display: flex; justify-content: flex-end;">
                <asp:Panel ID="pUserControl" runat="server">

                    <%--<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalOpciones">
                    ojo
                </button>--%>
                    <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-secondary" OnClick="btnHome_Click"
                        data-bs-toggle="tooltip"
                        data-bs-placement="top"
                        title="Guardar y salir"> <i class="bi bi-house-door"></i> </asp:LinkButton>&nbsp;&nbsp;

                <%--<button id="btnContinuar" class="btn btn-success" type="button">Siguiente<i class="bi bi-chevron-right"></i></button>--%>
                    <%--<asp:Button ID="btnNext" runat="server" Text="Next" CssClass="btn btn-success" OnClick="btnNext_Click" UseSubmitBehavior="False" />--%>

                    <asp:LinkButton ID="bntNext" runat="server" OnClick="btnNext_Click" CssClass="btn btn-primary">
                        <asp:Label ID="lbl_btnNext" runat="server" Text="Siguiente"></asp:Label><i class="bi bi-chevron-right"></i>
                    </asp:LinkButton>

                </asp:Panel>
                <asp:Label ID="lblAct" runat="server" Text=""></asp:Label>
                <%-- ========================= Botonones de administrador: solo visibles si eres admin =========== --%>
                <asp:Panel ID="pAdminControl" runat="server" Visible="false">
                    <asp:LinkButton ID="btnAdminBack" runat="server" CssClass="btn btn-secondary" CausesValidation="false" OnClick="btnAdminBack_Click"
                        data-bs-toggle="tooltip"
                        data-bs-placement="top"
                        title="Atras"><i class="bi bi-arrow-left-short"></i></asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="btnAdminH" runat="server" CssClass="btn btn-primary" OnClick="btnAdminH_Click"
                    data-bs-toggle="tooltip"
                    data-bs-placement="top"
                    title="Salir"> <i class="bi bi-house-door"></i> </asp:LinkButton>&nbsp;&nbsp;

                <asp:LinkButton ID="btnAdinSave" runat="server" OnClick="btnAdinSave_Click" CssClass="btn btn-success">Editar<i class="bi bi-chevron-right"></i> </asp:LinkButton>

                    <asp:LinkButton ID="btnAdminNext" runat="server" CssClass="btn btn-secondary" OnClick="btnAdminNext_Click"
                        data-bs-toggle="tooltip"
                        data-bs-placement="top"
                        title="Siguiente" CausesValidation="False"><i class="bi bi-arrow-right-short"></i></asp:LinkButton>&nbsp;&nbsp;
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
    <script src="../../Scripts/umd/popper.min.js"></script>
</asp:Content>
