<%@ Page Title="Reportes" Language="C#" MasterPageFile="~/admin/Admint.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="ClientesNuevos.admin.Reportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .stat {
            align-items: center;
            background: #d3e2f7;
            border-radius: 50%;
            display: flex;
            height: 40px;
            justify-content: center;
            width: 40px;
        }

        .redondo {
            border-radius: 50%;
        }

        .stat2 {
        }

        .icon-shape {
            width: 48px;
            height: 48px;
            background-position: 50%;
            border-radius: 0.75rem;
            font-size: 33px;
            color: white;
        }

        .icon-shape2 {
            width: 38px;
            height: 38px;
            background-position: 50%;
            border-radius: 0.75rem;
            font-size: 27px;
            color: white;
        }

        .bg-gradient-primary {
            background-image: linear-gradient(310deg,#09b51e,#55e767);
        }

        .bg-gradient-danger {
            background-image: linear-gradient(310deg,#ff0000,#fb4b4b);
        }

        .bg-gradient-warning {
            background-image: linear-gradient(310deg,#afc110,#fbf74b);
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <!--Clientes activos -->
        <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
            <div class="card rounded-4 shadow h-100">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <div class="number">
                                <p class="text-sm-right mb-0 text-uppercase font-weight-bold">
                                    Clientes/Proveedores activos
                                </p>
                                <br />
                                <h5 class="font-weight-bolder">
                                    <asp:Label ID="lblActivos" runat="server" Text="0"></asp:Label>
                                </h5>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="icon icon-shape bg-gradient-primary text-center rounded-circle ">
                                <i class="bi bi-person-check"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <asp:HyperLink ID="hlClientesA" NavigateUrl="~/admin/consulta/consulta.aspx?type=3" CssClass="btn btn-secondary btn-sm" runat="server">Detalles</asp:HyperLink>
                </div>
            </div>
        </div>
        <!--Clientes inactivos -->
        <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
            <div class="card rounded-4 shadow">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <div class="number">
                                <p class="text-sm-right mb-0 text-uppercase font-weight-bold">
                                    Clientes/proveedores inactivos
                                </p>
                                <br />
                                <h5 class="font-weight-bolder">
                                    <asp:Label ID="lblInactivos" runat="server" Text="0"></asp:Label>
                                </h5>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="icon icon-shape bg-gradient-danger text-center rounded-circle">
                                <i class="bi bi-person-x"></i>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <asp:HyperLink ID="hlClientesI" NavigateUrl="~/admin/consulta/consulta.aspx?type=4" CssClass="btn btn-secondary btn-sm" runat="server">Detalles</asp:HyperLink>
                </div>
            </div>
        </div>
        <div class="col-xl-4 col-sm-6 mb-xl-0 mb-4">
            <div class="card rounded-4 shadow">
                <div class="card-body">
                    <div class="row">
                        <div class="col-8">
                            <div class="number">
                                <p class="text-sm-right mb-0 text-uppercase font-weight-bold">
                                    Directorio
                                </p>
                                <br />
                                <h5 class="font-weight-bolder">
                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                </h5>
                               
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="icon icon-shape bg-gradient-warning text-center rounded-circle">
                                <i class="bi bi-book"></i>
                            </div>
                        </div>
                    </div>
                    <br />
                </div>
                <div class="card-footer">
                    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/admin/consulta/Directorio.aspx" CssClass="btn btn-secondary btn-sm" runat="server">Ver</asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col">
            <div class="card shadow rounded-4">
                <div class="card-body">
                    <div class="row">
                        <div class="col">
                            <div class="card rounded-4">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-8">

                                            <p class="text-sm-right mb-0 text-uppercase font-weight-bold">
                                                Clientes sin actualizar opinion positiva                                                    
                                            </p>
                                            <br />
                                            <h5 class="font-weight-bolder">
                                                <asp:Label ID="lblOP" runat="server" Text="0"></asp:Label>

                                            </h5>
                                        </div>
                                        <div class="col-4 d-flex justify-content-end">
                                            <div class="icon icon-shape2 bg-gradient-warning text-center rounded-circle ">
                                                <i class="bi bi-exclamation-circle"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer d-flex justify-content-end">
                                    <asp:HyperLink ID="hlActOP" NavigateUrl="~/admin/consulta/consulta.aspx?type=5" CssClass="btn btn-secondary btn-sm me-1" runat="server">Detalles</asp:HyperLink>
                                    <asp:Button ID="btnAviso" CssClass="btn btn-primary btn-sm"  runat="server" OnClientClick="return false;" Text="Crear aviso" data-bs-toggle="modal" data-bs-target="#EmailModal" />

                                    <%--<asp:Button ID="btnDetSin" runat="server" Text="Detalles" CssClass="btn btn-secondary btn-sm" />--%>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <%--  --%>
                            <div class="card h-100 rounded-4">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-8">

                                            <p class="text-sm-right mb-0 text-uppercase font-weight-bold">
                                                Clientes sin entregar opinion positiva                                                    
                                            </p>
                                            <br />
                                            <h5 class="font-weight-bolder">
                                                <asp:Label ID="lblSinOP" runat="server" Text="0"></asp:Label>

                                            </h5>
                                        </div>
                                        <div class="col-4 d-flex justify-content-end">
                                            <div class="icon icon-shape2 bg-gradient-danger text-center rounded-circle ">
                                                <i class="bi bi-file-earmark-excel"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer d-flex justify-content-end">
                                    <asp:HyperLink ID="hlSinOP" NavigateUrl="~/admin/consulta/consulta.aspx?type=6" CssClass="btn btn-secondary btn-sm me-1" runat="server">Detalles</asp:HyperLink>
                                    <button id="btnSInOp" type="button" class="btn btn-primary btn-sm"  data-bs-toggle="modal" data-bs-target="#EmailSinOPModal">Crear solicitud
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div> 

                </div>
            </div>
        </div>
    </div>
    <!-- ==================Modal======================= -->
    <div class="modal fade" id="EmailModal" tabindex="-1" aria-labelledby="EmailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title fs-5" id="EmailModalLabel">Enviar aviso</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="row">
              <div class="col-7">                     
                  <div class="card">
                      <div class="card-body">
                          <div class="table-responsive">
                                <table id="tCorreos" class="table table-hover"> 
                                    <thead>                                        
                                        <tr>
                                            <th>Correo</th>

                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="col-5">
                  <div class="form-group">
                      <asp:Label ID="lblASunto" runat="server" Text="Asunto" CssClass="form-label">
                      </asp:Label><asp:TextBox ID="txtAsunto" runat="server" CssClass="form-control" Text="Actualización de opinion positiva"></asp:TextBox>
                  </div>
                  <div class="form-group">
                      <asp:Label ID="lblMensaje" runat="server" Text="Mensaje"></asp:Label>
                      <asp:TextBox ID="txtMensaje" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="10" 
                          Text="Mensaje para solicitar la actualizacion de opinion positiva"
                          ></asp:TextBox>
                  </div>
              </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Cancelar</button>
        <button type="button" id="btnEnviarCorreo" class="btn btn-primary btn-sm">Enviar correos</button>
      </div>
    </div>
  </div>
</div>

  <!-- ==================Modal======================= -->
    <div class="modal fade" id="EmailSinOPModal" tabindex="-1" aria-labelledby="EmailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title fs-5" id="EmailSInOPModalLabel">Enviar aviso</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="row">
              <div class="col-7">                     
                  <div class="card">
                      <div class="card-body">
                          <div class="table-responsive">
                                <table id="tCorreosSinOP" class="table table-hover"> 
                                    <thead>                                        
                                        <tr>
                                            <th>Correo</th>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                          </div>
                      </div>
                  </div>
              </div>
              <div class="col-5">
                  <div class="form-group">
                      <asp:Label ID="Label2" runat="server" Text="Asunto" CssClass="form-label">
                      </asp:Label><asp:TextBox ID="txtAsuntoSinOP" runat="server" CssClass="form-control" Text="Solicitud de opinion positiva"></asp:TextBox>
                  </div>
                  <div class="form-group">
                      <asp:Label ID="Label3" runat="server" Text="Mensaje"></asp:Label>
                      <asp:TextBox ID="txtBodySinOP" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="10" 
                          Text="Mensaje para solicitar que se suba la opinion positiva"
                          ></asp:TextBox>
                  </div>
              </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Cancelar</button>
        <button type="button" id="btnEnviarCorreoSinOP" class="btn btn-primary btn-sm">Enviar correos</button>
      </div>
    </div>
  </div>
</div>





</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptsContent" runat="server">
    <script src="../Scripts/jquery-3.6.0.min.js"></script>
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
    <script src="../Scripts/DataTables/datatables.min.js"></script>
    <script src="../Scripts/sweetalert2.all.min.js"></script>
    <script src="template/asset/JS/ReportesJS.js"></script>
</asp:Content>
