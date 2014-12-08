using Microsoft.WindowsAzure.Storage.Table;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace contactWebsite.Entities
{
    public class MessageEntity : TableEntity
    {
        public MessageEntity() { }

        public MessageEntity(string to_user, int id, string from_user)
        {
            this.PartitionKey = to_user;
            this.RowKey = id +"";

            this.ToUser = to_user;
            this.FromUser = from_user;
            this.ID = id;
            this.Datetime = DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
        }

        public string ToUser { get; set; }
        public string FromUser { get; set; }
        public int ID { get; set; }
        public string Message { get; set; }
        public string Datetime { get; set; }
    }
}