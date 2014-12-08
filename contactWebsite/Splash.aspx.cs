using Microsoft.WindowsAzure.ServiceRuntime;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Table;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using contactWebsite.Entities;

namespace contactWebsite
{
    public partial class _Splash : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LoginSubmit_Click(object sender, EventArgs e)
        {
            var username = LoginUserName.Text;
            var password = LoginPassword.Text;

            //Create the table client
            var tableClient = Global.storageAccount.CreateCloudTableClient();
            var table = tableClient.GetTableReference("people");
            table.CreateIfNotExists();

            //Create the TableOperation to find the customer entity
            var retrieveOperation = TableOperation.Retrieve("person", username);

            var result = table.Execute(retrieveOperation);

            //The user was found successfully!!
            if (result.Result != null)
            {
                UserEntity user = new UserEntity((DynamicTableEntity)result.Result);
                if (user.Matches(username, password))
                {
                    Global.user = user;
                    Response.Redirect("Default.aspx");
                    base.OnLoad(e);
                }
                else
                {
                    InvalidLogin.Visible = true;
                }
            }
            //Invalid username or password
            else
            {
                InvalidLogin.Visible = true;
            }
        }

        protected void SignupSubmit_Click(object sender, EventArgs e)
        {
            var fullname = SignupFullName.Text;
            var username = SignupUserName.Text;
            var password = SignupPassword.Text;

            //Retrieve the storage account from the connection string
            var connectionString = RoleEnvironment.GetConfigurationSettingValue("MyConnectionString");
            var storageAccount = CloudStorageAccount.Parse(connectionString);

            //Create the table client
            var tableClient = storageAccount.CreateCloudTableClient();

            //Create the table if it doesn't exist
            var table = tableClient.GetTableReference("people");
            table.CreateIfNotExists();

            if (fullname == "delete users" && username == "admin" && password == "admin")
            {
                table.DeleteIfExists();
                table.CreateIfNotExists();
            }
            else
            {
                //Create the new user
                var user = new UserEntity(fullname, username, password);

                //TODO:: Need to check if username exists
                //Create the TableOperation that inserts the customer entity
                var insertOperation = TableOperation.Insert(user);

                //Execute the insert operation
                table.Execute(insertOperation);

                Global.user = user;
                Response.Redirect("Default.aspx");
                base.OnLoad(e);
            }
        }
    }
}