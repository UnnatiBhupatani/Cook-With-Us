<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmTEST.aspx.cs" Inherits="frmTEST" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <center>
 <asp:GridView ID="dtGrd_Ing" runat="server" 
    AutoGenerateColumns="False"
    BorderStyle="Solid" BorderColor="Black" Width="75%" ForeColor="Black">
    <Columns>
        <asp:BoundField DataField="Sr" HeaderText="Sr.No" ReadOnly="true" >
        <ControlStyle Width="95%" />
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
        </asp:BoundField>
        </Columns>
     <Columns>
<asp:BoundField DataField="Ing_ID" HeaderText="Ing ID" ReadOnly="True">
<ControlStyle Width="95%"></ControlStyle>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></ItemStyle>
</asp:BoundField>
</Columns>
     <Columns>
<asp:BoundField DataField="Ing_Name" HeaderText="Name" ReadOnly="True">
<ControlStyle Width="95%"></ControlStyle>

<ItemStyle HorizontalAlign="Left" VerticalAlign="Top" Width="40%"></ItemStyle>
</asp:BoundField>
         </Columns>
     <Columns>
<asp:TemplateField HeaderText="Quantity"><ItemTemplate>
                <asp:TextBox ID="txtQty" runat="server" Width="25%" BorderStyle="Solid"></asp:TextBox>
            
</ItemTemplate>
    <ControlStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" Width="95%" />
    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="40%" />
</asp:TemplateField>
        </Columns>
    
       
</asp:GridView>
    </center>
    </form>
</body>
</html>
