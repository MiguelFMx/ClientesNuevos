﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EvaluacionSeguridad.aspx.cs" Inherits="ClientesNuevos.cliente.F5.EvaluacionSeguridadRiesgoBussinessPartner" %>
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
                                            <input type="text" class="form-control " id="txt100" />
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
                                            <input type="radio" class="form-check-input" id="si120" value="" name="radioElgible" />
                                            <label class="form-check-label" for="si120">SI</label>
                                        </div>
                                        <div class="col-auto">
                                            <input type="radio" class="form-check-input" id="NO120" value="" name="radioElgible" />
                                            <label class="form-check-label" for="NO120">NO</label>
                                        </div>
                                        <div class="col-auto">
                                            <input type="radio" class="form-check-input" id="NA120" value="" name="radioElgible" />
                                            <label class="form-check-label" for="NA120">N/A</label>
                                        </div>
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
                                            <input type="radio" class="form-check-input" id="si130" value="si" name="radioMiembro" />
                                            <label class="form-check-label" for="si130">SI</label>
                                        </div>
                                        <div class="col-auto">
                                            <input type="radio" class="form-check-input" id="NO130" value="no" name="radioMiembro" />
                                            <label class="form-check-label" for="NO130">NO</label>
                                        </div>
                                        <div class="col-auto">
                                            <input type="radio" class="form-check-input" id="NA130" value="N/A" name="radioMiembro" />
                                            <label class="form-check-label" for="NA130">N/A</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <section id="seccionSI" style="display: none; background-color: #EEE8E7;">
                                <div class="row">
                                    <div class="col-auto backgroudtag">
                                       <span>1.3.1&nbsp;&nbsp;&nbsp;</span>
                                    </div>
                                    <div class="col" style="padding-bottom:15px;">
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
                                                <input type="text" class="form-control" id="txt1311" />
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
                                                <select class="form-select" id="cb1312">
                                                    <option value="Certificado">Certificado</option>
                                                    <option value="Certificado validado">Certificado validado</option>
                                                    <option value="Certificado no validado">Certificado no validado</option>
                                                </select>
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
                                                <select id="cb1313" class="form-select">
                                                    <option value="Actualizado">Actualizado</option>
                                                    <option value="Revision">En revisión</option>
                                                </select>    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr />

                            </section>

                            <section id="seccionNO" style="display: none; background-color: #EEE8E7;">
                                <div class="row">
                                    <div class="col-auto backgroudtag">
                                       <span>1.3.2&nbsp;&nbsp;&nbsp;</span>
                                    </div>
                                    <div class="col" style="padding-bottom:15px;">
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
                                                    <input type="radio" class="form-check-input" id="si1321" value="" name="radio1321" />
                                                    <label class="form-check-label" for="si1321">SI</label>
                                                </div>
                                                <div class="col">
                                                    <input type="radio" class="form-check-input" id="NO1321" value="" name="radio1321" />
                                                    <label class="form-check-label" for="NO1321">NO</label>
                                                </div>
                                                <div class="col">
                                                    <input type="radio" class="form-check-input" id="NA1321" value="" name="radio1321" />
                                                    <label class="form-check-label" for="NA1321">N/A</label>
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
                                                    <input type="radio" class="form-check-input" id="si1322" value="" name="radio1322" />
                                                    <label class="form-check-label" for="si1322">SI</label>
                                                </div>
                                                <div class="col">
                                                    <input type="radio" class="form-check-input" id="NO1322" value="" name="radio1322" />
                                                    <label class="form-check-label" for="NO1322">NO</label>
                                                </div>
                                                <div class="col">
                                                    <input type="radio" class="form-check-input" id="NA1322" value="" name="radio1322" />
                                                    <label class="form-check-label" for="NA1322">N/A</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <hr />
                            </section>

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
                                                <input type="radio" class="form-check-input" id="si140" value="" name="radio140" />
                                                <label class="form-check-label" for="si130">SI</label>
                                            </div>
                                            <div class="col">
                                                <input type="radio" class="form-check-input" id="NO140" value="" name="radio140" />
                                                <label class="form-check-label" for="NO130">NO</label>
                                            </div>
                                            <div class="col">
                                                <input type="radio" class="form-check-input" id="NA140" value="" name="radio140" />
                                                <label class="form-check-label" for="NA130">N/A</label>
                                            </div>
                                        </div>
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
                                            <input type="radio" class="form-check-input" id="si150" value="" name="radio150" />
                                            <label class="form-check-label" for="si150">SI</label>
                                        </div>
                                        <div class="col-auto">
                                            <input type="radio" class="form-check-input" id="NO150" value="" name="radio150" />
                                            <label class="form-check-label" for="NO150">NO</label>
                                        </div>
                                        <div class="col-auto">
                                            <input type="radio" class="form-check-input" id="NA150" value="" name="radio150" />
                                            <label class="form-check-label" for="NA150">N/A</label>
                                        </div>
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
                                            <input type="radio" class="form-check-input" id="si160" value="" name="radio160" />
                                            <label class="form-check-label" for="si130">SI</label>
                                        </div>
                                        <div class="col-auto">
                                            <input type="radio" class="form-check-input" id="NO160" value="" name="radio160" />
                                            <label class="form-check-label" for="NO130">NO</label>
                                        </div>
                                        <div class="col-auto">
                                            <input type="radio" class="form-check-input" id="NA160" value="" name="radio160" />
                                            <label class="form-check-label" for="NA130">N/A</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col"></div>
            <div class="col-2">
                <button type="button" id="btnContinuar" class="btn btn-success">Siguiente <i class="bi bi-chevron-right"></i></button>
            </div>
        </div>
 

                
   </div>

    <script type="text/javascript">

        $(document).ready(function () {

            $('#btnContinuar').click(function () {
                window.location.href = 'Autoevaluacion/autoevaluacion.aspx';
                

            });

        });
        

        $('input[type=radio][name=radioMiembro]').change(function () {
            if (this.value == 'si') {
                $('#seccionSI').show('fast');
                $('#seccionNO').hide('fast');
            }
            else if (this.value == 'no' || this.value == 'N/A') {
                $('#seccionNO').show('fast');
                $('#seccionSI').hide('fast');
                
            }
        });

    </script>

</asp:Content>
