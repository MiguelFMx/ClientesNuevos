﻿<%@ Page Title="Configuracion" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="user_config.aspx.cs" Inherits="ClientesNuevos.usuario.user_config" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="height: 70vh;">
        <%-- ======================Idioma========================================== --%>
        <div class="row">
            <div class="col">
                <asp:Label ID="lblIdioma" runat="server" Text="<%$Resources:config,lblIdioma %>" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddIdioma" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddIdioma_SelectedIndexChanged" Width="25%" AutoPostBack="True">
                    <asp:ListItem Text="<%$Resources:config, lblSpanish %>" Value="es-MX" />
                    <asp:ListItem Text="<%$Resources:config,lblEnglish %>" Value="en-US" />
                </asp:DropDownList>
                <br />
                <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary btn-sm" OnClick="btnGuardar_Click" Text="<%$Resources: config, lblGuardarCambio %>" />
            </div>
        </div>
        <%-- ===================== Cambio de contraseña  ====================== --%>
        <div class="row w-25 mt-4">
            <div class="col">
                <asp:HiddenField ID="hfID" runat="server" />
                <asp:ChangePassword ID="CambiarPass" runat="server" SuccessPageUrl="~/login.aspx?pass=success"
                    PasswordHintText="La contraseña debe tener al entre 8 y 16 caracteres, al menos un dígito, al menos una minúscula, al menos una mayúscula y al menos un caracter especial."
                    NewPasswordRegularExpression="^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{7,16}$"
                    NewPasswordRegularExpressionErrorMessage="Error: Su contraseña debe de tener entre 7 y 16 caracteres, y contener al menos una mayúscula, al menos un caracter especial y un dígito." OnChangingPassword="CambiarPass_ChangingPassword" OnContinueButtonClick="CambiarPass_ContinueButtonClick" ContinueDestinationPageUrl="~/login.aspx?pass=success" OnChangedPassword="CambiarPass_ChangedPassword">

                    <ChangePasswordTemplate>
                        <span>
                            <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:config, lblCambiarContra %>"></asp:Literal></span><br />
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="CurrentPassword" ID="CurrentPasswordLabel" CssClass="form-label" Text="<%$Resources: config, lblCurrent %>"></asp:Label>
                            <asp:TextBox runat="server" TextMode="Password" ID="CurrentPassword" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword" ErrorMessage="La contrase&#241;a es obligatoria." ValidationGroup="CambiarPass" ToolTip="La contrase&#241;a es obligatoria." ID="CurrentPasswordRequired">*</asp:RequiredFieldValidator>

                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" CssClass="form-label" AssociatedControlID="NewPassword" ID="NewPasswordLabel" Text="<%$Resources: config,lblNew %>"></asp:Label>
                            <asp:TextBox runat="server" TextMode="Password" ID="NewPassword" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword" ErrorMessage="La nueva contrase&#241;a es obligatoria." ValidationGroup="CambiarPass" ToolTip="La nueva contrase&#241;a es obligatoria." ID="NewPasswordRequired">*</asp:RequiredFieldValidator>

                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="ConfirmNewPassword" ID="ConfirmNewPasswordLabel" CssClass="form-label" Text="<%$Resources:config, lblConfirm %>"></asp:Label>
                            <asp:TextBox runat="server" TextMode="Password" ID="ConfirmNewPassword" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword" ErrorMessage="Confirmar la nueva contrase&#241;a es obligatorio." ValidationGroup="CambiarPass" ToolTip="Confirmar la nueva contrase&#241;a es obligatorio." ID="ConfirmNewPasswordRequired">*</asp:RequiredFieldValidator>

                        </div>
                        <div class="form-group">
                            <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" ErrorMessage="Confirmar la nueva contrase&#241;a debe coincidir con la entrada Nueva contrase&#241;a." Display="Dynamic" ValidationGroup="CambiarPass" ID="NewPasswordCompare"></asp:CompareValidator>
                            <asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>

                        </div>
                        <div class="form-group">
                            <asp:Button runat="server" CommandName="ChangePassword" Text="<%$Resources:config,lblCambiarBtn %>" ValidationGroup="CambiarPass" ID="ChangePasswordPushButton" CssClass="btn btn-primary btn-sm"></asp:Button>
                            <asp:Button runat="server" CausesValidation="False" CommandName="Cancel" Text="<%$Resources: config, lblCancelarBtn %>" ID="CancelPushButton" CssClass="btn btn-secondary btn-sm" OnClick="CancelPushButton_Click" ></asp:Button>

                        </div>

                    </ChangePasswordTemplate>


                    <SuccessTemplate>
                        <span>Cambio de contraseña completado</span>
                        <span>Se ha cambiado su contraseña</span>
                        <asp:Button ID="ContinuePushButton" runat="server" CausesValidation="False" CommandName="Continue" Text="Continuar" CssClass="btn btn-success"  />
                    </SuccessTemplate>


                </asp:ChangePassword>
                <asp:Label ID="lblPass" runat="server" Text=""></asp:Label>

            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
