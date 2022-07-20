<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Resultados.aspx.cs" Inherits="ClientesNuevos.F5.Autoevaluacion.Resultados" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col">
                <label >Empresa</label>
            </div>
            <div class="col-6"></div>
            <div class="col">
                <label>Fecha</label>
            </div>
        </div>
       <%-- <div class="row" hidden>
            <div class="col">
                <canvas id="chart"></canvas>
                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="seccion" YValueMembers="valor" ChartType="Bar"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:pruebas_hungarosConnectionString %>' SelectCommand="SELECT * FROM [Table_R]"></asp:SqlDataSource>
            </div>
        </div>--%>
        <br />
        <div class="row">
            <div class="col">
                <table id ="tRespuesta" class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Pregunta</th>
                            <th>Opcion</th>
                            <th>Observaciones</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot></tfoot>
                   
                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-5">

                <table class="table table-bordered" id="tabla1">
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                            <th>Promedio</th>
                            <th>N.R.</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1.0.0.</td>
                            <td>Requerimientos  de los socios comerciales</td>
                            <td> <label id="lbl100">...</label> </td>
                            <td> <label id="NR1">...</label> </td>
                        </tr>
                        <tr>
                            <td>1.1.0.</td>
                            <td>Procedimientos de seguridad</td>
                            <td> <label id="lbl110">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>1.2.0.</td>
                            <td>Punto de origen</td>
                            <td> <label id="lbl120">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>1.3.0.</td>
                            <td>Participación / Certificación en programas de seguridad de la cadena de abastecimiento de administraciones aduanales extranjeras</td>
                            <td> <label id="lbl130">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>1.4.0.</td>
                            <td>Procedimientos de Seguridad</td>
                            <td> <label id="lbl140">...</label> </td>
                            <td></td>
                        </tr>
                    </tbody>
                    <tfoot></tfoot>
                </table>

            </div>
            <div class="col-2"></div>
            <div class="col-5">
                 <table class="table table-bordered" id="tabla5">
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                            <th>Promedio</th>
                            <th>N.R.</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>5.0.0.</td>
                            <td>Seguridad de los Procesos</td>
                            <td> <label id="lbl500">...</label> </td>
                            <td> <label id="NR5">...</label> </td>
                        </tr>
                        <tr>
                            <td>5.1.0.</td>
                            <td>Procesamiento de la documentación</td>
                            <td> <label id="lbl510">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>5.2.0.</td>
                            <td>Procedimientos de declaración</td>
                            <td> <label id="lbl520">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>5.3.0.</td>
                            <td>Embarque y recepción</td>
                            <td> <label id="lbl530">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>5.4.0.</td>
                            <td>Discrepancias de la carga</td>
                            <td> <label id="lbl540">...</label> </td>
                            <td></td>
                        </tr>
                    </tbody>
                    <tfoot></tfoot>
                </table>
            </div>
        </div>

         <div class="row">
            <div class="col-5">

                <table class="table table-bordered" id="tabla2">
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                            <th>Promedio</th>
                            <th>N.R.</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2.0.0.</td>
                            <td>Seguridad de Contenedores y Remolques</td>
                            <td> <label id="lbl200">...</label> </td>
                            <td> <label id="NR2">...</label> </td>
                        </tr>
                        <tr>
                            <td>2.1.0.</td>
                            <td>Procedimientos de seguridad</td>
                            <td> <label id="lbl210">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>2.2.0.</td>
                            <td>Punto de origen</td>
                            <td> <label id="lbl220">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>2.3.0.</td>
                            <td>Participación / Certificación en programas de seguridad de la cadena de abastecimiento de administraciones aduanales extranjeras</td>
                            <td> <label id="lbl230">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>2.4.0.</td>
                            <td>Procedimientos de Seguridad</td>
                            <td> <label id="lbl240">...</label> </td>
                            <td></td>
                        </tr>
                    </tbody>
                    <tfoot></tfoot>
                </table>

            </div>
            <div class="col-2"></div>
            <div class="col-5">
                 <table class="table table-bordered" id="tabla6">
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                            <th>Promedio</th>
                            <th>N.R.</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>6.0.0.</td>
                            <td>Seguridad Física</td>
                            <td> <label id="lbl600">...</label> </td>
                            <td > <label id="NR6">...</label> </td>
                        </tr>
                        <tr>
                            <td>6.1.0.</td>
                            <td>Cercado</td>
                            <td> <label id="lbl610">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>6.2.0.</td>
                            <td>Puertas y casetas de vigilancia</td>
                            <td> <label id="lbl620">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>6.3.0.</td>
                            <td>Estacionamiento</td>
                            <td> <label id="lbl630">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>6.4.0.</td>
                            <td>Estructura del edificio</td>
                            <td> <label id="lbl640">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>6.5.0.</td>
                            <td>Dispositivos de cierre y control de llaves</td>
                            <td> <label id="lbl650">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>6.6.0.</td>
                            <td>Iluminación</td>
                            <td> <label id="lbl660">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>6.7.0.</td>
                            <td>Sistemas de alrma y cámaras de vigilancia por video</td>
                            <td> <label id="lbl670">...</label> </td>
                            <td></td>
                        </tr>
                    </tbody>
                    <tfoot></tfoot>
                </table>
            </div>
        </div>

                <div class="row">
            <div class="col-5">

                <table class="table table-bordered" id="tabla3">
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                            <th>Promedio</th>
                            <th>N.R.</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>3.0.0.</td>
                            <td>Controles de acceso físico</td>
                            <td> <label id="lbl300">...</label> </td>
                            <td> <label id="NR3">...</label> </td>
                        </tr>
                        <tr>
                            <td>3.1.0.</td>
                            <td>Control de Empleados</td>
                            <td> <label id="lbl310">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>3.2.0.</td>
                            <td>Control de visitantes</td>
                            <td> <label id="lbl320">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>3.3.0.</td>
                            <td>Control de Entregas (incluyendo la correspondencia)</td>
                            <td> <label id="lbl330">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>3.4.0.</td>
                            <td>Abordaje y remoción de personas no autorizadas</td>
                            <td> <label id="lbl340">...</label> </td>
                            <td></td>
                        </tr>
                    </tbody>
                    <tfoot></tfoot>
                </table>

            </div>
            <div class="col-2"></div>
            <div class="col-5">
                 <table class="table table-bordered" id="tabla7">
                    <thead>
                        <tr>
                            <th></th>
                            <th></th>
                            <th>Promedio</th>
                            <th>N.R.</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>7.0.0.</td>
                            <td>Seguridad de Tecnologías de la Información</td>
                            <td> <label id="lbl700">...</label> </td>
                            <td> <label id="NR7">...</label> </td>
                        </tr>
                        <tr>
                            <td>7.1.0.</td>
                            <td>Protección de contraseñas</td>
                            <td> <label id="lbl710">...</label> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>7.2.0.</td>
                            <td>Responsabilidad</td>
                            <td> <label id="lbl720">...</label> </td>
                            <td></td>
                        </tr>
                    </tbody>
                    <tfoot></tfoot>
                </table>
            </div>
        </div>



    </div>
    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/JS/ajax.js"></script>
    <script src="Calculos.js"></script>
    <script type="text/javascript">
        
    </script>

        <script type="text/javascript">
            $(document).ready(function () {
                CargarRes();
            });
        </script>
</asp:Content>
