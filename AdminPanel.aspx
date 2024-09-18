<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminPanel.aspx.cs" Inherits="AdminPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <center>
         <div style="background-color:white">
         <br />
           <br />
           <br />
             <br />
             <br />
          
           
             <h1>
                <asp:Label ID="lblheader" runat="server" Text="Admin Panel  " Font-Bold="True"  ForeColor="Black" Font-Underline="true" Font-Size="XX-Large"></asp:Label><br />
            </h1>
            <div id="divInputs" runat="server"
            style=" background-color:white;color:black; text-align:center; font-family:Verdana; margin-top:25px;
padding:20px; 
border-radius:2.5%; box-shadow:0px 0px 20px  #cdcdb1; width:65%;">
                 <h2 style="font-family:Verdana;"><a href="ManageUser.aspx">Manage User</a></h2><br />
             <h2 style="font-family:Verdana;"><a href="AddCategory.aspx" >Manage category</a></h2><br />
               <h2 style="font-family:Verdana;"><a href="AddImage.aspx">Manage Image</a></h2><br />
               <h2 style="font-family:Verdana;"><a href="AddIngrediants.aspx">Manage Ingrediants</a></h2><br />
               <h2 style="font-family:Verdana;"><a href="AddRecipe.aspx">Add Recipe</a></h2><br />
                <h2 style="font-family:Verdana;"><a href="ModifyRecipes.aspx">Modify Recipe</a></h2><br />              
             </div>
             <br /><br />
        
        </div>
          </center>
</asp:Content>

