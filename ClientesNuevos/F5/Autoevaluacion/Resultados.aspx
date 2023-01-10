<%@ Page Title="F5 | resultados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Resultados.aspx.cs" Inherits="ClientesNuevos.F5.Autoevaluacion.Resultados" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../template/assets/css/style_f5.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div id="imprimir">
            <div class="row">
                <div class="col">
                    <label>Empresa: </label>
                    <asp:Label ID="lblEmpresa" runat="server" Text="" Font-Bold="true"></asp:Label>
                </div>
                <div class="col"></div>
                <div class="col">
                    <label>Fecha:</label>
                    <asp:Label ID="lblFecha" runat="server" Text="" Font-Bold="true"></asp:Label>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col">
                    <div class="accordion accordion-flush d-block text-light" id="flushCuestionario">
                        <div class="accordion-item" style="background-color: #0169C2;">
                            <h3 class="accordion-header" id="flush-cuestionario">
                                <button class="accordion-button collapsed" style="background-color: #0169C2; color: white;" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-Cuestionario" aria-expanded="false" aria-controls="flush-Cuestionario">
                                    <i class="bi bi-ui-checks  ms-2 me-4 lead"></i>Respuestas del cuestionario de C-TPAT
                                </button>
                            </h3>
                            <div id="flush-Cuestionario" class="accordion-collapse collapse show"
                                aria-labelledby="flush-cuestionario" data-bs-parent="#flushCuestionario">
                                <div class="card">
                                    <div class="table-responsive">
                                        <asp:Table ID="tCuestionario" runat="server" CssClass="table table-hover">
                                            <asp:TableHeaderRow CssClass="cabezal">
                                                <asp:TableHeaderCell>#</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Pregunta</asp:TableHeaderCell>
                                                <asp:TableHeaderCell>Respuesta</asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow>
                                                <asp:TableCell>1.0.0.</asp:TableCell>
                                                <asp:TableCell>Nuestra Compañía YA ESTA CERTIFICADA C-TPAT y nuestro número SVI es:</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lbl100c" runat="server" Text=".."></asp:Label></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>1.2.0.</asp:TableCell>
                                                <asp:TableCell>Nuestra Compañía ES Elegible para ser miembro C-TPAT</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lbl120c" runat="server" Text=".."></asp:Label></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>1.3.0.</asp:TableCell>
                                                <asp:TableCell>Es miembro o está en proceso de ser Miembro C-TPAT</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lbl130c" runat="server" Text=".."></asp:Label></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow ID="preguntaDinamicaSi" Visible="false" CssClass="cabezal">
                                                <asp:TableCell>1.3.1.</asp:TableCell>
                                                <asp:TableCell ColumnSpan="2">Si la respuesta a la pregunta 1.3.0. es SI:</asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow ID="tr1311c" Visible="false">
                                                <asp:TableCell>1.3.1.1.</asp:TableCell>
                                                <asp:TableCell>Número de Cuenta C-TPAT</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lbl1311c" runat="server" Text=".."></asp:Label></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow ID="tr1312c" Visible="false">
                                                <asp:TableCell>1.3.1.2.</asp:TableCell>
                                                <asp:TableCell>Status de Cuenta</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lbl1312c" runat="server" Text=".."></asp:Label></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow ID="tr1313c" Visible="false">
                                                <asp:TableCell>1.3.1.3.</asp:TableCell>
                                                <asp:TableCell>Status de Revisión de su Perfil de Seguridad:</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lbl1313c" runat="server" Text=".."></asp:Label></asp:TableCell>
                                            </asp:TableRow>


                                            <asp:TableRow ID="preguntaDinamicaNo" CssClass="cabezal" Visible="false">
                                                <asp:TableCell>1.3.2.</asp:TableCell>
                                                <asp:TableCell ColumnSpan="2">Si la respuesta a la pregunta 1.3.0. es NO o N/A:</asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow ID="tr1321c" Visible="false">
                                                <asp:TableCell>1.3.2.1.</asp:TableCell>
                                                <asp:TableCell>No esta interesada en aplicar por el momento</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lbl1321c" runat="server" Text=".."></asp:Label></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow ID="tr1322c" Visible="false">
                                                <asp:TableCell>1.3.2.2.</asp:TableCell>
                                                <asp:TableCell>Esta interesada y desea recibir más información</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lbl1322c" runat="server" Text=".."></asp:Label></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow CssClass="cabezal" >
                                                <asp:TableCell ColumnSpan="3" ></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>1.4.0.</asp:TableCell>
                                                <asp:TableCell>Nuestra Compañía comprende las Normas Mínimas de Seguridad C-TPAT y certifica que sus operaciones están acordes con dichas normas.</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lbl140c" runat="server" Text=".."></asp:Label></asp:TableCell>
                                            </asp:TableRow>
                                            <asp:TableRow>
                                                <asp:TableCell>1.5.0.</asp:TableCell>
                                                <asp:TableCell>Nuestra compañía NO ES ELEGIBLE PARA SER MIEMBRO C_TPAT pero está de acuerdo en cumplir con los lineamientos de seguridad C-TPAT</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lbl150c" runat="server" Text=".."></asp:Label></asp:TableCell>
                                            </asp:TableRow>
                                             <asp:TableRow>
                                                <asp:TableCell>1.6.0.</asp:TableCell>
                                                <asp:TableCell>¿Esta usted respondiendo por todas las Unidades de Negocio de su Compañía?</asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:Label ID="lbl160c" runat="server" Text=".."></asp:Label></asp:TableCell>
                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col">
                    <div class="accordion accordion-flush d-block text-light" id="accordionFlushExample">
                        <div class="accordion-item" style="background-color: #0169C2;">
                            <h3 class="accordion-header" id="flush-headingOne">
                                <button class="accordion-button collapsed" style="background-color: #0169C2; color: white;" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                    <i class="bi bi-ui-checks  ms-2 me-4 lead"></i>Respuestas de autoevaluacion
                                </button>
                            </h3>
                            <div id="flush-collapseOne" class="accordion-collapse collapse"
                                aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                <div class="card">
                                    <div class="table-responsive">
                                        <table id="tRespuesta" class="table table-bordered">
                                            <thead class="cabezal">
                                                <tr>
                                                    <th>Pregunta</th>
                                                    <th>Opción</th>
                                                    <th>Observaciones</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                            <tfoot></tfoot>

                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <br />
            <div style="break-before: page;"></div>
            <h3 class="text-secondary">Resultados de autoevaluación</h3>
            <hr />
            <div class="row">
                <div class="col">
                    <canvas id="Grafica" height="150" width="600"></canvas>
                </div>
            </div>
            <hr />
            <br />
            <div class="row">
                <div class="col-md-6">
                    <div class="table-responsive">
                        <table class="table table-bordered border-primary">
                            <tr>
                                <td style="background-color: #0169C2; color: white; font-weight: bold;" width="20%">0.0.0</td>
                                <td style="background-color: #0169C2; color: white; font-weight: bold;">Promedio de cumplimiento</td>
                                <td width="20%">
                                    <asp:Label ID="lblPromedio" runat="server" Text="..."></asp:Label></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="table-responsive">
                        <table class="table table-bordered border-primary">
                            <tr>
                                <td style="background-color: #0169C2; color: white; font-weight: bold;" width="20%">0.0.1</td>
                                <td style="background-color: #0169C2; color: white; font-weight: bold;">Nivel de Riesgo (N.R.)</td>
                                <td id="promNR" width="20%">
                                    <asp:Label ID="lblPromNR" runat="server" Text="..."></asp:Label></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="tabla1">
                            <thead>
                                <tr class="cabezal">
                                    <th></th>
                                    <th></th>
                                    <th>Promedio</th>
                                    <th>N.R.</th>
                                </tr>
                            </thead>
                            <tbody>f
                                <tr class="table-primary">
                                    <td>1.0.0.</td>
                                    <td>Requerimientos  de los socios comerciales</td>
                                    <td>
                                        <asp:Label ID="lbl100" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td id="tNR1" style="font-weight: bold;">
                                        <asp:Label ID="NR1" runat="server" Text=".."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table-primary">1.1.0.</td>
                                    <td>Procedimientos de seguridad</td>
                                    <td>
                                        <asp:Label ID="lbl110" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">1.2.0.</td>
                                    <td>Punto de origen</td>
                                    <td>
                                        <asp:Label ID="lbl120" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">1.3.0.</td>
                                    <td>Participación / Certificación en programas de seguridad de la cadena de abastecimiento de administraciones aduanales extranjeras</td>
                                    <td>
                                        <asp:Label ID="lbl130" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">1.4.0.</td>
                                    <td>Procedimientos de Seguridad</td>
                                    <td>
                                        <asp:Label ID="lbl140" runat="server" Text="..."></asp:Label></td>
                                    <td></td>
                                </tr>
                            </tbody>
                            <tfoot></tfoot>
                        </table>
                    </div>

                </div>
                <div class="col-md-6">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="tabla2">
                            <thead>
                                <tr class="cabezal">
                                    <th></th>
                                    <th></th>
                                    <th>Promedio</th>
                                    <th>N.R.</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="table-primary">
                                    <td>2.0.0.</td>
                                    <td>Seguridad de Contenedores y Remolques</td>
                                    <td>
                                        <asp:Label ID="lbl200" runat="server" Text="..."></asp:Label></td>
                                    <td id="tNR2" style="font-weight: bold;">
                                        <asp:Label ID="NR2" runat="server" Text="..."></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">2.1.0.</td>
                                    <td>Inspección de los contenedores</td>
                                    <td>
                                        <asp:Label ID="lbl210" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">2.2.0.</td>
                                    <td>Inspección del Remolque</td>
                                    <td>
                                        <asp:Label ID="lbl220" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">2.3.0.</td>
                                    <td>Sellos de los remolques y contenedores</td>
                                    <td>
                                        <asp:Label ID="lbl230" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">2.4.0.</td>
                                    <td>Almacenamiento de contenedores y remolques</td>
                                    <td>
                                        <asp:Label ID="lbl240" runat="server" Text="..."></asp:Label></td>
                                    <td></td>
                                </tr>
                            </tbody>
                            <tfoot></tfoot>
                        </table>

                    </div>
                </div>
            </div>


            <div class="row" style="break-before: page;">
                <div class="col-md-6">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="tabla3">
                            <thead>
                                <tr class="cabezal">
                                    <th></th>
                                    <th></th>
                                    <th>Promedio</th>
                                    <th>N.R.</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="table-primary">
                                    <td>3.0.0.</td>
                                    <td>Controles de acceso físico</td>
                                    <td>
                                        <asp:Label ID="lbl300" runat="server" Text="..."></asp:Label></td>
                                    <td id="tNR3" style="font-weight: bold;">
                                        <asp:Label ID="NR3" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table-primary">3.1.0.</td>
                                    <td>Control de Empleados</td>
                                    <td>
                                        <asp:Label ID="lbl310" runat="server" Text="..."></asp:Label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">3.2.0.</td>
                                    <td>Control de visitantes</td>
                                    <td>
                                        <asp:Label ID="lbl320" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">3.3.0.</td>
                                    <td>Control de Entregas (incluyendo la correspondencia)</td>
                                    <td>
                                        <asp:Label ID="lbl330" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">3.4.0.</td>
                                    <td>Abordaje y remoción de personas no autorizadas</td>
                                    <td>
                                        <asp:Label ID="lbl340" runat="server" Text="..."></asp:Label></td>
                                    <td></td>
                                </tr>
                            </tbody>
                            <tfoot></tfoot>
                        </table>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="tabla4">
                            <thead>
                                <tr class="cabezal">
                                    <th></th>
                                    <th></th>
                                    <th>Promedio</th>
                                    <th>N.R.</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="table-primary">
                                    <td>4.0.0.</td>
                                    <td>Seguridad del personal</td>
                                    <td>
                                        <asp:Label ID="lbl400" runat="server" Text="..."></asp:Label></td>
                                    <td id="tNR4" style="font-weight: bold;">
                                        <asp:Label ID="NR4" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table-primary">4.1.0.</td>
                                    <td>Verificación previa a la contratación<</td>
                                    <td>
                                        <asp:Label ID="lbl410" runat="server" Text="..."></asp:Label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">4.2.0.</td>
                                    <td>Verificación / investigación</td>
                                    <td>
                                        <asp:Label ID="lbl420" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">4.3.0.</td>
                                    <td>Porcedimientos deteerminación de relaciones laborales</td>
                                    <td>
                                        <asp:Label ID="lbl430" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>

                            </tbody>
                            <tfoot></tfoot>
                        </table>

                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="tabla5">
                            <thead>
                                <tr class="cabezal">
                                    <th></th>
                                    <th></th>
                                    <th>Promedio</th>
                                    <th>N.R.</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="table-primary">
                                    <td>5.0.0.</td>
                                    <td>Seguridad de los Procesos</td>
                                    <td>
                                        <asp:Label ID="lbl500" runat="server" Text="Label"></asp:Label></td>
                                    <td id="tNR5" style="font-weight: bold;">
                                        <asp:Label ID="NR5" runat="server" Text="Label"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">5.1.0.</td>
                                    <td>Procesamiento de la documentación</td>
                                    <td>
                                        <asp:Label ID="lbl510" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">5.2.0.</td>
                                    <td>Procedimientos de declaración</td>
                                    <td>
                                        <asp:Label ID="lbl520" runat="server" Text=".."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">5.3.0.</td>
                                    <td>Embarque y recepción</td>
                                    <td>
                                        <asp:Label ID="lbl530" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">5.4.0.</td>
                                    <td>Discrepancias de la carga</td>
                                    <td>
                                        <asp:Label ID="lbl540" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                            </tbody>
                            <tfoot></tfoot>
                        </table>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="tabla6">
                            <thead>
                                <tr class="cabezal">
                                    <th></th>
                                    <th></th>
                                    <th>Promedio</th>
                                    <th>N.R.</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="table-primary">
                                    <td>6.0.0.</td>
                                    <td>Seguridad Física</td>
                                    <td>
                                        <asp:Label ID="lbl600" runat="server" Text="..."></asp:Label></td>
                                    <td id="tNR6" style="font-weight: bold;">
                                        <asp:Label ID="NR6" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table-primary">6.1.0.</td>
                                    <td>Cercado</td>
                                    <td>
                                        <asp:Label ID="lbl610" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">6.2.0.</td>
                                    <td>Puertas y casetas de vigilancia</td>
                                    <td>
                                        <asp:Label ID="lbl620" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">6.3.0.</td>
                                    <td>Estacionamiento</td>
                                    <td>
                                        <asp:Label ID="lbl630" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">6.4.0.</td>
                                    <td>Estructura del edificio</td>
                                    <td>
                                        <asp:Label ID="lbl640" runat="server" Text=".."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">6.5.0.</td>
                                    <td>Dispositivos de cierre y control de llaves</td>
                                    <td>
                                        <asp:Label ID="lbl650" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">6.6.0.</td>
                                    <td>Iluminación</td>
                                    <td>
                                        <asp:Label ID="lbl660" runat="server" Text="..."></asp:Label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">6.7.0.</td>
                                    <td>Sistemas de alrma y cámaras de vigilancia por video</td>
                                    <td>
                                        <asp:Label ID="lbl670" runat="server" Text="..-"></asp:Label></td>
                                    <td></td>
                                </tr>
                            </tbody>
                            <tfoot></tfoot>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="tabla7">
                            <thead>
                                <tr class="cabezal">
                                    <th></th>
                                    <th></th>
                                    <th>Promedio</th>
                                    <th>N.R.</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="table-primary">
                                    <td>7.0.0.</td>
                                    <td>Seguridad de Tecnologías de la Información</td>
                                    <td>
                                        <asp:Label ID="lbl700" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td id="tNR7" style="font-weight: bold;">
                                        <asp:Label ID="NR7" runat="server" Text="..."></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">7.1.0.</td>
                                    <td>Protección de contraseñas</td>
                                    <td>
                                        <asp:Label ID="lbl710" runat="server" Text="..."></asp:Label></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="table-primary">7.2.0.</td>
                                    <td>Responsabilidad</td>
                                    <td>
                                        <asp:Label ID="lbl720" runat="server" Text="..."></asp:Label>
                                    </td>
                                    <td></td>
                                </tr>
                            </tbody>
                            <tfoot></tfoot>
                        </table>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="tabla8">
                            <thead>
                                <tr class="cabezal">
                                    <th></th>
                                    <th></th>
                                    <th>Promedio</th>
                                    <th>N.R.</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="table-primary">
                                    <td>8.0.0.</td>
                                    <td>Entrenamiento de seguridad y concintización de amenazas</td>
                                    <td>
                                        <asp:Label ID="lbl800" runat="server" Text="..."></asp:Label></td>
                                    <td id="tNR8" style="font-weight: bold;">
                                        <asp:Label ID="NR8" runat="server" Text="..."></asp:Label>
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot></tfoot>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <table class="table table-bordered" style="font-weight: bold;">
                        <thead>
                            <tr>
                                <th colspan="3">Niveles de riesgo</th>
                            </tr>
                        </thead>
                        <tr>
                            <td style="background-color: #ff0000;"><span>Nivel 3. Riesgo alto: 0 a 49% de cumplimiento</span></td>
                            <td style="background-color: #eddb11;"><span>Nivel 2. Riesgo medio: 50% a 74% de cumplimiento</span></td>
                            <td style="background-color: #39c922;"><span>Nivel 1. Riesgo bajo: 75% a 100% de cumplimiento</span></td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-2"></div>
            </div>

        </div>
        <asp:Panel ID="pUser" runat="server">
            <div class="acciones">
                <asp:LinkButton ID="btnAtras" runat="server" CssClass="btn btn-secondary" PostBackUrl="~/F5/Autoevaluacion/autoevaluacion.aspx"
                    title="Rehacer evaluacion"><i class="bi bi-arrow-repeat"></i></asp:LinkButton>

                <button class="btn btn-primary" onclick="DescargarDoc();" type="button"
                    title="Imprimir">
                    <i class="bi bi-printer-fill"></i>
                </button>
                <asp:LinkButton ID="btnFinalizar" runat="server" CssClass="btn btn-success" PostBackUrl="~/usuario/user_index.aspx"
                    title="Ir al inicio"><i class="bi bi-house-door-fill"></i></asp:LinkButton>
            </div>
        </asp:Panel>



    </div>


</asp:Content>
<asp:Content ID="content3" ContentPlaceHolderID="ScriptsContent" runat="server">

    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/printThis.js"></script>
    <script src="../../Scripts/JS/ajax.js"></script>
    <script src="../../Scripts/chart.min.js"></script>
    <script src="../../Scripts/umd/popper.min.js"></script>

    <script src="Calculos.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            CargarRes();
            Obtener_Resdultados();
        });

        function DescargarDoc() {
            $('#imprimir').printThis({
                pageTitle: "Resultados de Cuestionario C-TPAT"
            });
        }
    </script>

</asp:Content>
