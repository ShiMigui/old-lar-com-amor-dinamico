using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lar_com_amor.classes
{
    public class Banco
    {
        string linhaConexao = null;
        MySqlConnection conexao = null;
        public MySqlDataReader data = null;

        public Banco()
        {
            linhaConexao = Credenciais.Conexao();
        }

        public void Fechar()
        {
            if (conexao != null) if (conexao.State == System.Data.ConnectionState.Open) conexao.Close();
        }

        public void Executar(string comando)
        {
            try
            {
                using (MySqlConnection conexao = new MySqlConnection(linhaConexao))
                {
                    conexao.Open();
                    using (MySqlCommand comandoSql = new MySqlCommand(comando, conexao))
                    {
                        comandoSql.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public void Executar(string comando, List<Parametro> parametros)
        {
            try
            {
                using (MySqlConnection conexao = new MySqlConnection(linhaConexao))
                {
                    conexao.Open();
                    using (MySqlCommand comandoSql = AddParametersCommand(new MySqlCommand(comando, conexao), parametros))
                    {
                        comandoSql.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public MySqlDataReader Consultar(string comando)
        {
            try
            {
                this.conexao = new MySqlConnection(linhaConexao);
                conexao.Open();
                MySqlCommand comandoSql = new MySqlCommand(comando, conexao);
                data = comandoSql.ExecuteReader();
                return data;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public MySqlDataReader Consultar(string comando, List<Parametro> parametros)
        {
            try
            {
                this.conexao = new MySqlConnection(linhaConexao);
                conexao.Open();
                MySqlCommand command = new MySqlCommand(comando, conexao);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                command.Parameters.Clear();
                command = AddParametersCommand(command, parametros);
                data = command.ExecuteReader();
                return data;

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        MySqlCommand AddParametersCommand(MySqlCommand comandoSql, List<Parametro> parametros)
        {
            comandoSql.CommandType = System.Data.CommandType.StoredProcedure;
            comandoSql.Parameters.Clear();
            if (parametros == null) return comandoSql;
            if (parametros.Count <= 0) return comandoSql;
            for (int x = 0; x < parametros.Count; x++) comandoSql.Parameters.AddWithValue(parametros[x].Nm, parametros[x].Vl);
            return comandoSql;
        }
    }
}