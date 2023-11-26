using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using lar_com_amor.classes;
using MySql.Data.MySqlClient;

namespace lar_com_amor.classes
{
    public class Usuario : Banco
    {
        #region Props
        public string Cd = null;
        public string Nm = null;
        public string Mail = null;
        public string Ds = null;
        public string Telefone = null;
        public string Cep = null;
        public string Rua = null;
        public string Cidade = null;
        public string UF = null;
        public bool Logado = false;
        public bool IsOrg = false;

        private string _LastPage;
        public string LastPage
        {
            get { return _LastPage; }
            set { _LastPage = value; }
        }

        private string _Sg;

        public string Sg
        {
            get { return _Sg; }
            set
            {
                if (value.Length == 1)
                {
                    _Sg = value;
                    IsOrg = value == "O";
                }
                else
                {
                    throw new ArgumentException("O valor deve conter apenas um caractere.");
                }
            }
        }
        #endregion

        public Usuario()
        {
            
        }

        public Usuario(string cd, string nm)
        {
            Cd = cd;
            Nm = nm;
        }


        public static void Login(string cd_user, string nm_user, string tipo_user="A")
        {
            HttpContext.Current.Session["nm_user"] = nm_user;
            HttpContext.Current.Session["cd_user"] = cd_user;
            HttpContext.Current.Session["tipo_user"] = tipo_user;
        }
        public bool VerificarLogin()
        {
            if (HttpContext.Current.Session["nm_user"] != null && HttpContext.Current.Session["cd_user"] != null && HttpContext.Current.Session["tipo_user"] != null)
            {
                Nm = HttpContext.Current.Session["nm_user"].ToString();
                Cd = HttpContext.Current.Session["cd_user"].ToString();
                Sg = HttpContext.Current.Session["tipo_user"].ToString();
            }

            Logado = !string.IsNullOrEmpty(Nm) && !string.IsNullOrEmpty(Cd) && !string.IsNullOrEmpty(Sg);
            return Logado;
        }

        public void HeaderContent(Literal lit)
        {
            VerificarLogin();
            if (!Logado)
            {
                lit.Text = "<a href='./login.aspx' id='account' class='flex alignCenter'>Entrar<img src='./img/icons/account.png' alt='ícone de login'></a>";
                return;
            }
            string initials = GetInitials(Nm);
            lit.Text = $"<a href='./perfil.aspx' id='account' class='flex alignCenter'>{initials}{Elemento.FotoAnuncioOrganizacao(Cd, Nm, false)}</a>";
            lit.Text += "<img id='arrow-down' src='./img/icons/arrow-down.png' alt='ícone de seta para baixo'>";
        }

        private string GetInitials(string fullName)
        {
            if (string.IsNullOrWhiteSpace(fullName)) return string.Empty;

            string[] parts = fullName.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            string initials = string.Join("", parts.Select(p => p[0]));

            return initials;
        }

        internal bool ByCode(string cd)
        {
            string command = $@"SELECT u.nm_usuario, u.nm_email, u.nm_telefone, u.ds_usuario, c.nm_rua, ci.nm_cidade, ci.sg_estado, u.cd_cep
                            FROM usuario u 
                            JOIN cep c ON (c.cd_cep = u.cd_cep)
                            JOIN cidade ci ON (ci.cd_cidade = c.cd_cidade)
                            WHERE u.cd_usuario = {cd} AND u.sg_tipo = 'O' AND ic_ativo = 1;";

            using(MySqlDataReader Data = Consultar(command))
            {
                if (Data.Read())
                {
                    try
                    {
                        Cd = cd;
                        Nm = Data["nm_usuario"].ToString();
                        Ds = Data["ds_usuario"].ToString();
                        Telefone = Data["nm_telefone"].ToString();
                        UF = Data["sg_estado"].ToString();
                        Cidade = Data["nm_cidade"].ToString();
                        Rua = Data["nm_rua"].ToString();
                        Cep = Data["cd_cep"].ToString();   
                        return true;
                    }
                    catch {
                        return false;
                    }
                }
                else return false;
            }
        }

        internal bool Update(string cd, string Nome, string Descricao, string Cep, string Telefone, string Mail)
        {
            List<Parametro> parametros = new List<Parametro>();
            parametros.Add(new Parametro("pcd_usuario", cd));
            parametros.Add(new Parametro("pnm_usuario", Nome));
            parametros.Add(new Parametro("pnm_email", Mail));
            parametros.Add(new Parametro("pnm_telefone", Telefone));
            parametros.Add(new Parametro("pds_usuario", Descricao));
            parametros.Add(new Parametro("pcd_cep", Cep));
            try
            {
                Executar("AtualizarPerfilUsuario", parametros);
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}