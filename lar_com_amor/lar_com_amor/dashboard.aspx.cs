using lar_com_amor.classes;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lar_com_amor.build
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();

            List<Parametro> Tabs = new List<Parametro>
            {
                new Parametro("Informações", "infos"),
                new Parametro("Histórico", "history"),
                new Parametro("Formulário", "forms"),
            };
            litTabs.Text = Elemento.tabList(Tabs, $"dashboard.aspx?");

            if (!IsPostBack)
            {
                usuario.HeaderContent(litHeader);
                if (!usuario.Logado || !usuario.IsOrg) Response.Redirect("index.aspx");

                string tab = "infos";
                if (!String.IsNullOrEmpty(Request["tab"])) tab = Request["tab"].ToString();

                if (tab == "infos")
                {
                    pnlInfos.Visible = true;
                    #region Carregando informações
                    using (MySqlDataReader Data = usuario.GetDashboardData(usuario.Cd))
                    {
                        if (Data.Read())
                        {
                            litTtalAnimais.Text = Data["total_animais"].ToString();
                            litAdotados.Text = Data["animais_adotados"].ToString();
                            litPedidosNovos.Text = Data["pedidos_pendentes"].ToString();
                            litPermitidosPendentes.Text = Data["pedidos_permitidos"].ToString();
                            litPedidosFinalizados.Text = Data["pedidos_finalizados"].ToString();
                        }
                    }
                    #endregion

                    #region Preparando variáveis
                    List<Parametro> parametros = new List<Parametro>
                    {
                        new Parametro("pcd_organizacao", usuario.Cd),
                        new Parametro("poffset", "0")
                    };
                    Banco banco = new Banco();
                    List<string> header = new List<string> { "Adotante", "Animal", "Formulário" };
                    #endregion

                    #region Tabela adoção pendente
                    using (MySqlDataReader Data = banco.Consultar("TabPedidosPendentes", parametros))
                    {
                        if (Data.HasRows)
                        {
                            List<List<string>> content = new List<List<string>>();
                            while (Data.Read())
                            {
                                string nm_ad = Data["nm_adotante"].ToString();
                                string cd_ad = Data["cd_adotante"].ToString();
                                string nm_an = Data["nm_animal"].ToString();
                                string cd_an = Data["cd_animal"].ToString();
                                string dt = Data["dt_pedido"].ToString().Split(' ')[0];
                                content.Add(new List<string>
                            {
                                nm_ad,
                                $"<a href='animal.aspx?cd={cd_an}'>{nm_an}</a>",
                                $"<a href='forms.aspx?a={cd_an}&&u={cd_ad}&&dt={dt}'><b>Ver respostas</b></a>"
                            });
                            }

                            litTblPendentes.Text = Elemento.GenerateTable(header, content, "Não há pedidos pendentes");
                        }
                        else litTblPendentes.Text = "<p class='textCenter'>Não há pedidos de adoção pendentes</p>";
                    }
                    #endregion

                    #region Tabela adoção aceita
                    header.Add("Finalizar adoção");
                    using (MySqlDataReader Data = banco.Consultar("TabPedidosAceitos", parametros))
                    {
                        if (Data.HasRows)
                        {
                            List<List<string>> content = new List<List<string>>();
                            while (Data.Read())
                            {
                                string nm_ad = Data["nm_adotante"].ToString();
                                string cd_ad = Data["cd_adotante"].ToString();
                                string nm_an = Data["nm_animal"].ToString();
                                string cd_an = Data["cd_animal"].ToString();
                                string dt = Data["dt_pedido"].ToString().Split(' ')[0];
                                string p = $" a='{cd_an}' u='{cd_ad}' dt='{dt}'";
                                content.Add(new List<string>
                            {
                                nm_ad,
                                $"<a href='animal.aspx?cd={cd_an}'>{nm_an}</a>",
                                $"<a href='forms.aspx?a={cd_an}&&u={cd_ad}&&dt={dt}'><b>Ver respostas</b></a>",
                                $@"<img src='./img/icons/confirm.png' alt='ícone de confirmar a adoção' {p} class='icon-accept-order'>
                                <img src='./img/icons/close.png' alt='ícone de confirmara adoção' {p} class='icon-refuse-order'>"
                            });
                            }

                            litTblAceitos.Text = Elemento.GenerateTable(header, content, "Não há pedidos pendentes");
                        }
                        else litTblAceitos.Text = "<p class='textCenter'>Não há pedidos de adoção aceitos</p>";
                    }
                    #endregion
                }
                else if (tab == "history")
                {
                    pnlHistory.Visible = true;

                    #region Preparando variáveis
                    List<Parametro> parametros = new List<Parametro>
                    { 
                        new Parametro("pcd_organizacao", usuario.Cd),
                        new Parametro("poffset", "0"),
                    };

                    Banco banco = new Banco();
                    List<string> header = new List<string> { "Adotante", "Animal", "Formulário", "Permitido", "Finalizado" };
                    #endregion

                    #region Gerando histórico
                    using (MySqlDataReader Data = banco.Consultar("TabHistoricoPedidos", parametros))
                    {
                        if (Data.HasRows)
                        {
                            List<List<string>> content = new List<List<string>>();
                            while (Data.Read())
                            {
                                string nm_ad = Data["nm_adotante"].ToString();
                                string cd_ad = Data["cd_adotante"].ToString();
                                string nm_an = Data["nm_animal"].ToString();
                                string cd_an = Data["cd_animal"].ToString();
                                string dt = Data["dt_pedido"].ToString().Split(' ')[0];
                                bool permitido = Data["ic_permitido"].ToString() == "true";
                                bool finalizado = Data["ic_finalizado"].ToString() == "true";
                                content.Add(new List<string>
                                {
                                    nm_ad,
                                    $"<a href='animal.aspx?cd={cd_an}'>{nm_an}</a>",
                                    $"<a href='forms.aspx?a={cd_an}&&u={cd_ad}&&dt={dt}'><b>Ver respostas</b></a>",
                                    permitido?"Sim":"Não",
                                    finalizado?"Sim":"Não",
                                });
                            }

                            litTblHistory.Text = Elemento.GenerateTable(header, content, "Não há pedidos finalizados");
                        }
                        else litTblHistory.Text = "<p class='textCenter'>Não há pedidos finalizados</p>";
                    }
                    #endregion
                }
                else Response.Redirect("dashboard.aspx");

            }
        }
    }
}