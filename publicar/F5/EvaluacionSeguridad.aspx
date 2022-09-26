<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EvaluacionSeguridad.aspx.cs" Inherits="ClientesNuevos.cliente.F5.EvaluacionSeguridadRiesgoBussinessPartner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <div class="row">
            <div class="col">
                <span class="text-secondary">Por favor responda las preguntas, en caso de que su empresa ya ha sido certificada C-TPAT, unicamente verifque que su numero de cuenta sea el correcto y de clic en el boton siguiente.</span>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col">
                <div id="formulario" class="card border-primary">
                    <h6 style="text-align: center;" class="card-header cabezal">Cuestionario C-TPAT para SOCIO COMERCIAL </h6>

                    <div class="card-body">
                        <section id="portada">

                            <div class="row ">
                                <div class="col-auto backgroudtag">
                                    <span>1.0.0</span>
                                </div>

                                <div class="col">
                                    <div class="row">
                                        <div class="col-auto">
                                            <span style="padding-top: 10px;">Nuestra compañia <strong>ya esta certificada</strong>  en C-TPAT y nuestro numero de cuenta es:</span>
                                        </div>
                                        <div class="col-4">
                                            <asp:TextBox ID="txt100" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <hr />
                            <!-- 2 -->
                            <div class=" row">
                                <div class="col-auto backgroudtag">
                                    <span>1.2.0</span>
                                </div>


                                <div class="col">
                                    <span>Nuestra Compañía <strong>ES</strong> elegible para ser miembro C-TPAT</span>
                                    <div class="row">

                                        <div class="col-auto">
                                            <asp:RadioButtonList ID="radio120" runat="server" RepeatDirection="Horizontal" CssClass="spaced" RepeatLayout="Flow">
                                                <asp:ListItem Text="SI" />
                                                <asp:ListItem Text="NO" />
                                                <asp:ListItem Text="N/A" />
                                            </asp:RadioButtonList>

                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                            ErrorMessage="*Elija una opcion"
                                            ControlToValidate="radio120"
                                            Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <div class=" row">
                                <div class="col-auto backgroudtag">
                                    <span>1.3.0</span>
                                </div>
                                <div class="col">
                                    <div class="row">
                                        <span>Es miembro o está en proceso de ser Miembro C-TPAT</span>
                                        <div class="col-auto">
                                            <asp:RadioButtonList ID="radio130" runat="server" CssClass="spaced" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="radioMiembro_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Text="SI" />
                                                <asp:ListItem Text="NO" />
                                                <asp:ListItem Text="N/A" />
                                            </asp:RadioButtonList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                            ErrorMessage="*Elija una opcion"
                                            ControlToValidate="radio130"
                                            Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <asp:Panel ID="PanelSi" runat="server" Visible="false">
                                <section id="seccionSI" style="background-color: #EEE8E7;">
                                    <div class="row">
                                        <div class="col-auto backgroudtag">
                                            <span>1.3.1&nbsp;&nbsp;&nbsp;</span>
                                        </div>
                                        <div class="col" style="padding-bottom: 15px;">
                                            <span>Si la respuesta a la pregunta 1.3.0 es <strong>SI</strong> :</span>
                                        </div>
                                    </div>
                                    <hr style="width: 70%;">
                                    <div class="row">
                                        <div class="col-auto backgroudtag">
                                            <span>1.3.1.1</span>
                                        </div>
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-auto">
                                                    <span>Número de Cuenta C-TPAT:</span>
                                                </div>
                                                <div class="col-4">
                                                    <asp:TextBox ID="txt1311" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                    <hr style="width: 70%;">
                                    <div class=" row">
                                        <div class="col-auto backgroudtag">
                                            <span>1.3.1.2</span>
                                        </div>
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-auto">
                                                    <span>Estatus de cuenta:</span>
                                                </div>
                                                <div class="col-4">
                                                    <asp:DropDownList ID="cb1312" runat="server" CssClass="form-select">
                                                        <asp:ListItem Text="Certificado" Value="0" />
                                                        <asp:ListItem Text="Certificado validado" Value="1" />
                                                        <asp:ListItem Text="Certificado no validado" Value="2" />
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <hr style="width: 70%;">
                                    <div class="row">
                                        <div class="col-auto backgroudtag">
                                            <span>1.3.1.3</span>
                                        </div>
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-auto">
                                                    <span>Estatus de revisión de su perfil de seguridad:</span>
                                                </div>
                                                <div class="col-4">
                                                    <asp:DropDownList ID="cb1313" runat="server" CssClass="form-select">
                                                        <asp:ListItem Text="Actualizado" Value="1" />
                                                        <asp:ListItem Text="En Revision" Value="2" />
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr />

                                </section>
                            </asp:Panel>

                            <asp:Panel ID="PanelNo" runat="server" Visible="false">
                                <section id="seccionNO" style="background-color: #EEE8E7;">
                                    <div class="row">
                                        <div class="col-auto backgroudtag">
                                            <span>1.3.2&nbsp;&nbsp;&nbsp;</span>
                                        </div>
                                        <div class="col" style="padding-bottom: 15px;">
                                            <span>Si la respuesta a la pregunta 1.3.0 es <strong>NO o N/A</strong> :</span>
                                        </div>
                                    </div>
                                    <hr style="width: 50%;">

                                    <div class=" row">
                                        <div class="col-auto backgroudtag">
                                            <span>1.3.2.1</span>
                                        </div>
                                        <div class="col">
                                            <div class="row">
                                                <div class="row">
                                                    <div class="col">
                                                        <span>No esta interesada en aplicar por el momento</span>
                                                    </div>
                                                </div>
                                                <div class="row row-cols-auto">
                                                    <div class="col">
                                                        <asp:RadioButtonList ID="radio1321" runat="server" RepeatLayout="Flow" CssClass="spaced" RepeatDirection="Horizontal">
                                                            <asp:ListItem Text="SI" />
                                                            <asp:ListItem Text="NO" />
                                                            <asp:ListItem Text="N/A" />
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr style="width: 50%;" />

                                    <div class=" row">
                                        <div class="col-auto backgroudtag">
                                            <span>1.3.2.2</span>
                                        </div>
                                        <div class="col">
                                            <div class="row">
                                                <span>Esta interesada y desea recibir más información</span>
                                                <div class="row row-cols-auto">

                                                    <div class="col">
                                                        <asp:RadioButtonList ID="radio1322" runat="server" CssClass="spaced" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                                            <asp:ListItem Text="SI" />
                                                            <asp:ListItem Text="NO" />
                                                            <asp:ListItem Text="N/A" />
                                                        </asp:RadioButtonList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <hr />
                                </section>
                            </asp:Panel>
                            <div class=" row">
                                <div class="col-auto backgroudtag">
                                    <span>1.4.0</span>
                                </div>
                                <div class="col">
                                    <div class="row">
                                        <div class="row">
                                            <div class="col">
                                                <span>Nuestra compañía comprende las normas mínimas de Seguridad C-TPAT y certifica que sus operaciones están acordes con dichas normas.</span>
                                            </div>
                                        </div>
                                        <div class="row row-cols-auto">
                                            <div class="col">
                                                <asp:RadioButtonList ID="radio140" runat="server" RepeatDirection="Horizontal" CssClass="spaced" RepeatLayout="Flow">
                                                    <asp:ListItem Text="SI" />
                                                    <asp:ListItem Text="NO" />
                                                    <asp:ListItem Text="N/A" />
                                                </asp:RadioButtonList>
                                            </div>

                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                            ErrorMessage="*Elija una opcion"
                                            ControlToValidate="radio140"
                                            Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                            </div>
                            <hr />
                            <div class="row">
                                <div class="col-auto backgroudtag">
                                    <span>1.5.0</span>
                                </div>
                                <div class="col">
                                    <div class="row">
                                        <div class="col">
                                            <span>Nuestra compañía <strong>NO ES ELEGIBLE PARA SER MIEMBRO C-TPAT </strong>pero está de acuerdo en cumplir con los lineamientos de seguridad</span>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-auto">
                                            <asp:RadioButtonList ID="radio150" runat="server" RepeatDirection="Horizontal" CssClass="spaced" RepeatLayout="Flow">
                                                <asp:ListItem Text="SI" />
                                                <asp:ListItem Text="NO" />
                                                <asp:ListItem Text="N/A" />
                                            </asp:RadioButtonList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                            ErrorMessage="*Elija una opcion"
                                            ControlToValidate="radio150"
                                            Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                        </asp:RequiredFieldValidator>
                                    </div>

                                </div>

                            </div>
                            <hr />

                            <div class=" row">
                                <div class="col-auto backgroudtag">
                                    <span>1.6.0</span>
                                </div>
                                <div class="col">
                                    <div class="row">
                                        <div class="col">
                                            <span>¿Esta usted respondiendo por todas las entidades de negocio de su compañía?</span>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-auto">
                                            <asp:RadioButtonList ID="radio160" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="spaced">
                                                <asp:ListItem Text="SI" />
                                                <asp:ListItem Text="NO" />
                                                <asp:ListItem Text="N/A" />
                                            </asp:RadioButtonList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                            ErrorMessage="*Elija una opcion"
                                            ControlToValidate="radio160"
                                            Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </section>

                    </div>
                </div>
            </div>
        </div>
        <br />
        <asp:Label ID="lbluno" runat="server" Text="Label"></asp:Label>

        <div class="row">
            <div class="col"></div>
            <div class="col" style="display:flex; justify-content:flex-end;">
                 <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-secondary"
                    data-bs-toggle="tooltip"
                    data-bs-placement="top"
                    title="Guardar y salir" OnClick="btnHome_Click"> <i class="bi bi-house-door"></i> </asp:LinkButton>&nbsp;&nbsp;
                    <asp:LinkButton ID="btnContinue" runat="server" OnClick="btnContinue_Click" CssClass="btn btn-success">Siguiente<i class="bi bi-chevron-right"></i></asp:LinkButton>
              
            </div>
        </div>



    </div>

    <script type="text/javascript">

        $(document).ready(function () {

            const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
            const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));

        });

    </script>

</asp:Content>
