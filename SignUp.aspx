<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-color:white">
    <center>
   
          
       
         <br />
         <br />
          
      <br />
         <br />
         <br />
         
         <asp:Image ID="Image1" runat="server" ImageUrl="~/assets/GIF/sign up.gif" Width="20%" Height="40%"></asp:Image>
        <br />
        <br />
  
        <div id="divInputs" runat="server"
            style=" background-color:white;color:black; text-align:center; font-family:Verdana; margin-top:25px;
padding:20px; 
border-radius:5%; box-shadow:0px 0px 40px  #cdcdb1; width:65%;">
   Enter User Name: <asp:TextBox ID="txtuser" runat="server" TabIndex="1" Width="164px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="valReqTxtName" runat="server" ControlToValidate="txtuser" Display="Dynamic" ErrorMessage="Name Must Not Be Blank" Font-Names="Verdana" Font-Size="0.8em" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
    <br />
   
             Enter Contact No:<asp:TextBox ID="txtcont" runat="server" TabIndex="2" Width="164px"></asp:TextBox>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  
ControlToValidate="txtcont" ErrorMessage="Mobile Number Must Contain 10 Digits"  
ValidationExpression="[0-9]{10}" Font-Names="Verdana" Font-Size="0.8em" ForeColor="Red" SetFocusOnError="True" Display="Dynamic"></asp:RegularExpressionValidator> 
    <br />
    <br />
   
            <asp:Label ID="lblgen" runat="server" Text=" Choose Gender:" ForeColor="Black" Width="170px"></asp:Label>
 <asp:RadioButton ID="rdbmale" runat="server" GroupName="grpgender" ForeColor="Black" Text="Male" Checked="true" TabIndex="3"></asp:RadioButton>
     <asp:RadioButton ID="rdbfemale" runat="server" GroupName="grpgender" ForeColor="Black" Text="Female" TabIndex="4"></asp:RadioButton>
    <br /><br />

  
   Enter Password: &nbsp;&nbsp;<asp:TextBox ID="txtpass" runat="server" TextMode="Password" TabIndex="5" Width="164px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="valReqPass" runat="server" ControlToValidate="txtpass" Display="Dynamic" ErrorMessage="Password Must Not Be Blank" Font-Names="Verdana" Font-Size="0.8em" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br /><br />

   <asp:Label ID="lblconpass" runat="server" Text="Enter Confirm Password:" ForeColor="Black" Width="155px"></asp:Label>
    <asp:TextBox ID="txtconfpass" runat="server" TextMode="Password" TabIndex="6" Width="169px"></asp:TextBox>
             <asp:RequiredFieldValidator ID="valReqConfPass" runat="server" ControlToValidate="txtconfpass" Display="Dynamic" ErrorMessage="Confirm Password Must Not Be Blank" Font-Names="Verdana" Font-Size="0.8em" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="valCmpTxtConfPass" runat="server" ErrorMessage="Password And Confirm Password Must Be Same" ControlToCompare="txtpass" ControlToValidate="txtconfpass" Display="Dynamic" Font-Bold="True" Font-Size="0.8em" SetFocusOnError="True" ForeColor="Red"></asp:CompareValidator>
            <br /><br /><br />

    <asp:Button ID="btnsignup" runat="server" Text="Sign Up"  ForeColor="Black" BackColor="Green" Font-Size="Large" TabIndex="7" BorderStyle="Dotted" Font-Bold="true" BorderColor="Black" OnClick="btnsignup_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:Button ID="btncancle" runat="server" Text="Cancel" ForeColor="Black" BackColor="red" TabIndex="8" Font-Size="Large" Font-Bold="true" BorderStyle="Dotted" BorderColor="Black" OnClick="btncancle_Click"/>
            
    <br /><br />
            </div>
         <br /><br />
        </center>
        
        </div>
     
</asp:Content>

