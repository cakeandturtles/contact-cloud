using Microsoft.WindowsAzure.Storage.Table;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace contactWebsite.Entities
{
    public class ConnectionEntity : TableEntity
    {
        public ConnectionEntity() { }

        public ConnectionEntity(string my, string their)
        {
            this.PartitionKey = my;
            this.RowKey = their;

            this.MyUsername = my;
            this.TheirUsername = their;
        }

        public ConnectionEntity(DynamicTableEntity entity)
        {
            this.PartitionKey = entity.PartitionKey;
            this.RowKey = entity.RowKey;

            this.MyUsername = entity.PartitionKey;
            this.TheirUsername = entity.RowKey;

            if (entity.Properties.ContainsKey("Level"))
            {
                this.Level = (int)entity.Properties["Level"].Int32Value;
            }
            if (entity.Properties.ContainsKey("Type"))
            {
                this.Type = entity.Properties["Type"].StringValue;
            }
        }

        public string MyUsername { get; set; }
        public string TheirUsername { get; set; }
        public int Level { get; set; }
        public string Type { get; set; }
    }
}