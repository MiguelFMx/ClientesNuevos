<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PoliticaSeguridad.aspx.cs" Inherits="ClientesNuevos.F12.PoliticaSeguridad" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><%: Page.Title %> Politicas de seguridad y carta compromiso</title>
    <script src="../Scripts/jquery-3.6.0.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <!-- logo -->
        <div id="print">
            <section id="pg1">
                <div class="row"></div>
                <!--Encabezado -->
                <div class="row">
                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <asp:Label ID="lblFecha" runat="server" Text=""></asp:Label>

                            </div>
                            <div class="col">
                                <div class="row">
                                    <div class="col-2">
                                        <span><strong>Asunto</strong>:</span>
                                    </div>
                                    <div class="col-10">
                                        <p>
                                            Aviso a nuestro socios de negocio sobre la participacion en el programa de Segurida Alianza - Comercio contra el Terrorismo (Customs-Trade Partnership Against Terorrism (C-TPAT)).
                                        </p>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label id="lblEmpresa">Empresa:</label>
                            <asp:Label ID="lblEmpresa1" runat="server" Text="Label" Font-Bold="true"></asp:Label>
                        </div>
                        <br />
                        <br />
                    </div>

                </div>
                <!-- Politica de seguridad -->
                <div class="row">
                    <div class="col" style="text-align: justify;">
                        <p>
                            Por medio de la presente, me permito informarle que Hungaros Transportistas S.A. de C.V.,
                        está en proceso de certificación del Programa de Seguridad Alianza Aduana-Comercio contra el Terrorismo (<strong>Customs-Trade Partnership Against Terrorism “C-TPAT”</strong>), auspiciado por el gobierno de Estados Unidos a través de su Servicio de Aduana y Protección Fronteriza (<strong>U.S. Customs and Border Protection “CBP"</strong>).
                        </p>
                        <p>
                            Además, nos encontramos en proceso de aplicación para la certificación de Operador Economico Certificado (“OEA”). El nuevo esquema de empresas Certificadas es un programa que busca fortalecer la seguridad en la cadena Logística del comercio exterior a través de establecer, en coordinación con el sector privado, estándares mínimos en materia de seguridad internacionalmente reconocidos, y que otorga beneficios a las empresas participantes.
                        </p>
                        <p>
                            C-TPAT es un programa de seguridad que conjunta los esfuerzos entre CBP y la Comunidad Internacional del Comercio con el objetivo de reducir la amenaza del terrorismo a través del reforzamiento de las medidas de seguridad dirigidas a proteger la integridad de la carga legítima que ingresa a Estados Unidos por cualquiera de sus puertos fronterizos, aéreos o marítimos. 
                        </p>
                        <p>
                            Las cargas de los exportadores participantes en el programa C-TPAT reciben beneficios de entrada, tales como la utilización de carriles exprés y reducción de inspecciones;  a diferencia de aquellas empresas que no pueden demostrar la seguridad de su cadena logística, tendrán retrasos y mayores inspecciones que se traducen en retrasos para el ingreso de su carga a Estados Unidos. 
                        </p>
                        <p>
                            Uno de los objetivos principales de Hungaros Transportistas S.A. de C.V. es el de incrementar y mantener de manera efectiva sus procesos de seguridad de la cadena logística, y así, asegurar el envió a tiempo de toda la carga con destino a Estados Unidos. 
                        </p>
                        <p>
                            Para Hungaros Transportistas S.A. de C.V., Usted es un Socio de Negocio muy valioso, como cliente y/o proveedor de servicio, motivo por el cual su participación dando seguimiento a los requerimientos de seguridad C-TPAT y OEA es CRÍTICO para lograr alcanzar el objetivo de asegurar nuestra cadena logística, de esta manera contribuir con cooperación con CBP y SAT. 
                        </p>
                        <p style="break-before: page;">
                            Tanto CBP, SAT como Hungaros Transportistas S.A. de C.V., esperamos que nuestros socios de negocio desarrollen e implementen las medidas de seguridad necesarias para que aseguren sus propias cadenas logísticas, con sus propios socios de negocio. Y hagan extensivos a todas sus unidades de negocio y a cada uno de sus socios de negocio sobre el programa de seguridad C-TPAT y OEA así como la participación que Hungaros Transportistas S.A. de C.V. tiene en el mismo. 
                        </p>
                        <p>
                            Como primer paso para asegurar sus respectivas cadenas logísticas, Hungaros Transportistas S.A. de C.V.  
                        Se permite recomendarle que considere los <strong>Puntos de Seguridad de la Cadena Logística C-TPAT</strong>:
                        </p>

                        <ol>
                            <li>
                                <strong>Procedimientos de Seguridad</strong>
                                <br />
                                Procedimientos de seguridad aplicables tanto a Socios de Negocio como todo lo relacionado con el movimiento de bienes, carga, etc., para detectar y prevenir que éstos sean objeto de una alteración o manipulación ilegitima o lícita y se infiltre en la cadena logística. 
                            <br />
                                <br />
                            </li>
                            <li>
                                <strong>Procedimientos de Seguridad Física</strong>
                                Procedimientos de seguridad para la protección física de edificios, patios de operaciones, entradas, etc., con el fin de evitar y prevenir ingresos ilícitos o no autorizados a las instalaciones.
                            <br />
                                <br />
                            </li>
                            <li>
                                <strong>Controles de Acceso</strong>
                                <br />
                                Procedimientos de seguridad para prevenir accesos no autorizados a las instalaciones, sistema de transporte y carga. 
                            <br />
                                <br />
                            </li>
                            <li>
                                <strong>Seguridad en Recursos Humanos</strong>
                                <br />
                                Procedimientos de seguridad en la contratación de personal, verificación e investigación de antecedentes, asimismo, las acciones disciplinarias contra el personal que viole las normas de seguridad establecidas. 
                            <br />
                                <br />
                            </li>
                            <li>
                                <strong>Capacitación en Concientización de Seguridad</strong>
                                <br />
                                Entrenamiento al personal, el cual será enfocado en la concientización de seguridad. Mantenimiento de la integridad de la carga y procedimientos de seguridad para reportar incidentes de vulneren las normas de seguridad. 
                            <br />
                                <br />
                            </li>
                            <li>
                                <strong>Procedimientos para los Manifiestos y Documentos</strong>
                                <br />
                                Procedimientos de seguridad para asegurarse que los manifiestos y documentación comercial que soporte todo el proceso de exportación, están en orden y son enviados oportunamente a CBP. 
                            <br />
                                <br />
                            </li>
                            <li>
                                <strong>Procedimiento de Seguridad del Sistema de Transporte</strong>
                                <br />
                                Procedimientos de seguridad para proteger la integridad del sistema de transporte contra accesos no autorizados, material/personas no manifestadas o manipulaciones ilegítimas o ilícitas.
                            <br />
                                <br />
                            </li>
                            <li style="break-before: page;">
                                <strong>Procedimiento de Seguridad en Agricultura</strong>
                                <br />
                                Procedimientos de seguridad para proteger la integridad del cargamento para evitar la amenaza de plagas y pestes tales como tierra, estiércol, semillas, y material de animales o plantas los cuales pueden encubar pestes y plagas invasivas y destructivas a los EE.UU. 
                            <br />
                                <br />
                            </li>
                            <li>
                                <strong>Procedimiento de Ciberseguridad</strong>
                                <br />
                                Procedimientos de seguridad para identificar, analizar, evaluar, y comunicar riesgos a la seguridad cibernética y aceptar, evitar, transferir o mitigar a un nivel aceptable, considerando costos y beneficios. Procedimientos de seguridad para proteger la integridad de los sistemas de información contra accesos no autorizados o manipulaciones ilegítimas o ilícitas de la información.
                            <br />
                                <br />
                            </li>
                            <li>
                                <strong>Visión de Seguridad y Responsabilidad</strong>
                                <br />
                                La empresa debe asegurar la continuidad y seguimiento de los procesos de seguridad mediante una participación y promoción de la importancia de la cultura de seguridad sea una parte integra del funcionamiento de la empresa; esta responsabilidad recae en la alta gerencia de la empresa. 
                            <br />
                                <br />
                            </li>
                        </ol>

                        <p>
                            Para mayor información relacionada con los Criterios de Seguridad C-TPAT, lo invitamos a visitar la página del Servicio de Aduana y Protección Fronteriza, así como también, la página de Servicio de Administración Tributaria que se menciona más adelante. Nuevamente, Hungaros Transportistas S.A. de C.V. lo invita a implementar las medidas de seguridad de acuerdo a la Norma que le corresponda. 
                        </p>
                        <p style="text-align: center;">
                            <br />
                            <a href="http://www.cbp.gov">http://www.cbp.gov</a>
                            <br />
                            <br />
                            <a href="http://www.sat.gob.mx">http://www.sat.gob.mx</a>
                            <br />
                            <br />
                        </p>
                        <p>
                            Distinguido Socio de Negocio, agradecería su confirmación de que ha leído y comprendido el contenido del presente aviso informativo, solicitándole la respuesta al formato de “Carta compromiso de Seguridad C-TPAT y OEA para Socios de Negocio” la cual se anexa a la presente, le solicitamos de la manera más cordial nos envié el formato firmado vía correo electrónico.
                        </p>
                        <p>
                            De antemano, le agradezco sus finas atenciones para el presente, y en caso de alguna pregunta sobre el particular, por favor no dude en contactarme.
                        </p>
                        <p>
                            Atentamente.
                        <br />
                            <strong>María de Lourdes Freig - Gerent administrativo </strong>
                            <br />
                            HUNGAROS TRASNPORTISTAS SA. de CV.
                        </p>
                    </div>
                </div>
            </section>
            <hr />
            <section id="pg2" style="break-before: page;">
                <!-- Carta compromiso-->
                <div class="row">
                    <div class="col">
                        <p>
                            La firma de este documento respalda la conformidad de que la Empresa ha leído y ha comprendido la carta de notificación de aplicación a los programas C-TPAT y OEA por parte de Hungaros Transportistas S.A. de C.V. Además, de comprometerse a dar seguimiento a los estándares de seguridad indicados en la misma.
                        </p>
                        <p>
                            Nombre y dirección de la empresa:
                    <br />
                            <asp:Label ID="lblNombre" runat="server" Text="Label" Font-Underline="True"></asp:Label>
                            <br />
                            <asp:Label ID="lblDireccion" runat="server" Text="Label" Font-Underline="True"></asp:Label>
                            <br />
                        </p>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-auto">
                        <asp:RadioButton ID="si1" GroupName="radioPregunta1" Text="Si" runat="server" />
                    </div>
                    <div class="col-auto">
                        <asp:RadioButton ID="no1" GroupName="radioPregunta1" Text="No" runat="server" />
                    </div>
                    <div class="col-auto">
                        <span>Nuestra compañía ES o ESTA EN EL PROCESO de llegar a ser a un miembro de C-TPAT. </span>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-auto" style="display: flex; justify-content: flex-start;">
                        <asp:RadioButton ID="si2" Text="Si" runat="server" GroupName="radioPregunta2" />
                    </div>
                    <div class="col-auto">
                        <asp:RadioButton ID="no2" Text="No" GroupName="radioPregunta2" runat="server" />
                    </div>
                    <div class="col-auto">
                        <label for="txtnumeroCuenta">Nuestra Compañía ES ya un miembro de C-TPAT. Nuestro número de cuenta es: </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-1" style="padding-right: 95px;"></div>
                    <div class="col">
                        <asp:TextBox ID="txtnumeroCuenta" runat="server" CssClass="form-control-sm form-control" Style="width: 40%;"></asp:TextBox>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-auto">
                        <asp:RadioButton ID="si3" runat="server" Text="Si" GroupName="radioPregunta3" />
                    </div>
                    <div class="col-auto">
                        <asp:RadioButton ID="no3" runat="server" Text="No" GroupName="radioPregunta3" />
                    </div>
                    <div class="col">
                        <span>Nuestra Compañía ES ELEGIBE de llegar a ser un miembro de C-TPAT.</span>
                    </div>
                </div>

                <asp:Panel ID="pPrgunta4" runat="server">
                    <div class="row">
                        <div class="col-auto">
                            <asp:RadioButton ID="si4" runat="server" GroupName="radioPregunta4" Text="Si" />
                        </div>
                        <div class="col-auto">
                            <asp:RadioButton ID="no4" runat="server" GroupName="radioPregunta4" Text="No" />
                        </div>
                        <div class="col">
                            <span>Solo contestar si la opción superior es NO. Declaramos que entendemos los lineamientos del Programa C-TPAT y OEA. </span>
                        </div>
                    </div>
                </asp:Panel>

                <br />

                <div class="row">
                    <div class="col-auto">
                        <asp:RadioButton ID="si5" runat="server" Text="Si" GroupName="radioPregunta5" OnCheckedChanged="si5_CheckedChanged" AutoPostBack="true" />
                    </div>
                    <div class="col-auto">
                        <asp:RadioButton ID="no5" runat="server" Text="No" GroupName="radioPregunta5" AutoPostBack="true" OnCheckedChanged="si5_CheckedChanged" />
                    </div>
                    <div class="col">
                        <asp:Label ID="lblpregunta5" runat="server" Text="Somos participantes en el programa de seguridad de la cadena de suministro de nuestro País. Nuevo Esquema de Empresas Certificadas OEA."></asp:Label>
                        <asp:TextBox ID="txtPregunta5" runat="server" CssClass="form-control-sm form-control" Style="width: 40%;" Visible="false"></asp:TextBox>
                    </div>
                </div>
                <br />

                <div class="row">
                    <div class="col-auto">
                        <asp:RadioButton ID="si6" runat="server" Text="Si" GroupName="radioPregunta6" />
                    </div>
                    <div class="col-auto">
                        <asp:RadioButton ID="no6" runat="server" Text="No" GroupName="radioPregunta6" />

                    </div>
                    <div class="col">
                        <label for="gvProgramas">Nuestra Compañía actualmente participa en algún programa de Seguridad. En caso de que la respuesta sea positiva favor de indicar el programa de seguridad en el que participa: </label>

                        <div class="table-responsive">
                            <asp:GridView ID="gvProgramas" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered">
                                <Columns>
                                    <asp:BoundField DataField="Descripcion" HeaderText="Programa de seguridad" SortExpression="Descripcion"></asp:BoundField>
                                    <asp:BoundField DataField="codigo_certificacion" HeaderText="Codigo de certificación" SortExpression="codigo_certificacion"></asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row" style="break-before: page;">
                    <div class="col-auto">
                        <span>¿Usted responde por todas las ubicaciones de la compañia?</span>
                    </div>
                    <div class="col">
                        <div class="row">
                            <div class="col-auto">
                                <asp:RadioButton ID="si7" runat="server" GroupName="radioPregunta7" Text="Si" />
                            </div>
                            <div class="col-auto">
                                <asp:RadioButton ID="no7" runat="server" GroupName="radioPregunta7" Text="No" />
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col">
                        <div class="row">
                            <div class="col-2"></div>
                            <div class="col-5" style="display: flex; justify-content: center;">
                                <span>Nombre del <strong>representante legal</strong> o <strong>encargado de seguridad de la empresa</strong>:</span>
                            </div>
                            <div class="col-5">
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>

                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-1"></div>
                            <div class="col-10">
                                <div class="row">
                                    <div class="col">
                                        <asp:CheckBox ID="chFirma" runat="server" />
                                        <asp:Label ID="lblFirma" runat="server" Text="La empresa ha leído y ha comprendido la carta de notificación de aplicación a los programas C-TPAT y OEA por parte de Hungaros Transportistas S.A. de C.V.
                                        Además, se compromete a dar seguimiento a los estándares de seguridad indicados en la misma."></asp:Label>
                                    </div>

                                </div>
                                <div class="row">
                                    <asp:Label ID="lblError" runat="server" Text="*Por favor firme el documento" ForeColor="Red" Visible="false"></asp:Label>
                                </div>
                            </div>
                            <div class="col-1"></div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <br />
        <section id="boton">
            <div class="row">
                <div class="col d-flex justify-content-end">
                    <button id="btnImprimir" class="btn btn-primary text-light" type="button" onclick="imprSelec()"><i class="bi bi-printer"></i></button>
                    &nbsp;
                    <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/usuario/user_index.aspx" CssClass="btn btn-secondary"><i class="bi bi-house-door"></i></asp:HyperLink>
                    &nbsp;
                    <asp:LinkButton ID="btnNext" runat="server" CssClass="btn  btn-success" OnClick="btnNext_Click">Continuar <i class="bi bi-chevron-double-right"></i></asp:LinkButton>
                </div>
            </div>

        </section>
    </div>

    <script src="PoliticaSeguridadJS.js"></script>
    <script type="text/javascript">
        function imprSelec() {
            $('#pg1, #pg2').printThis({
                header: "<img src='../template/assets/img/logo/HungarosTexto.png'  width='250' height='100' style='display:block; margin:auto;'/><br>"

            });
        }
    </script>
</asp:Content>
