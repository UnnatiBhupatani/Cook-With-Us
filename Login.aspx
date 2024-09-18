<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server" >
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    
   <%-- <form id="form2" runat="server">--%>
    <div style="background-color:white">
   
          
            <br /> 
            <br />
             <%-- <div id="divInputs" runat="server"
            style=" background-color:white;color:black; text-align:center; font-family:Verdana;">--%>
           <center>
            <%--<asp:Label ID="Label4" runat="server" Text="LOG IN" Font-Bold="True" Font-Size="XX-Large" ForeColor="#996600" BorderColor="#996633" BorderStyle="Double"></asp:Label>--%>
             <asp:Image ID="Image1" runat="server" ImageUrl="~/assets/GIF/log in.gif" Height="30%" Width="15%"></asp:Image>
            <br />
           
            
           
       
            <div id="div1" runat="server"
            style=" background-color:white;color:black; text-align:center; font-family:Verdana; margin-top:25px;
padding:20px; 
border-radius:2.5%; box-shadow:0px 0px 20px  #cdcdb1; width:30%;">
            
        Enter Username:   <asp:TextBox ID="txtusername" runat="server" Width="164px"></asp:TextBox><br /><br />
<asp:RequiredFieldValidator ID="valReqTxtName" runat="server" ControlToValidate="txtusername" Display="Dynamic" ErrorMessage=" User Name Must Not Be Blank" Font-Names="Verdana" Font-Size="0.8em" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>




Enter Password: <asp:TextBox ID="txtpassword" runat="server" Width="165px" TextMode="Password"></asp:TextBox>
<asp:RequiredFieldValidator ID="valReqPass" runat="server" ControlToValidate="txtpassword" Display="Dynamic" ErrorMessage="Password Is Incoorect Enter Correct Password" Font-Names="Verdana" Font-Size="0.8em" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                 <br /><br />
 

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
<br />



<asp:Button ID="btnlogin" runat="server" Text="Log In" BorderStyle="Outset" Font-Bold="True" Font-Size="Large" ForeColor="Black" Height="40px" Width="105px" BackColor="Green" OnClick="btnlogin_Click"></asp:Button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btncan" runat="server" Text="Cancel" BorderStyle="Outset" Font-Bold="True" Font-Size="Large" ForeColor="Black" Height="40px" Width="105px" BackColor="red" OnClick="btncan_Click"></asp:Button>
                 <br />
                 <br />
                </div>
                    <br />
    <br />  
                 </div>
   
      
       
         </div>
    
         
    
     </center>
         
   
       
  <%--  </form>--%>
    
   
</asp:Content>

