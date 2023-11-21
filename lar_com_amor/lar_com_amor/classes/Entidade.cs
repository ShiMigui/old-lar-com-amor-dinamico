using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using lar_com_amor.classes;
using MySql.Data.MySqlClient;

namespace larcomamor.classes
{
    public class Entidade: Banco
    {
        public string Nm { get; set; }
        public string Cd { get; set; }
        public string Sg { get; set; }
        public string Ds { get; set; }

        public Entidade(string cd, string nm, string ds)
        {
            this.Cd = cd;
            this.Nm = nm;
            this.Ds = ds;
        }

        public Entidade(string cd, string nm)
        {
            this.Nm = nm;
            this.Cd = cd;
        }

        public Entidade()
        {

        }



    }
}