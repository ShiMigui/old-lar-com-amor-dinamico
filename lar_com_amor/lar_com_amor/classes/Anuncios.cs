using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lar_com_amor.classes
{
    public class Anuncios : Banco
    {

        public MySqlDataReader GetAnuncios(string command, string offset = "0", string limit = "6")
        {
            return Consultar($"{command} LIMIT {limit} OFFSET {offset}");
        }
        public List<string> GetAnimais(string txt = "", string org = "", string especie = "", string raca = "", string genero = "", string porte = "", string offset = "0", string limit = "6", bool naoAdotado = true)
        {
            List<string> anuncios = new List<string>();
            string command = $@"SELECT a.cd_animal, a.nm_animal, a.dt_nascimento FROM animal a
                LEFT JOIN pedido p ON (p.cd_animal = a.cd_animal)
                WHERE ()";

            List<string> condicoes = new List<string>();
            if (naoAdotado) condicoes.Add("(p.ic_finalizado IS NULL OR p.ic_finalizado = false)");
            if (!String.IsNullOrEmpty(org)) condicoes.Add($"(a.cd_organizacao = {org})");

            if (condicoes.Count > 0) command += string.Join(" AND ", condicoes);

            using (MySqlDataReader Data = GetAnuncios(command, offset, limit))
            {
                while (Data.Read()) anuncios.Add(Elemento.AnuncioAnimal(Data[0].ToString(), Data[1].ToString(), Data[2].ToString()));
            }
            return anuncios;
        }
    }
}