<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EvaluacionSeguridadRiesgoBussinessPartner.aspx.cs" Inherits="ClientesNuevos.cliente.F5.EvaluacionSeguridadRiesgoBussinessPartner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="container" class="container" style="width: 100%">
        
 <div class="row">
     <div id="Encabezado">
         <h1 style="text-align: center">Cuestionario C-TPAT para SOCIO COMERCIAL </h1>

     </div>
 </div>
        <div class="row">
            <div id="formulario">
                <section id="portada">

                    <form action="/" method="post">
                        <div class="form-group row">
                            <label for="100" class="col-form-label">Nuestra compañia ya esta certificada en C-TPAT y nuestro numero SVI es:</label>
                            <div>
                                <input type="text" class="form-control" id="100" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="120">Nuestra Compañía ES Elegible para ser miembro C-TPAT</label>
                            <div id="120">

                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="si120" value="" />
                                    <label class="form-check-label" for="si120">SI</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="NO120" value="" />
                                    <label class="form-check-label" for="NO120">NO</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="NA120" value="" />
                                    <label class="form-check-label" for="NA120">N/A</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="130">Es miembro o está en proceso de ser Miembro C-TPAT</label>
                            <div id="130">

                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="si130" value="" onchange="showMe('seccion1')" />
                                    <label class="form-check-label" for="si130">SI</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="NO130" value="" />
                                    <label class="form-check-label" for="NO130">NO</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="NA130" value="" />
                                    <label class="form-check-label" for="NA130">N/A</label>
                                </div>
                            </div>
                        </div>
                        <section id="seccionSI" style="display: none">
                            <div class="form-group row">
                                <label for="1311">Número de Cuenta C-TPAT:</label>
                                <div>
                                    <input type="text" class="form-control" id="1311" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="1312">Status de Cuenta:</label>
                                <div>
                                    <input type="text" class="form-control" id="1312" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="1313">Status de Revisión de su Perfil de Seguridad:</label>
                                <div>
                                    <input type="text" class="form-control" id="1313" />
                                </div>
                            </div>
                        </section>

                        <section id="seccionNO" style="display: none">
                            <div class="form-group row">
                                <label for="1321">No esta interesada en aplicar por el momento</label>
                                <div id="1321">

                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="si1321" value="" />
                                        <label class="form-check-label" for="si1321">SI</label>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="NO1321" value="" />
                                        <label class="form-check-label" for="NO1321">NO</label>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="NA1321" value="" />
                                        <label class="form-check-label" for="NA1321">N/A</label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="1322">Esta interesada y desea recibir más información</label>
                                <div id="1322">

                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="si1322" value="" />
                                        <label class="form-check-label" for="si1322">SI</label>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="NO1322" value="" />
                                        <label class="form-check-label" for="NO1322">NO</label>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="NA1322" value="" />
                                        <label class="form-check-label" for="NA1322">N/A</label>
                                    </div>
                                </div>
                            </div>

                        </section>

                        <div class="form-group row">
                            <label for="140">Nuestra Compañía comprende las Normas Mínimas de Seguridad C-TPAT y certifica que sus operaciones están acordes con dichas normas.</label>
                            <div id="140">

                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="si140" value="" />
                                    <label class="form-check-label" for="si130">SI</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="NO140" value="" />
                                    <label class="form-check-label" for="NO130">NO</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="NA140" value="" />
                                    <label class="form-check-label" for="NA130">N/A</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="150">Nuestra compañía NO ES ELEGIBLE PARA SER MIEMBRO C_TPAT pero está de acuerdo en cumplir con los lineamientos de seguridad</label>
                            <div id="150">

                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="si150" value="" />
                                    <label class="form-check-label" for="si130">SI</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="NO150" value="" />
                                    <label class="form-check-label" for="NO130">NO</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="NA150" value="" />
                                    <label class="form-check-label" for="NA130">N/A</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="160">¿Esta usted respondiendo por todas las Unidades de Negocio de su Compañía?</label>
                            <div id="160">

                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="si160" value="" />
                                    <label class="form-check-label" for="si130">SI</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="NO160" value="" />
                                    <label class="form-check-label" for="NO130">NO</label>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="NA160" value="" />
                                    <label class="form-check-label" for="NA130">N/A</label>
                                </div>
                            </div>
                        </div>

                    </form>

                </section>
            </div>
        </div>
 

    <section id="evaluacion" style="display:none;">

        <div id="contenedor">

            <section id="">
                <h3>Requerimientos  de los socios comerciales</h3>
                <table id="100Requerimientos" class="table">
                    <thead></thead>
                    <tbody>
                        <tr>
                            <th>1.0.0.</th>
                            <th>Requerimientos de los socios comerciales</th>
                            <th>SI</th>
                            <th>PARCIAL</th>
                            <th>NO</th>
                            <th>N/A</th>

                        </tr>
                        <tr>
                            <td>
                            1.0.1
                                </td>
                       
                        <td>
                            La empresa cuenta con procesos verificables y por escrito para la selección de socios comerciales, incluyendo transportistas, otros fabricantes, proveedores de productos y vendedores.. 
                        </td>
                        <td>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="">
                            </div>
                        </td>
                            <td>
                           <div class="form-check">
                               <input class="form-check-input" type="radio" name="flexRadioDefault" id="">

                           </div>
                        </td>
                            <td>
                            <div class="form-check">
                               <input class="form-check-input" type="radio" name="flexRadioDefault" id="">

                           </div>
                        </td>
                            <td>
                            <div class="form-check">
                               <input class="form-check-input" type="radio" name="flexRadioDefault" id="">

                           </div>
                        </td>
                        </tr>
                        <tr>
                            <td>
                                1.1.0.
                            </td>
                            <td>
                                Procedimientos de seguridad
                            </td>

                        </tr>
                        
                    </tbody>

                </table>
            </section>

        </div>

    </section>
   </div>

    <script type="text/javascript">

        function showMe(seccion) {
            var chboxs = document.getElementById(seccion).style.display;
            var vis = "none";
            if (chboxs == "none") {
                vis = "block";
            }
            if (chboxs == "block") {
                vis = "none";
            }
            document.getElementById(box).style.display = vis;
        }

    </script>

</asp:Content>
