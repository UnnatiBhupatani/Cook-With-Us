<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Ingrediants.aspx.cs" Inherits="Ingrediants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">








    <%--<div class="col-lg-6 order-1 order-lg-2" data-aos="zoom-in" data-aos-delay="100">--%>
    <section class="about">
        <center>
         
            <div style="width:99%;margin:0px; margin-top:60px; vertical-align:top;">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/assets/GIF/ingredientsad4.webp" Width="24%" Height="300px" ></asp:Image>
                <asp:Image ID="Image4" runat="server" ImageUrl="~/assets/GIF/1360-grocery-shelf-outline.gif" Width="24%"></asp:Image>        
                <asp:Image ID="Image1" runat="server" ImageUrl="~/assets/GIF/ingredientsad2.gif" Width="24%"></asp:Image>
                <asp:Image ID="Image3" runat="server" ImageUrl="~/assets/GIF/ingredientsad3.gif" Width="23%"></asp:Image>
        </div>

            <h1>
                <asp:Label ID="Label1" runat="server" Text="Ingredients" Font-Bold="True"  ForeColor="Black" Font-Underline="true" Font-Size="XX-Large" Font-Names="Verdana"></asp:Label>
            </h1>        
            
          <div style="border:12px double black; width:50%; color:black; font-family:Verdana; padding:15px; margin:0px; margin-top:10px; text-align:justify;">

          
                                 <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
                                     DataSourceID="SqlDataSource1" DataTextField="ING_name" 
                                     RepeatColumns="3" DataValueField="ING_name" 
                                    Width="95%"></asp:CheckBoxList>
          </div> 
    




       
            <br />
            <asp:Button ID="Button1" runat="server" Text="Submit" Font-Bold="true" OnClick="Button1_Click" BorderStyle="Ridge" BorderColor="#ff0066" BackColor="#ffcccc"></asp:Button><br /><br />
            <asp:Panel ID="Panel1" runat="server" BorderStyle="Double" BorderColor="Black" Height="200px" Width="400px">
            <asp:Label ID="lblslsing" runat="server" Text="Selected Ingridents :" Font-Bold="true" ForeColor="Black"></asp:Label>
            <asp:Label ID="lbldising" runat="server" Text="" ForeColor="Black"></asp:Label>
                </asp:Panel>
            <br />
            <asp:Button ID="btnfindrec" runat="server" Text="Find Recipes" Font-Size="X-Large" ForeColor="Black" BorderStyle="Ridge" BorderColor="#ff0066" BackColor="#ffcccc" OnClick="btnfindrec_Click"></asp:Button>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Cook With UsConnectionString %>" SelectCommand="SELECT * FROM [ING_master]" ></asp:SqlDataSource>

            <br />
            <asp:Repeater ID="rptrRec" runat="server">
                <HeaderTemplate>
                    <center>
                    <div style="display:flex; flex-wrap:wrap; width:99%; padding:5px; margin:0px; text-align:center; border:3px double black;">
                </HeaderTemplate>
                <ItemTemplate>                    
                   <%--<a href='Handler.ashx?myID=<%# Eval("IMG_id") %>' target="_blank" style="width:15%; padding:3px; margin:0px;margin-right:15px; margin-top:12px; text-align:center;">--%>
                    <a href="Recipe_Master.aspx?ImgId=<%# Eval("IMG_id") %>&ImgName=<%# Eval("IMG_name") %>" target="_blank" style="width:15%; padding:3px; margin:0px;margin-right:15px; margin-top:12px; text-align:center;">
                       <div>
                        <img src='Handler.ashx?myID=<%# Eval("IMG_id") %>' alt='<%# Eval("IMG_name") %>' style="width:100%;height:200px; border:1px solid black; padding:5px;" />
                        <h5 style="color:black; margin:0px; margin-top:2px;"><%# Eval("RM_name") %></h5>
                    </div>
                    </a>
                    
                </ItemTemplate>
                <FooterTemplate>                    
                    </div>
                    </center>
                </FooterTemplate>
            </asp:Repeater>              
    </section>

    </center>

           
     
        
</asp:Content>

