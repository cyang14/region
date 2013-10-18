<%@ Page Title="" Language="C#" MasterPageFile="~/ASLAControl.Master" AutoEventWireup="true" CodeBehind="Region.aspx.cs" Inherits="AslaWebsite.Region" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <style type="text/css">
        .style1
        {
            height: 26px;
        }
         .auto-style1
         {
             height: 48px;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <strong>&nbsp;Add/Edit Region</strong></p>
    <table class="style5">
        <tr>
            <td rowspan="3">
                <asp:ListBox ID="ListBox1" runat="server" Width="127px" 
                    onselectedindexchanged="ListBox1_SelectedIndexChanged" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" DataTextField="RegionName" 
                    DataValueField="RegionID" ViewStateMode="Enabled">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                </asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
                    SelectCommand="SELECT [RegionID], [RegionName] FROM [Table_1]" 
                    ViewStateMode="Disabled">
                </asp:SqlDataSource>
            </td>
            <td class="style1">
                <asp:Label ID="RegionID" runat="server" Text="Region ID"></asp:Label>
            </td>
            <td class="style1">
                <asp:TextBox ID="RegionIDBox" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="RegionName" runat="server" Text="Region Name"></asp:Label>
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="RegionNameBox" runat="server"></asp:TextBox>
                <asp:Label ID="ErrorMsg" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Cancle" runat="server" Text="Cancle" Height="26px" onclick="Cancle_Click" Width="68px" />
                <asp:Button ID="Save" runat="server" Text="Save" onclick="Save_Click" Width="68px" />
            &nbsp;<asp:Button ID="Delete" runat="server" Text="Delete" onclick="Delete_Click" Width="67px"/>
            </td>
        </tr>
    </table>
</asp:Content>
