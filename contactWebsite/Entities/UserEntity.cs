using Microsoft.WindowsAzure.Storage.Table;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;

namespace contactWebsite.Entities
{
    public class UserEntity : TableEntity
    {
        public UserEntity() { }

        public UserEntity(string fullname, string username, string password)
        {
            this.PartitionKey = "person";
            this.RowKey = username;

            this.Username = username;
            this.FullName = fullname;
            this.Password = password;
        }

        public UserEntity(DynamicTableEntity entity)
        {
            this.PartitionKey = entity.PartitionKey;
            this.RowKey = entity.RowKey;

            this.Username = entity.RowKey;

            if (entity.Properties.ContainsKey("FullName"))
            {
                this.FirstName = entity.Properties["FullName"].StringValue;
            }
            if (entity.Properties.ContainsKey("Password"))
            {
                this.Password = entity.Properties["Password"].StringValue;
            }
        }

        public bool Matches(UserEntity user)
        {
            return (user.Username == this.Username) && (user.Password == this.Password);
        }
        public bool Matches(string username, string password)
        {
            return (this.Username == username) && (this.Password == password);
        }

        public String ToPublicURL()
        {
            return String.Format("~/{0}.aspx", Regex.Replace(this.Username, "[^a-zA-Z]", ""));
        }

        public string Username { get; set; }
        public string Password { get; set; }
        private string FirstName { get; set; }
        private string LastName { get; set; }
        public string FullName
        {
            get { return FirstName + " " + LastName; }
            set
            {
                var names = value.Split(' ');
                if (names.Length > 1)
                {
                    var firstname = "";
                    for (var i = 0; i < names.Length - 1; i++)
                    {
                        if (i > 0) firstname += " ";
                        firstname += names[i];
                    }
                    var lastname = names[names.Length - 1];
                    this.FirstName = firstname;
                    this.LastName = lastname;
                }
                else
                {
                    this.FirstName = names[0];
                    this.LastName = "";
                }
            }
        }
    }
}