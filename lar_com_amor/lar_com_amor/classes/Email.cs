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
        private string Mail = "larcomamoroficial@outlook.com";
        private string Password = "";

        public bool SendMail(string content = "",string Subject = "", string To = "")
        {
            #region Configurações do Remetente
            SmtpClient client = new SmtpClient();
            client.Credentials = new NetworkCredential(Mail, Password);
            client.Host = "smtp.office365.com";
            client.Port = 587;
            client.EnableSsl = true;
            #endregion

            #region Configuração do Email
            MailMessage mail = new MailMessage();
            mail.To.Add(To);
            //mail.CC.Add(destinatario);
            //mail.Bcc.Add(destinatario);
            mail.From = new MailAddress(Mail, "Lar com Amor | Oficial", System.Text.Encoding.UTF8);
            mail.Subject = Subject;
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = $"<html><body>{content}</body></html>";
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