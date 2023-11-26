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
            Usuario.Login("10", "PPPP ASS", "A");
            if (!IsPostBack)
            {
                usuario.HeaderContent(litHeader);

                #region Pegando o código do animal
                string cd = string.Empty;
                if (String.IsNullOrWhiteSpace(Request["a"])) Response.Redirect("forms.aspx?a=1");
                cd = Request["a"].ToString();
                #endregion

                if (!usuario.Logado)
                {
                    Session["last_page"] = $"forms.aspx?a={cd}";
                    Response.Redirect("login.aspx");
                }

                #region Pegando o animal
                Animal animal = new Animal();
                bool ic = animal.ByCode(cd);
                if (!ic) Response.Redirect("index.aspx");
                #endregion

                #region Verificações para organização
                // verifica o sg do user
                if (usuario.Sg == "O")
                {
                    if (usuario.Cd == animal.Organizacao.Cd)
                    {
                        return;
                    }
                    else Response.Redirect("index.aspx");
                }
                #endregion

                Pedido pedido = new Pedido();
                pedido.Animal = animal;
                pedido.Adotante = usuario;

                #region Verificando se há um pedido em andamento
                string command = $@"SELECT ic_enviado FROM pedido WHERE cd_animal = {animal.Cd} AND ic_finalizado = false AND cd_adotante = {usuario.Cd};";
                Banco bd = new Banco();
                using (MySqlDataReader data = bd.Consultar(command))
                {
                    if (data.Read())
                    {
                        if (data[0].ToString() == "false")
                        {
                            litPerguntas.Text = "<p class='textCenter'>Este formulário já foi respondido! Espere uma resposta</p>";
                        }
                    }
                    if (!data.HasRows) pedido.NovoPedido(animal, usuario);
                }
                #endregion

                #region Tentando gerar Perguntas
                try
                {
                    List<Parametro> parametros = new List<Parametro>
                {
                    new Parametro("pcd_animal", animal.Cd),
                    new Parametro("pcd_adotante", usuario.Cd)
                };
                    using (MySqlDataReader data = bd.Consultar("PegarPedido", parametros))
                    {
                        while (data.Read())
                        {
                            string dt = data["dt_pedido"].ToString();
                            string cd_pergunta = data["cd_pergunta"].ToString();
                            string nm_pergunta = data["nm_pergunta"].ToString();
                            string nm_resposta = data["nm_resposta"].ToString();
                            if (!String.IsNullOrEmpty(nm_resposta))
                            {
                                litPerguntas.Text = "<p class='textCenter'>Este formulário já foi respondido!</p>";
                                return;
                            }

                            pedido.Perguntas.Add(new Pergunta(cd_pergunta, nm_pergunta, ""));
                            pedido.Data = dt;
                        }
                        CarregarFormularioUser(pedido);
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.Message);
                }
                #endregion
            }
        }

        private void CarregarFormularioUser(Pedido pedido)
        {
            btnEnviar.Visible = true;
            litPerguntas.Text = "";
            foreach (Pergunta p in pedido.Perguntas) litPerguntas.Text += Elemento.PerguntaFormularioUser(p);
            litPerguntas.Text += $@"<script>
                const U = {pedido.Adotante.Cd};
                const O = {pedido.Animal.Organizacao.Cd};
                const A = {pedido.Animal.Cd};
            </script>";
            litPerguntas.Text += "<script src='./script/userForms.js' defer></script>";
        }
    }
}