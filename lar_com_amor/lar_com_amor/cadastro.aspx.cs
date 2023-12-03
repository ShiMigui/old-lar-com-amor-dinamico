using lar_com_amor.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lar_com_amor
{
    public partial class cadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Parametro> tabs = new List<Parametro>
                { 
                    new Parametro("Adotante", "A"),
                    new Parametro("Organizacao", "O"),
                };
                litTabs.Text = Elemento.tabList(tabs, "./cadastro.aspx?");
            }
        }

        protected void btnCadastro_Click(object sender, EventArgs e)
        {
            if(inpNome.Text.Length < 8)
            {
                inpNome.Focus();
                litMsg.Text = Elemento.Error("Nome muito curto");
                return;
            }
            if (inpNome.Text.Length > 200)
            {
                inpNome.Focus();
                litMsg.Text = Elemento.Error("Nome muito longo");
                return;
            }
        }
    }
}