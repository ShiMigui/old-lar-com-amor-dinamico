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
            Usuario.Login("1", "Miguel", "A");
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

            if (usuario.IsOrg)
            {

            }
            else
            {
                Banco banco = new Banco();
                List<Parametro> parametros  = new List<Parametro>
                { 
                    new Parametro("pcd_animal", a),
                    new Parametro("pcd_adotante", usuario.Cd)
                };

                using(MySqlDataReader Data = banco.Consultar($@"VerificarRespostasUsuario", parametros))
                {
                    if (Data.HasRows)
                    {
                        litPerguntas.Text = "<p>Seu formulário será analisado! Espere uma resposta em seu email</p>";
                    }
                    else CarregarForms(a, usuario.Cd);
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
                const dt_pedido = {dt};   
            </script>
            <script src='./script/forms-user.js'></script>";
        }
    }
}