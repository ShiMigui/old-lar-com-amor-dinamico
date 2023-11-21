using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI.WebControls;
using lar_com_amor.classes;
using MySql.Data.MySqlClient;

namespace lar_com_amor.classes
{
    public class Usuario
    {
        #region Props
        public string Cd = null;
        public string Nm = null;
        public string Mail = null;
        public string Ds = null;
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

        public bool VerificarLogin()
        {
            if (HttpContext.Current.Session["nm_user"] != null) Nm = HttpContext.Current.Session["nm_user"].ToString();
            if (HttpContext.Current.Session["cd_user"] != null) Cd = HttpContext.Current.Session["cd_user"].ToString();
            if (HttpContext.Current.Session["tipo_user"] != null) Sg = HttpContext.Current.Session["tipo_user"].ToString();

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

            lit.Text = $"<a href='./perfil.aspx' id='account' class='flex alignCenter'>{(Nm.Length >= 5 ? Nm.Substring(0, 5) : Nm)}{Elemento.FotoAnuncioOrganizacao(Cd, Nm, false)}</a>";
            lit.Text += "<img id='arrow-down' src='./img/icons/arrow-down.png' alt='ícone de seta para baixo'>";
        }
    }
}