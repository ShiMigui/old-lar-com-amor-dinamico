using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lar_com_amor.classes
{
    public partial class animal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            if (!IsPostBack)
            {
                usuario.HeaderContent(litHeader);
                string cd="";
                if (String.IsNullOrEmpty(Request["cd"])) Response.Redirect("index.aspx");
                else cd = Request["cd"].ToString();

                Animal animal = new Animal();
                bool ic = animal.ByCode(cd);

                if (!ic) Response.Redirect("index.aspx"); // TODO avisar o usuário que ele será redirecionado

                if (usuario.Logado && animal.Organizacao.Cd == usuario.Cd) CarregarAnimalOrganizacao(animal);
                else CarregarAnimalUsuario(animal);

            }

            // falta add animal



        }

        protected void CarregarAnimalUsuario(Animal animal)
        {
            litNome.Text = $"<p>{animal.Nm}</p>";
            litNascimento.Text = $"<p>{animal.Nascimento}</p>";
            litDescricao.Text = $"<p>{animal.Ds}</p>";
            litCastrado.Text = animal.Castrado ? "<p>Castrado</p>" : "<p>Não castrado</p>";
            litGenero.Text = $"<p>{animal.Genero.Nm}</p>";
            litEspecie.Text = $"<p>{animal.Especie.Nm}</p>";
            litRaca.Text = $"<p>{animal.Raca.Nm}</p>";
            litPorte.Text = $"<p>{animal.Porte.Nm}</p>";
            imgAnimal.ImageUrl = $"./img/animal/{animal.Cd}.jpg";

            Usuario usuario = new Usuario();
            if (!usuario.IsOrg) lnkBtn.NavigateUrl = $"./forms.aspx?a={animal.Cd}";
            else lnkBtn.Visible = false;
        }

        protected void CarregarAnimalOrganizacao(Animal animal)
        {
            btnSalvar.Visible = true;
            btnExcluir.Visible = true;

            inpNome.Visible = true;
            inpNascimento.Visible = true;
            chkCastrado.Visible = true;
            inpDescricao.Visible = true;
            selEspecie.Visible = true;
            selRaca.Visible = true;
            selGenero.Visible = true;
            selPorte.Visible = true;
            imgAnimal.ImageUrl = $"./img/animal/{animal.Cd}.jpg";

            inpDescricao.Text = animal.Ds;
            inpNascimento.Text = Credenciais.DateToInput(animal.Nascimento);
            inpNome.Text = animal.Nm;
            chkCastrado.Checked = animal.Castrado;
            litCastrado.Text = animal.Castrado ? "Castrado" : "Não castrado";
            lnkBtn.Visible = false;

            CarregarDDL(selEspecie);
            selEspecie.SelectedValue = animal.Especie.Vl;
            CarregarDDL(selPorte, "PegarPortes");
            selPorte.SelectedValue = animal.Porte.Vl;
            selPorte.Enabled = false;
            CarregarRacas();
            selRaca.SelectedValue = animal.Raca.Vl;
            selGenero.SelectedValue = animal.Genero.Vl;
        }

        protected void btnAdicionar_Click(object sender, EventArgs e)
        {
            Banco banco = new Banco();
        }

        protected void btnExcluir_Click(object sender, EventArgs e)
        {
            Banco banco = new Banco();
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (!VerificarInputs())
            {
                litMsg.Text = Elemento.Error("Preencha todos os campos!");
                return;
            }

            Banco banco = new Banco();
            List<Parametro> parametros = new List<Parametro>();
            parametros.Add(new Parametro("pcd_animal", Request["cd"].ToString()));
            parametros.Add(new Parametro("pnm_animal", inpNome.Text));
            parametros.Add(new Parametro("pds_animal", inpDescricao.Text));
            parametros.Add(new Parametro("pdt_nascimento", inpNascimento.Text));
            parametros.Add(new Parametro("pic_castrado", chkCastrado.Checked ? "1" : "0"));
            parametros.Add(new Parametro("pcd_raca", selRaca.SelectedValue));
            parametros.Add(new Parametro("psg_genero", selGenero.SelectedValue));

            try
            {
                banco.Executar("AtualizarAnimal", parametros);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
                //litMsg.Text = Elemento.Error("Ocorreu um problema :( Tente mais tarde!");
            }
        }

        protected bool VerificarInputs()
        {
            if (inpNome.Text.Trim() == "" || inpDescricao.Text.Trim() == "" || inpNascimento.Text.Trim() == "" || selRaca.SelectedValue == "0" || selGenero.SelectedValue == "0")
            {
                if (inpNome.Text.Trim() == "") inpNome.Focus();
                else if (inpDescricao.Text.Trim() == "") inpDescricao.Focus();
                else if (inpNascimento.Text.Trim() == "") inpNascimento.Focus();
                else if (selRaca.SelectedValue == "0") selRaca.Focus();
                else if (selGenero.SelectedValue == "0") selGenero.Focus();
                return false;
            }
            return true;
        }

        protected void CarregarDDL(DropDownList ddl, string command = "PegarEspecies")
        {
            Banco banco = new Banco();
            using (MySqlDataReader Data = banco.Consultar(command, null)) Elemento.InsertDDLValues(ddl, Data);
        }

        protected void selEspecie_SelectedIndexChanged(object sender, EventArgs e)
        {
            CarregarRacas();
        }
        protected void CarregarRacas()
        {
            if (selEspecie.SelectedValue == "0") return;
            List<Parametro> parametros = new List<Parametro> { new Parametro("pcd_especie", selEspecie.SelectedValue) };
            Banco banco = new Banco();
            using (MySqlDataReader Data = banco.Consultar("PegarRacas", parametros)) Elemento.InsertDDLValues(selRaca, Data);
            selPorte.Enabled = true;
        }

        protected void selRaca_SelectedIndexChanged(object sender, EventArgs e)
        {
            LigarRacaPorte();
        }

        protected void LigarRacaPorte()
        {
            if (selRaca.SelectedValue == "0")
            {
                selPorte.Enabled = true;
                return;
            }

            List<Parametro> parametros = new List<Parametro> { new Parametro("pcd_raca", selRaca.SelectedValue) };
            Banco banco = new Banco();
            using (MySqlDataReader Data = banco.Consultar("PegarPorteRaca", parametros))
            {
                if (Data.Read())
                {
                    selPorte.SelectedValue = Data[0].ToString();
                    selPorte.Enabled = false;
                }
            }
        }
    }
}