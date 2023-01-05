<%@ Page Title="Evaluacion de seguridad" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EvaluacionSeguridad.aspx.cs" Inherits="ClientesNuevos.cliente.F5.EvaluacionSeguridadRiesgoBussinessPartner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">

        <div class="row">
            <div class="col">
                <span class="text-secondary">
                    <asp:Literal ID="Literal22" runat="server" Text="<%$Resources: Evaluacion, lblInstrucciones %>"></asp:Literal></span>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col">
                <div id="formulario" class="card border-primary">
                    <h6 style="text-align: center;" class="card-header cabezal">
                        <asp:Literal ID="Literal21" runat="server" Text="<%$Resources: Evaluacion, lblTitulo %>"></asp:Literal></h6>

                    <div class="card-body">
                        <section id="portada">

                            <div class="row ">
                                <div class="col-auto backgroudtag">
                                    <span>1.0.0</span>
                                </div>

                                <div class="col">
                                    <div class="row">
                                        <div class="col-auto">
                                            <span style="padding-top: 10px;">
                                                <asp:Literal ID="Literal4" runat="server" Text="<%$Resources: Evaluacion, lbl100 %>"></asp:Literal> <strong>
                                                    <asp:Literal ID="Literal5" runat="server" Text="<%$Resources:Evaluacion, lbl1001 %>"></asp:Literal></strong>  <asp:Literal ID="Literal6" runat="server" Text="<%$Resources: Evaluacion,lbl1002 %>"></asp:Literal></span>
                                        </div>
                                        <div class="col-md-5">
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
                                    <span>
                                        <asp:Literal ID="Literal1" runat="server" Text="<%$Resources: Evaluacion, lbl120 %>"></asp:Literal><strong><asp:Literal ID="Literal3" runat="server" Text="<%$Resources: Evaluacion,lbl1201 %>"></asp:Literal></strong> <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:Evaluacion, lbl1202 %>"></asp:Literal></span>
                                    <div class="row">

                                        <div class="col-auto">
                                            <asp:RadioButtonList ID="radio120" runat="server" RepeatDirection="Horizontal" CssClass="spaced" RepeatLayout="Flow">
                                                <asp:ListItem Text="<%$Resources: Certificacion, lblSI %>" />
                                                <asp:ListItem Text="NO" />
                                                <asp:ListItem Text="N/A" />
                                            </asp:RadioButtonList>

                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                            ErrorMessage="<%$Resources:Evaluacion, lblerror%>"
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
                                        <span>
                                            <asp:Literal ID="Literal7" runat="server" Text="<%$Resources:Evaluacion,lbl130 %>"></asp:Literal></span>
                                        <div class="col-auto">
                                            <asp:RadioButtonList ID="radio130" runat="server" CssClass="spaced" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="radioMiembro_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Text="<%$Resources: Certificacion, lblSI %>" />
                                                <asp:ListItem Text="NO" />
                                                <asp:ListItem Text="N/A" />
                                            </asp:RadioButtonList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                            ErrorMessage="<%$Resources:Evaluacion, lblerror%>"
                                            ControlToValidate="radio130"
                                            Display="Dynamic" ValidateRequestMode="Enabled" ForeColor="#ff0000">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <%-- ==============Si la respuesta es si ================================================== --%>
                            <asp:Panel ID="PanelSi" runat="server" Visible="false">
                                <section id="seccionSI" style="background-color: #EEE8E7;">
                                    <div class="row">
                                        <div class="col-auto backgroudtag">
                                            <span>1.3.1&nbsp;&nbsp;&nbsp;</span>
                                        </div>
                                        <div class="col" style="padding-bottom: 15px;">
                                            <span>
                                                <asp:Literal ID="Literal8" runat="server" Text="<%$Resources: Evaluacion, lbl131 %>"></asp:Literal> <strong><asp:Literal ID="Literal9" runat="server" Text="<%$Resources: Certificacion, lblSI %>"></asp:Literal></strong> :</span>
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
                                                    <span>C-TPAT SVI:</span>
                                                </div>
                                                <div class="col-md-4">
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
                                                    <span>
                                                        <asp:Literal ID="Literal10" runat="server" Text="<%$Resources:Evaluacion, lbl1312 %>"></asp:Literal></span>
                                                </div>
                                                <div class="col-md-4">
                                                    <asp:DropDownList ID="cb1312" runat="server" CssClass="form-select">
                                                        <asp:ListItem Text="<%$Resources: Certificacion, lblCertificado %>" Value="0" />
                                                        <asp:ListItem Text="<%$Resources: Certificacion, lblCertificadoValidado %>" Value="1" />
                                                        <asp:ListItem Text="<%$Resources: Certificacion, lblCertificadoNoVal %>" Value="2" />
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
                                                    <span>
                                                        <asp:Literal ID="Literal19" runat="server" Text="<%$Resources: Evaluacion,lbl1313 %>"></asp:Literal></span>
                                                </div>
                                                <div class="col-md-4">
                                                    <asp:DropDownList ID="cb1313" runat="server" CssClass="form-select">
                                                        <asp:ListItem Text="<%$Resources: Evaluacion,lblActualizado %>" Value="1" />
                                                        <asp:ListItem Text="<%$Resources: Evaluacion,lblEnRevision %>" Value="2" />
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr />

                                </section>
                            </asp:Panel>
                            <%-- ==============Si la respuesta es no ================================================== --%>
                            <asp:Panel ID="PanelNo" runat="server" Visible="false">
                                <section id="seccionNO" style="background-color: #EEE8E7;">
                                    <div class="row">
                                        <div class="col-auto backgroudtag">
                                            <span>1.3.2&nbsp;&nbsp;&nbsp;</span>
                                        </div>
                                        <div class="col" style="padding-bottom: 15px;">
                                            <span>
                                                <asp:Literal ID="Literal11" runat="server" Text="<%$Resources:Evaluacion,lbl131 %>"></asp:Literal> <strong>NO o N/A</strong> :</span>
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
                                                        <span>
                                                            <asp:Literal ID="Literal12" runat="server" Text="<%$Resources: Evaluacion,lbl1321 %>"></asp:Literal></span>
                                                    </div>
                                                </div>
                                                <div class="row row-cols-auto">
                                                    <div class="col">
                                                        <asp:RadioButtonList ID="radio1321" runat="server" RepeatLayout="Flow" CssClass="spaced" RepeatDirection="Horizontal">
                                                            <asp:ListItem Text="<%$Resources: Certificacion, lblSI %>" />
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
                                                <span>
                                                    <asp:Literal ID="Literal13" runat="server" Text="<%$Resources: Evaluacion, lbl1322 %>"></asp:Literal></span>
                                                <div class="row row-cols-auto">

                                                    <div class="col">
                                                        <asp:RadioButtonList ID="radio1322" runat="server" CssClass="spaced" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                                            <asp:ListItem Text="<%$Resources: Certificacion, lblSI %>" />
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
                                                <span>
                                                    <asp:Literal ID="Literal14" runat="server" Text="<%$Resources: Evaluacion, lbl140 %>"></asp:Literal></span>
                                            </div>
                                        </div>
                                        <div class="row row-cols-auto">
                                            <div class="col">
                                                <asp:RadioButtonList ID="radio140" runat="server" RepeatDirection="Horizontal" CssClass="spaced" RepeatLayout="Flow">
                                                    <asp:ListItem Text="<%$Resources: Certificacion, lblSI %>" />
                                                    <asp:ListItem Text="NO" />
                                                    <asp:ListItem Text="N/A" />
                                                </asp:RadioButtonList>
                                            </div>

                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                            ErrorMessage="<%$Resources:Evaluacion, lblerror%>"
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
                                            <span>
                                                <asp:Literal ID="Literal15" runat="server" Text="<%$Resources:Evaluacion,lbl150 %>"></asp:Literal> <strong>
                                                    <asp:Literal ID="Literal16" runat="server" Text="<%$Resources:Evaluacion,lbl1501 %>"></asp:Literal> </strong>
                                                <asp:Literal ID="Literal17" runat="server" Text="<%$Resources:Evaluacion,lbl1502 %>"></asp:Literal></span>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-auto">
                                            <asp:RadioButtonList ID="radio150" runat="server" RepeatDirection="Horizontal" CssClass="spaced" RepeatLayout="Flow">
                                                <asp:ListItem Text="<%$Resources: Certificacion, lblSI %>" />
                                                <asp:ListItem Text="NO" />
                                                <asp:ListItem Text="N/A" />
                                            </asp:RadioButtonList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                            ErrorMessage="<%$Resources:Evaluacion, lblerror%>"
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
                                            <span>
                                                <asp:Literal ID="Literal18" runat="server" Text="<%$Resources:Evaluacion,lbl160 %>"></asp:Literal></span>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-auto">
                                            <asp:RadioButtonList ID="radio160" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" CssClass="spaced">
                                                <asp:ListItem Text="<%$Resources: Certificacion, lblSI %>" />
                                                <asp:ListItem Text="NO" />
                                                <asp:ListItem Text="N/A" />
                                            </asp:RadioButtonList>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                                            ErrorMessage="<%$Resources:Evaluacion, lblerror%>"
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
        <asp:Label ID="lbluno" runat="server" Text="Label" Visible="false"></asp:Label>

        <div class="row">
            <div class="col" style="display:flex; justify-content:flex-end;">
                 <asp:LinkButton ID="btnHome" runat="server" CssClass="btn btn-secondary"
                    data-bs-toggle="tooltip"
                    data-bs-placement="top"
                    title="Guardar y salir" OnClick="btnHome_Click"> <i class="bi bi-house-door"></i> </asp:LinkButton>&nbsp;&nbsp;
                    <asp:LinkButton ID="btnContinue" runat="server" OnClick="btnContinue_Click" CssClass="btn btn-success">
                        <asp:Literal ID="Literal20" runat="server" Text="<%$Resources: InformacionCompania,lblBtnContinuar %>"></asp:Literal><i class="bi bi-chevron-right"></i></asp:LinkButton>
              
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
