using lar_com_amor.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lar_com_amor
{
    public partial class Eventos : System.Web.UI.Page
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

                lista = Pegar.PegarTipoEvento();
                ddlTipoEvento.Items.Add(new ListItem("Selecione", "0"));
                foreach (Parametro parametro in lista)
                {
                    ddlTipoEvento.Items.Add(new ListItem(parametro.Nm, parametro.Vl));
                }

               
            }

            if (ddlEstado.SelectedValue == "0")
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
                try
                {
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
                if (ddlTipoEvento.SelectedValue == "0")
                {
                    if(ddlEstado.SelectedValue != "0")
                    {
                        if(ddlCidade.SelectedValue != "0")
                        {
                            litEventos.Text = Elemento.GerarAnuncios(anuncios.GetEventos("", "", "","0","4",true,ddlEstado.SelectedValue.ToString(),ddlCidade.SelectedValue.ToString()), "e", message: "Eventos não encontradas");
                        }
                        else
                        {
                            litEventos.Text = Elemento.GerarAnuncios(anuncios.GetEventos("", "", "", "0", "4", true, ddlEstado.SelectedValue.ToString(), ""), "e", message: "Eventos não encontradas");
                        }
                    }
                    else
                    {
                        litEventos.Text = Elemento.GerarAnuncios(anuncios.GetEventos(), "e", message: "Eventos não encontradas");
                    }
                    
                }
                else
                {
                    if (ddlEstado.SelectedValue != "0")
                    {
                        if (ddlCidade.SelectedValue != "0")
                        {
                            litEventos.Text = Elemento.GerarAnuncios(anuncios.GetEventos("", "", ddlTipoEvento.SelectedValue.ToString(), "0", "4", true, ddlEstado.SelectedValue.ToString(), ddlCidade.SelectedValue.ToString()), "e", message: "Eventos não encontradas");
                        }
                        else
                        {
                            litEventos.Text = Elemento.GerarAnuncios(anuncios.GetEventos("", "", ddlTipoEvento.SelectedValue.ToString(), "0", "4", true, ddlEstado.SelectedValue.ToString(), ""), "e", message: "Eventos não encontradas");
                        }
                    }
                    else
                    {
                        litEventos.Text = Elemento.GerarAnuncios(anuncios.GetEventos("","", ddlTipoEvento.SelectedValue.ToString()), "e", message: "Eventos não encontradas");
                    }
                }                
            }
            else
            {
                if (ddlTipoEvento.SelectedValue == "0")
                {
                    if (ddlEstado.SelectedValue != "0")
                    {
                        if (ddlCidade.SelectedValue != "0")
                        {
                            litEventos.Text = Elemento.GerarAnuncios(anuncios.GetEventos(txtPesquisa.Text.ToString(), "", "", "0", "4", true, ddlEstado.SelectedValue.ToString(), ddlCidade.SelectedValue.ToString()), "e", message: "Eventos não encontradas");
                        }
                        else
                        {
                            litEventos.Text = Elemento.GerarAnuncios(anuncios.GetEventos(txtPesquisa.Text.ToString(), "", "", "0", "4", true, ddlEstado.SelectedValue.ToString(), ""), "e", message: "Eventos não encontradas");
                        }
                    }
                    else
                    {
                        litEventos.Text = Elemento.GerarAnuncios(anuncios.GetEventos(txtPesquisa.Text.ToString()), "e", message: "Eventos não encontradas");
                    }

                }
                else
                {
                    if (ddlEstado.SelectedValue != "0")
                    {
                        if (ddlCidade.SelectedValue != "0")
                        {
                            litEventos.Text = Elemento.GerarAnuncios(anuncios.GetEventos(txtPesquisa.Text.ToString(), "", ddlTipoEvento.SelectedValue.ToString(), "0", "4", true, ddlEstado.SelectedValue.ToString(), ddlCidade.SelectedValue.ToString()), "e", message: "Eventos não encontradas");
                        }
                        else
                        {
                            litEventos.Text = Elemento.GerarAnuncios(anuncios.GetEventos(txtPesquisa.Text.ToString(), "", ddlTipoEvento.SelectedValue.ToString(), "0", "4", true, ddlEstado.SelectedValue.ToString(), ""), "e", message: "Eventos não encontradas");
                        }
                    }
                    else
                    {
                        litEventos.Text = Elemento.GerarAnuncios(anuncios.GetEventos(txtPesquisa.Text.ToString(), "", ddlTipoEvento.SelectedValue.ToString()), "e", message: "Eventos não encontradas");
                    }
                }
            }
        }
    }
}