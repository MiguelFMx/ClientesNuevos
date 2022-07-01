<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="ClientesNuevos.F14.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../Scripts/jquery-3.6.0.min.js"></script>

    <script src="JsClienteNuevo.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">.
    <div class="container">
        

            <iframe src="Secciones/InformacionCompania.html" style="width:100%; border:none; height:100%;" title="IframeComp" id="IframeComp" scrolling="no" onload="resizeIframe(this)" ></iframe>
       

        <div class="row">
            <div class="col-10"></div>
            <div class="col-2">
            <input type="button" name="btnNxt" value="Siguiente" id="btnNxt" class="btn btn-primary" style="font-size:15px;" />
                </div>
          
        </div>
    </div>

    <script type="text/javascript">

        $(document).ready(function () {

            $('#IframeComp').load(function () {
                $(this).height($(this).contents().height());
                $(this).width($(this).contents().width());
            });
           
        });

    </script>

</asp:Content>
