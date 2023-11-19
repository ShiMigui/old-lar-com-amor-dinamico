using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lar_com_amor.classes
{
    public class Parametro
    {
        public string Nm = "";
        public string Vl = "";

        public Parametro(string Nm, string Vl)
        {
            this.Nm = Nm;
            this.Vl = Vl;
        }


        public Parametro()
        {
        }
    }
}