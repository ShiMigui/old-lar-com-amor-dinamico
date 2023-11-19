using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;

namespace lar_com_amor.classes
{
    public class Arquivo
    {

        public string caminho { get; set; }

        static public bool Exists(string caminho)
        {
            return File.Exists(Arquivo.AbsPath(caminho));
        }

        static public string AbsPath(string caminho)
        {
            return HttpContext.Current.Server.MapPath(caminho);
        }
    }
}