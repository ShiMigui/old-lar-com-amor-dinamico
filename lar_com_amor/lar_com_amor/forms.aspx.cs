using lar_com_amor.classes;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lar_com_amor
{
    public partial class forms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            usuario.VerificarLogin();
            if (!IsPostBack)
            {
                usuario.HeaderContent(litHeader);
                if (!usuario.Logado)
                {
                    Session["last_page"] = Request.Url.AbsoluteUri;
                    Response.Redirect("login.aspx");
                }
            }

            string a = "", u = "", dt = "";
            if (String.IsNullOrEmpty(Request["a"])) Response.Redirect("index.aspx");
            else a = Request["a"].ToString();

            if (!String.IsNullOrEmpty(Request["u"])) u = Request["u"].ToString();
            if (!String.IsNullOrEmpty(Request["dt"])) dt = Request["dt"].ToString();

            Animal animal = new Animal();
            bool ic = animal.ByCode(a);
            if (!ic) Response.Redirect("index.aspx");

            Banco banco = new Banco();

            if (usuario.IsOrg && usuario.Cd == animal.Organizacao.Cd)
            {
                if (String.IsNullOrEmpty(Request["u"]) || String.IsNullOrEmpty(Request["dt"])) Response.Redirect("index.aspx");

                u = Request["u"].ToString();
                dt = Request["dt"].ToString();
                CarregarRespostas(a, u, dt);
            }
            else if (!usuario.IsOrg)
            {
                List<Parametro> parametros = new List<Parametro>
                {
                    new Parametro("pcd_animal", a),
                    new Parametro("pcd_adotante", usuario.Cd)
                };
                if (!String.IsNullOrEmpty(Request["q"]))
                {
                    perguntas.Visible = false;
                    pnlView.Visible = true;
                    litFotoAnimal.Text = Elemento.FotoAnuncioAnimal(a, animal.Nm);
                    using(MySqlDataReader data = banco.Consultar("SituacaoPedido", parametros))
                    {
                        if (data.Read())
                        {
                            string nm_animal = data["nm_animal"].ToString();
                            string nm_usuario = data["nm_usuario"].ToString();
                            string ic_permitido = data["ic_permitido"].ToString().ToLower();
                            string ic_finalizado = data["ic_finalizado"].ToString().ToLower();
                            string situacao;

                            if (ic_finalizado == "false") situacao = "Não adotado";
                            else if (ic_finalizado == "true") situacao = "Adotado";
                            else
                            {
                                if (ic_permitido == "false") situacao = "Formulário aceito";
                                else if (ic_permitido == "true") situacao = "Formulário recusado";
                                else situacao = "Em análise pela organização";
                            }

                            litNomeAdotante.Text = nm_usuario;
                            litSituacao.Text = situacao;
                            litDataAdocao.Text = dt;
                        }
                        else Response.Redirect("index.aspx");
                    }
                }
                else
                {
                    using (MySqlDataReader Data = banco.Consultar("VerificarRespostasUsuario", parametros))
                    {
                        if (Data.HasRows)
                        {
                            Response.Redirect("perfil.aspx?tab=pedidos");
                        }
                        else CarregarForms(a, usuario.Cd);
                    }
                }
            }
            else Response.Redirect("index.aspx");
        }

        private void CarregarRespostas(string a, string u, string dt)
        {
            
            Banco banco = new Banco();
            List<Parametro> parametros = new List<Parametro>
            {
                new Parametro("pcd_animal", a),
                new Parametro("pcd_adotante", u),
                new Parametro("pdt_pedido", Credenciais.DateToInput(dt)),
            };
            using (MySqlDataReader Data = banco.Consultar("PegarRespostasUsuario", parametros))
            {
                while (Data.Read())
                {
                    string cd_pergunta = Data["cd_pergunta"].ToString();
                    string nm_pergunta = Data["nm_pergunta"].ToString();
                    string nm_resposta = Data["nm_resposta"].ToString();
                    if (Data["ic_permitido"].ToString() == "") pnlOrgControll.Visible = true;
                    litPerguntas.Text += Elemento.PerguntaFormularioUser(cd_pergunta, nm_pergunta, nm_resposta, true);
                }
            }
        }

        private void CarregarForms(string a, string u)
        {
            btnEnviar.Visible = true;
            Banco banco = new Banco();
            string dt = "";
            List<Parametro> parametros = new List<Parametro>
            { new Parametro("pcd_animal", a), new Parametro("pcd_adotante", u) };
            using (MySqlDataReader Data = banco.Consultar($"SELECT dt_pedido FROM pedido WHERE cd_adotante = {u} AND cd_animal = {a} AND ic_permitido IS NULL AND ic_finalizado IS NULL"))
            {
                if (Data.Read())
                {
                    dt = Data["dt_pedido"].ToString().Split(' ')[0];
                }
                else
                {
                    try
                    {
                        using (MySqlDataReader Data2 = banco.Consultar("novopedido", parametros))
                        {
                            if (Data2.Read()) dt = Data2[0].ToString().Split(' ')[0];
                            else
                            {
                                litMsg.Text = Elemento.Error("Ocorreu um erro ao tentar fazer requisição!");
                                return;
                            }
                        }
                    }
                    catch
                    {
                        Response.Redirect("perfil.aspx?tab=pedidos");
                    }
                }
            }

            parametros = new List<Parametro>
            { new Parametro("pcd_animal", a) };
            using (MySqlDataReader Data = banco.Consultar("PegarPerguntasByAnimal", parametros))
            {
                if (!Data.HasRows)
                {
                    litPerguntas.Text = "<p class='textCenter'>Formulário não tem perguntas</p>";
                    return;
                }

                while (Data.Read()) litPerguntas.Text += Elemento.PerguntaFormularioUser(Data["cd_pergunta"].ToString(), Data["nm_pergunta"].ToString(), "");
            }
            litPerguntas.Text += $@"<script>
                const cd_animal = {a};    
                const cd_adotante = {u};    
                const dt_pedido = '{dt}';   
            </script>
            <script src='./script/forms-user.js'></script>";
        }

        protected void btnAceitar_Click(object sender, EventArgs e)
        {
            string u = "", dt = "", a = "";

            if (String.IsNullOrEmpty(Request["u"]) || String.IsNullOrEmpty(Request["dt"]) || String.IsNullOrEmpty(Request["a"])) Response.Redirect("index.aspx");

            u = Request["u"].ToString(); // cd_adotante
            a = Request["a"].ToString();
            dt = Request["dt"].ToString();

            Banco banco = new Banco();

            #region Verfificando se animal foi adotado
            using (MySqlDataReader data = banco.Consultar($@"select a.nm_animal from animal a JOIN pedido p ON p.cd_animal = a.cd_animal WHERE a.cd_animal = {a} AND p.ic_finalizado IS TRUE;"))
            {
                if (data.Read())
                {
                    litMsg.Text = Elemento.Error("Animal já foi adotado!");
                    return;
                }
            }
            #endregion

            List<Parametro> parametros = new List<Parametro>
            {
                new Parametro("pcd_animal", a),
                new Parametro("pcd_adotante", u)
            };

            #region Mandando e-mail para adotante
            try
            {
                using (MySqlDataReader data = banco.Consultar("InfosPedidoAceito", parametros))
                {
                    if (data.Read())
                    {
                        string u_mail = data["mail_user"].ToString();
                        string o_mail = data["mail_org"].ToString();
                        string o_tel = data["tel_org"].ToString();
                        string nm_animal = data["nm_animal"].ToString();
                        string nm_user = data["nm_user"].ToString();
                        string nm_org = data["nm_org"].ToString();

                        string content = $@"<h1>Parabéns {nm_user}!</h1>
                    <p><b>{nm_org}</b> aceitou seu pedido por {nm_animal}</p>
                    <h2>Formas de contato:</h2>
                    <p>Email -> {o_mail}</p>
                    <p>Telefone -> {o_tel}</p>";
                        Email.EnviarEmail(u_mail, content, "Parabéns pelo novo bichinho!");
                    }
                }
            }
            catch (Exception ex)
            {
                litMsg.Text = Elemento.Error(ex.Message);
                return;
            }
            #endregion

            #region Finalizando pedidos deste animal
            banco.Executar("FinalizarPedidos", parametros);
            #endregion
            Response.Redirect("dashboard.aspx");
        }

        protected void btnRecusar_Click(object sender, EventArgs e)
        {
            string u = "", dt = "", a = "";

            if (String.IsNullOrEmpty(Request["u"]) || String.IsNullOrEmpty(Request["dt"]) || String.IsNullOrEmpty(Request["a"])) Response.Redirect("index.aspx");

            u = Request["u"].ToString();
            a = Request["a"].ToString();
            dt = Request["dt"].ToString();

            List<Parametro> parametros = new List<Parametro>
            {
                new Parametro("pcd_animal", a),
                new Parametro("pcd_adotante", u),
                new Parametro("pdt_pedido", Credenciais.DateToInput(dt)),
                new Parametro("pic_permitido", "0"),
                new Parametro("pic_finalizado", "0"),
            };
            Banco banco = new Banco();
            banco.Executar("AtualizarPedido", parametros);
            Response.Redirect("index.aspx");
        }
    }
}