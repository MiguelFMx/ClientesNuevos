<%@ Page Title="Contacto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="contacto.aspx.cs" Inherits="ClientesNuevos.usuario.contacto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row h-100">
            <div class="col">
                <div class="card shadow">
                    <div class="card-header cabezal">
                        <h5>Informacion</h5>
                    </div>
                    <div class="card-body">
                        <div id="direccion">
                            <p>
                                <b>Direccion</b>
                                <br />
                                Blv. Luis Donaldo Colosio #3199
                                <br />
                                C.P. 84066 Nogales, Sonora.
                            </p>
                        </div>
                        <div id="telefonos">
                            <p>
                                <b>Teléfonos</b><br />
                                +52 631-314-3434
                                <br />
                                +52 631-314-3403
                                <br />
                                +52 631-314-473
                                <br />
                                +52 631-314-3467
                            </p>
                        </div>
                        <div id="Usa">
                            <p>
                                <b>Teléfono USA</b><br />
                                +1 520-223-4898
                            </p>
                        </div>
                        <div id="ubicacion">
                            <b>Ubicación</b>
                            <div id="mapa">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3409.650184992682!2d-110.94397278468153!3d31.28577006581861!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x86d152e432b8e57f%3A0xb8aabdbedc0b9807!2sHungaros%20Transportistas%20SA%20De%20Cv!5e0!3m2!1sen!2smx!4v1671043778593!5m2!1sen!2smx" width="600" height="315" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card shadow">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                    <div class="card-header cabezal">
                        <h5>Contacto</h5>
                    </div>
                     
                    <div class="card-body">
                        <div class="row">

                           
                            <div class="col">
                                <div class="form-group mb-1">
                                    <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ForeColor="#cc3300" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombre" ErrorMessage="*Se requiere un nombre"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group mb-1">
                                    <asp:Label ID="lblMail" CssClass="form-label" runat="server" Text="Correo:"></asp:Label>
                                    <asp:TextBox ID="txtCorreo" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ForeColor="#cc3300" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCorreo" ErrorMessage="*Se requiere un correo"></asp:RequiredFieldValidator>

                                </div>
                                <div class="form-group mb-1">
                                    <asp:Label ID="lblAsunto" CssClass="form-label" runat="server" Text="Asunto:"></asp:Label>
                                    <asp:TextBox ID="txtAsunto" CssClass="form-control" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ForeColor="#cc3300" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAsunto" ErrorMessage="*Se requiere el asunto"></asp:RequiredFieldValidator>

                                </div>
                                <div class="form-group">
                                    <asp:Label ID="lblCuerpo" CssClass="form-label" runat="server" Text="Mensaje:"></asp:Label>
                                    <asp:TextBox ID="txtCuerpo" CssClass="form-control" runat="server" TextMode="MultiLine" Rows="8"></asp:TextBox>
                                    <asp:RequiredFieldValidator ForeColor="#cc3300" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCuerpo" ErrorMessage="*Se requier el mensaje"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                            
                                    <asp:Label ID="lblEnviado" runat="server" Text=""></asp:Label>

                                
                        </div>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btnEnviar" runat="server" Text="Enviar" CssClass="btn btn-primary" OnClick="btnEnviar_Click" />
                    </div>
                    </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger EventName="click" ControlID="btnEnviar"/>
                                </Triggers>
                            </asp:UpdatePanel>


                </div>
                </div>

            </div>
        </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
