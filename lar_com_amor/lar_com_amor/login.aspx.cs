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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (inpLogin.Text == "")
            {
                litMsg.Text = Elemento.Error("Preencha todos os campos!");
                inpLogin.Focus();
                return;
            }

            if (inpSenha.Text == "")
            {
                litMsg.Text = Elemento.Error("Preencha todos os campos!");
                inpSenha.Focus();
                return;
            }
            string login = inpLogin.Text;
            Banco banco = new Banco();
            using (MySqlDataReader Data = banco.Consultar("Login", new List<Parametro> { new Parametro("pnm_login", login), new Parametro("pnm_senha", inpSenha.Text) }))
            {
                if (!Data.HasRows)
                {
                    litMsg.Text = Elemento.Error("Senha e/ou login inválidos");
                    return;
                }

                if (Data.Read())
                {
                    Usuario.Login(Data[0].ToString(), Data[1].ToString(), Data[2].ToString());
                    litMsg.Text = Elemento.Success("Logado com sucesso");

                    string page = "";
                    if (Session["tipo_user"].ToString() == "O") page = "organizacao.aspx";
                    else page = "index.aspx";
                    if (Session["last_page"] != null) page = Session["last_page"].ToString();

                    string script = @"<script type='text/javascript'>
                        setTimeout(function(){
                            window.location.href = '" + page + @"';
                        }, 3000); 
                     </script>";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "redirect", script);
                }
                else
                {
                    litMsg.Text = Elemento.Error("Senha e/ou login inválidos");
                }
            }
        }
    }
}