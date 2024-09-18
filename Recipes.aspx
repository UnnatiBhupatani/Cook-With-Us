<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Recipes.aspx.cs" Inherits="Recipes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section id="recipes" class="recipes">    
        <center>
            <div style="width:99%;margin:0px; margin-top:60px; vertical-align:top;">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/assets/GIF/Result3.gif" Width="24%" ></asp:Image>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/assets/GIF/Ad.gif" Width="24%"></asp:Image>
        <asp:Image ID="Image3" runat="server" ImageUrl="~/assets/GIF/ad4.gif" Width="23%"></asp:Image>
        <asp:Image ID="Image4" runat="server" ImageUrl="~/assets/GIF/ad3.gif" Width="24%"></asp:Image>        
        </div>
            </center>        
        <center>
        <asp:Label ID="lbl" runat="server" Text="Choose Your's Favourite Recipe" Font-Underline="true" Font-Size="XX-Large" Font-Bold="true" ForeColor="Black" Font-Names="Verdana"></asp:Label>
        <br /><br />
             <asp:Label ID="lblcat" runat="server" Text="Select Category :" ForeColor="Black" Font-Size="X-Large"  Font-Bold="true"></asp:Label>
            <asp:DropDownList ID="drpcat" runat="server" ForeColor="Black" OnSelectedIndexChanged="drpcat_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList><br /><br />
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
                           <asp:ImageButton ID="imglike" runat="server" ImageUrl="~/assets/GIF/add to like img.png" Height="15%" Width="15%" CommandName="Like" CommandArgument='<%# Eval("IMG_id") %>' />
                    </div>
                    </a>
                    
                </ItemTemplate>
                <FooterTemplate>                    
                    </div>
                    </center>
                </FooterTemplate>
            </asp:Repeater>              
            <%--</div>--%>
    
            
</center>
    <br />
              </div>

          </section>
   
   
    </section>
   
   
</asp:Content>



