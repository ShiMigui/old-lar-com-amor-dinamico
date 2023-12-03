using lar_com_amor.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lar_com_amor
{
    public partial class orgnizacoes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Parametro Pegar = new Parametro();
            List<Parametro> lista = new List<Parametro>();
            lista = Pegar.PegarEstado();

            if (!IsPostBack)
            {
                Usuario usuario = new Usuario();
                usuario.HeaderContent(litHeader);

                ddlEstado.Items.Add(new ListItem("Selecione", "0"));
                foreach (Parametro parametro in lista)
                {
                    ddlEstado.Items.Add(new ListItem(parametro.Nm, parametro.Vl));
                }
            }
            

            if(ddlEstado.SelectedValue == "0")
            {
                ddlCidade.Enabled = false;
            }
            else
            {
                string cd_cidade = ddlCidade.SelectedValue;
                ddlCidade.Enabled = true;
                ddlCidade.Items.Clear();
                lista = Pegar.PegarCidade(ddlEstado.SelectedValue.ToString());
                ddlCidade.Items.Add(new ListItem("Selecione", "0"));
                foreach (Parametro parametro in lista)
                {
                    ddlCidade.Items.Add(new ListItem(parametro.Nm, parametro.Vl));
                }
                try{
                    ddlCidade.SelectedValue = cd_cidade;
                }
                catch
                {
                    ddlCidade.SelectedValue = "0";
                }
            }

            Pesquisa();
        }

        public void Pesquisa()
        {
            Anuncios anuncios = new Anuncios();
            if (String.IsNullOrEmpty(txtPesquisa.Text)) 
            { 
                if(ddlEstado.SelectedValue == "0")
                {
                    litOrganizacoes.Text = Elemento.GerarAnuncios(anuncios.GetOrganizacoes(), message: "Organizações não encontradas");
                }
                else
                {
                    if(ddlCidade.SelectedValue == "0")
                    {
                        litOrganizacoes.Text = Elemento.GerarAnuncios(anuncios.GetOrganizacoes("", "0", "6", ddlEstado.SelectedValue.ToString(), ""), message: "Organizações não encontradas");
                    }
                    else
                    {
                        litOrganizacoes.Text = Elemento.GerarAnuncios(anuncios.GetOrganizacoes("", "0", "6", ddlEstado.SelectedValue.ToString(), ddlCidade.SelectedValue.ToString()), message: "Organizações não encontradas");
                    }                    
                }

            }
            else
            {
                if (ddlEstado.SelectedValue == "0")
                {
                    litOrganizacoes.Text = Elemento.GerarAnuncios(anuncios.GetOrganizacoes(txtPesquisa.Text.ToString()), message: "Organizações não encontradas");
                }
                else
                {
                    if (ddlCidade.SelectedValue == "0")
                    {
                        litOrganizacoes.Text = Elemento.GerarAnuncios(anuncios.GetOrganizacoes(txtPesquisa.Text.ToString(), "0", "6", ddlEstado.SelectedValue.ToString(), ""), message: "Organizações não encontradas");
                    }
                    else
                    {
                        litOrganizacoes.Text = Elemento.GerarAnuncios(anuncios.GetOrganizacoes(txtPesquisa.Text.ToString(), "0", "6", ddlEstado.SelectedValue.ToString(), ddlCidade.SelectedValue.ToString()), message: "Organizações não encontradas");
                    }
                }
            }
        }
    }
}