<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompaniaFilial.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.CompaniaFilial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<%--    <link href="../../Scripts/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../../template/assets/css/style.css" rel="stylesheet" />

    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/bootstrap.min.js"></script>--%>

    <script src="../../Scripts/JS/ajax.js"></script>

   <%-- <script src="https://kit.fontawesome.com/e0bca678de.js" crossorigin="anonymous"></script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        
        <div class="row">
            <div class="col">
                <div class="progress">
                    <div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Warning example" style="width: 45%" aria-valuenow="7" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-auto">
                <h4>Información de compañia filial
                    <span style="font-size: 15px;">
                        <i class="bi bi-question-circle"
                            data-bs-toggle="tooltip"
                            data-bs-placement="bottom"
                            title="Compañia filial es considerada cualquier empresa subcontratada para realizar cualquier servicio de transporte, almacenaje o resguardo de unidades de transporte internacional"></i>
                    </span>
                </h4>
            </div>
            
            <div class="row">
                <div class="col">
                    <label for="txtNombreCompaniaFilial" class="form-label">Nombre de la compañia:</label>
                    <input type="text" name="name" value="" id="txtNombreCompaniaFilial" class="form-control " />
                </div>
                <div class="col">
                    <label for="txtNombrComFilial" class="form-label">Nombre comercial:</label>
                    <input type="text" name="name" value="" id="txtNombrComFilial" class="form-control" />
                </div>
            </div>
            <div class="row">
                <div class="col-9">
                    <label for="txtDirecFiscalComFilial" class="form-label">Dirección fiscal:</label>
                    <input type="text" name="name" value="" id="txtDirecFiscalComFilial" class="form-control" />
                </div>

                <div class="col-3">

                    <label for="txtRfcComFilial" class="form-label">RFC:</label>
                    <input type="text" name="name" value="" id="txtRfcComFilial" class="form-control " />
                </div>
            </div>

            <div class="row">
                    <div class="col">
                        <label for="cbPaisComFilial" class="form-label">Pais:</label>
                        <select id="cbPaisComFilial" class="form-select">
                            <option value="...">...</option>
                        </select>
                        
                    </div>
                    <div class="col">
                        <label for="cboEstadoComFilial" class="form-label">Estado:</label>
                        <select id="cboEstadoComFilial" class="form-select">
                            <option value="value">...</option>
                        </select>
                        
                    </div>
                    <div class="col">
                        <label for="cbCiudadComFilial" class="form-label">Ciudad:</label>
                        <select id="cbCiudadComFilial" class="form-select">
                            <option value="value">...</option>
                        </select>
                    </div>
                 <div class="col">
                        <label for="txtCPComFIlial" class="form-label">CP:</label>
                        <input type="text" name="name" value="" id="txtCPComFIlial" class="form-control" />
                    </div>
                </div>

        </div>
        <hr />
        <div class="row">
            <h4>Contacto</h4>
            <div class="row">
                <div class="col-6">
                    <label for="txtNombrContFilial" class="form-label">Nombre:</label>
                    <input type="text" name="name" value="" id="txtNombrContFilial" class="form-control" />
                </div>

                <div class="col-3">
                    <label for="txtPuestoContFilial" class="form-label">Puesto:</label>
                    <input type="text" name="name" value="" id="txtPuestoContFilial" class="form-control" />
                </div>
                <div class="col-3">
                    <label for="txtCorreoContFilial" class="form-label">Correo:</label>
                    <input type="email" name="name" value="" id="txtCorreoContFilial" class="form-control" />
                </div>
            </div>

            <div class="row">
                <div class="col-6">
                    <label for="txtTelContFilial" class="form-label">Telefono:</label>
                    <input type="tel" name="name" value="" id="txtTelContFilial" class="form-control" />
                </div>
                <div class="col-2">
                    <label for="txtExtContFilial"class="form-label">Extension:</label>
                    <input type="text" name="name" value="" id="txtExtContFilial" class="form-control" />
                </div>
                <div class="col-4">
                    <label for="txtCelContFilial"class="form-label">Celular:</label>
                    <input type="tel" name="name" value="" id="txtCelContFilial" class="form-control" />
                </div>
            </div>


        </div>
        <hr />
        <br />
        <div class="row">
            <div class="col">
                <input type="button" name="btnAgregarComFilial" class=" btn btn-success" value="Agregar"  id="btnAgregarComFilial"/>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col">
                 <table class="table table-responsive" id="tComFil">
                       
                        <thead class="cabezal">
                            <tr>
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
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            </tr>
                        </tbody>
                        <tfoot></tfoot>

                    </table>
            </div>
            <%--<div class="col">
                 <table class="table table-responsive" id="tContactoFil">
                       
                        <thead class="cabezal">
                            <tr>
                                
                                <th>Nombre</th>
                                <th>Puesto</th>
                                <th>Telefono</th>
                                <th>Ext</th>
                                <th>Celular</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            </tr>
                        </tbody>
                        <tfoot></tfoot>

                    </table>
            </div>--%>
        </div>
        <hr />
        <div class="row" >
            <div class="col-10"></div>
            <div class="col-2">
                <button id="btnContinuar" class="btn btn-success" type="button">Continuar</button>
            </div>
        </div>
        

    </div>
        <script src="../JS/InfoComJS.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            fillComboPais($('#cbPaisComFilial'));
            $('#btnContinuar').click(function () {
                window.location.href = 'TipoServicioProductos.aspx';
            });

        });

    </script>
</asp:Content>
