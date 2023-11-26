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
    public partial class forms1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario.Login("10", "PCC", "A");
            Usuario usuario = new Usuario();
            if (!IsPostBack)
            {
                usuario.HeaderContent(litHeader);
            }

            #region Pegando cd_animal
            string cd_animal = "";
            if (String.IsNullOrEmpty(Request["a"])) Response.Redirect("forms.aspx?a=1");
            cd_animal = Request["a"].ToString();
            #endregion

            if (!usuario.Logado)
            {
                Session["last_page"] = Request.Url.AbsoluteUri;
                Response.Redirect("login.aspx");
            }

            Banco banco = new Banco();

            litPerguntas.Text = "";
            btnEnviar.Visible = false;
            btnSalvar.Visible = false;

            Animal animal = new Animal();
            bool ic = animal.ByCode(cd_animal);
            if (!ic) Response.Redirect("index.aspx");

            if (usuario.Sg == "O")
            {

            }
            else
            {
                // Adotando
                string cd_usuario = usuario.Cd;
                string command = $@"SELECT r.nm_resposta FROM resposta r
                JOIN pedido p ON (p.cd_animal = r.cd_animal AND p.cd_adotante = r.cd_adotante)
                WHERE p.cd_animal = {cd_animal} AND p.cd_adotante = {cd_usuario} AND p.ic_finalizado = false";
                using (MySqlDataReader data = banco.Consultar(command))
                {
                    if (data.HasRows)
                    {
                        litPerguntas.Text = "<p class='textCenter'>Formulário respondido</p>";
                        return;
                    }
                    CarregarFormularioUsuario(cd_animal, cd_usuario, animal.Organizacao.Cd);
                }
            }
        }

        private void CarregarFormularioUsuario(string cd_animal, string cd_usuario, string cd_organizacao)
        {
            btnEnviar.Visible = true;
            List<Parametro> parametros = new List<Parametro>
            {
                new Parametro("pcd_organizacao", cd_organizacao)
            };
            Banco banco = new Banco();
            using (MySqlDataReader Data = banco.Consultar("PegarPerguntasOrg", parametros))
            {
                while(Data.Read())
                {
                    string cd = Data[0].ToString();
                    string nm = Data[1].ToString();
                    litPerguntas.Text += Elemento.PerguntaFormularioUser(cd, nm, "");
                }
                litPerguntas.Text += $@"<script>
                    const cd_usuario = {cd_usuario};
                    const cd_animal = {cd_animal};
                    const cd_organizacao = {cd_organizacao};
                </script><script src='./script/userForms.js' defer></script>";
            }

        }
    }
}