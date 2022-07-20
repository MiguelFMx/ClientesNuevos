<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgentesAduanales.aspx.cs" Inherits="ClientesNuevos.F14.Seccioness.AgentesAduanales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   <title>Agentes aduanales</title>

     <link href="../../Scripts/bootstrap/css/bootstrap.min.css" rel="stylesheet" /> 
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
                <div class="progress">
                    <div class="progress-bar bg-warning progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Warning example" style="width: 25%" aria-valuenow="7" aria-valuemin="0" aria-valuemax="100">25%</div>
                </div>
            </div>
        </div>
        <br />
        <!-- fieldset Agente aduanal; cambia con el boton-->
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
                                            <input type="text" name="txtNombreCompaniaAA" value="" id="txtNombreCompaniaAA" class="form-control" />
                                        </div>
                                        <div class="col">
                                            <label for="txtNoPatAA" class="form-label">Numero de patente:</label>
                                            <input type="text" name="txtNoPatAA" value="" id="txtNoPatAA" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label for="txtNombrComAA" class="form-label">Nombre comercial:</label>
                                            <input type="text" name="txtNombrComAA" value="" id="txtNombrComAA" class="form-control" />
                                        </div>
                                        <div class="col">
                                            <label for="txtRFCTaxAA" id="lblRFCTaxAAA" class="form-label">RFC:</label>
                                            <br />
                                            <input type="text" name="txtRFCTaxAA" value="" id="txtRFCTaxAA" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label for="txtDirecAA" class="form-label">Dirección:</label>
                                            <textarea name="txtDirecAA" id="txtDirecAA" class="form-control"></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label for="txtEstadoAA" class="form-label">Estado:</label>
                                            <select id="cbEstadoAA" class="form-select">
                                                <option value="value">...</option>
                                            </select>
                                        </div>
                                        <div class="col">
                                            <label for="txtCiudadAA" class="form-label">Ciudad:</label>
                                            <select id="cbCiudadAA" class="form-select">
                                                <option value="value">...</option>
                                            </select>
                                        </div>
                                        <div class="col">
                                            <label for="txtCPAA" id="lblCPAA" class="form-label">Codgio Postal:</label>
                                            <input type="text" name="txtCPAA" value="" id="txtCPAA" class="form-control" />
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
                                            <input type="text" name="txtNombrContAA" value="" id="txtNombrContAA" class="form-control" />
                                        </div>
                                        <div class="col">
                                            <label for="txtpuestoContAA" class="form-label">Puesto:</label>
                                            <input type="text" name="txtpuestoContAA" value="" id="txtpuestoContAA" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label for="txtCorreoContAA" class="form-label">Correo:</label>
                                            <input type="email" name="txtCorreoContAA" value="" id="txtCorreoContAA" class="form-control" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <label for="txtTelContAA" class="form-label">Telefono:</label>
                                            <input type="tel" name="txtTelContAA" value="" id="txtTelContAA" class="form-control" />
                                        </div>
                                        <div class="col">
                                            <label for="txtExtxContAA" class="form-label">Extension:</label>
                                            <input type="text" name="txtExtxContAA" value="" id="txtExtxContAA" class="form-control" />
                                        </div>
                                        <div class="col">
                                            <label for="txtCelContAA" class="form-label">Celular:</label>
                                            <input type="tel" name="name" value="" id="txtCelContAA" class="form-control" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
            </fieldset>

            <!--Agente aduanal americano-->
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
                                            <input type="text" name="txtNombreCompaniaAA" value="" id="txtNombreCompaniaAAm" class="form-control" />
                                        </div>
                                        <div class="col">
                                            <label for="txtNoPatAAm" class="form-label">Numero de patente:</label>
                                            <input type="text" name="txtNoPatAA" value="" id="txtNoPatAAm" class="form-control" />
                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="col">
                                            <label for="txtNombrComAA" class="form-label">Nombre comercial:</label>
                                            <input type="text" name="txtNombrComAA" value="" id="txtNombrComAAm" class="form-control" />
                                        </div>
                                        <div class="col">
                                            <label for="txtTaxAAm" id="lblRFCTaxAAAm" class="form-label">Tax ID:</label>
                                            <br />
                                            <input type="text" name="txtRFCTaxAA" value="" id="txtRFCTaxAAm" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label for="txtDirecAA" class="form-label">Dirección:</label>
                                            <textarea name="txtDirecAA" id="txtDirecAAm" class="form-control"></textarea>
                                        </div>
                                    </div>

                                    <div class="row">

                                        <div class="col">
                                            <label for="cbEstadoAAm" class="form-label">Estado:</label>
                                            <select id="cbEstadoAAm" class="form-select">
                                                <option value="value">...</option>
                                            </select>
                                        </div>
                                        <div class="col">
                                            <label for="cbCiudadAAm" class="form-label">Ciudad:</label>
                                            <select id="cbCiudadAAm" class="form-select">
                                                <option value="value">...</option>
                                            </select>
                                        </div>
                                        <div class="col">
                                            <label for="txZCPAA" id="lblCPAAm" class="form-label">Zip code:</label>
                                            <input type="text" name="txZCPAA" value="" id="txtCPAAm" class="form-control" />
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
                                            <input type="text" name="txtNombrContAA" value="" id="txtNombrContAAm" class="form-control" />
                                        </div>
                                        <div class="col">
                                            <label for="txtpuestoContAAm" class="form-label">Puesto:</label>
                                            <input type="text" name="txtpuestoContAAm" value="" id="txtpuestoContAAm" class="form-control" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label for="txtCorreoContAAm" class="form-label">Correo:</label>
                                            <input type="email" name="txtCorreoContAAm" value="" id="txtCorreoContAAm" class="form-control" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <label for="txtTelContAAm" class="form-label">Telefono:</label>
                                            <input type="tel" name="txtTelContAAm" value="" id="txtTelContAAm" class="form-control" />
                                        </div>
                                        <div class="col">
                                            <label for="txtExtContAAm" class="form-label">Extension:</label>
                                            <input type="text" name="txtExtContAAm" value="" id="txtExtxContAAm" class="form-control" />
                                        </div>
                                        <div class="col">
                                            <label for="txtCelContAAm" class="form-label">Celular:</label>
                                            <input type="tel" name="name" value="" id="txtCelContAAm" class="form-control" />
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
            <div class="col-10"></div>
            <div class="col-2">
                <button id="btnContinuar" class="btn btn-success" type="button">Siguiente<i class="bi bi-chevron-right"></i></button>
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
        });
    </script>

</asp:Content>
