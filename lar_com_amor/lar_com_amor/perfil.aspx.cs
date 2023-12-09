using lar_com_amor.classes;
using MySql.Data.MySqlClient;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lar_com_amor
{
    public partial class perfil : System.Web.UI.Page
    {
        public Usuario usuario { get; set; }
        public bool cepOk { get; set; }
        public bool icMsg { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            usuario.VerificarLogin();
            this.usuario = usuario;

            if (!icMsg) litMsg.Text = "";
            else icMsg = false;

            if (!IsPostBack)
            {
                usuario.HeaderContent(litHeader);

                #region Gerando tabs
                List<Parametro> tabs = new List<Parametro>
                {
                    new Parametro("Perfil", "perfil")
                };

                if (usuario.Sg == "A") tabs.Add(new Parametro("Pedidos", "pedidos"));
                litTabs.Text = Elemento.tabList(tabs, "./perfil.aspx?");
                #endregion

                if (!usuario.Logado) Response.Redirect("index.aspx");

                #region Gerando dados
                usuario.ByCode(usuario.Cd, usuario.Sg);
                this.usuario = usuario;

                string tab = "perfil";
                if (!String.IsNullOrEmpty(Request["tab"])) tab = Request["tab"].ToString();

                if (tab == "perfil")
                {
                    #region Tab Perfil
                    pnlPerfil.Visible = true;
                    if (usuario.Sg == "O")
                    {
                        pnlCNPJ.Visible = true;
                        pnlDescricao.Visible = true;
                        litCNPJ.Text = usuario.CNPJ;
                    }

                    inpNome.Text = this.usuario.Nm;
                    inpEmail.Text = this.usuario.Mail;
                    inpTelefone.Text = this.usuario.Telefone;
                    inpDescricao.Text = this.usuario.Ds;
                    inpCep.Text = this.usuario.Cep;
                    litRua.Text = this.usuario.Rua;
                    litCidade.Text = this.usuario.Cidade;
                    litUf.Text = this.usuario.UF;
                    #endregion
                }
                else if (tab == "pedidos" && usuario.Sg == "A")
                {
                    #region Tab Pedidos
                    pnlPedidos.Visible = true;
                    Banco banco = new Banco();
                    List<Parametro> parametros = new List<Parametro>
                    { new Parametro("pcd_usuario", usuario.Cd)};
                    using (MySqlDataReader data = banco.Consultar("PedidosUsuario", parametros))
                    {
                        litPedidos.Text = "";
                        List<string> header = new List<string> { "Animal", "Data", "Formulário", "Situação"};
                        List<List<string>> content = new List<List<string>>();
                        while (data.Read())
                        {
                            string nm_animal = data["nm_animal"].ToString();
                            string dt_pedido = data["dt_pedido"].ToString().Split(' ')[0];
                            string ic_permitido = data["ic_permitido"].ToString().ToLower();
                            string ic_finalizado = data["ic_finalizado"].ToString().ToLower();
                            string cd_animal = data["cd_animal"].ToString();
                            string situacao = "";

                            if (ic_finalizado == "false") situacao = "Não adotado";
                            else if(ic_finalizado == "true") situacao = "Adotado";
                            else
                            {
                                if (ic_permitido == "false") situacao = "Formulário recusado"; 
                                else if (ic_permitido == "true") situacao = "Formulário aceito";
                                else situacao = "Em análise";
                            }

                            string link = $"<a href='./forms.aspx?q=view&&a={cd_animal}&&u={usuario.Cd}&&dt={dt_pedido}'>clique aqui</a>";

                            content.Add(new List<string> { nm_animal, dt_pedido, link, situacao});
                        }
                        litPedidos.Text = Elemento.GenerateTable(header, content, "Não há pedidos feitos");
                    }
                    #endregion
                }
                else Response.Redirect("index.aspx");
                #endregion
            }

        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            #region Verificações

            #region Variáveis
            string tel;
            #endregion

            icMsg = true; // Apenas para as verificações
            if (inpNome.Text.Length > 250)
            {
                litMsg.Text = Elemento.Error("Nome muito longo");
                return;
            }

            tel = Credenciais.ValidatePhone(inpTelefone.Text);
            if (tel != null) inpTelefone.Text = tel;
            else
            {
                litMsg.Text = Elemento.Error("Telefone não é válido");
                return;
            }
            inpCep_TextChanged(sender, e);
            if (!cepOk)
            {
                litMsg.Text = Elemento.Error("CEP incorreto verifique-o");
                return;
            }
            #endregion

            #region Atualizando usuario
            List<Parametro> parametros = new List<Parametro>
            {
                new Parametro("pcd_usuario", this.usuario.Cd),
                new Parametro("pnm_usuario", inpNome.Text),
                new Parametro("pnm_email", inpEmail.Text),
                new Parametro("pnm_telefone", inpTelefone.Text),
                new Parametro("pds_usuario", inpDescricao.Text),
                new Parametro("pcd_cep", inpCep.Text),
            };

            Banco banco = new Banco();
            try
            {
                banco.Executar("AtualizarPerfilUsuario", parametros);
                litMsg.Text = Elemento.Success("Alterações salvas");
            }
            catch
            {
                litMsg.Text = Elemento.Error("Ocorreu um erro, tente mais tarde");
            }
            #endregion
        }

        protected void inpCep_TextChanged(object sender, EventArgs e)
        {
            try
            {
                JObject json = Credenciais.GetCep(inpCep.Text);
                this.cepOk = (bool)json["ok"];
                if (cepOk)
                {
                    inpCep.Text = json["cep"].ToString();
                    litRua.Text = json["logradouro"].ToString();
                    litUf.Text = json["uf"].ToString();
                    litCidade.Text = json["localidade"].ToString();
                }
                else
                {
                    litMsg.Text = Elemento.Error(json["msg"].ToString());
                    icMsg = true;
                }
            }
            catch
            {
                this.cepOk = false;
            }
        }
    }
}