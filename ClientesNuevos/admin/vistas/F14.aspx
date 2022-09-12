<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="F14.aspx.cs" Inherits="ClientesNuevos.admin.vistas.F14" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <section id="imprimir">
            <section id="InformacionCompania">
                <div class="row">
                    <div id="contenedorComp">
                        <h4>Información de la compañia</h4>
                        <div class="row">
                            <div class="col">
                                <label for="txtNombreCompania" class="form-label">Nombre de la compañia:</label>
                                <asp:TextBox ID="txtNombreCompania" runat="server" CssClass="form-control" ></asp:TextBox>                               
                            </div>
                            <div class="col">
                                <label for="txtNombrCom" class="form-label">Nombre comercial:</label>
                                <asp:TextBox ID="txtNombrCom" runat="server" CssClass="form-control"></asp:TextBox>
                                
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col">
                                <label for="txtRfc" class="form-label">RFC:</label>
                                <asp:TextBox ID="txtRfc" runat="server" CssClass="form-control"></asp:TextBox>
                                
                            </div>
                            <div class="col">
                                <label for="txtCURP" class="form-label">CURP:</label>
                                <asp:TextBox ID="txtCURP" runat="server" CssClass="form-control"></asp:TextBox>

                            </div>
                            <div class="col">
                                <label for="txtAnosNegocio" class="form-label">Años de negocio:</label>
                                <asp:TextBox ID="txtAnosNegocio" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-8">
                                <label for="txtDirecFiscal" class="form-label">Dirección fiscal:</label>
                                <asp:TextBox ID="txtDirecFiscal" runat="server" CssClass="form-control"></asp:TextBox>
                                
                            </div>
                            <div class="col-4">
                                <label for="txtCP" class="form-label">CP:</label>
                                <asp:TextBox ID="txtCP" runat="server" CssClass="form-control"></asp:TextBox>
                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <label for="cbPais" class="form-label">Pais:</label>
                                <asp:TextBox ID="txtPais" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col">
                                <label for="cboEstado" class="form-label">Estado:</label>
                                <asp:TextBox ID="txtEstado" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col">
                                <label for="cbCiudad" class="form-label">Ciudad:</label>
                                <asp:TextBox ID="txtCiudad" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>

            <hr />
                <!--------------------------------------------Datos de facturacion--------------------------------------------------------->
            <div class="row">
                <div class="col">
                    <div class="card border-primary">
                        <div class="card-header cabezal">
                            <div class="col">
                                <h6 style="font-weight: bold;">Datos de facturacion</h6>
                            </div>
                        </div>
                        <asp:Panel runat="server" ID="pFra">
                            <div class="card-body" id="DirFra">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="txtDirecFacturacion" class="form-label">Dirección facturación:</label>
                                        <asp:TextBox ID="txtDirecFacturacion" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="txtPaisFact" class="form-label">Pais:</label>
                                        <asp:TextBox ID="txtPaisFact" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <label for="txtEstadoFact" class="form-label">Estado:</label>
                                        <asp:TextBox ID="txtEstadoFact" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <label for="txtCiudadFact" class="form-label">Ciudad:</label>
                                        <asp:TextBox ID="txtCiudadFact" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col">
                                        <label for="txtCPFacturacion" class="form-label">CP:</label>
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
                                <div class="col">
                                    <label for="txtMetodoPago" class="form-label">Metodo de pago</label>
                                    <asp:TextBox ID="txtMetodoPago" runat="server" CssClass="form-control"></asp:TextBox>

                                </div>
                                <div class="col">
                                    <label for="cbFormaPago" class="form-label">Forma de pago</label>
                                    <asp:TextBox ID="txtFormaPago" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="txtUsoCFDI" class="form-label">Uso de CFDI</label>
                                    <asp:TextBox ID="txtUsoCFDI" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="col-3">
                                    <label for="txtMoneda" class="form-label">Moneda</label>
                                    <asp:TextBox ID="txtMoneda" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="txtBanco" class="form-label">Nombre del banco</label>
                                    <asp:TextBox ID="txtBanco" runat="server" CssClass="form-control"></asp:TextBox>
                                    
                                </div>
                                <div class="col">
                                    <label for="txtBanco" class="form-label">RFC del banco</label>
                                    <asp:TextBox ID="txtBancoRFC" runat="server" CssClass="form-control"></asp:TextBox>
                                    
                                </div>
                            </div>
                            <div class="row" style="padding-bottom: 1.3rem;">
                                <div class="col">
                                    <label for="txtNoCuenta" class="form-label">Numero de cuenta</label>
                                    <asp:TextBox ID="txtNoCuenta" runat="server" CssClass="form-control"></asp:TextBox>
                                    
                                </div>
                                <div class="col">
                                    <label for="txtClaveBancaria" class="form-label">Clave bancaria</label>
                                    <asp:TextBox ID="txtClaveBancaria" runat="server" CssClass="form-control" MaxLength="18"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr />
                <!-- ==============================================Datos de contacto=========================================================== -->
            <div class="row">
                <div class="col">
                    <h5>Contactos</h5>
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
                </div>
            </section>
        </section>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
