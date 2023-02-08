<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ClientesNuevos.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>


    <!-- Favicons -->
    <link href="admin/template/assets/img/favicon.png" rel="icon" />
    <link href="admin/template/assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet" />
         -->
    <!-- Vendor CSS Files -->
    <link href="template/assets/css/style.css" rel="stylesheet" />

    <!-- Bootstrap -->
    <%--<link href="template/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />--%>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="template/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />


    <!-- Font Awesome -->
    <link href="admin/template/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet" />


    <link href="template/assets/css/login/style.css" rel="stylesheet" />
    <link href="admin/template/vendors/nprogress/nprogress.css" rel="stylesheet" />

    <link href="Content/sweetalert2.min.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <section>
            <div class="container">
                <asp:Panel ID="Password" Visible="false" runat="server" CssClass="d-flex justify-content-center" >
                    <div class="alert alert-success alert-dismissible fade show shadow position-fixed" role="alert" style="z-index:100; top:0%">
                        <strong><i class="bi bi-check-circle-fill"></i> Cambio de contraseña!</strong> Inicia sesión nuevamente.
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </asp:Panel>

                <div class="row justify-content-center mt-5">
                    <div class="col-md-12 col-lg-10">
                        <div class="wrap d-md-flex">
                            <div class="img" style="background-image: url(template/assets/img/logo/Tractor.jpg);">
                            </div>
                            <div class="login-wrap p-4 p-md-5">
                                <div class="d-flex">
                                    <div class="w-100">
                                        <div style="display: flex; justify-content: center">
                                            <img src="template/assets/img/logo/Hungaros.png" width="60%" height="100%" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mb-3">
                                    <asp:Label ID="lbluser" runat="server" Text="User" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" placeholder="user"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUser" ErrorMessage="*Este campo es requerido" ForeColor="Red" ValidationGroup="Login1" ToolTip="El nombre de usuario es obligatorio." ID="UserNameRequired"></asp:RequiredFieldValidator>


                                </div>
                                <div class="form-group mb-3">
                                    <asp:Label ID="lblPass" runat="server" Text="Password" CssClass="form-label"></asp:Label>
                                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="form-control" placeholder="password"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPass" ErrorMessage="*Este campo es requerido" ForeColor="Red" ValidationGroup="Login1" ToolTip="La contrase&#241;a es obligatoria." ID="PasswordRequired"></asp:RequiredFieldValidator>
                                    <br />

                                    <asp:Label ID="lbltest" runat="server" Text="" ForeColor="#ff0000"></asp:Label>
                                </div>
                                <div class="form-group" style="color: red;">
                                    <asp:Literal runat="server" ID="FailureText" EnableViewState="False"></asp:Literal>
                                </div>

                                <div class="form-group">
                                    <asp:Button ID="btnLogin" runat="server" Text="Iniciar sesion" CssClass="form-control btn btn-primary rounded submit px-3" OnClick="btnLogin_Click" />
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="w-50 text-left">
                                        <asp:CheckBox runat="server" Text="&nbsp;Recuerdame" ID="RememberMe" CssClass="checkbox-primary mb-0"></asp:CheckBox>

                                    </div>
                                    <div class="w-50 text-md-right">
                                        <a href="#" id="btnPasswordOlvidado" hidden>Olvidé la contraseña</a>
                                        <asp:LinkButton ID="btnPasswordOlvidado1" runat="server" OnClientClick="return false;" >Olvidé la contraseña</asp:LinkButton>
                                    </div>
                                </div>
                                <div>
                                    <asp:Button ID="btnPrueba" runat="server" Text="prueba" CssClass="btn btn-outline-secondary" OnClick="btnPrueba_Click" Visible="false" />
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>
    <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <script src="admin/template/vendors/nprogress/nprogress.js"></script>
    <script src="Scripts/sweetalert2.all.min.js"></script>
    <script src="template/assets/js/loginJS.js"></script>
    
</body>
</html>

