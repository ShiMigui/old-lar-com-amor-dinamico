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
            Usuario.Login("1", "Ng Cachorros", "O");
            Usuario usuario = new Usuario();
            if (!IsPostBack)
            {
                usuario.HeaderContent(litHeader);
                if (!usuario.Logado || !usuario.IsOrg) Response.Redirect("index.aspx");

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

                List<string> header = new List<string> {"Adotante", "Animal", "Formulário"};
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
                                $"<a href='forms.aspx?a={cd_an}&&u={cd_ad}&&dt={dt}'>"
                            });
                        }

                        litTblPendentes.Text = Elemento.GenerateTable(header, content, "Não há pedidos pendentes");
                    }
                    else litTblPendentes.Text = "<p class='textCenter'>Não há pedidos de adoção pendentes</p>";
                }
                #endregion

                #region Tabela adoção aceita
                header.Add("Confirmar adoção");
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
                            content.Add(new List<string>
                            {
                                nm_ad,
                                $"<a href='animal.aspx?cd={cd_an}'>{nm_an}</a>",
                                $"<a href='forms.aspx?a={cd_an}&&u={cd_ad}&&dt={dt}' a='{cd_an}' u='{cd_ad}' dt='{dt}'>",
                                $@"<img src='./img/icons/confirm.png' alt='ícone de confirmara adoção' class='icon-accept-order'>
                                <img src='./img/icons/close.png' alt='ícone de confirmara adoção' class='icon-refuse-order'>"
                            });
                        }

                        litTblAceitos.Text = Elemento.GenerateTable(header, content, "Não há pedidos pendentes");
                    }
                    else litTblAceitos.Text = "<p class='textCenter'>Não há pedidos de adoção aceitos</p>";
                }
                #endregion
            }
        }
    }
}