using lar_com_amor.classes;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lar_com_amor.build
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario.Login("1", "Ng Cachorros", "O");
            Usuario usuario = new Usuario();
            if (!IsPostBack)
            {
                usuario.HeaderContent(litHeader);
                if (!usuario.Logado || !usuario.IsOrg) Response.Redirect("index.aspx");

                using(MySqlDataReader Data = usuario.GetDashboardData(usuario.Cd))
                {
                    if (Data.Read())
                    {
                        litTtalAnimais.Text = Data["total_animais"].ToString();
                        litAdotados.Text = Data["animais_adotados"].ToString();
                        litPedidosNovos.Text = Data["pedidos_pendentes"].ToString();
                        litPermitidosPendentes.Text = Data["pedidos_permitidos"].ToString();
                        litPedidosFinalizados.Text = Data["pedidos_finalizados"].ToString();
                    }
                }

            }
        }
    }
}