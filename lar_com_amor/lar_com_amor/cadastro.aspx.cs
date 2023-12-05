using lar_com_amor.classes;
using Newtonsoft.Json.Linq;
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
            string sg = "A";
            if (!String.IsNullOrEmpty(Request["tab"])) sg = Request["tab"].ToString();

            if (sg == "A")
            {
                pnlDate.Visible = true;
            }
            else
            {
                pnlCnpj.Visible = true;
            }
        }

        protected void btnCadastro_Click(object sender, EventArgs e)
        {
            string sg = "A";
            if(!String.IsNullOrEmpty(Request["tab"])) sg= Request["tab"].ToString();
            string DATE = null, CNPJ = null, phone=null;

            #region Verificações
            if (inpNome.Text.Length < 8)
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
            if (inpEmail.Text.Length > 200)
            {
                inpEmail.Focus();
                litMsg.Text = Elemento.Error("Email muito longo");
                return;
            }
            if (!verificarIdade())
            {
                litMsg.Text = Elemento.Error("Você deve ter 18 anos para criar uma conta");
                inpDate.Focus();
                DATE = inpDate.Text;
                return;
            }
            phone = Credenciais.ValidatePhone(inpTelefone.Text);
            if (phone == null)
            {
                litMsg.Text = Elemento.Error("Telefone inválido");
                inpTelefone.Focus();
                return;
            }
            else inpTelefone.Text = phone;

            if (inpSenha.Text.Length < 5 || inpSenha2.Text.Length < 5)
            {
                inpSenha.Focus();
                litMsg.Text = Elemento.Error("Senha muito curta");
                return;
            }
            if (inpSenha.Text != inpSenha2.Text)
            {
                inpSenha.Focus();
                litMsg.Text = Elemento.Error("Senha não são iguais");
                return;
            }

            JObject dateJson = Credenciais.GetCep(inpCep.Text);
            if (dateJson["ok"].ToString() == "false")
            {
                litMsg.Text = Elemento.Error(dateJson["msg"].ToString());
                return;
            }
            if(inpCNPJ.Text.Length != 14)
            {
                litMsg.Text = Elemento.Error("CNPJ inválido");
                inpCNPJ.Focus();
                return;
            }

            // TODO: Verificar se usuário com mesmo email ou CNPJ existem

            #endregion
            
            //string codigo = Credenciais.GerarCodigo();
            List<Parametro> parametros = new List<Parametro>
            {
                new Parametro("pnm_usuario", inpNome.Text),
                new Parametro("pnm_email", inpEmail.Text),
                new Parametro("pnm_telefone", inpTelefone.Text),
                new Parametro("pnm_senha", inpSenha.Text),
                new Parametro("pdt_nascimento", DATE),
                new Parametro("pcd_cnpj", CNPJ),
                new Parametro("pcd_cep", inpCep.Text),
                new Parametro("psg_tipo", sg),
                //new Parametro("pnm_codigo", codigo),
            };

            try
            {
                Banco banco = new Banco();
                banco.Executar("NovoUsuario", parametros);
            }
            catch
            {
                litMsg.Text = Elemento.Error("Não foi possível criar usuário");
            }
        }


        protected bool verificarIdade()
        {
            DateTime dataDeNascimento;
            if (DateTime.TryParse(inpDate.Text, out dataDeNascimento))
            {
                if (DateTime.Today.Year - dataDeNascimento.Year > 18) return true;
                else if (DateTime.Today.Year - dataDeNascimento.Year == 18)
                {
                    if (dataDeNascimento.AddYears(18) <= DateTime.Today) return true;
                    else return false;
                }
                else return false;
            }
            else return false;
        }

        protected void inpCep_TextChanged(object sender, EventArgs e)
        {
            JObject dateJson = Credenciais.GetCep(inpCep.Text);
            if (dateJson["ok"].ToString() == "false")
            {
                litMsg.Text = Elemento.Error(dateJson["msg"].ToString());
                return;
            }
            inpCep.Text = dateJson["cep"].ToString();
            inpRua.Text = dateJson["logradouro"].ToString();
            inpCidade.Text = dateJson["localidade"].ToString();
            inpEstado.Text = dateJson["uf"].ToString();
        }
    }
}