using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;

namespace lar_com_amor.classes
{
    public class Email
    {

        public static bool EnviarEmail(string emailDestinatario, string corpo, string assunto)
        {
            #region Declaração de Variáveis
            string remetente = "";
            string senha = "";
            string destinatario = "";
            #endregion

            #region Atribuição dos Valores
            remetente = "larcomamoroficial@outlook.com";
            senha = "OsIncriveis";
            destinatario = emailDestinatario;
            #endregion

            #region Configurações do Remetente
            SmtpClient client = new SmtpClient();
            client.Credentials = new NetworkCredential(remetente, senha);
            client.Host = "smtp-mail.outlook.com";
            //client.Host = "smtp.office365.com";
            client.Port = 587;
            client.EnableSsl = true;
            #endregion

            #region Configuração do Email
            MailMessage mail = new MailMessage();
            mail.To.Add(destinatario);
            //mail.CC.Add(destinatario);
            //mail.Bcc.Add(destinatario);
            mail.From = new MailAddress(remetente, "lar com amor", System.Text.Encoding.UTF8);
            mail.Subject = assunto;
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = $"<html><body>{corpo}</body></html>";
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            #endregion

            #region Envio do Email
            try
            {
                client.Send(mail);
                return true;
            }
            catch
            {
                return false;
            }
            #endregion
        }
    }
}