using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using lar_com_amor.classes;
using MySql.Data.MySqlClient;

namespace larcomamor.classes
{
    public class Animal : Banco
    {
        public string Cd { get; set; }
        public string Nm { get; set; }
        public string Ds { get; set; }
        public string Nascimento { get; set; }
        public bool Castrado { get; set; }

        public Parametro Raca = new Parametro();
        public Parametro Especie = new Parametro();
        public Parametro Porte = new Parametro();
        public Parametro Genero = new Parametro();
        public Usuario Organizacao = new Usuario();



    }
}