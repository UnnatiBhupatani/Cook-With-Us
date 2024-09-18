<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About Us.aspx.cs" Inherits="Contact_Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section id="recipes" class="recipes"> 
    <br />
    <br />
    <br />
    <div style="width:99%;margin:0px; margin-top:60px; vertical-align:top;">

      <%--<section id="events" class="events">

        <center style="height: 448px">--%>
        <center>             <title>Cook With Us - CWU| About Us</title>

            <asp:Label ID="Label1" runat="server" Text="About Us" Font-Bold="true" ForeColor="Black" Font-Underline="true" Font-Size="XX-Large" Font-Names="Verdana"></asp:Label>
            <br /><br />
            <asp:Image ID="Image1" runat="server" ImageUrl="~/assets/GIF/about us.gif" Height="60%" Width="50%"></asp:Image>
            <br />
        <br />

             <h6  style="color:black; font-size:x-large" >
                        We hope you like our recipes and after  see it you can also make it.
                        If you have any questions or comments, please don't hesitate to contact us.
                        <br />
                        <br />
                        Sincerely,
                        <br />
                        Cook With Us - Food
                    </h6>
            <br />

            <h5 style="color:black">
                 Simply Recipes is here to help you cook delicious meals with less stress and more joy.<br />
                 We offer recipes and cooking advice for home cooks, by home cooks. Helping create “kitchen wins” is what we’re all about.<br />
                Today, Simply Recipes has grown into a trusted resource for home cooks with  guides,<br />
                 and meal plans, drawing over 15 million readers each month from around the world. We’re supported by a diverse group of recipe developers,<br />
                 food writers, recipe and product testers, photographers, and other creative professionals. <br /><br />

            </h5>

            </center>
        </div>
         </section>

</asp:Content>

