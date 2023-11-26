using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using lar_com_amor.classes;
using MySql.Data.MySqlClient;

namespace lar_com_amor.classes
{
    public class Animal : Banco
    {
        public string Cd { get; set; }
        public string Nm { get; set; }
        public string Ds { get; set; }
        public string Nascimento { get; set; }
        public bool Castrado { get; set; }

        public Parametro Raca = null;
        public Parametro Especie = null;
        public Parametro Porte = null;
        public Parametro Genero = null;
        public Usuario Organizacao = null;


        public bool ByCode(string cd)
        {
            List<Parametro> lista = new List<Parametro> { new Parametro("pcd_animal", cd) };
            using (MySqlDataReader Data = Consultar("PegarAnimalCodigo", lista))
            {
                if(!Data.HasRows) return false;
                if (Data.Read())
                {
                    Cd = cd;
                    Nm = Data["nm_animal"].ToString();
                    Ds = Data["ds_animal"].ToString();
                    Nascimento = Data["dt_nascimento"].ToString().Split(' ')[0];
                    Castrado = Data["ic_castrado"].ToString().ToLower() == "true";
                    Raca = new Parametro(Data["nm_raca"].ToString(), Data["cd_raca"].ToString());
                    Especie = new Parametro(Data["nm_especie"].ToString(), Data["cd_especie"].ToString());
                    Porte = new Parametro(Data["nm_porte"].ToString(), Data["sg_porte"].ToString());
                    Genero = new Parametro(Data["nm_genero"].ToString(), Data["sg_genero"].ToString());
                    Organizacao = new Usuario(Data["cd_usuario"].ToString(), Data["nm_usuario"].ToString());
                    return true;
                }
                else return false;
            }
        }
    }
}