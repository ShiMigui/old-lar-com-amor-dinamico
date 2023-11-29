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
            if (!IsPostBack)
            {
                usuario.HeaderContent(litHeader);
                if (!usuario.Logado)
                {
                    Session["last_page"] = Request.Url.AbsoluteUri;
                    Response.Redirect("login.aspx");
                }
            }

            string a = "";
            if (String.IsNullOrEmpty(Request["a"])) Response.Redirect("forms.aspx?a=1"); //Response.Redirect("index.aspx");
            else a = Request["a"].ToString();

            Animal animal = new Animal();
            bool ic = animal.ByCode(a);
            if (!ic) Response.Redirect("index.aspx");

            Banco banco = new Banco();  

            if (usuario.IsOrg && usuario.Cd == animal.Organizacao.Cd)
            {
                string u = "", dt = "";

                if (String.IsNullOrEmpty(Request["u"])  || String.IsNullOrEmpty(Request["dt"])) Response.Redirect("index.aspx");

                u = Request["u"].ToString();
                dt = Request["dt"].ToString();
                CarregarRespostas(a, u, dt);
            }
            else
            {
                List<Parametro> parametros  = new List<Parametro>
                { 
                    new Parametro("pcd_animal", a),
                    new Parametro("pcd_adotante", usuario.Cd)
                };

                using(MySqlDataReader Data = banco.Consultar($@"VerificarRespostasUsuario", parametros))
                {
                    if (Data.HasRows)
                    {
                        litPerguntas.Text = "<p class='textCenter'>Requisição enviada</p>";
                        litMsg.Text = Elemento.Success("Requisição enviada");
                    }
                    else CarregarForms(a, usuario.Cd);
                }
            }
        }

        private void CarregarRespostas(string a, string u, string dt)
        {
            pnlOrgControll.Visible = true;
            Banco banco = new Banco();
            List<Parametro> parametros = new List<Parametro>
            { 
                new Parametro("pcd_animal", a),
                new Parametro("pcd_adotante", u),
                new Parametro("pdt_pedido", Credenciais.DateToInput(dt)),
            };
            using(MySqlDataReader Data = banco.Consultar("PegarRespostasUsuario", parametros))
            {
                while (Data.Read())
                {
                    string cd_pergunta = Data["cd_pergunta"].ToString();
                    string nm_pergunta = Data["nm_pergunta"].ToString();
                    string nm_resposta = Data["nm_resposta"].ToString();
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
                if(Data.Read())
                {
                    dt = Data["dt_pedido"].ToString().Split(' ')[0];
                }
                else
                {
                    using(MySqlDataReader Data2 = banco.Consultar("novopedido", parametros))
                    {
                        if(Data2.Read()) dt = Data2[0].ToString().Split(' ')[0];
                        else
                        {
                            litMsg.Text = Elemento.Error("Ocorreu um erro ao tentar fazer requisição!");
                            return;
                        }
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
            string u = "", dt = "", a="";

            if (String.IsNullOrEmpty(Request["u"]) || String.IsNullOrEmpty(Request["dt"]) || String.IsNullOrEmpty(Request["a"])) Response.Redirect("index.aspx");

            u = Request["u"].ToString();
            a = Request["a"].ToString();
            dt = Request["dt"].ToString();

            List<Parametro> parametros = new List<Parametro>
            {
                new Parametro("pcd_animal", a),
                new Parametro("pcd_adotante", u),
                new Parametro("pdt_pedido", Credenciais.DateToInput(dt)),
                new Parametro("pic_permitido", "TRUE"),
                new Parametro("pic_finalizado", null),
            };
            Banco banco = new Banco();
            banco.Executar("AtualizarPedido", parametros);
            litMsg.Text = Elemento.Success("Pedido aceito");
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
                new Parametro("pic_permitido", "FALSE"),
                new Parametro("pic_finalizado", "FALSE"),
            };
            Banco banco = new Banco();
            banco.Executar("AtualizarPedido", parametros);
            litMsg.Text = Elemento.Success("Pedido recusado");
        }
    }
}