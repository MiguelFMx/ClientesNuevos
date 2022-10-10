<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="user_config.aspx.cs" Inherits="ClientesNuevos.usuario.user_config" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <%-- ======================Idioma========================================== --%>
        <div class="row">
            <div class="col">
                <asp:Label ID="lblIdioma" runat="server" Text="Idioma" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddIdioma" runat="server" CssClass="form-select" Width="10%">
                    <asp:ListItem Text="Español"  Value="Es"/>
                    <asp:ListItem Text="English" Value="En"/>
                </asp:DropDownList>
            </div>
        </div>
        <%-- ===================== Informacion de usuario   ====================== --%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
</asp:Content>
