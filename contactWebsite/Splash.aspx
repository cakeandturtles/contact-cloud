<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Splash.Master" AutoEventWireup="true" CodeBehind="Splash.aspx.cs" Inherits="contactWebsite._Splash"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="jumbotron">
        <h1><span>cont@ct</span> connect express</h1>
        <p class="lead">use <span>cont@ct</span> to meet and connect people with similar interests, aesthetics, and ideas</p>
        <div style="background:white;padding:10px;padding-top:3px;width:auto;">
            <h3>log in</h3>
            <asp:TextBox ID="LoginUserName" runat="server" placeholder="username"></asp:TextBox>
            <asp:Label ID="InvalidLogin" runat="server" Visible="false">
                <span style="color: red;">Invalid Username or Password.</span>
            </asp:Label>
            <br />
            <br />
            <asp:TextBox ID="LoginPassword" runat="server" TextMode="Password" placeholder="password" ></asp:TextBox>&nbsp;&nbsp;
            <asp:Button ID="LoginSubmit" runat="server" OnClick="LoginSubmit_Click" Text="log in" />
        </div>
        <br />
        <div style="background:white;padding:10px;padding-top:3px;width:auto;">
            <h3>sign up</h3>
            <asp:TextBox ID="SignupFullName" runat="server" placeholder="full name"></asp:TextBox><br />
            <br />
            <asp:TextBox ID="SignupUserName" runat="server" placeholder="username"></asp:TextBox><br />
            <br />
            <asp:TextBox ID="SignupPassword" runat="server" TextMode="Password" placeholder="password"></asp:TextBox>&nbsp;&nbsp;
            <asp:Button ID="SignupSubmit" runat="server" OnClick="SignupSubmit_Click" Text="sign up for cont@ct" />
        </div>
    </div>

    <div class="row">
    </div>

</asp:Content>
