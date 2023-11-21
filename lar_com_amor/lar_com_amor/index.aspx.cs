using lar_com_amor.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lar_com_amor
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            if (!IsPostBack)
            {
                usuario.HeaderContent(litHeader);

                Anuncios anuncios = new Anuncios();
                litAnimais.Text = Elemento.GerarAnuncios(anuncios.GetAnimais(), message: "Animais não encontrados");
                
            }
            
            
        }
    }
}