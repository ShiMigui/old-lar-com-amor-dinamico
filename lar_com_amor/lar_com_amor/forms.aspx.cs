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
    public partial class forms1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            Usuario.Login("2", "Ng Cachorros", "A");

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
                bool ic = animal.ByCode(cdAnimal);
                if (!ic) Response.Redirect("index.aspx");
                
                if (usuario.Sg == "A") CarregarFormsUser(animal, usuario);
                else
                {
                    if (usuario.Cd == animal.Organizacao.Cd) CarregarFormsOrg(animal, usuario);
                    else Response.Redirect("index.aspx");
                }
            }
        }

        private void CarregarFormsOrg(Animal animal, Usuario usuario)
        {
            
        }

        private void CarregarFormsUser(Animal animal, Usuario usuario)
        {
            btnEnviar.Visible = true;
            Banco banco = new Banco();
            string command = $@"SELECT cd_pergunta, nm_pergunta, cd_organizacao FROM pergunta p
                WHERE p.cd_organizacao = {animal.Organizacao.Cd};";
            using (MySqlDataReader Data = banco.Consultar(command))
            {
                litPerguntas.Text = "";
                while (Data.Read()) litPerguntas.Text += Elemento.PerguntaFormularioUser(Data[0].ToString(), Data[1].ToString());
            }
            litPerguntas.Text += @"<script>
                let objForms = {
                    type: 'view-user',
                    u: " + usuario.Cd + @",
                    a: " + animal.Cd + @",
                    o: " + animal.Organizacao.Cd + @"
                }
                </script><script src='./script/userForms.js' defer></script>";
        }
    }
}