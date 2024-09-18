<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <br />
    <br />
    
    <center> 
        <div style="background-color:white; margin-left: 40px;">
            <br />
            <br /><br />
        <asp:Label ID="Label1" runat="server" Text="Add Category" ForeColor="Black" Font-Bold="true" Font-Size="XX-Large" Font-Underline="true" Font-Names="Verdana"></asp:Label>
        <br /><br />

<asp:Label ID="lblcat" runat="server" Text="Enter Category" ForeColor="Black" ></asp:Label>
<asp:TextBox ID="txtcat" runat="server"></asp:TextBox>
            
            <br />
           <br />

<asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click"></asp:Button>
        <br />
        <br />

            <asp:GridView ID="dtGrd_cat" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" OnRowCancelingEdit="dtGrd_cat_RowCancelingEdit" OnRowEditing="dtGrd_cat_RowEditing" OnRowUpdating="dtGrd_cat_RowUpdating" Width="65%" OnRowDeleting="dtGrd_cat_RowDeleting" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
            <Columns>
                <asp:BoundField DataField="FCM_id" HeaderText="Id" ReadOnly="True" >
                    <ControlStyle Width="95%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="15%" />
                </asp:BoundField>
                
                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="lblFCName" runat="server" Text='<%# Bind("FCM_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblFCName" runat="server" Text='<%# Bind("FCM_name") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="90%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="35%" />
                </asp:TemplateField>
                
                <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowEditButton="True">
                    <ControlStyle Font-Names="Verdana" BackColor="#990000" ForeColor="White" Font-Size="1em" Height="40px" Width="95%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="25%" />
                </asp:CommandField>
                <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="True" ControlStyle-BackColor="#990000" ControlStyle-ForeColor="White" ControlStyle-Font-Size="1em" ControlStyle-Height="40px" ControlStyle-Width="95%" ControlStyle-Font-Names="Verdana" >
                    <ControlStyle BackColor="#990000" Font-Names="Verdana" Font-Size="1em" ForeColor="White" Height="40px" Width="95%"></ControlStyle>
                    <ItemStyle Width="25%" />
                </asp:CommandField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>


            </div>
        
    </center>
</asp:Content>

