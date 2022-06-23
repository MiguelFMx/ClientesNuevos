<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="ClientesNuevos.F14.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../Scripts/jquery-3.6.0.min.js"></script>

    <script src="JsClienteNuevo.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">.
    <div class="container">
        

            <iframe src="Secciones/InformacionCompania.html" style="width:100%; border:none; height:100%; " title="IframeComp" id="IframeComp" scrolling="no" onload="resizeIframe(this)" ></iframe>


        <div class="row">
            <div class="col">
            <input type="button" name="btnNxt" value="Siguiente" id="btnNxt" />
                </div>
            <div class="col">
            <input type="button" name="btnNxt" value="Prueba" id="btnPrueba" />
                </div>
        </div>
    </div>

    <script type="text/javascript">

        $(document).ready(function () {
           

           
        });

        function resizeIframe(obj) {
            obj.style.height = obj.contentWindow.document.documentElement.scrollHeight + 'px';
        }
    </script>

</asp:Content>
