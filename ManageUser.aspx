<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageUser.aspx.cs" Inherits="ManageUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div style="background-color:white">
        <br />
        <br />
        <br />
         <br />
         <br />
         <br />
         <br />
         <center>
            <asp:Label ID="lblperinfo" runat="server" Text="User Information" Font-Bold="true" ForeColor="Black" Font-Underline="true" Font-Size="X-Large" Font-Names="Verdana" ></asp:Label><br /><br />
          <asp:GridView ID="dtGrd_acc" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black"  Width="65%" OnRowEditing="dtGrd_acc_RowEditing" OnRowUpdating="dtGrd_acc_RowUpdating" OnRowCancelingEdit="dtGrd_acc_RowCancelingEdit" OnRowDeleting="dtGrd_acc_RowDeleting" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
            <Columns>


                <asp:BoundField DataField="U_id" HeaderText="Id" ReadOnly="True" >
                    <ControlStyle Width="95%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="15%" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="UserName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtuname" runat="server" Text='<%# Bind("U_name") %>'></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="lbluname" runat="server" Text='<%# Bind("U_name") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="90%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="35%" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Contact No">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtucon" runat="server" Text='<%# Bind("U_cont") %>'></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="lblucon" runat="server" Text='<%# Bind("U_cont") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="90%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="35%" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Gender ">
                    <EditItemTemplate>
                        
                        <asp:RadioButton ID="rdbmale" runat="server" GroupName="gender" Text="Male"></asp:RadioButton>
                        <asp:RadioButton ID="rdmfemale" runat="server" GroupName="gender" Text="Female"></asp:RadioButton>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="lblugen" runat="server" Text='<%# Bind("U_gen") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="90%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="35%" />
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Password ">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtupass" runat="server" Text='<%# Bind("U_pass") %>'></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="lblupass" runat="server" Text='<%# Bind("U_pass") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="90%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="35%" />
                </asp:TemplateField>

                <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowEditButton="True">
                    <ControlStyle Font-Names="Verdana" BackColor="#990000" ForeColor="White" Font-Size="1em" Height="40px" Width="95%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="25%" />
                </asp:CommandField>
                 <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="True"  ControlStyle-BackColor="#990000" ControlStyle-ForeColor="White" ControlStyle-Font-Size="1em" ControlStyle-Height="40px" ControlStyle-Width="95%" ControlStyle-Font-Names="Verdana" >
        <ControlStyle BackColor="#990000" Font-Names="Verdana" Font-Size="1em"  ForeColor="White" Height="40px" Width="95%"></ControlStyle>
                <ItemStyle Width="7%" />
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
             <br />
             <br />
             </center>
         </div>
</asp:Content>

