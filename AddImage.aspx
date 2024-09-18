<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddImage.aspx.cs" Inherits="AddImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <center>
    <div style="background-color:white">
        <br />
        <br />
        <br />
        <br /><br /><br />
        
<asp:Label ID="Label1" runat="server" Text="Add Images"  Font-Size="XX-Large" ForeColor="Black" Font-Bold="true"  Font-Underline="true" Font-Names="Verdana"></asp:Label>
                <br /><br /><br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="Label2" runat="server" Text="Choose image:" ForeColor="Black" Font-Size="20"></asp:Label>
<asp:FileUpload ID="flimg" runat="server" ForeColor="Black"></asp:FileUpload>
 
        <br /><br />
        <asp:Label ID="lblimgname" runat="server" Text="Image Name:" ForeColor="Black" Font-Size="20" ></asp:Label>
        <asp:TextBox ID="txtimgname" runat="server"></asp:TextBox>
       

        <br /><br /><br /><br />

         <asp:Button ID="btnadd" runat="server" Text="Add" OnClick="btnadd_Click"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btncan" runat="server" Text="Cancle" OnClick="btncan_Click"></asp:Button>
        <br /><br /><br /><br />

         <asp:GridView ID="grdimg" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black"  Width="95%" OnRowCancelingEdit="grdimg_RowCancelingEdit" OnRowDeleting="grdimg_RowDeleting" OnRowEditing="grdimg_RowEditing" OnRowUpdating="grdimg_RowUpdating" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" >
             <Columns>
                <asp:BoundField DataField="IMG_id" HeaderText="Id" ReadOnly="True" >
                
                <ControlStyle Width="95%" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="5%" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="Image">
                    <EditItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("IMG_id", "Handler.ashx?myId={0}") %>' />
                        <asp:FileUpload ID="fldImgGrid" runat="server" ForeColor="Black"></asp:FileUpload>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("IMG_id", "Handler.ashx?myId={0}") %>' />
                    </ItemTemplate>
                    <ControlStyle Height="30%" Width="30%" />
                    <ItemStyle Height="30%" Width="30%" />
</asp:TemplateField>
                 <asp:BoundField DataField="IMG_name" HeaderText="Name" >
                <ControlStyle Width="40%" />
                <ItemStyle  VerticalAlign="Top"  />
                </asp:BoundField>

                  <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowEditButton="True">
                <ControlStyle Font-Names="Verdana" BackColor="#990000" ForeColor="White" Font-Size="1em" Height="40px" Width="95%" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="8%" />
                </asp:CommandField>
                <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="True" ControlStyle-BackColor="#990000" ControlStyle-ForeColor="White" ControlStyle-Font-Size="1em" ControlStyle-Height="40px" ControlStyle-Width="95%" ControlStyle-Font-Names="Verdana" >
<ControlStyle BackColor="#990000" Font-Names="Verdana" Font-Size="1em"   ForeColor="White" Height="40px" Width="95%"></ControlStyle>
                <ItemStyle Width="7%" VerticalAlign="Top" />
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

