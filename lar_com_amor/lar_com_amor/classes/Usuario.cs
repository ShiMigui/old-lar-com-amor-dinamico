using System;
using System.Collections.Generic;
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
    }
}