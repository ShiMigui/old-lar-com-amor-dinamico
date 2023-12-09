using lar_com_amor.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lar_com_amor
{
    public partial class reposta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(Request["txt"])) Response.Redirect("index.aspx");

            Usuario usuario = new Usuario();
            if (!IsPostBack)
            {
                usuario.HeaderContent(litHeader);
                Anuncios anuncios = new Anuncios();
                string txt = Request["txt"].ToString();
                litAnimais.Text = Elemento.GerarAnuncios(anuncios.GetAnimais(txt, limit: "48"), "a", message: "Animais não encontrados");
                litEventos.Text = Elemento.GerarAnuncios(anuncios.GetEventos(txt, limit: "48"), "e", message: "Eventos não encontrados");
                litOrganizacoes.Text = Elemento.GerarAnuncios(anuncios.GetOrganizacoes(txt, limit: "48"), "o", message: "organizações não encontradas");
            }


        }
    }
}