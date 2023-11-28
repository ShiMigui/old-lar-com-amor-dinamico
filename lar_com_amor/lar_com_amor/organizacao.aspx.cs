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
    public partial class organizacao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();

            string cd = "";

            if (!IsPostBack)
            {
                usuario.HeaderContent(litHeader);
                if (String.IsNullOrEmpty(Request["cd"])) Response.Redirect($"organizacao.aspx?cd={usuario.Cd}");
            }

            if (String.IsNullOrEmpty(Request["cd"])) Response.Redirect("index.aspx");
            else cd = Request["cd"].ToString();



            Usuario organizacao = new Usuario();
            bool ic = organizacao.ByCode(cd);
            if (!ic) Response.Redirect("index.aspx");

            string tab = "perfil";
            if (!String.IsNullOrEmpty(Request["tab"])) tab = Request["tab"].ToString();

            litFoto.Text = Elemento.FotoAnuncioOrganizacao(organizacao.Cd, organizacao.Nm);

            if (tab == "perfil")
            {
                litRua.Text = organizacao.Rua;
                litCidade.Text = organizacao.Cidade;
                litUf.Text = organizacao.UF;
            }

            if (!IsPostBack)
            {
                List<Parametro> Tabs = new List<Parametro> 
                {
                    new Parametro("Perfil", "perfil"),
                    new Parametro("Animais", "animais"),
                    new Parametro("Eventos", "eventos"),
                };

                if (usuario.Cd == organizacao.Cd) Tabs.Add(new Parametro("Formulário", "forms"));
                litTabs.Text = Elemento.tabList(Tabs, $"organizacao.aspx?cd={cd}&&");

                if (tab == "perfil")
                {
                    if (usuario.Logado && organizacao.Cd == usuario.Cd) CarregarOrganizacaoOrg(organizacao);
                    else CarregarOrganizacaoUser(organizacao);
                }
                else if (tab == "forms" && usuario.Cd == organizacao.Cd)
                {
                    pnlForms.Visible = true;
                    Banco bd = new Banco();
                    using (MySqlDataReader Data = bd.Consultar($@"SELECT p.dt_pedido, p.ic_permitido, p.ic_finalizado, u.cd_usuario, u.nm_usuario, a.cd_animal, a.nm_animal FROM pedido p JOIN animal a ON (p.cd_animal = a.cd_animal) JOIN usuario u ON (u.cd_usuario = p.cd_adotante) WHERE a.cd_organizacao = {cd} ORDER BY p.dt_pedido;"))
                    {
                        if (!Data.HasRows)
                        {
                            litForms.Text = "<p class='textCenter'>Ainda não há nenhum pedido de adoção!</p>";
                            return;
                        }
                        string content = "";
                        while (Data.Read())
                        {
                            string situacao = "";
                            content += $@"<tr>
                                <td class='textCenter'>{Data["nm_usuario"]}</td>
                                <td class='textCenter'><a href='./forms.aspx?a={Data["cd_animal"]}&&u={Data["cd_usuario"]}&&dt={Data["dt_pedido"].ToString().Split(' ')[0]}'>clique aqui</a></td>
                                <td class='textCenter'>{situacao}</td>
                            </tr>";
                        }
                        litForms.Text = $"<table><tr><th>Adotante</th><th>Formulário</th><th>Situação</th></tr>{content}</table>";
                    }
                }
                else if (tab == "animais")
                {
                    pnlAnimais.Visible = true;
                    Anuncios anuncios = new Anuncios();
                    litAnimais.Text = Elemento.GerarAnuncios(anuncios.GetAnimais(org: cd), message: "Animais da organização não encontrados!");
                }
                else if (tab == "eventos")
                {
                    pnlEventos.Visible = true;
                    Anuncios anuncios = new Anuncios();
                    litEventos.Text = Elemento.GerarAnuncios(anuncios.GetEventos(org: cd), "e", "Eventos da organização não encontrados!");
                }
                else Response.Redirect("index.aspx");
            }
        }

        private void CarregarOrganizacaoUser(Usuario organizacao)
        {
            pnlPerfil.Visible = true;
            litNome.Visible = true;
            litDescricao.Visible = true;
            litCep.Visible = true;
            litTelefone.Visible = true;

            litNome.Text = $"<p>{organizacao.Nm}</p>";
            if (String.IsNullOrEmpty(organizacao.Ds)) litDescricao.Text = $"<p>Não há uma descrição até o momento :(</p>";
            else litDescricao.Text = $"<p>{organizacao.Ds}</p>";
            litCep.Text = $"<p>{Credenciais.Formatar(organizacao.Cep, "XX.XXX-XXX")}</p>";
            litTelefone.Text = $"<p>{organizacao.Telefone}</p>";
        }

        private void CarregarOrganizacaoOrg(Usuario organizacao)
        {
            pnlPerfil.Visible = true;
            inpNome.Visible = true;
            inpDescricao.Visible = true;
            inpCep.Visible = true;
            inpTelefone.Visible = true;

            inpNome.Text = organizacao.Nm;
            inpDescricao.Text = organizacao.Ds;
            inpCep.Text = organizacao.Cep;
            inpTelefone.Text = organizacao.Telefone;
            buttons.Visible = true;
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (inpNome.Text == "")
            {
                litMsg.Text = Elemento.Error("Preencha o campo de nome!");
                inpNome.Focus();
                return;
            }
            if (inpTelefone.Text == "")
            {
                litMsg.Text = Elemento.Error("Preencha o campo de telefone!");
                inpTelefone.Focus();
                return;
            }
            if (inpCep.Text == "")
            {
                litMsg.Text = Elemento.Error("Preencha o campo de CEP!");
                inpCep.Focus();
                return;
            }

            Usuario usuario = new Usuario();
            bool ic = usuario.Update(Request["cd"].ToString(), inpNome.Text, inpDescricao.Text, inpCep.Text, inpTelefone.Text, null);
            if (ic) litMsg.Text = Elemento.Success("Alterações salvas com sucesso");
            else litMsg.Text = Elemento.Error("Problemas ao salvar alterações, tente mais tarde!");
        }

        protected void inpCep_TextChanged(object sender, EventArgs e)
        {
            JObject json = Credenciais.GetCep(inpCep.Text);
            if (json["ok"] != null && json["ok"].Value<bool>())
            {
                btnSalvar.Enabled = true;
                litRua.Text = json["logradouro"].ToString();
                litCidade.Text = json["localidade"].ToString();
                litUf.Text = json["uf"].ToString();
            }
            else
            {
                litMsg.Text = Elemento.Error(json["msg"].ToString());
                btnSalvar.Enabled = false;
            }
        }
    }
}