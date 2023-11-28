using lar_com_amor.classes;
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
                if (String.IsNullOrEmpty(Request["cd"]) && usuario.IsOrg) Response.Redirect($"organizacao.aspx?cd={usuario.Cd}");
            }

            #region Verficações
            if (String.IsNullOrEmpty(Request["cd"])) Response.Redirect("index.aspx");
            else cd = Request["cd"].ToString();
            List<Parametro> tabs = new List<Parametro>
            {
                new Parametro("Sobre", "sobre"),
                new Parametro("Animais", "animais"),
                new Parametro("Eventos", "eventos")
            };
            litTabs.Text = Elemento.tabList(tabs, $"organizacao.aspx?cd={cd}&&");

            try
            {
                int.Parse(cd);
            }
            catch
            {
                Response.Redirect("index.aspx");
            }
            #endregion

            Usuario org = new Usuario();
            bool existsOrg = org.ByCode(cd, "O");
            if (!existsOrg) Response.Redirect("index.aspx");

            litFoto.Text = Elemento.FotoAnuncioOrganizacao(org.Cd, org.Nm);
            string tab = "sobre";
            if (!String.IsNullOrEmpty(Request["tab"])) tab = Request["tab"].ToString();
            if (tab == "sobre")
            {
                pnlPerfil.Visible = true;
                litNome.Text = org.Nm;
                litDescricao.Text = org.Ds;
                litEmail.Text = org.Mail;
                litTelefone.Text = org.Telefone;
                litCep.Text = org.Cep;
                litUf.Text = org.UF;
                litRua.Text = org.Rua;
                litCidade.Text = org.Cidade;
            }
            else if (tab == "animais")
            {
                Anuncios anuncios = new Anuncios();
                pnlAnimais.Visible = true;
                litAnimais.Text = Elemento.GerarAnuncios(anuncios.GetAnimais(org: cd, limit: "18"), "a", "Sem animais registrados 🐶");
            }
            else if (tab == "eventos")
            {
                Anuncios anuncios = new Anuncios();
                pnlEventos.Visible = true;
                litEventos.Text = Elemento.GerarAnuncios(anuncios.GetEventos(org: cd, limit: "12"), "e", "Sem eventos registrados 🐶");
            }
            else Response.Redirect("index.aspx");
        }
    }
}