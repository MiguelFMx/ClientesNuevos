<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admint.Master" AutoEventWireup="true" CodeBehind="Directorio.aspx.cs" Inherits="ClientesNuevos.admin.consulta.Directorio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col">

        </div>
    </div>
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header cabezal">
                    <h4>Directorio</h4>
                </div>
                <div class="card-body">
                    <table id="tDirectorio" class="table table-hover">
                        <thead>
                            <tr>
                                <th>RFC</th>
                                <th>Socio comercial</th>
                                <th>Nombre</th>
                                <th>Puesto</th>
                                <th>Correo</th>
                                <th>Telefono</th>
                                <th>Ext</th>
                                <th>Celular</th>
                                <th>Tipo</th>
                                <th>Accion</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
       
    </div>
     <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header cabezal">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Nuevo correo</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="mb-3">
            <label for="txtCorreo" class="col-form-label">Para:</label>
            <input type="text" class="form-control" id="txtCorreo">
          </div>
           <div class="mb-3">
            <label for="txtAsunto" class="col-form-label">Asunto:</label>
            <input type="text" class="form-control" id="txtAsunto">
          </div>
          <div class="mb-3">
            <label for="txtCuerpo" class="col-form-label">Mensaje:</label>
            <textarea class="form-control" id="txtCuerpo"></textarea>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">cancelar</button>
        <button type="button" class="btn btn-primary">enviar correo</button>
      </div>
    </div>
  </div>
</div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../../Scripts/bootstrap.bundle.min.js"></script>
    <script src="../../Scripts/umd/popper.min.js"></script>
    <script src="../../Scripts/DataTables/datatables.min.js"></script>
    <script src="../template/vendors/nprogress/nprogress.js"></script>
    <script src="../template/asset/JS/DorectorioJS.js"></script>
</asp:Content>
