<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="contactWebsite._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>ASP.NET</h1>
        <p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS and JavaScript.</p>
        <p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>
    </div>

    <%
        string[] messages = {"step it up sniper", "gotta go fast"};
        for (var i = 0; i < messages.Length; i++){
            %>
            <div class="row" style="background:white;border-bottom: 1px solid #cccccc;padding-top:10px;padding-bottom: 10px;">
                <div class="col-md-4">
                    <div style="width:60px;height:60px;background:red;float:left;">
                    </div>
                    <p style="float:left; margin-left:20px;">
                        <% =messages[i] %>
                    </p>
                    <div style="clear:both;padding-top:0px;line-height:2px;">
                        <br />
                        <div style="width:80px;height:10px;float:left;"></div>
                        <% string[] buttons = {
                                             "comment",
                                             "share",
                                             "hide"
                                         };
                           for (var j = 0; j < buttons.Length; j++)
                           {%>
                               <a class="btn btn-default"  style="float:left;padding: 2px;margin-left:10px;background: #808080;border-color:#808080" 
                                href="#"><%=buttons[j] %></a>
                           <%}%>
                    </div>
                </div>
            </div>
        <%}%>

</asp:Content>

