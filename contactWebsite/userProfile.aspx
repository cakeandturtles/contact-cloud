<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="contactWebsite.userProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1><asp:Label runat="server" ID="DisplayFullName1"></asp:Label></h1>
        <p class="lead"><asp:Label runat="server" ID="DisplayUsername1"></asp:Label></p>
        <p><asp:Button ID="ConnectButton" runat="server" OnClientClick="return ConnectButton_Click()" Text="connect"/></p>
        <p><asp:Button ID="MessageButton" runat="server" OnClientClick="return MessageButton_Click()" Text="message" Visible="false"/></p>

        <script>

            var EditButton_Click = function () {
                var dialog = "#MainContent_EditButton_Popup";
                $(dialog).css("display", "block");
                $(dialog).css("left", ($(window).width() - $(dialog).width()) / 2);
                $(dialog).css("top", ($(window).height() - $(dialog).height()) / 2);
                return false;
            }

            var ConnectButton_Click = function () {
                var dialog = "#MainContent_ConnectButton_Popup";
                $(dialog).css("display", "block");
                $(dialog).css("left", ($(window).width() - $(dialog).width()) / 2);
                $(dialog).css("top", ($(window).height() - $(dialog).height()) / 2);
                return false;
            }

            var ConnectedButton_Click = function () {
                var dialog = "#MainContent_ConnectedButton_Popup";
                $(dialog).css("display", "block");
                $(dialog).css("left", ($(window).width() - $(dialog).width()) / 2);
                $(dialog).css("top", ($(window).height() - $(dialog).height()) / 2);
                return false;
            }

            var MessageButton_Click = function () {
                var dialog = "#MainContent_MessageButton_Popup";
                $(dialog).css("display", "block");
                $(dialog).css("left", ($(window).width() - $(dialog).width()) / 2);
                $(dialog).css("top", ($(window).height() - $(dialog).height()) / 2);
                return false;
            }

            var CloseDialogs = function () {
                $("#MainContent_ConnectButton_Popup").css("display", "none");
                $("#MainContent_ConnectedButton_Popup").css("display", "none");
                $("#MainContent_EditButton_Popup").css("display", "none");
                $("#MainContent_MessageButton_Popup").css("display", "none");
                return false;
            }
        </script>

        <asp:Label runat="server" ID="EditButton_Popup" CssClass="modal" Width="600px" Height="400px">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <asp:Button CssClass="close" runat="server" OnClientClick="return CloseDialogs()" Text="x" />
                        <h4 class="modal-title">edit profile</h4>
                    </div>
                    <div style="text-align:center;width:auto;margin:0px auto;">
                        <b style="font-size:16px;">change full name</b>
                        <br /><br />
                        <asp:TextBox runat="server" ID="FullName_Input"></asp:TextBox>
                        <br />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" OnClick="return CloseDialogs()">close</button>
                        <asp:Button runat="server" ID="EditButton_Final" 
                            CssClass="btn btn-primary" OnClick="EditButton_Click_Final" Text="save changes"/>
                    </div>
                </div>
            </div>
        </asp:Label>

        <asp:Label runat="server" ID="ConnectButton_Popup" CssClass="modal" Width="600px" Height="400px">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <asp:Button CssClass="close" runat="server" OnClientClick="return CloseDialogs()" Text="x" />
                        <h4 class="modal-title">connect to <asp:Label runat="server" ID="DisplayFullName3"></asp:Label></h4>
                    </div>
                    <div style="text-align:center;width:auto;margin:0px auto;">
                        <b style="font-size:16px;">Type of relationship</b><br />
                        <i style="font-size:12px;">(what is <asp:Label runat="server" ID="DisplayFullName2"></asp:Label> to you?)</i>
                        <br /><br />
                        they are my: <asp:TextBox runat="server" ID="ConnectionType_Input"></asp:TextBox>
                        <br />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" OnClick="return CloseDialogs()">close</button>
                        <asp:Button runat="server" ID="ConnectButton_Final" 
                            CssClass="btn btn-primary" OnClick="ConnectButton_Click_Final" Text="connect"/>
                    </div>
                </div>
            </div>
        </asp:Label>

        <asp:Label runat="server" ID="ConnectedButton_Popup" CssClass="modal" Width="600px" Height="900px">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <asp:Button CssClass="close" runat="server" OnClientClick="return CloseDialogs()" Text="x" />
                        <h4 class="modal-title">edit your connection to <asp:Label runat="server" ID="DisplayFullName4"></asp:Label></h4>
                    </div>
                    <div style="text-align:center;width:auto;margin:0px auto;">
                        <b style="font-size:16px;">Type of relationship</b><br />
                        <i style="font-size:12px;">(what is <asp:Label runat="server" ID="DisplayFullName5"></asp:Label> to you?)</i>
                        <br /><br />
                        they are my: <asp:TextBox runat="server" ID="ConnectionType_Input2"></asp:TextBox>
                        <br /><br />
                        <b style="font-size:16px">Connection Level</b><br />
                        <asp:Label runat="server" ID="DisplayLevel"></asp:Label>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" OnClick="return CloseDialogs()">close</button>
                        <asp:Button runat="server" ID="ConnectedButton_Final" 
                            CssClass="btn btn-primary" OnClick="ConnectedButton_Click_Final" Text="save changes"/>
                    </div>
                </div>

                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">disconnect <asp:Label runat="server" ID="DisplayFullName6"></asp:Label></h4>
                    </div>
                    <div style="text-align:center;width:auto;margin:0px auto;color:darkred;font-weight:bold;">
                        disconnect from <asp:Label runat="server" ID="DisplayFullName7"></asp:Label>,<br />and delete your connection with them
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" OnClick="return CloseDialogs()">close</button>
                        <asp:Button runat="server" ID="DisconnectButton_Final" 
                            CssClass="btn btn-primary" OnClick="DisconnectButton_Click_Final" Text="disconnect"/>
                    </div>
                </div>
            </div>
        </asp:Label>

        <asp:Label runat="server" ID="MessageButton_Popup" CssClass="modal" Width="600px" Height="400px">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <asp:Button CssClass="close" runat="server" OnClientClick="return CloseDialogs()" Text="x" />
                        <h4 class="modal-title">send a message to <asp:Label runat="server" ID="DisplayFullName8"></asp:Label></h4>
                    </div>
                    <div style="text-align:center;width:auto;margin:0px auto;">
                        <b style="font-size:16px;">message</b>
                        <br />
                        <asp:TextBox runat="server" ID="Message_Input" MaxLength="240" TextMode="multiline" Width="300px" Height="80px"></asp:TextBox>
                        <br />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" OnClick="return CloseDialogs()">close</button>
                        <asp:Button runat="server" ID="MessageButton_Final" 
                            CssClass="btn btn-primary" OnClick="MessageButton_Click_Final" Text="send message"/>
                    </div>
                </div>
            </div>
        </asp:Label>

        <script>
            $("#MainContent_EditButton_Popup").css("display", "none");
            $("#MainContent_ConnectButton_Popup").css("display", "none");
            $("#MainContent_ConnectedButton_Popup").css("display", "none");
            $("#MainContent_MessageButton_Popup").css("display", "none");
        </script>
    </div>
</asp:Content>
