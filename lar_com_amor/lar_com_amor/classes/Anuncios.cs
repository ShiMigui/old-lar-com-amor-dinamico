using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lar_com_amor.classes
{
    public class Anuncios : Banco
    {

        public MySqlDataReader GetAnuncios(string command, List<string> condicoes, string offset = "0", string limit = "6")
        {
            if(condicoes!=null) if (condicoes.Count > 0) command += " AND " + string.Join(" AND ", condicoes);
            return Consultar($"{command} LIMIT {limit} OFFSET {offset}");
        }
        public List<string> GetAnimais(string txt = "", string org = "", string especie = "", string raca = "", string genero = "", string porte = "", string offset = "0", string limit = "6", bool naoAdotado = true)
        {
            List<string> anuncios = new List<string>();
            string command = $@"SELECT a.cd_animal, a.nm_animal, a.dt_nascimento FROM animal a
                LEFT JOIN pedido p ON (p.cd_animal = a.cd_animal)
                JOIN raca r ON (r.cd_raca = a.cd_raca)
                JOIN especie e ON (e.cd_especie = r.cd_especie)
                JOIN porte po ON (po.sg_porte = r.sg_porte)
                JOIN genero g ON (g.sg_genero = a.sg_genero)
                JOIN usuario u ON (u.cd_usuario = a.cd_organizacao)
                WHERE (a.nm_animal LIKE '%{txt}%' OR e.nm_especie LIKE '%{txt}%' OR r.nm_raca LIKE '%{txt}%' OR po.nm_porte LIKE '%{txt}%' OR u.nm_usuario LIKE '%{txt}%')";

            List<string> condicoes = new List<string>();
            if (naoAdotado) condicoes.Add("(p.ic_finalizado IS NULL OR p.ic_finalizado = false)");
            if (!String.IsNullOrEmpty(org)) condicoes.Add($"(a.cd_organizacao = {org})");
            if (!String.IsNullOrEmpty(especie)) condicoes.Add($"(e.cd_especie = {especie})");
            if (!String.IsNullOrEmpty(raca)) condicoes.Add($"(r.cd_raca = {raca})");
            if (!String.IsNullOrEmpty(genero)) condicoes.Add($"(g.sg_genero = '{genero}')");
            if (!String.IsNullOrEmpty(porte)) condicoes.Add($"(po.sg_porte = '{porte}')");

            using (MySqlDataReader Data = GetAnuncios(command, condicoes, offset, limit))
            {
                while (Data.Read())
                {
                    string data = Data[2].ToString().Split(' ')[0];
                    anuncios.Add(Elemento.AnuncioAnimal(Data[0].ToString(), Data[1].ToString(), Credenciais.CalcularIdadeTexto(data)));
                }
            }
            return anuncios;
        }

        public List<string> GetEventos(string txt = "", string org = "", string tipo = "", string offset = "0", string limit = "4", bool naoFinalizado = true)
        {
            List<string> anuncios = new List<string>();
            string command = $@"SELECT e.cd_evento, e.nm_evento, e.dt_inicio FROM evento e
            JOIN usuario u ON (u.cd_usuario = e.cd_organizacao)
            JOIN tipo_evento te ON (te.cd_tipo = e.cd_tipo)
            WHERE (e.nm_evento LIKE '%{txt}%' OR e.ds_evento LIKE '%{txt}%' OR u.nm_usuario LIKE '%{txt}%' OR u.cd_usuario = '%{txt}%')";

            List<string> condicoes = new List<string>();
            if (naoFinalizado) condicoes.Add("e.dt_final > NOW()");
            if (!String.IsNullOrEmpty(org)) condicoes.Add($"(e.cd_organizacao = {org})");
            if (!String.IsNullOrEmpty(tipo)) condicoes.Add($"(e.cd_tipo = '{tipo}' OR te.nm_tipo LIKE '%{tipo}%')");

            using (MySqlDataReader Data = GetAnuncios(command, condicoes, offset, limit))
            {

                while (Data.Read())
                {
                    string data = Data[2].ToString().Split(' ')[0];
                    anuncios.Add(Elemento.AnuncioEvento(Data[0].ToString(), Data[1].ToString(), data));
                }
            }
            return anuncios;
        }

        internal List<string> GetOrganizacoes(string txt = "", string offset = "0", string limit = "6")
        {
            List<string> anuncios = new List<string>();
            string command = $@"SELECT u.cd_usuario, u.nm_usuario, c.nm_cidade, e.sg_estado 
                FROM usuario u
                JOIN cep ON (cep.cd_cep = u.cd_cep)
                JOIN cidade c ON (c.cd_cidade = cep.cd_cidade)
                JOIN estado e ON (e.sg_estado = c.sg_estado)
                WHERE u.sg_tipo = 'O' AND u.ic_ativo = 1 
                AND (u.nm_usuario LIKE '%{txt}%' OR u.ds_usuario LIKE '%{txt}%' OR c.nm_cidade LIKE '%{txt}%' OR e.nm_estado LIKE '%{txt}%')";

            using (MySqlDataReader Data = GetAnuncios(command, null, offset, limit))
            {

                while (Data.Read())
                {
                    anuncios.Add(Elemento.AnuncioOrganizacao(Data[0].ToString(), Data[1].ToString(), $"{Data[2]}, {Data[3]}"));
                }
            }
            return anuncios;
        }
    }
}