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

        public Usuario()
        {
            VerificarLogin();
            Sg = "A";
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