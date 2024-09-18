<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShowUserRec.aspx.cs" Inherits="ShowUserRec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <center>
    <div style="background-color:white" margin-left:"40px;" >
        <br />
        <br />
        <br />
        <br /><br /><br />


        <asp:Label ID="lblrecname" runat="server" Text=" Your Recipes Recipe :" Font-Bold="true" Font-Size="XX-Large" ForeColor="Black" Font-Underline="true"></asp:Label>&nbsp;&nbsp;
       <br />
        <br />
<asp:GridView ID="dtGrd_rec" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black"  Width="65%" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
            <Columns>


                <asp:BoundField DataField="RM_id" HeaderText="Id" ReadOnly="True" >
                    <ControlStyle Width="95%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="15%" />
                </asp:BoundField>
                


                <asp:TemplateField HeaderText="Food Category ">
                    <EditItemTemplate>
                        Select Category :<br />
                                        <asp:DropDownList ID="ddlfcm" runat="server"></asp:DropDownList>
                    </EditItemTemplate>

                    <ItemTemplate>
                        <asp:Label ID="lblfcm" runat="server" Text='<%# Bind("FCM_name") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="90%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Image">
                    <EditItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("IMG_id", "Handler.ashx?myId={0}") %>' />
                        <asp:FileUpload ID="fldImgGrid" runat="server" ForeColor="Black"></asp:FileUpload>
                    </EditItemTemplate>

                    <ItemTemplate>
                         <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("IMG_id", "Handler.ashx?myId={0}") %>' />
                    </ItemTemplate>
                    <ControlStyle Width="90%" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="35%" />
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

