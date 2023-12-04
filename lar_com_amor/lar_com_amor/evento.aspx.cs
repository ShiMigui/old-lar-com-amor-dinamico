using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using lar_com_amor.classes;

namespace larcomamor
{
    public partial class Evento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            if (!IsPostBack) usuario.HeaderContent(litHeader);

            if (usuario.Sg == "O")
            {
                gerarPnlOrg();
                return;
            }
            if (string.IsNullOrEmpty(Request["cd"]))
            {
                Response.Redirect("./index.aspx");
            }
            gerarPnlUser();
        }

        protected void gerarPnlOrg()
        {
            pnlEventoDadosOrg.Visible = true;
            pnlEventoDadosUser.Visible = false;
            pnlEventoOrg.Visible = true;
            pnlEventoUser.Visible = false;

            if (String.IsNullOrEmpty(Request["cd"]))
            {

                if (!IsPostBack)
                {
                    gererDdlTipoEvento();
                    lit_foto.Text = $@"<img id='image' src='img/icons/add.png' alt='' class='eventoPhoto'>";
                }
                
            }
            else
            {
                /// Fazer verificação se o evento é daquela ong 
                /// TRocar o cd Organizacao
                String org = "1";
                Event evento = new Event();
                if(!evento.VerificarOrgEvento(Request["cd"].ToString(), org))
                {
                    ///evento user
                    
                }

                pnlBtnOrgGerenciaEvento.Visible = true;
                pnlBtnOrgAddEvento.Visible = false;

                if (!IsPostBack)
                {
                    gererDdlTipoEvento();
                    lit_foto.Text = $@"<img id='image' src='img/{Request["cd"].ToString()}.jpg' alt='' class='eventoPhoto'>";

                    /// colocar os dados aq
                    /// 

                    Event DadosEvento = evento.PegarEventoComCd(Request["cd"].ToString());

                    if (DadosEvento.nome == "")
                    {
                        Response.Redirect("./Event.aspx");
                        ///Mandar a página erro (Inesistente)
                    }
                    else
                    {
                        inpNome.Text = DadosEvento.nome;
                        inpDescricao.Value = DadosEvento.descricao.ToString();
                        DdlTipo.SelectedValue = DadosEvento.tipoEvento.ToString();

                        string dataInicial = DadosEvento.inicio.ToString("yyyy-MM-dd");
                        string hrInicial = DadosEvento.inicio.ToString("HH:mm");

                        string dataFinal = DadosEvento.final.ToString("yyy-MM-dd");
                        string hrFinal = DadosEvento.final.ToString("HH:mm");

                        TxtDtInicio.Text = dataInicial;
                        txtHrInicio.Text = hrInicial;

                        txtDataFinal.Text = dataFinal;
                        txtHrFinal.Text = hrFinal;

                    }
                }
            }
        }

        protected void gerarPnlUser()
        {
            litFotoEventoUser.Text = $@"<img src='./img/evento/{Request["cd"].ToString()}.jpg' alt='imagem promocional do evento' class='eventoPhoto'>";

            Event evento = new Event();
            evento = evento.PegarEventoComCd(Request["cd"].ToString());

            litDadosEventoUser.Text = $@"
                <div class='grid2'>
                <div class='itemForm'>
                    <label for='inpNome'>Nome</label>
                    <p>{evento.nome}</p>
                </div>
                <div class='itemForm'>
                    <label for='selTipo'>Tipo de evento</label>
                    <p>{evento.Tipo_Evento.nm}</p>
                </div>
            </div>
            <div class='grid4'>
                <div class='itemForm'>
                    <label for='inpDtInicio'>Data início</label>
                    <p>{evento.inicio.ToString("dd/MM/yyyy")}</p>
                </div>
                <div class='itemForm'>
                    <label for='inpHrInicio'>Horário início</label>
                    <p>{evento.inicio.ToString("HH:mm")}</p>
                </div>
                <div class='itemForm'>
                    <label for='inpDtFinal'>Data final</label>
                    <p>{evento.final.ToString("dd/MM/yyyy")}</p>
                </div>
                <div class='itemForm'>
                    <label for='inpHrFinal'>Horário final</label>
                    <p>{evento.final.ToString("HH:mm")}</p>
                </div>
            </div>
            <div class='itemForm'>
                <label for='inpDescricao'>Descrição</label>
                <p>{evento.descricao}</p>
            </div> 

            ";
        }

        protected void gererDdlTipoEvento()
        {
            Entidade lista = new Entidade();
            List<Entidade> tiposEventos = lista.ListarTipoEvento();
            DdlTipo.Items.Add(new ListItem("Selecione---", "0"));
            foreach (Entidade tipoEvento in tiposEventos)
            {
                DdlTipo.Items.Add(new ListItem(tipoEvento.nm, tipoEvento.cd.ToString()));
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            DateTime dataEntrada = DateTime.Now;

            #region Validação se está vazio 

            if (inpNome.Text == "")
            {
                lblResposta.Text = "prencha todos os dados";
                return;
            }
            if (inpDescricao.Value == "")
            {
                lblResposta.Text = "prencha todos os dados";
                return;
            }
            if(DdlTipo.SelectedValue == "0")
            {
                lblResposta.Text = "prencha todos os dados";
                return;
            }
            if (TxtDtInicio.Text == "")
            {
                lblResposta.Text = "prencha todos os dados";
                return;
            }
            if (txtHrInicio.Text == "")
            {
                lblResposta.Text = "prencha todos os dados";
                return;
            }
            if (txtDataFinal.Text == "")
            {
                lblResposta.Text = "prencha todos os dados";
                return;
            }
            if (txtHrFinal.Text == "")
            {
                lblResposta.Text = "prencha todos os dados";
                return;
            }

            #endregion

            #region atribuição das datas e horas
            DateTime dtInicio = DateTime.Parse(TxtDtInicio.Text.ToString());
            DateTime horaInicio = DateTime.Parse(txtHrInicio.Text.ToString());
            DateTime dataFinal = DateTime.Parse(txtDataFinal.Text.ToString());
            DateTime horaFinal = DateTime.Parse(txtHrFinal.Text.ToString());

            int anoAtual = int.Parse(dataEntrada.ToString("yyyy"));
            int mesATual = int.Parse(dataEntrada.ToString("MM"));
            int diaAtual = int.Parse(dataEntrada.ToString("dd"));
            int Hratual = int.Parse(dataEntrada.ToString("HH"));

            int ano = int.Parse(dtInicio.ToString("yyyy"));
            int mes = int.Parse(dtInicio.ToString("MM"));
            int dia = int.Parse(dtInicio.ToString("dd"));
            int HrInicio = int.Parse(horaInicio.ToString("HH"));
            int MmInicio = int.Parse(horaInicio.ToString("mm"));

            int anoFinal = int.Parse(dataFinal.ToString("yyyy"));            
            int mesFinal = int.Parse(dataFinal.ToString("MM"));            
            int diaFinal = int.Parse(dataFinal.ToString("dd"));                        
            int HrFinal = int.Parse(horaFinal.ToString("HH"));
            int MmFinal = int.Parse(horaFinal.ToString("mm"));
            #endregion

            #region Validacao da data

            if (anoAtual <= ano )
            {
                if(anoAtual == ano)
                {
                    if (mes < mesATual)
                    {
                        lblResposta.Text = "O mês não pode menor que o atual";
                        return;
                    }

                    if (mes == mesATual)
                    {
                        if (dia == diaAtual)
                        {
                            if(HrInicio < Hratual)
                            {
                                lblResposta.Text = "O horário inicial não pode menor que o atual";
                                return;
                            }
                        }
                        if (dia < diaAtual)
                        {
                            lblResposta.Text = "O dia não pode menor que o atual";
                            return;
                        }

                        
                    }

                    if (ano <= anoFinal)
                    {
                        if (anoFinal == ano)
                        {
                            if (mesFinal < mes)
                            {
                                lblResposta.Text = "O mês final não pode menor que o inicial";
                                return;
                            }

                            if (mes == mesFinal)
                            {
                                if (dia == diaFinal)
                                {
                                    if (HrInicio > HrFinal)
                                    {
                                        lblResposta.Text = "O horário final não pode menor que o inicial";
                                        return;
                                    }

                                    if(MmFinal< MmInicio)
                                    {
                                        lblResposta.Text = "O horário final (minutos) não pode menor que o inicial";
                                        return;
                                    }
                                }
                                if (diaFinal < dia)
                                {
                                    lblResposta.Text = "O dia final não pode menor que o inicial";
                                    return;
                                }
                            }
                        }
                    }


                }

                if(ano <= anoFinal)
                {
                    if (anoFinal == ano)
                    {
                        if (mesFinal < mes)
                        {
                            lblResposta.Text = "O mês final não pode menor que o inicial";
                            return;
                        }

                        if (mes == mesFinal)
                        {
                            if (dia == diaFinal)
                            {
                                if (HrInicio > HrFinal)
                                {
                                    lblResposta.Text = "O horário final não pode menor que o inicial";
                                    return;
                                }
                            }
                            if (diaFinal < dia)
                            {
                                lblResposta.Text = "O dia final não pode menor que o inicial";
                                return;
                            }

                            if (diaFinal < dia)
                            {
                                lblResposta.Text = "O dia final não pode menor que o inicial";
                                return;
                            }
                        }
                    }
                }
                else
                {
                    lblResposta.Text = "O ano final não pode menor que o inicial";
                    return;
                }
                


            }
            else
            {
                lblResposta.Text = "O ano não pode menor que o atual";
                return;
            }

            #endregion

            #region construção da data para o banco
            string dataInicialBanco = $@"{ano}-{mes}-{dia} {HrInicio}:{MmInicio}:00";
            string dataFinalBanco = $@"{anoFinal}-{mesFinal}-{diaFinal} {HrFinal}:{MmFinal}:00";
            #endregion

            ///Colocar que é da sessão
            string cd_org = "1";            

            if (foto.PostedFile != null)
            {
                string NomeOriginalArq = Path.GetFileName(foto.PostedFile.FileName);
                Event Evento = new Event();
                string NomeArq = Evento.maxCodigo(); ;


                string TipoArq = foto.PostedFile.ContentType;
                if (TipoArq != "image/jpeg")
                {
                    lblResposta.Text = "Arquivo não permitido! Somente Jpg.";
                    return;
                }
                int TamanhoArq = foto.PostedFile.ContentLength;

                if (TamanhoArq <= 0)
                    lblResposta.Text = "A tentativa de upLoad do arquivo " + NomeOriginalArq + " falhou!";
                else
                {

                    /// Mandar adiconar o evento aqui 

                    if(!Evento.NovoEvento(inpNome.Text, inpDescricao.Value, dataInicialBanco, dataFinalBanco, cd_org, DdlTipo.SelectedValue.ToString()))
                    {
                        lblResposta.Text = "Houve algum problema, estamos resolvendo";
                        return;
                    }

                    foto.PostedFile.SaveAs(Request.PhysicalApplicationPath + @"img\evento\" + NomeArq + ".jpg");
                }
            }
        }

        protected void btnUpdateEvento_Click(object sender, EventArgs e)
        {
            DateTime dataEntrada = DateTime.Now;

            #region Validação se está vazio 

            if (inpNome.Text == "")
            {
                lblResposta.Text = "prencha todos os dados";
                return;
            }
            if (inpDescricao.Value == "")
            {
                lblResposta.Text = "prencha todos os dados";
                return;
            }
            if (DdlTipo.SelectedValue == "0")
            {
                lblResposta.Text = "prencha todos os dados";
                return;
            }
            if (TxtDtInicio.Text == "")
            {
                lblResposta.Text = "prencha todos os dados";
                return;
            }
            if (txtHrInicio.Text == "")
            {
                lblResposta.Text = "prencha todos os dados";
                return;
            }
            if (txtDataFinal.Text == "")
            {
                lblResposta.Text = "prencha todos os dados";
                return;
            }
            if (txtHrFinal.Text == "")
            {
                lblResposta.Text = "prencha todos os dados";
                return;
            }

            #endregion

            #region atribuição das datas e horas
            DateTime dtInicio = DateTime.Parse(TxtDtInicio.Text.ToString());
            DateTime horaInicio = DateTime.Parse(txtHrInicio.Text.ToString());
            DateTime dataFinal = DateTime.Parse(txtDataFinal.Text.ToString());
            DateTime horaFinal = DateTime.Parse(txtHrFinal.Text.ToString());

            int anoAtual = int.Parse(dataEntrada.ToString("yyyy"));
            int mesATual = int.Parse(dataEntrada.ToString("MM"));
            int diaAtual = int.Parse(dataEntrada.ToString("dd"));
            int Hratual = int.Parse(dataEntrada.ToString("HH"));

            int ano = int.Parse(dtInicio.ToString("yyyy"));
            int mes = int.Parse(dtInicio.ToString("MM"));
            int dia = int.Parse(dtInicio.ToString("dd"));
            int HrInicio = int.Parse(horaInicio.ToString("HH"));
            int MmInicio = int.Parse(horaInicio.ToString("mm"));

            int anoFinal = int.Parse(dataFinal.ToString("yyyy"));
            int mesFinal = int.Parse(dataFinal.ToString("MM"));
            int diaFinal = int.Parse(dataFinal.ToString("dd"));
            int HrFinal = int.Parse(horaFinal.ToString("HH"));
            int MmFinal = int.Parse(horaFinal.ToString("mm"));
            #endregion

            #region Validacao da data

            if (anoAtual <= ano)
            {
                if (anoAtual == ano)
                {
                    if (mes < mesATual)
                    {
                        lblResposta.Text = "O mês não pode menor que o atual";
                        return;
                    }

                    if (mes == mesATual)
                    {
                        if (dia == diaAtual)
                        {
                            if (HrInicio < Hratual)
                            {
                                lblResposta.Text = "O horário inicial não pode menor que o atual";
                                return;
                            }
                        }
                        if (dia < diaAtual)
                        {
                            lblResposta.Text = "O dia não pode menor que o atual";
                            return;
                        }


                    }

                    if (ano <= anoFinal)
                    {
                        if (anoFinal == ano)
                        {
                            if (mesFinal < mes)
                            {
                                lblResposta.Text = "O mês final não pode menor que o inicial";
                                return;
                            }

                            if (mes == mesFinal)
                            {
                                if (dia == diaFinal)
                                {
                                    if (HrInicio > HrFinal)
                                    {
                                        lblResposta.Text = "O horário final não pode menor que o inicial";
                                        return;
                                    }

                                    if (MmFinal < MmInicio)
                                    {
                                        lblResposta.Text = "O horário final (minutos) não pode menor que o inicial";
                                        return;
                                    }
                                }
                                if (diaFinal < dia)
                                {
                                    lblResposta.Text = "O dia final não pode menor que o inicial";
                                    return;
                                }
                            }
                        }
                    }


                }

                if (ano <= anoFinal)
                {
                    if (anoFinal == ano)
                    {
                        if (mesFinal < mes)
                        {
                            lblResposta.Text = "O mês final não pode menor que o inicial";
                            return;
                        }

                        if (mes == mesFinal)
                        {
                            if (dia == diaFinal)
                            {
                                if (HrInicio > HrFinal)
                                {
                                    lblResposta.Text = "O horário final não pode menor que o inicial";
                                    return;
                                }
                            }
                            if (diaFinal < dia)
                            {
                                lblResposta.Text = "O dia final não pode menor que o inicial";
                                return;
                            }

                            if (diaFinal < dia)
                            {
                                lblResposta.Text = "O dia final não pode menor que o inicial";
                                return;
                            }
                        }
                    }
                }
                else
                {
                    lblResposta.Text = "O ano final não pode menor que o inicial";
                    return;
                }



            }
            else
            {
                lblResposta.Text = "O ano não pode menor que o atual";
                return;
            }

            #endregion

            #region construção da data para o banco
            string dataInicialBanco = $@"{ano}-{mes}-{dia} {HrInicio}:{MmInicio}:00";
            string dataFinalBanco = $@"{anoFinal}-{mesFinal}-{diaFinal} {HrFinal}:{MmFinal}:00";
            #endregion

            ///Colocar que é da sessão
            string cd_org = "1";

            if (foto.PostedFile != null)
            {
                string NomeOriginalArq = Path.GetFileName(foto.PostedFile.FileName);
                Event Evento = new Event();
                string NomeArq = Evento.maxCodigo(); ;

                string TipoArq = foto.PostedFile.ContentType;

                if (NomeOriginalArq != "")
                {
                    if (TipoArq != "image/jpeg")
                    {
                        lblResposta.Text = "Arquivo não permitido! Somente Jpg.";
                        return;
                    }
                    int TamanhoArq = foto.PostedFile.ContentLength;

                    if (TamanhoArq <= 0)
                        lblResposta.Text = "A tentativa de upLoad do arquivo " + NomeOriginalArq + " falhou!";
                    else
                    {

                        /// Mandar adiconar o evento aqui 

                        if (!Evento.NovoEvento(inpNome.Text, inpDescricao.Value, dataInicialBanco, dataFinalBanco, cd_org, DdlTipo.SelectedValue.ToString()))
                        {
                            lblResposta.Text = "Houve algum problema, estamos resolvendo";
                            return;
                        }

                        foto.PostedFile.SaveAs(Request.PhysicalApplicationPath + @"img\" + NomeArq + ".jpg");
                    }
                }
                else
                {                    
                    if (!Evento.UpdateEvento(Request["cd"].ToString(),inpNome.Text, inpDescricao.Value, dataInicialBanco, dataFinalBanco, cd_org, DdlTipo.SelectedValue.ToString()))
                    {
                        lblResposta.Text = "Houve algum problema, estamos resolvendo";
                        return;
                    }
                    else
                    {
                        ///Mandar para a index
                        Response.Redirect("./index.aspx");
                    }
                }

                
                
            }
        }

        protected void btnExcluirEvento_Click(object sender, EventArgs e)
        {
            Event evento = new Event();

            if (!evento.ExcluirEvento(Request["cd"].ToString()))
            {
                lblResposta.Text = "Não foi possivél ecluir o evento";
                return;
            }

            /// MAndar mensagem
            lblResposta.Text = "foi possivél ecluir o evento";

            return;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("./index.aspx");
        }
    }
}