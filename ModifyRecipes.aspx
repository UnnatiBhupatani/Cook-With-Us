<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ModifyRecipes.aspx.cs" Inherits="ModifyRecipes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
    <div style="background-color:white" margin-left:"40px;" >
        <br />
        <br />
        <br />
        <br /><br /><br />

        <asp:Label ID="Label1" runat="server" Text="Modify Recipe " ForeColor="Black" Font-Underline="true" Font-Bold="true" Font-Size="XX-Large" Font-Names="Verdana"></asp:Label><br /><br />
        <asp:Label ID="lblrecname" runat="server" Text=" Select Recipe :" ForeColor="Black"></asp:Label>&nbsp;&nbsp;
        <asp:DropDownList ID="drprecname" runat="server" OnSelectedIndexChanged="drprecname_SelectedIndexChanged1" AutoPostBack="true"></asp:DropDownList>
        <br />
        <br />

       <table cellpadding="8" cellspacing="10" border="1" style="width:95%;" align="center;" border-color="black;">
            <tr align="left" valign="top">
                <td align="center" valign="top" style="width:40%;" rowspan="9">
<asp:GridView ID="dtGrd_rec" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black"  Width="65%" OnRowCancelingEdit="dtGrd_rec_RowCancelingEdit" OnRowDeleting="dtGrd_rec_RowDeleting" OnRowEditing="dtGrd_rec_RowEditing" OnRowUpdating="dtGrd_rec_RowUpdating1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
            <Columns>

                <%--<asp:BoundField DataField="RM_id" HeaderText="Id" ReadOnly="True" >
                    <ControlStyle Width="95%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="15%" />
                </asp:BoundField>--%>

                <asp:TemplateField HeaderText="Id">
                    <ItemTemplate>
                        <asp:Label ID="lblrmid" runat="server" Text='<%# Bind("RM_id") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="90%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Food Category ">
                    <EditItemTemplate>
                        Select Category :<br />
                        <asp:Label ID="lblfcmID" runat="server" Text='<%# Bind("FCM_ID") %>' Visible="false"></asp:Label>
                                        <asp:DropDownList ID="ddlfcm" runat="server"></asp:DropDownList>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="lblfcm" runat="server" Text='<%# Bind("FCM_name") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="90%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Recipe Name ">
                    <EditItemTemplate>
                        
                         <asp:TextBox ID="txtrecname" runat="server" Text='<%# Bind("RM_name") %>'></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="lblrecname" runat="server" Text='<%# Bind("RM_name") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="90%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                </asp:TemplateField>                  

                <asp:TemplateField HeaderText="Prepare Time ">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtrectime" runat="server" Text='<%# Bind("RM_preparetime") %>'></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="lblrectime" runat="server" Text='<%# Bind("RM_preparetime") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="90%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Recipe Description ">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtrecdec" runat="server" Text='<%# Bind("RM_desc") %>'></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="lblrecdec" runat="server" Text='<%# Bind("RM_desc") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="90%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="50%" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Recipe Method ">
                    <EditItemTemplate>
                        
                        <asp:TextBox ID="txtrecmethod" runat="server" Text='<%# Bind("RM_method") %>'></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="lblrecmethod" runat="server" Text='<%# Bind("RM_method") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="90%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="50%" />
                </asp:TemplateField>

                <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowEditButton="True">
                    <ControlStyle Font-Names="Verdana" BackColor="#990000" ForeColor="White" Font-Size="1em" Height="40px" Width="95%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="20%" />
                </asp:CommandField>
                <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="True" ControlStyle-BackColor="#990000" ControlStyle-ForeColor="White" ControlStyle-Font-Size="1em" ControlStyle-Height="40px" ControlStyle-Width="95%" ControlStyle-Font-Names="Verdana" >
                    <ControlStyle BackColor="#990000" Font-Names="Verdana" Font-Size="1em" ForeColor="White" Height="40px" Width="95%"></ControlStyle>
                    <ItemStyle Width="25%" VerticalAlign="Top" />
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
                <td>
        <asp:GridView ID="Grd_Ingridents" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black"  Width="65%" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="7" OnRowEditing="Grd_Ingridents_RowEditing" OnRowUpdating="Grd_Ingridents_RowUpdating" OnRowCancelingEdit="Grd_Ingridents_RowCancelingEdit" OnRowDeleting="Grd_Ingridents_RowDeleting" >
            <Columns>

                 <asp:BoundField DataField="RIM_id" HeaderText="Id" ReadOnly="True" >
                    <ControlStyle Width="95%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="15%" />
                </asp:BoundField>

                 <asp:TemplateField HeaderText="Food Category ">
                    <EditItemTemplate>
                        Select Ingridents Name :<br />
                        <asp:Label ID="lblingname" runat="server" Text='<%# Bind("ING_name") %>' Visible="false"></asp:Label>
                                        <asp:DropDownList ID="ddlingname" runat="server"></asp:DropDownList>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="lblingname" runat="server" Text='<%# Bind("ING_name") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="95%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="QTY">
                    <EditItemTemplate>
                        
                        <asp:TextBox ID="txtIngQty" runat="server" Text='<%# Bind("ING_qty") %>'></asp:TextBox>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="lblIngQty" runat="server" Text='<%# Bind("ING_qty") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="90%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="50%" />
                </asp:TemplateField>

                <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowEditButton="True">
                    <ControlStyle Font-Names="Verdana" BackColor="#990000" ForeColor="White" Font-Size="1em" Height="40px" Width="95%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="20%" />
                </asp:CommandField>
                <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="True" ControlStyle-BackColor="#990000" ControlStyle-ForeColor="White" ControlStyle-Font-Size="1em" ControlStyle-Height="40px" ControlStyle-Width="95%" ControlStyle-Font-Names="Verdana" >
                    <ControlStyle BackColor="#990000" Font-Names="Verdana" Font-Size="1em" ForeColor="White" Height="40px" Width="95%"></ControlStyle>
                    <ItemStyle Width="25%" VerticalAlign="Top" />
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
       
</center>
</asp:Content>

