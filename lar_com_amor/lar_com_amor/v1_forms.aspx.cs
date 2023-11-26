using lar_com_amor.classes;
using larcomamor.classes;
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
            Usuario.Login("1", "Ng Cachorros", "O");

            string cdAnimal = "";
            if (String.IsNullOrEmpty(Request["a"])) Response.Redirect("forms.aspx?a=1");
            else cdAnimal = Request["a"];

            if (!IsPostBack)
            {
                usuario.HeaderContent(litHeader);

                if (!usuario.Logado)
                {
                    Session["last_page"] = $"forms.aspx?a={cdAnimal}";
                    Response.Redirect("login.aspx");
                }

                Animal animal = new Animal();
                animal.ByCode(cdAnimal);


                if (usuario.Sg == "A") CarregarFormsUser(animal);
                else
                {
                    if (usuario.Cd == animal.Organizacao.Cd) CarregarFormsOrg(animal, usuario);
                    else Response.Redirect("index.aspx");
                }
            }
        }

        private void CarregarFormsOrg(Animal animal, Usuario usuario)
        {
            Banco banco = new Banco();
            string command = $@"SELECT cd_pergunta, nm_pergunta, cd_organizacao, MAX(cd_pergunta) AS total_perguntas
                FROM pergunta
                WHERE cd_organizacao = {animal.Organizacao.Cd}
                GROUP BY cd_pergunta, nm_pergunta, cd_organizacao;";
            string indice = "";
            using (MySqlDataReader Data = banco.Consultar(command))
            {
                
                while (Data.Read())
                {
                    
                    indice = Data["total_perguntas"].ToString();
                    btnAddPergunta.Visible = true;
                    btnSalvar.Visible = true;
                }
                Session["indice_forms"] = indice;
            }

            string script = @"<script> 
                    let objForms = {
                        type: 'view-org',
                        cd_animal: " + animal.Cd + @",
                        cd_usuario: " + usuario.Cd + @",
                        qt_perguntas: " + indice + @",
                    } </script>";

            Page.ClientScript.RegisterStartupScript(this.GetType(), "scriptObjForms", script);
        }

        private void CarregarFormsUser(Animal animal)
        {
            throw new NotImplementedException();
        }

        protected void btnAddPergunta_Click(object sender, EventArgs e)
        {
            string i = Session["indice_forms"].ToString();
            litPerguntas.Text += Elemento.PerguntaFormularioOrg("", i);
        }
    }
}