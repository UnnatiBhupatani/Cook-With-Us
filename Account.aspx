<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="assets_Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div style="background-color:white"  margin-left:"40px;">
        <br />
        <br />
        <br />
        
       <table cellpadding="3" cellspacing="0" border="1" style="width:95%;" border-color:"black;">
            <tr align="center" valign="top">
                <td align="center" valign="top" style="width:40%;">
        <%--<div id="divInputs" runat="server" style="text-align:left; ">
             <h2><a href="Account.aspx" target="_self" >Personal Information</a></h2><br />
               <h2><a href="UserAddRecipe.aspx" target="_self">Add Recipe</a></h2><br />
               <h2><a href="ShowUserRec.aspx" target="_parent">Show  My Recipe</a></h2><br />
             </div>--%>
                    <center>
                    <br />
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/assets/GIF/animation_login.gif" Height="20%" Width="20%"></asp:Image>
                    
            <div style="text-align:center;" id="divInputs">
                <h3 style="font-family:Verdana;"><a href="Account.aspx" target="_self" >Personal Information |</a>
               <a href="UserAddRecipe.aspx" target="_self"> Add Recipe |</a>
               <a href="ShowUserRec.aspx" target="_parent"> Show My Recipe</a></h3>
            </div>

        </td>
                </tr>
            <tr align="center" valign="top">
                <td align="center" valign="top" style="width:40%;">
        <asp:Label ID="lbperinfo" runat="server" Text="Personal Information" ForeColor="Black" Font-Bold="true" Font-Size="XX-Large" Font-Underline="true" Font-Names="Verdana" ></asp:Label><br />
              </td> 
                </tr>
          <tr align="center" valign="top">
                <td align="center" valign="top" style="width:40%;">
                

         <asp:GridView ID="dtGrd_acc" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black"  Width="65%" OnRowEditing="dtGrd_acc_RowEditing" OnRowUpdating="dtGrd_acc_RowUpdating" OnRowCancelingEdit="dtGrd_acc_RowCancelingEdit" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
            <Columns>


                <asp:BoundField DataField="U_id" HeaderText="Id" ReadOnly="True" >
                    <ControlStyle Width="95%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="5%" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="UserName">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtuname" runat="server" Text='<%# Bind("U_name") %>'></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="lbluname" runat="server" Text='<%# Bind("U_name") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="90%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="5%" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Contact No">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtucon" runat="server" Text='<%# Bind("U_cont") %>'></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="lblucon" runat="server" Text='<%# Bind("U_cont") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="90%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="5%" />
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
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="5%" />
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Password ">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtupass" runat="server" Text='<%# Bind("U_pass") %>'></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="lblupass" runat="server" Text='<%# Bind("U_pass") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="90%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="5%" />
                </asp:TemplateField>

                <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowEditButton="True">
                    <ControlStyle Font-Names="Verdana" BackColor="#990000" ForeColor="White" Font-Size="1em" Height="40px" Width="50%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
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

                </td>
                </tr>
   </table>     

</div>
    
</asp:Content>

