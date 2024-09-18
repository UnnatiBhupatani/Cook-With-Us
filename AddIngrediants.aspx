<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddIngrediants.aspx.cs" Inherits="AddIngrediants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center>
    <div style="background-color:white"  margin-left: 40px;">
        <br />
        <br />
        <br />
        <br /><br /><br />
<asp:Label ID="lblingadd" runat="server" Text="Add Ingrediants"  Font-Size="XX-Large" ForeColor="Black" Font-Bold="true"  Font-Underline="true" Font-Names="Verdana"></asp:Label>
                <br /><br />
<asp:Label ID="lvling" runat="server" Text="Enter Ingrediants Name:" ForeColor="Black" ></asp:Label>
<asp:TextBox ID="txting" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="valingname" runat="server" ControlToValidate="txting" Display="Dynamic" ErrorMessage="Enter Ingridents Name" Font-Names="Verdana" Font-Size="0.8em" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br /><br />

        <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Cancle" OnClick="Button2_Click1"></asp:Button>
        <br /><br /><br />


        <asp:GridView ID="dtGrd_ing" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black"  Width="65%" OnRowEditing="dtGrd_ing_RowEditing" OnRowUpdating="dtGrd_ing_RowUpdating" OnRowCancelingEdit="dtGrd_ing_RowCancelingEdit" OnRowDeleting="dtGrd_ing_RowDeleting" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" >
            <Columns>
                <asp:BoundField DataField="ING_id" HeaderText="Id" ReadOnly="True" >
                    <ControlStyle Width="95%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="15%" />
                </asp:BoundField>
                
                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="lblINGname" runat="server" Text='<%# Bind("ING_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblINGname" runat="server" Text='<%# Bind("ING_name") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="90%" />
                    <ItemStyle  VerticalAlign="Top" Width="35%" />
                </asp:TemplateField>
                
                <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowEditButton="True">
                    <ControlStyle Font-Names="Verdana" BackColor="#990000" ForeColor="White" Font-Size="1em" Height="40px" Width="95%" />
                    <ItemStyle  VerticalAlign="Top" Width="25%" />
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

