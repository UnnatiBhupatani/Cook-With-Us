<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Favourite.aspx.cs" Inherits="Favourite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

 

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section id="recipes" class="recipes"> 
     <center>
         <br />
         <br />
            <asp:Label ID="lblheader" runat="server" Text="Your Liked Recipes" ForeColor="Black" Font-Size="XX-Large" Font-Bold="true" Font-Underline="true" Font-Names="Verdana" ></asp:Label><br /><br />
         <asp:Label ID="lblmes" runat="server" Text="Your Liked Recipes" ForeColor="red" Font-Size="XX-Large"  Visible="false" ></asp:Label>

            <div style="width:99%;margin:0px; margin-top:60px; vertical-align:top;">
     <asp:Repeater ID="rptrRec" runat="server" OnItemCommand="rptrRec_ItemCommand" >
                <HeaderTemplate>
                    <center>
                    <div style="display:flex; flex-wrap:wrap; width:99%; padding:5px; margin:0px; text-align:center; border:3px double black;">
                </HeaderTemplate>
                <ItemTemplate>                    
                   <%--<a href='Handler.ashx?myID=<%# Eval("IMG_id") %>' target="_blank" style="width:15%; padding:3px; margin:0px;margin-right:15px; margin-top:12px; text-align:center;">--%>
                    <a href="Recipe_Master.aspx?ImgId=<%# Eval("IMG_id") %>&ImgName=<%# Eval("IMG_name") %>" target="_blank" style="width:15%; padding:3px; margin:0px;margin-right:15px; margin-top:12px; text-align:center;">
                       <div>
                        <img src='Handler.ashx?myID=<%# Eval("IMG_id") %>' alt='<%# Eval("IMG_name") %>' style="width:100%;height:200px; border:1px solid black; padding:5px;" />

                        <h5 style="color:black; margin:0px; margin-top:2px;"><%# Eval("IMG_name") %></h5>
                           <asp:ImageButton ID="imglike" runat="server" ImageUrl="~/assets/GIF/dislike.png" Height="20%" Width="20%" CommandName="Delete" CommandArgument='<%# Eval("IMG_id") %>' />
                    </div>
                    </a>
                    
                </ItemTemplate>
                <FooterTemplate>                    
                    </div>
                    </center>
                </FooterTemplate>
            </asp:Repeater>
                
                </div>
         
                </center>
   </section>
</asp:Content>

