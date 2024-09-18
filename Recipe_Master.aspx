<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Recipe_Master.aspx.cs" Inherits="Recipe_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center> 
        <div style="background-color:white">
            <br />
            <br />
            <br /><br /><br /><br /><br />  
           <asp:Image ID="RcpImg" runat="server" Width="35%"/>
    <br />
    <br />
             <div style="border:6px double black; width:70%">
    <asp:Label ID="lblrecname" runat="server" ForeColor="Black" Font-Size="20" Font-Bold="true"></asp:Label>
                 <br />
                 <br />
     <asp:Label ID="lbl2" runat="server" Text="Prepare Time:" ForeColor="Black" Font-Size="Larger" Font-Bold="true"></asp:Label>
     <asp:Label ID="lblprepare" runat="server" Text="111" ForeColor="Black"></asp:Label>

    <br />
    <br />
    <asp:Label ID="lbl1" runat="server" Text="Description:" ForeColor="Black" Font-Size="Larger" Font-Bold="true"></asp:Label>
     <asp:Label ID="lbldescription" runat="server" ForeColor="Black"></asp:Label>
    <br />
    <br />

           
    
                 <asp:Repeater ID="rptring" runat="server" >
                <HeaderTemplate>
                    <center>
                    <%--<div style="display:flex; flex-wrap:wrap; width:99%; padding:5px; margin:0px; text-align:center; border:3px double black;">--%>
                    <%--<table cellpadding="6" cellspacing="0" border="1" style="width:95%">--%>
                        <table style="width:65%; padding:5px; margin:0px; text-align:center; border:3px double black;">
                    <th style="border:3px double black; color:black;">Ingredients</th>
                    <th style="border:3px double black; color:black;"">Quantity</th>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr valign="top">
                    <%--<asp:Label ID="LblIng" runat="server" Text="Indrediants Name:" ForeColor="Black"></asp:Label>--%>
                    
                    <td align="center" valign="top" style="border:1px solid black; width:50%;">
                        <asp:Label ID="IngValue" runat="server" Text='<%# Eval("ING_name") %>' ForeColor="Black"></asp:Label>
                    </td>
                    <%--<asp:Label ID="LblQnt" runat="server" Text="Quantity:" ForeColor="Black"></asp:Label>--%>
                    <td align="center" valign="top" style="border:1px solid black; width:50%;">
                        <asp:Label ID="QntVal" runat="server" Text='<%# Eval("ING_qty") %>' ForeColor="Black"></asp:Label>
                    </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>  
                    </table>                  
                    <%--</div>--%>
                    </center>
                </FooterTemplate>
            </asp:Repeater>     
                 <%--<div style="border:5px double black; width:65%; height:30%;">
     <asp:Label ID="lbl3" runat="server" Text="Indrediants Name" ForeColor="Black"></asp:Label><br />
    <asp:Label ID="lbling" runat="server" Text="11111" ForeColor="Black"></asp:Label><br />
                       <asp:Label ID="lbl4" runat="server" Text="Quantity:" ForeColor="Black"></asp:Label>
    <asp:Label ID="lblqty" runat="server" Text="3333" ForeColor="Black"></asp:Label>
    <br />
    <br />
                     </div>--%>
    <br />
   
    

     <asp:Label ID="lbl5" runat="server" Text="Method :" ForeColor="Black" Font-Size="X-Large" Font-Bold="true"></asp:Label><br />
         <asp:Label ID="lblmethod" runat="server" Text="5555" ForeColor="Black"></asp:Label>
                <br /><br /><br /><br /><br />
            </div>
            </div>
       
     </center>


</asp:Content>

