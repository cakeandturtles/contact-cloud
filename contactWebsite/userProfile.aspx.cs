using contactWebsite.Entities;
using Microsoft.WindowsAzure.ServiceRuntime;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.Table;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace contactWebsite
{
    public partial class userProfile : System.Web.UI.Page
    {
        protected CloudTable peopleTable;
        protected CloudTable connectionTable;
        protected CloudTable messageTable;
        protected UserEntity user;
        protected ConnectionEntity loaded_connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Global.user == null){
                Response.Redirect("Splash.aspx");
                base.OnLoad(e);
            }

            try
            {
                var username = Request.QueryString["username"].ToString();

                //Create the table client
                var tableClient = Global.storageAccount.CreateCloudTableClient();
                peopleTable = tableClient.GetTableReference("people");
                peopleTable.CreateIfNotExists();

                connectionTable = tableClient.GetTableReference("connections");
                connectionTable.CreateIfNotExists();

                messageTable = tableClient.GetTableReference("messages");
                messageTable.CreateIfNotExists();

                //Create the TableOperation to find the customer entity
                var retrieveOperation = TableOperation.Retrieve("person", username);

                var result = peopleTable.Execute(retrieveOperation);

                //The user was found successfully!!
                if (result.Result != null)
                {
                    user = new UserEntity((DynamicTableEntity)result.Result);
                    DisplayFullName1.Text = user.FullName;
                    DisplayFullName2.Text = user.FullName;
                    DisplayFullName3.Text = user.FullName;
                    DisplayFullName4.Text = user.FullName;
                    DisplayFullName6.Text = user.FullName;
                    DisplayFullName7.Text = user.FullName;
                    DisplayFullName8.Text = user.FullName;
                    DisplayUsername1.Text = user.Username;

                    loaded_connection = null;

                    if (Global.user.Matches(user))
                    {
                        ConnectButton.Text = "edit profile";
                        ConnectButton.OnClientClick = "return EditButton_Click()";

                        FullName_Input.Attributes.Add("value", user.FullName);
                    }
                    else
                    {
                        //Let's check to see if we are already connected!!
                        var retrieveOperation2 = TableOperation.Retrieve(Global.user.Username, username);
                        var result2 = connectionTable.Execute(retrieveOperation2);

                        if (result2.Result != null)
                        {
                            ConnectButton.Text = "edit connection";
                            ConnectButton.OnClientClick = "return ConnectedButton_Click()";
                            MessageButton.Visible = true;

                            loaded_connection = new ConnectionEntity((DynamicTableEntity)result2.Result);

                            ConnectionType_Input2.Attributes.Add("value", loaded_connection.Type);
                            DisplayLevel.Text = "lvl. " + loaded_connection.Level;
                        }
                    }
                }
                //Invalid username or password
                else
                {
                    Response.Redirect("DoesNotExist.aspx");
                    base.OnLoad(e);
                }
            }
            catch (Exception ex)
            {
                //Response.Redirect("Default.aspx");
                //base.OnLoad(e);
            }
        }


        protected void EditButton_Click_Final(object sender, EventArgs e)
        {
            var retrieveOperation = TableOperation.Retrieve<UserEntity>("person", user.Username);
            var result = peopleTable.Execute(retrieveOperation);

            if (result.Result != null)
            {
                var updateUser = (UserEntity)result.Result;
                updateUser.FullName = FullName_Input.Text;

                var replaceOperation = TableOperation.Replace(updateUser);
                peopleTable.Execute(replaceOperation);
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void ConnectButton_Click_Final(object sender, EventArgs e)
        {
            var connection = new ConnectionEntity(Global.user.Username, user.Username);
            connection.Level = 0;
            connection.Type = ConnectionType_Input.Text;
            var insertOperation = TableOperation.Insert(connection);
            connectionTable.Execute(insertOperation);
            Response.Redirect(Request.RawUrl);
        }

        protected void ConnectedButton_Click_Final(object sender, EventArgs e)
        {
            var retrieveOperation = TableOperation.Retrieve<ConnectionEntity>(loaded_connection.MyUsername, loaded_connection.TheirUsername);
            var result = connectionTable.Execute(retrieveOperation);

            if (result.Result != null)
            {
                var updateConnection = (ConnectionEntity)result.Result;
                updateConnection.Type = ConnectionType_Input2.Text;

                var replaceOperation = TableOperation.Replace(updateConnection);
                connectionTable.Execute(replaceOperation);
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void DisconnectButton_Click_Final(object sender, EventArgs e)
        {
            var retrieveOperation = TableOperation.Retrieve<ConnectionEntity>(loaded_connection.MyUsername, loaded_connection.TheirUsername);
            var result = connectionTable.Execute(retrieveOperation);

            if (result.Result != null)
            {
                var deleteOperation = TableOperation.Delete((ConnectionEntity)result.Result);
                connectionTable.Execute(deleteOperation);
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void MessageButton_Click_Final(object sender, EventArgs e)
        {
            var max_id = 1;
            try
            {
                var exQuery = new TableQuery<MessageEntity>().Where(
                    TableQuery.GenerateFilterCondition("PartitionKey", QueryComparisons.Equal, user.Username));

                List<MessageEntity> results = messageTable.ExecuteQuery(exQuery).Select(entry => (MessageEntity)entry).ToList();
                for (var i = 0; i < results.Count; i++){
                    if (results.ElementAt(i).ID >= max_id)
                        max_id = results.ElementAt(i).ID + 1;
                }
            }
            catch (Exception ex) { }

            var message = new MessageEntity(user.Username, max_id, Global.user.Username);
            message.Message = Message_Input.Text;
            var insertOperation = TableOperation.Insert(message);
            messageTable.Execute(insertOperation);
            Response.Redirect(Request.RawUrl);
        }
    }
}