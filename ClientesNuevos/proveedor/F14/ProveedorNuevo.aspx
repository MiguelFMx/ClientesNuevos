<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProveedorNuevo.aspx.cs" Inherits="ClientesNuevos.proveedor.F14.ProveedorNuevo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" >
        <h1 style="text-align:center">Imagen</h1>
        <h2 style="text-align:center">Porvider information sheet</h2>
        <h3 style="text-align:center">new business partners</h3>

        
        <!-- Formulario -->
        <form class="form" method="post">
            <!-- fieldset company information -->
            <fieldset style="display: block;">
                <h2>Company information</h2>
                <div  class="row">
                    <div class="col">
                        <label for="txtNombreCompania" class="form-label">Name of the company:</label>
                        <input type="text" name="name" value="" id="txtNombreCompania" class="form-control"/>
                   </div>
                    <div class="col">
                        <label for="txtRfc"class="form-label">RFC or TAX ID:</label>
                        <input type="text" name="name" value="" id="txtRfc" class="form-control "/>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <label for="txtNombrCom" class="form-label">DBA:</label>
                        <input type="text" name="name" value="" id="txtNombrCom" class="form-control" />
                    </div>
                    <div class="col">
                        <label for="txtAnosNegocio">Years in business:</label>
                        <input type="number" name="name" value="" id="txtAnosNegocio" class="form-control" />
                    </div>
                </div>
                <div class="form-row">
                    <label for="txtDirecFiscal">Fiscal address:</label>
                    <input type="text" name="name" value="" id="txtDirecFiscal" class="form-control" />
                </div>

                <div class="row">
                    <div class="col">
                        <label for="txtCiudad">City:</label>
                        <input type="text" name="name" value="" id="txtCiudad" class="form-control" />
                    </div>
                    <div class="col">
                        <label for="txtEstado">State:</label>
                        <input type="text" name="name" value="" id="txtEstado" class="form-control" />
                    </div>
                    <div class="col">
                        <label for="txtPais">Country:</label>
                        <input type="text" name="name" value="" id="txtPais" class="form-control" />
                    </div>
                    <div class="col">
                        <label for="txtCP">Postal code:</label>
                        <input type="text" name="name" value="" id="txtCP" class="form-control" />
                    </div>
                </div>
                <hr />
                <div>
                    <h3>Contact</h3>
                    <div>
                        <label for="txtNombrCont">Name:</label>
                        <input type="text" name="name" value="" id="txtNombrCont" class="form-control"/>

                        <label for="txtpustoCont">Title:</label>
                        <input type="text" name="name" value="" id="txtpustoCont" class="form-control"/>

                    </div>
                    <div>
                         <label for="txtCorreoCont">E-mail:</label>
                        <input type="email" name="name" value="" id="txtCorreoCont" class="form-control"/>

                         <label for="txtCorreoCont2">Mailing address(if different):</label>
                        <input type="email" name="name" value="" id="txtCorreoCont2" class="form-control"/>
                    </div>

                    <div>
                         <label for="txtTelCont">Phone:</label>
                        <input type="tel" name="name" value="" id="txtTelCont" class="form-control"/>

                         <label for="txtCelCont">Cel/Nextel:</label>
                        <input type="tel" name="name" value="" id="txtCelCont" class="form-control"/>

                        <label for="txtFaxCont">Fax:</label>
                        <input type="text" name="name" value="" id="txtFaxCont" class="form-control"/>

                    </div>
                    
                    <h6>En caso de contar con más contactos podrá agregarlos mas adelante</h6>

                </div>
                <hr />
                    <input type="button" name="data[info]" class="next btn btn-info" value="Siguiente" />
               
            </fieldset>

            <!-- fieldset informacion de facturacion -->
            <fieldset style="display: none;">
                <h2>Información de facturación</h2>
                <div>

                    <div>
                        <div class="form-row">
                            <label for="txtDirecFacturacion">Dirección facturación:</label>
                            <input type="text" name="name" value="" id="txtDirecFacturacion" class="form-control" />
                        </div>

                        <div class="form-row">
                            <label for="txtCiudadFacturacion">Ciudad:</label>
                            <input type="text" name="name" value="" id="txtCiudadFacturacion" class="form-control" />

                            <label for="txtEstadoFacturacion">Estado:</label>
                            <input type="text" name="name" value="" id="txtEstadoFacturacion" class="form-control" />

                            <label for="txtPaisFacturacion">Pais:</label>
                            <input type="text" name="name" value="" id="txtPaisFacturacion" class="form-control" />

                            <label for="txtCPFacturacion">CP:</label>
                            <input type="text" name="name" value="" id="txtCPFacturacion" class="form-control" />
                        </div>

                    </div>
                    <div>
                        <h3>Contacto</h3>
                        <div>
                            <label for="txtNombrContFacturacion">Nombre:</label>
                            <input type="text" name="name" value="" id="txtNombrContFacturacion" class="form-control" />


                        </div>
                        <div>
                            <label for="txtCorreoContFacturacion">Correo:</label>
                            <input type="email" name="name" value="" id="txtCorreoContFacturacion" class="form-control" />

                            <label for="txtCorreoFacturacion2">Correo(si es diferente):</label>
                            <input type="email" name="name" value="" id="txtCorreoFacturacion2" class="form-control" />
                        </div>

                        <div>
                            <label for="txtTelContFacturacion">Telefono:</label>
                            <input type="tel" name="name" value="" id="txtTelContFacturacion" class="form-control" />

                            <label for="txtCelContFacturacion">Celular/Nextel:</label>
                            <input type="tel" name="name" value="" id="txtCelContFacturacion" class="form-control" />

                            <label for="txtFaxContFacturacion">Fax:</label>
                            <input type="text" name="name" value="" id="txtFaxContFacturacion" class="form-control" />

                        </div>

                    </div>

                    <hr />
                </div>

                <input type="button" name="previous" class="previous btn btn-default" value="Previo" />
                <input type="button" name="next" class="next btn btn-info" value="Siguiente" />

            </fieldset>

            <!-- fieldset Informacion de compañia filial -->
            <fieldset style="display:none;">
                <h2> Información de compañia filial en cadena de suministro de otra ciudad </h2>

                <div  class="form-row">
                    <div class="row">
                        <label for="txtNombreCompaniaFilial" class="form-label">Nombre de la compañia:</label>
                        <input type="text" name="name" value="" id="txtNombreCompaniaFilial" class="form-control form-control-sm"/>
                        
                    </div>
                </div>

                <div class="form-row">
                    <label for="txtNombrComFilial" class="form-label">Nombre comercial:</label>
                    <input type="text" name="name" value="" id="txtNombrComFilial" class="form-control"/>

                    <label for="txtRfcComFilial"class="form-label">RFC:</label>
                        <input type="text" name="name" value="" id="txtRfcComFilial" class="form-control form-control-sm"/>
                   
                </div>
                <div class="form-row">
                    <label for="txtDirecFiscalComFilial">Dirección fiscal:</label>
                    <input type="text" name="name" value="" id="txtDirecFiscalComFilial" class="form-control"/>
                </div>

                <div class="form-row">
                     <label for="txtCiudadComFilial">Ciudad:</label>
                    <input type="text" name="name" value="" id="txtCiudadComFilial" class="form-control"/>

                     <label for="txtEstadoComFilial">Estado:</label>
                    <input type="text" name="name" value="" id="txtEstadoComFilial" class="form-control"/>

                     <label for="txtPaisComFilial">Pais:</label>
                    <input type="text" name="name" value="" id="txtPaisComFilial" class="form-control"/>

                     <label for="txtCPComFilial">CP:</label>
                    <input type="text" name="name" value="" id="txtCPComFilial" class="form-control"/>
                </div>

                 <div>
                        <h3>Contacto</h3>
                        <div>
                            <label for="txtNombrContFilial">Nombre:</label>
                            <input type="text" name="name" value="" id="txtNombrContFilial" class="form-control" />

                            <label for="txtPuestoContFilial">Nombre:</label>
                            <input type="text" name="name" value="" id="txtPuestoContFilial" class="form-control" />
                        </div>
                        <div>
                            <label for="txtCorreoContFilial">Correo:</label>
                            <input type="email" name="name" value="" id="txtCorreoContFilial" class="form-control" />
                        </div>

                        <div>
                            <label for="txtTelContFilial">Telefono:</label>
                            <input type="tel" name="name" value="" id="txtTelContFilial" class="form-control" />

                            <label for="txtCelContFilial">Celular/Nextel:</label>
                            <input type="tel" name="name" value="" id="txtCelContFilial" class="form-control" />

                            <label for="txtFaxContFilial">Fax:</label>
                            <input type="text" name="name" value="" id="txtFaxContFilial" class="form-control" />

                        </div>

                    </div>
                <h6>Si cuenta con mas d una compañia filial podra registrarla mas adelante</h6>
                <hr />
                 
                    <input type="button" name="previous" class="previous btn btn-default" value="Previo" />
                     <input type="button" name="next" class="next btn btn-info" value="Siguiente" />
                
            </fieldset>

            <!-- fieldset tipo de servicio requerido-->
            <fieldset style="display:none;">
                <h2> Tipos de servicio requerido </h2>

                <div>
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <td>Servicio</td>
                                <td>Material peligroso</td>
                                <td>In-bonds</td>
                                <td>Ferrocarril</td>
                                <td>Almacen de deposito</td>
                                <td>Transbordo</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Almacenaje</td>
                                <td><input type="checkbox" name="cbAlmacenajetMP" value="" id="cbAlmacenajetMP"/></td>
                                <td><input type="checkbox" name="cbAlmacenajetIB" value="" id="cbAlmacenajetIB"/></td>
                                <td></td>
                                <td><input type="checkbox" name="cbAlmacenajeAD" value="" id="cbAlmacenajeAD"/></td>
                                <td><input type="checkbox" name="cbAlmacenajeT" value="" id="cbAlmacenajeT"/></td>
                                
                            </tr>
                            <tr>
                                <td>Exportación</td>
                                <td>
                                    <input type="checkbox" name="cbExportMP" value="" id="cbExporttMP"/>
                                </td>
                                <td>
                                    <input type="checkbox" name="cbImportIB" value="" id="cbExportIB"/>
                                </td>
                                <td>
                                    <input type="checkbox" name="cbImportFerro" value="" id="cbExportFerro" />
                                </td>
                            </tr>
                            <tr>
                                <td>Importacion</td>
                                <td>
                                    <input type="checkbox" name="cbImportMP" value="" id="cbImportMP"/>
                                </td>
                                <td>
                                    <input type="checkbox" name="cbImportIB" value="" id="cbImportIB"/>
                                </td>
                                <td>
                                    <input type="checkbox" name="cbImportFerro" value="" id="cbImportFerro" />
                                </td>
                            </tr>                            
                            <tr>
                                <td>Transportación</td>
                                <td>
                                    <input type="checkbox" name="cbTranstMP" value="" id="cbTranstMP"/>
                                </td>
                                <td>
                                    <input type="checkbox" name="cbTransIB" value="" id="cbTransIB"/>
                                </td>
                            </tr>
                            
                        </tbody>
                    </table>
                </div>

                <div>
                    <div class="form-check">
                        <label class="form-check-label" for="cbAgenciaAduanal">Agencia aduanal mexicana</label>
                        <input type="checkbox" class="form-check-input" id="cbAgenciaAduanal" value="" />

                    </div>
                    <div class="form-check">
                        <label class="form-check-label" for="cbLogistica">Logistica</label>
                        <input type="checkbox" class="form-check-input" id="cbLogistica" value="" />

                    </div>
                    <div>
                        <label for="txtOtroServicio" class="form-label">Otro:</label>
                        <input type="text" name="name" value="" id="txtOtroServicio" class="form-control" />
                    </div>
                </div>
                <hr />
                    <input type="button" name="previous" class="previous btn btn-default" value="Previo" />
                     <input type="button" name="next" class="next btn btn-info" value="Siguiente" />
                
            </fieldset>

             <!-- fieldset informacion de productos-->
            <fieldset style="display:none;">
                 <h2> Información de productos </h2>
                <hr />
                <input type="button" name="previous" class="previous btn btn-default" value="Previo" />
                     <input type="button" name="next" class="next btn btn-info" value="Siguiente" />
            </fieldset>

            <!-- fieldset Agente aduanal americano-->
            <fieldset style="display:none;">
                <h2> Agente aduanal americano </h2>

                <div  class="form-row">
                    <div class="row">
                        <label for="txtNombreCompaniaAAA" class="form-label">Nombre de la compañia:</label>
                        <input type="text" name="name" value="" id="txtNombreCompaniaAAA" class="form-control form-control-sm"/>
                   
                        <label for="txtNoPatAAA"class="form-label">Numero de patente:</label>
                        <input type="text" name="name" value="" id="txtNoPatAAA" class="form-control form-control-sm"/>
                    </div>
                </div>

                <div class="form-row">
                    <label for="txtNombrComAAA" class="form-label">Nombre comercial:</label>
                    <input type="text" name="name" value="" id="txtNombrComAAA" class="form-control"/>
                    
                    <label for="txtRFCTaxAAA">RFC/Tax ID:</label>
                    <input type="text" name="name" value="" id="txtRFCTaxAAA" class="form-control"/>
                </div>
                <div class="form-row">
                    <label for="txtDirecAAA">Dirección:</label>
                    <input type="text" name="name" value="" id="txtDirecAAA" class="form-control"/>
                </div>

                <div class="form-row">
                     <label for="txtCiudadAAA">Ciudad:</label>
                    <input type="text" name="name" value="" id="txtCiudadAAA" class="form-control"/>

                     <label for="txtEstadoAAA">Estado:</label>
                    <input type="text" name="name" value="" id="txtEstadoAAA" class="form-control"/>

                     <label for="txtPaisAAA">Pais:</label>
                    <input type="text" name="name" value="" id="txtPaisAAA" class="form-control"/>

                     <label for="txtCPAAA">CP:</label>
                    <input type="text" name="name" value="" id="txtCPAAA" class="form-control"/>
                </div>

                <div>
                    <h3>Contacto</h3>
                    <div>
                        <label for="txtNombrContAAA">Nombre:</label>
                        <input type="text" name="name" value="" id="txtNombrContAAA" class="form-control"/>

                        <label for="txtpuestoContAAA">Puesto:</label>
                        <input type="text" name="name" value="" id="txtpuestoContAAA" class="form-control"/>

                    </div>
                    <div>
                         <label for="txtCorreoContAAA">Correo:</label>
                        <input type="email" name="name" value="" id="txtCorreoContAAA" class="form-control"/>

                    </div>

                    <div>
                         <label for="txtTelContAAA">Telefono:</label>
                        <input type="tel" name="name" value="" id="txtTelContAAA" class="form-control"/>

                         <label for="txtCelContAAA">Celular/Nextel:</label>
                        <input type="tel" name="name" value="" id="txtCelContAAA" class="form-control"/>

                        <label for="txtFaxContAAA">Fax:</label>
                        <input type="text" name="name" value="" id="txtFaxContAAA" class="form-control"/>

                    </div>
                   
                    </div>

                <hr />
                
                    <input type="button" name="previous" class="previous btn btn-default" value="Previo" />
                     <input type="button" name="next" class="next btn btn-info" value="Siguiente" />
                
            </fieldset>

            <!-- fieldset Agente aduanal mexicano-->
            <fieldset style="display:none;">
                <h2> Agente aduanal mexicano </h2>
                
                <div  class="form-row">
                    <div class="row">
                        <label for="txtNombreCompaniaAAM" class="form-label">Nombre de la compañia:</label>
                        <input type="text" name="name" value="" id="txtNombreCompaniaAAM" class="form-control form-control-sm"/>
                   
                        <label for="txtNoPatAAM"class="form-label">Numero de patente:</label>
                        <input type="text" name="name" value="" id="txtNoPatAAM" class="form-control form-control-sm"/>
                    </div>
                </div>

                <div class="form-row">
                    <label for="txtNombrComAAM" class="form-label">Nombre comercial:</label>
                    <input type="text" name="name" value="" id="txtNombrComAAM" class="form-control"/>
                    
                    <label for="txtRFCTaxAAM">RFC/Tax ID:</label>
                    <input type="text" name="name" value="" id="txtRFCTaxAAM" class="form-control"/>
                </div>
                <div class="form-row">
                    <label for="txtDirecAAM">Dirección:</label>
                    <input type="text" name="name" value="" id="txtDirecAAM" class="form-control"/>
                </div>

                <div class="form-row">
                     <label for="txtCiudadAAM">Ciudad:</label>
                    <input type="text" name="name" value="" id="txtCiudadAAM" class="form-control"/>

                     <label for="txtEstadoAAM">Estado:</label>
                    <input type="text" name="name" value="" id="txtEstadoAAM" class="form-control"/>

                     <label for="txtPaisAAM">Pais:</label>
                    <input type="text" name="name" value="" id="txtPaisAAM" class="form-control"/>

                     <label for="txtCPAAM">CP:</label>
                    <input type="text" name="name" value="" id="txtCPAAM" class="form-control"/>
                </div>

                <div>
                    <h3>Contacto</h3>
                    <div>
                        <label for="txtNombrContAAM">Nombre:</label>
                        <input type="text" name="name" value="" id="txtNombrContAAM" class="form-control"/>

                        <label for="txtpuestoContAAM">Puesto:</label>
                        <input type="text" name="name" value="" id="txtpuestoContAAM" class="form-control"/>

                    </div>
                    <div>
                         <label for="txtCorreoContAAM">Correo:</label>
                        <input type="email" name="name" value="" id="txtCorreoContAAM" class="form-control"/>

                    </div>

                    <div>
                         <label for="txtTelContAAM">Telefono:</label>
                        <input type="tel" name="name" value="" id="txtTelContAAM" class="form-control"/>

                         <label for="txtCelContAAM">Celular/Nextel:</label>
                        <input type="tel" name="name" value="" id="txtCelContAAM" class="form-control"/>

                        <label for="txtFaxContAAM">Fax:</label>
                        <input type="text" name="name" value="" id="txtFaxContAAM" class="form-control"/>

                    </div>
                   
                    </div>


                <hr />
                    <input type="button" name="previous" class="previous btn btn-default" value="Previo" />
                     <input type="button" name="next" class="next btn btn-info" value="Siguiente" />
               
            </fieldset>

            <!-- fieldset Información de programa de cadena de suministro-->
            <fieldset style="display:none;">
                <h2> Información de cadena de suministro </h2>
                
                <div  class="col">
                    <div class="row">
                        <label for="txtCTPATSatuts" >C-TPAT status:</label>
                        <input type="text" name="" value="" id="txtCTPATSatuts" />
                        </div>
                        <div class="row">
                        <label for="txtCTPATSVI">C-TPAT SVI Numero:</label>
                        <input type="text" name="" value="" id="txtCTPATSVI" />
                    </div>

                    <div class="row">
                        <label>Validado por US customs:</label>
                        
                        <section>
                        <input type="radio" name="" value="" id="chValidadoSi"  />
                        <label for="radValidadoSi" >Si</label>
                        
                        <input type="radio" name="" value="" id="chValidadoNo"  />
                        <label for="radValidadoNo" >No</label>

                   </section>
                        <label for="dtFechaVal">Fecha de validacion:</label>
                        <input type="date" name="" value="" id="dtFechaVal" />
                    </div>

                    <div class="row">
                        <label for="txtCTPATComment" >Comentarios:</label>
                        <input type="text" name="" value="" id="txtCTPATComment" />
                    </div>
                    <div class="row">
                        <label for="txtCTPATComment" >Comentarios:</label>
                        <input type="text" name="" value="" id="txtCTPATComment" />
                    </div>
                </div>
                <hr />
                
                 
                    <input type="button" name="previous" class="previous btn btn-default" value="Previo" />
                     <input type="submit" name="submit" class="submit btn btn-info" value="Finalizar" />
                
            </fieldset>

            
        </form>
            </div>

</asp:Content>
