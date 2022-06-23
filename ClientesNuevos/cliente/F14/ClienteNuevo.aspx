<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClienteNuevo.aspx.cs" Inherits="ClientesNuevos.cliente.F14.ClienteNuevo" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        fileldset:not(:first-of-type) {
            display: none;
        }
    </style>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

   <!--Contenedor -->
    <div class="container">

        <h1 style="text-align: center">Información de cliente</h1>
        <h2 style="text-align: center">Cliente nuevo</h2>


        <!-- Formulario -->
        <form class="form" method="post">
            <!-- fieldset información de compañia -->
            <fieldset style="display: block;">
                <legend style="font-size:25px;">Información de la compañia</legend>
                
                <div id="contenedorComp">
                    <div class="row">
                        <div class="col">
                            <label for="txtNombreCompania">Nombre de la compañia:</label>
                            <input type="text" name="name" value="" id="txtNombreCompania" class="form-control" style="font-size: 16px; " />
                        </div>


                        <div class="col">
                            <label for="txtNombrCom" class="form-label">Nombre comercial:</label>
                            <input type="text" name="name" value="" id="txtNombrCom" class="form-control" style="font-size: 16px;" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col">
                            <label for="txtRfc">RFC:</label>
                            <input type="text" name="name" value="" id="txtRfc" class="form-control " style="font-size: 16px;" />
                        </div>
                        <div class="col">
                            <label for="txtAnosNegocio">Años de negocio:</label>
                            <input type="number" name="name" value="" id="txtAnosNegocio" class="form-control" style="font-size: 16px;" />
                        </div>
                    </div>  
                    <br />
                    <div class="row">
                        <div class="col">
                            <label for="txtDirecFiscal">Dirección fiscal:</label>                          
                            <textarea id="txtDirecFiscal" class="form-control" style="font-size: 16px;"></textarea>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-3">
                            <label for="txtCiudad">Ciudad:</label>
                            <input type="text" name="name" value="" id="txtCiudad" class="form-control" style="font-size: 16px;" />
                        </div>
                        <div class="col-3">
                            <label for="txtEstado">Estado:</label>
                            <input type="text" name="name" value="" id="txtEstado" class="form-control" style="font-size: 16px;" />
                        </div>
                        <div class="col-3">
                            <label for="txtPais">Pais:</label>
                            <input type="text" name="name" value="" id="txtPais" class="form-control" style="font-size: 16px;" />
                        </div>
                        <div class="col-3">
                            <label for="txtCP">CP:</label>
                            <input type="text" name="name" value="" id="txtCP" class="form-control" style="font-size: 16px;" />
                        </div>
                    </div>
                    
                    <hr />
                    <div class="row">
                    <section id="contactoCompania">
                        <div class="card">
                        <div class="card-header">Contacto</div>
                        <div class="card-body">
                            <div class="row">

                                <div class="col">
                                    <label for="txtNombrCont">Nombre:</label>
                                    <input type="text" name="name" value="" id="txtNombrCont" class="form-control" style="font-size: 16px;" />
                                </div>

                                <div class="col">
                                    <label for="txtpustoCont">Puesto:</label>
                                    <input type="text" name="name" value="" id="txtpustoCont" class="form-control" style="font-size: 16px;" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md">
                                    <label for="txtCorreoCont">Correo:&nbsp;</label>
                                    <input type="email" name="name" value="" id="txtCorreoCont" class="form-control" style="font-size: 16px;" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-2">
                                    <label for="txtFaxCont">Extensión:</label>
                                    <input type="number" name="name" value="" id="txtFaxCont" class="form-control" style="font-size: 16px;" />
                                </div>
                                <div class="col-5">
                                    <label for="txtTelCont">Telefono:</label>
                                    <input type="tel" name="name" value="" id="txtTelCont" class="form-control" style="font-size: 16px;" />
                                </div>
                                <div class="col-5">
                                    <label for="txtCelCont">Celular:</label>
                                    <input type="tel" name="name" value="" id="txtCelCont" class="form-control" style="font-size: 16px;" />
                                </div>
                            </div>
                        </div>
                        </div>
                    </section>
                        </div>
                </div>
                <hr />
                <input type="button" name="data[info]" class="next btn btn-info" value="Siguiente" />

            </fieldset>

            <!-- fieldset informacion de facturacion -->
            <fieldset style="display: none;">
                <legend style="font-size:25px;">Información de facturación</legend>

                <div class="row g-3">
                    <div class="col-md-12">
                        <label for="txtDirecFacturacion">Dirección facturación:</label>
                        <input type="text" name="name" value="" id="txtDirecFacturacion" class="form-control"style="font-size:16px;"/>
                    </div>
                    <div class="col-md-3">
                         <label for="txtCiudadFacturacion">Ciudad:</label>
                                <input type="text" name="name" value="" id="txtCiudadFacturacion" class="form-control"style="font-size:16px;" />
                    </div>
                    <div class="col-md-3">
                         <label for="txtEstadoFacturacion">Estado:</label>
                                <input type="text" name="name" value="" id="txtEstadoFacturacion" class="form-control" style="font-size:16px;"/>
                    </div>
                    <div class="col-md-3">
                         <label for="txtPaisFacturacion">Pais:</label>
                                <input type="text" name="name" value="" id="txtPaisFacturacion" class="form-control" style="font-size:16px;"/>
                    </div>
                    <div class="col-md-3">
                         <label for="txtCPFacturacion">CP:</label>
                                <input type="text" name="name" value="" id="txtCPFacturacion" class="form-control"style="font-size:16px;" />
                    </div>

                    <hr />

                    <div class="card">
                        <h3 class="card-header">Contacto</h3>
                        
                            <div class="row g-0">
                                <label for="txtNombrContFacturacion">Nombre:</label>
                                <input type="text" name="name" value="" id="txtNombrContFacturacion" class="form-control"style="font-size:16px;" />

                            </div>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="txtCorreoContFacturacion">Correo:</label>
                                    <input type="email" name="name" value="" id="txtCorreoContFacturacion" class="form-control"style="font-size:16px;" />
                                </div>
                                <div class="col-md-6">
                                    <label for="txtCorreoFacturacion2">Correo(si es diferente):</label>
                                    <input type="email" name="name" value="" id="txtCorreoFacturacion2" class="form-control" style="font-size:16px;"/>
                                </div>
                            </div>

                            <div class="row"> 
                                <div class="col-md-1">

                                    <label for="txtFaxContFacturacion">Extension:</label>
                                    <input type="number" name="name" value="" id="txtFaxContFacturacion" class="form-control"style="font-size:16px;" />
                                </div>
                                <div class="col-md-5">
                                    <label for="txtTelContFacturacion">Telefono:</label>
                                    <input type="tel" name="name" value="" id="txtTelContFacturacion" class="form-control" style="font-size:16px;"/>
                                </div>
                                <div class="col-md-5">

                                    <label for="txtCelContFacturacion">Celular:</label>
                                    <input type="tel" name="name" value="" id="txtCelContFacturacion" class="form-control"style="font-size:16px;" />
                                </div>
                               
                            </div>

                        </div>
                   
                    <hr />
                </div>

                <input type="button" name="previous" class="previous btn btn-default" value="Previo" />
                <input type="button" name="next" class="next btn btn-info" value="Siguiente" />

            </fieldset>
            <!-- fieldset Agente aduanal americano-->
            <fieldset style="display: none;">
                <legend style="font-size:25px;">Agente aduanal americano </legend>

                <div class="container">
                
                    <div class="row">
                        <div class="col">
                        <label for="txtNombreCompaniaAAA" class="form-label">Nombre de la compañia:</label>
                        <input type="text" name="name" value="" id="txtNombreCompaniaAAA" class="form-control form-control-sm" />
                            </div>
                        <div class="col">
                        <label for="txtNoPatAAA" class="form-label">Numero de patente:</label>
                        <input type="text" name="name" value="" id="txtNoPatAAA" class="form-control form-control-sm" />
                            </div>
                    </div>
                

                <div class="row">
                    <div class="col">
                    <label for="txtNombrComAAA" class="form-label">Nombre comercial:</label>
                    <input type="text" name="name" value="" id="txtNombrComAAA" class="form-control" />
                        </div>
                    <div class="col">
                    <label for="txtRFCTaxAAA">Tax ID:</label>
                    <input type="text" name="name" value="" id="txtRFCTaxAAA" class="form-control" />
                        </div>
                </div>
                <div class="row">
                    <label for="txtDirecAAA">Dirección:</label>
                    <input type="text" name="name" value="" id="txtDirecAAA" class="form-control" />
                </div>

                <div class="row">
                    <div class="col">
                        <label for="txtCiudadAAA">Ciudad:</label>
                        <input type="text" name="name" value="" id="txtCiudadAAA" class="form-control" />
                    </div>
                    <div class="col">
                        <label for="txtEstadoAAA">Estado:</label>
                        <input type="text" name="name" value="" id="txtEstadoAAA" class="form-control" />
                    </div>
                    <div class="col">
                        <label for="txtPaisAAA">Pais:</label>
                        <input type="text" name="name" value="" id="txtPaisAAA" class="form-control" />
                    </div>
                    <div class="col">
                        <label for="txtCPAAA">CP:</label>
                        <input type="text" name="name" value="" id="txtCPAAA" class="form-control" />
                    </div>
                </div>

                    <hr />
                    <h3>Contacto</h3>
                    <div class="row">
                        <div class="col">
                            <label for="txtNombrContAAA">Nombre:</label>
                            <input type="text" name="name" value="" id="txtNombrContAAA" class="form-control" />
                        </div>
                        <div class="col">
                            <label for="txtpuestoContAAA">Puesto:</label>
                            <input type="text" name="name" value="" id="txtpuestoContAAA" class="form-control" />
                        </div>
                    </div>
                    <div class="row">
                        <label for="txtCorreoContAAA">Correo:</label>
                        <input type="email" name="name" value="" id="txtCorreoContAAA" class="form-control" />

                    </div>

                    <div class="row">
                        <div class="col">
                            <label for="txtFaxContAAA">Extension:</label>
                            <input type="text" name="name" value="" id="txtFaxContAAA" class="form-control" />
                        </div>
                        <div class="col">
                            <label for="txtTelContAAA">Telefono:</label>
                            <input type="tel" name="name" value="" id="txtTelContAAA" class="form-control" />
                        </div>
                        <div class="col">
                            <label for="txtCelContAAA">Celular:</label>
                            <input type="tel" name="name" value="" id="txtCelContAAA" class="form-control" />
                        </div>
                       
                    </div>

                
                    </div>
                <hr />

                <input type="button" name="previous" class="previous btn btn-default" value="Previo" />
                <input type="button" name="next" class="next btn btn-info" value="Siguiente" />

            </fieldset>

            <!-- fieldset Agente aduanal mexicano-->
            <fieldset style="display: none;">
                <legend style="font-size:25px;">Agente aduanal mexicano</legend>

                <div class="container">

                <div class="row">
                    <div class="col">
                        <label for="txtNombreCompaniaAAM" class="form-label">Nombre de la compañia:</label>
                        <input type="text" name="name" value="" id="txtNombreCompaniaAAM" class="form-control form-control-sm" />
                    </div>
                    <div class="col">
                        <label for="txtNoPatAAM" class="form-label">Numero de patente:</label>
                        <input type="text" name="name" value="" id="txtNoPatAAM" class="form-control form-control-sm" />

                    </div>
                </div>

                <div class="row">
                    <div class="col">
                    <label for="txtNombrComAAM" class="form-label">Nombre comercial:</label>
                    <input type="text" name="name" value="" id="txtNombrComAAM" class="form-control" />
                        </div>
                    <div class="col">

                    <label for="txtRFCTaxAAM">RFC/Tax ID:</label>
                    <input type="text" name="name" value="" id="txtRFCTaxAAM" class="form-control" />
                        </div>
                </div>
                <div class="row">
                    <label for="txtDirecAAM">Dirección:</label>
                    <input type="text" name="name" value="" id="txtDirecAAM" class="form-control" />
                </div>

                <div class="row">
                    <div class="col">
                        <label for="txtCiudadAAM">Ciudad:</label>
                        <input type="text" name="name" value="" id="txtCiudadAAM" class="form-control" />
                    </div>
                    <div class="col">
                        <label for="txtEstadoAAM">Estado:</label>
                        <input type="text" name="name" value="" id="txtEstadoAAM" class="form-control" />
                    </div>
                    <div class="col">
                        <label for="txtPaisAAM">Pais:</label>
                        <input type="text" name="name" value="" id="txtPaisAAM" class="form-control" />
                    </div>
                    <div class="col">
                        <label for="txtCPAAM">CP:</label>
                        <input type="text" name="name" value="" id="txtCPAAM" class="form-control" />
                    </div>
                </div>

                    <hr />
                    <h3>Contacto</h3>
                    <div class="row">
                        <div class="col">
                            <label for="txtNombrContAAM">Nombre:</label>
                            <input type="text" name="name" value="" id="txtNombrContAAM" class="form-control" />
                        </div>
                        <div class="col">

                            <label for="txtpuestoContAAM">Puesto:</label>
                            <input type="text" name="name" value="" id="txtpuestoContAAM" class="form-control" />
                        </div>

                    </div>
                    <div class="row">
                        <label for="txtCorreoContAAM">Correo:</label>
                        <input type="email" name="name" value="" id="txtCorreoContAAM" class="form-control" />

                    </div>

                    <div class="row"> 
                        <div class="col-1">
                            <label for="txtFaxContAAM">Extension:</label>
                            <input type="text" name="name" value="" id="txtFaxContAAM" class="form-control" />
                        </div>
                        <div class="col">
                            <label for="txtTelContAAM">Telefono:</label>
                            <input type="tel" name="name" value="" id="txtTelContAAM" class="form-control" />
                        </div>
                        <div class="col">
                            <label for="txtCelContAAM">Celular:</label>
                            <input type="tel" name="name" value="" id="txtCelContAAM" class="form-control" />
                        </div>
                       
                    </div>

                
                </div>

                <hr />
                <input type="button" name="previous" class="previous btn btn-default" value="Previo" />
                <input type="button" name="next" class="next btn btn-info" value="Siguiente" />

            </fieldset>

            <!-- fieldset Informacion de compañia filial -->
            <fieldset style="display: none;" >
                <legend style="font-size:25px;">Información de compañia filial en cadena de suministro de otra ciudad </legend>
                <div class="container">
                    <div class="row">

                        <label for="txtNombreCompaniaFilial" class="form-label">Nombre de la compañia:</label>
                        <input type="text" name="name" value="" id="txtNombreCompaniaFilial" class="form-control form-control-sm" />
                    </div>

                    <div class="row">
                        <div class="col">
                            <label for="txtNombrComFilial" class="form-label">Nombre comercial:</label>
                            <input type="text" name="name" value="" id="txtNombrComFilial" class="form-control" />
                        </div>
                        <div class="col">

                            <label for="txtRfcComFilial" class="form-label">RFC:</label>
                            <input type="text" name="name" value="" id="txtRfcComFilial" class="form-control form-control-sm" />
                        </div>
                    </div>
                    <div class="row">
                        <label for="txtDirecFiscalComFilial">Dirección fiscal:</label>
                        <input type="text" name="name" value="" id="txtDirecFiscalComFilial" class="form-control" />
                    </div>

                    <div class="row">
                        <div class="col">
                            <label for="txtCiudadComFilial">Ciudad:</label>
                            <input type="text" name="name" value="" id="txtCiudadComFilial" class="form-control" />
                        </div>
                        <div class="col">
                            <label for="txtEstadoComFilial">Estado:</label>
                            <input type="text" name="name" value="" id="txtEstadoComFilial" class="form-control" />
                        </div>
                        <div class="col">
                            <label for="txtPaisComFilial">Pais:</label>
                            <input type="text" name="name" value="" id="txtPaisComFilial" class="form-control" />
                        </div>
                        <div class="col">
                            <label for="txtCPComFilial">CP:</label>
                            <input type="text" name="name" value="" id="txtCPComFilial" class="form-control" />
                        </div>
                    </div>

                    <hr />
                        <h3>Contacto</h3>
                        <div class="row">
                            <div class="col">
                                <label for="txtNombrContFilial">Nombre:</label>
                                <input type="text" name="name" value="" id="txtNombrContFilial" class="form-control" />
                            </div>

                            <div class="col">
                                <label for="txtPuestoContFilial">Nombre:</label>
                                <input type="text" name="name" value="" id="txtPuestoContFilial" class="form-control" />
                            </div>
                        </div>
                        <div class="row">
                            <label for="txtCorreoContFilial">Correo:</label>
                            <input type="email" name="name" value="" id="txtCorreoContFilial" class="form-control" />
                        </div>

                        <div class="row">
                            <div class="col">
                                <label for="txtTelContFilial">Telefono:</label>
                                <input type="tel" name="name" value="" id="txtTelContFilial" class="form-control" />
                            </div>
                            <div class="col">
                                <label for="txtCelContFilial">Celular/Nextel:</label>
                                <input type="tel" name="name" value="" id="txtCelContFilial" class="form-control" />
                            </div>
                            <div class="col">
                                <label for="txtFaxContFilial">Fax:</label>
                                <input type="text" name="name" value="" id="txtFaxContFilial" class="form-control" />
                            </div>
                        </div>
                </div>
                <hr />

                <input type="button" name="previous" class="previous btn btn-default" value="Previo" />
                <input type="button" name="next" class="next btn btn-info" value="Siguiente" />

            </fieldset>

            <!-- fieldset tipo de servicio requerido-->
            <fieldset style="display: none;">
                <legend style="font-size:25px;">Tipos de servicio requerido</legend>


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
                                <td>
                                    <input type="checkbox" name="cbAlmacenajetMP" value="" id="cbAlmacenajetMP" /></td>
                                <td>
                                    <input type="checkbox" name="cbAlmacenajetIB" value="" id="cbAlmacenajetIB" /></td>
                                <td></td>
                                <td>
                                    <input type="checkbox" name="cbAlmacenajeAD" value="" id="cbAlmacenajeAD" /></td>
                                <td>
                                    <input type="checkbox" name="cbAlmacenajeT" value="" id="cbAlmacenajeT" /></td>

                            </tr>
                            <tr>
                                <td>Exportación</td>
                                <td>
                                    <input type="checkbox" name="cbExportMP" value="" id="cbExporttMP" />
                                </td>
                                <td>
                                    <input type="checkbox" name="cbImportIB" value="" id="cbExportIB" />
                                </td>
                                <td>
                                    <input type="checkbox" name="cbImportFerro" value="" id="cbExportFerro" />
                                </td>
                            </tr>
                            <tr>
                                <td>Importacion</td>
                                <td>
                                    <input type="checkbox" name="cbImportMP" value="" id="cbImportMP" />
                                </td>
                                <td>
                                    <input type="checkbox" name="cbImportIB" value="" id="cbImportIB" />
                                </td>
                                <td>
                                    <input type="checkbox" name="cbImportFerro" value="" id="cbImportFerro" />
                                </td>
                            </tr>
                            <tr>
                                <td>Transportación</td>
                                <td>
                                    <input type="checkbox" name="cbTranstMP" value="" id="cbTranstMP" />
                                </td>
                                <td>
                                    <input type="checkbox" name="cbTransIB" value="" id="cbTransIB" />
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
            <fieldset style="display: none;">
                <legend style="font-size:25px;">Información de productos</legend>

                <table class="table table-responsive table-hover">
                    <thead>
                        <tr>
                            <th>Descripción de mercancia</th>
                            <th>Comentarios</th>
                            <th></th>
                            
                        </tr>
                    </thead>
                    <tbody id="tbodyProductos">

                    </tbody>
                    <tfoot>
                        <tr>
                            
                        </tr>
                        
                    </tfoot>
                </table>


                <hr />
                <input type="button" name="previous" class="previous btn btn-default" value="Previo" />
                <input type="button" name="next" class="next btn btn-info" value="Siguiente" />
            </fieldset>



            <!-- fieldset Información de programa de cadena de suministro-->
            <fieldset style="display: none;">
                <legend style="font-size:25px;">Información de cadena de suministro</legend>
                <div class="container">
                <div class="row">
                    <div class="col">
                        <label for="cbCTPATSatuts">C-TPAT status:</label>
                        <select name="cbCTPATSatuts" id="cbCTPATSatuts" class="form-select" style="font-size:14px;">
                            <option value="0">Ninguno</option>
                            <option value="1">Certificado no validado</option>
                            <option value="2">Certificado validado</option>
                        </select>
                    </div>
                    <div class="col">
                        <label for="txtCTPATSVI">C-TPAT SVI Numero:</label>
                        <input type="text" name="txtCTPATSVI" value="" id="txtCTPATSVI" class="form-control" />
                    </div>
                </div>
                <div class="row">
                    <label>Validado por US customs:</label>

                    <div class="form-check col-1">
                         <input type="radio" name="radValidado" value="" id="radValidadoSi" class="form-check-input"/>
                        <label for="radValidadoSi" >Si</label>

                    </div>

                    <div class="form-check col-11">
                        <input type="radio" name="radValidado" value="" id="radValidadoNo" class="form-check-input"/>
                        <label for="radValidadoNo">No</label>

                    </div>                   
                    

                </div>
                <div class="row-cols-4">
                    <label for="dtFechaVal">Fecha de validacion:</label>
                    <input type="date" name="" value="" id="dtFechaVal" class="form-control" />
                      </div>
                    <div class="row">
                        <label>
                            ¿Esta Certificado en CT-PAT o equivalente/WCO acreditado en programa de seguridad de comercio exterior?
                        </label>
                            <div class="form-check col-1">
                                <input type="radio" name="radCertificado" value="" id="radCertificadoSi" class="form-check-input" />
                                <label for="radCertificadoSi">Si</label>
                            </div>
                            <div class="form-check col-11">
                                <input type="radio" name="radCertificado" value="" id="radCertificadoNo" class="form-check-input" />
                                <label for="radCertificadoNo">No</label>
                            </div>
                       
                    </div>
                        <div class="row">
                            <label for="txtDescripcion">Descripción:</label>
                            <textarea id="txtDescripcion" name="txtDescripcion" class="form-control"></textarea>
                        </div>
                <div class="row">
                    <label>¿Puede proporcionar copia del crtificado?:</label>
                    <div class="form-check col-1">
                        <input type="radio" name="radPropCertificado" value="" id="radPropCertificadoSi" class="form-check-input" />
                        <label for="radPropCertificadoSi">Si</label>
                    </div>
                    <div class="form-check col-11">
                        <input type="radio" name="radPropCertificado" value="" id="radPropCertificadoNo" class="form-check-input" />
                        <label for="radPropCertificadoNo">No</label>
                    </div>
                </div>
                    <div class="row">
                        <div class="col-6">
                            <label for="txtCodCrtificado">Codigo de certificacion:</label>
                            <input type="text" name="txtCodCrtificado" value="" id="txtCodCrtificado" class="form-control" />
                        </div>
                    </div>
                
               </div>
                <hr />

                <input type="button" name="previous" class="previous btn btn-default" value="Previo" />
                <input type="submit" name="submit" class="submit btn btn-info" value="Finalizar" />

            </fieldset>


        </form>
    </div>
  
    <script type="text/javascript">


        $(document).ready(function () {
            var current = 1, current_step, next_step, steps;
            steps = $("fieldset").length;
            $(".next").click(function () {
                current_step = $(this).parent();
                next_step = $(this).parent().next();
                next_step.show();
                current_step.hide();
            });
            $(".previous").click(function () {
                current_step = $(this).parent();
                next_step = $(this).parent().prev();
                next_step.show();
                current_step.hide();
            });






            var count = 1;
            dynamic_field(count);

            function dynamic_field(number) {
                var html = '<tr>';

                html += '<td><div class="row"><input type="text" name="in_number[]" class="form-control" value=""></div></td>';
                html += '<td><div class="row"><input type="text" name="in_description[]" class="form-control"></div></td>';
                
                if (number > 1) {
                    html += '<td><button type="button" class="btn btn-danger" name="remove" id="remove" style="border-radius:42px;"><i class="fas fa-minus-circle"></i></button></td></tr>';
                    $('#tbodyProductos').append(html);
                } else {
                    html += '<td><button type="button"class="btn btn-success" name="add" id="add" style="border-radius:42px;"><i class="fas fa-plus-circle"></i></button></td></tr>';
                    $('#tbodyProductos').html(html);
                }
            }

            $('#add').click(function () {
                count++;
                dynamic_field(count);
            });

            $(document).on('click', '#remove', function () {
                count--;
                $(this).parent().closest("tr").remove();
            });



        });
    </script>

</asp:Content>
