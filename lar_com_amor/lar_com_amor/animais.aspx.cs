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
    public partial class animais2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            if (!IsPostBack)
            {
                usuario.HeaderContent(litHeader);

                Banco banco = new Banco();
                Elemento.InsertDDLValues(selEspecie, banco.Consultar("PegarEspecies", null));
                Elemento.InsertDDLValues(selPorte, banco.Consultar("PegarPortes", null));
                litAnimais.Text = "";
            }

            //DDLs
            // Gênero
            // Espécie
            // Raça
            // Porte
            string especie = "", porte = "", genero = "", raca = "", txt = inpPesquisa.Text;

            if (selEspecie.SelectedValue != "0") especie = selEspecie.SelectedValue;
            if (selRaca.SelectedValue != "0") raca = selRaca.SelectedValue;
            if (selGenero.SelectedValue != "0") genero = selGenero.SelectedValue;
            if (selPorte.SelectedValue != "0") porte = selPorte.SelectedValue;


            Anuncios anuncios = new Anuncios();
            litAnimais.Text = Elemento.GerarAnuncios(anuncios.GetAnimais(txt, "", especie, raca, genero, porte, "0", "48"), "a", "Animais não encontrados", false);


        }

        protected void btnPesquisa_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void selEspecie_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (selEspecie.SelectedValue == "0") return;
            Banco banco = new Banco();
            List<Parametro> parametros = new List<Parametro> { new Parametro("pcd_especie", selEspecie.SelectedValue) };
            Elemento.InsertDDLValues(selRaca, banco.Consultar("PegarRacas", parametros));
            selPorte.Enabled = true;
        }

        protected void selRaca_SelectedIndexChanged(object sender, EventArgs e)
        {
            selPorte.Enabled = true;

            if (selRaca.SelectedValue == "0") return;

            Banco banco = new Banco();
            List<Parametro> parametros = new List<Parametro> { new Parametro("pcd_raca", selRaca.SelectedValue) };
            using (MySqlDataReader Data = banco.Consultar("PegarPorteRaca", parametros))
            {
                if (Data.Read())
                    selPorte.SelectedValue = Data[0].ToString();
            }
            selPorte.Enabled = false;
        }
    }
}