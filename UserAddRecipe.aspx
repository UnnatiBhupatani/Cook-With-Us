<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserAddRecipe.aspx.cs" Inherits="UserAddRecipe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
    <div style="background-color:white">
        <br />
        <br />
        <br />
        <br />



<asp:Label ID="lblrecipeadd" runat="server" Text="Add Recipe"  Font-Size="XX-Large" Font-Bold="true" ForeColor="Black" Font-Underline="true" ></asp:Label>
                <br />

         <div id="divInputs" runat="server"
            style=" background-color:white;color:black; text-align:center; font-family:Verdana; margin-top:25px;
padding:20px; 
border-radius:2.5%; box-shadow:0px 0px 20px  #cdcdb1; width:75%;">
        <asp:Label ID="lbladdcat" runat="server" Text="Enter Category" ForeColor="Black"></asp:Label>
<asp:TextBox ID="txtcat" runat="server" TabIndex="1"></asp:TextBox>
       
           
         
<asp:Button ID="btaddncat" runat="server" Text="Add" OnClick="btaddncat_Click"  TabIndex="2"></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
     <asp:Label ID="lblcat" runat="server" Text="Choose Category : " ForeColor="Black"></asp:Label>
<asp:DropDownList ID="drpcat" runat="server" AutoPostBack="true" TabIndex="3"></asp:DropDownList>
        <asp:RequiredFieldValidator ID="valcat" runat="server" ControlToValidate="drpcat" Display="Dynamic" ErrorMessage="Choose Category" Font-Names="Verdana" Font-Size="0.8em" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="lblrecipe" runat="server" Text="Enter Recipe Name : " ForeColor="Black"></asp:Label>
<asp:TextBox ID="txtRname" runat="server" TabIndex="4"></asp:TextBox>
        <asp:RequiredFieldValidator ID="valrecname" runat="server" ControlToValidate="txtRname" Display="Dynamic" ErrorMessage="Enter Recipe Name" Font-Names="Verdana" Font-Size="0.8em" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br /><br />

<asp:Label ID="lblrtime" runat="server" Text="Enter Recipe Prepare Time : " ForeColor="Black"></asp:Label>
<asp:TextBox ID="txtrtime" runat="server" TabIndex="5"></asp:TextBox>
        <asp:RequiredFieldValidator ID="valpre" runat="server" ControlToValidate="txtrtime" ValidationExpression="[0-9]{3}"  Display="Dynamic" ErrorMessage="Enter Prepare Time" Font-Names="Verdana" Font-Size="0.8em" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br /><br />


        <asp:Label ID="lblrdes" runat="server" Text="Enter Recipe Description : " ForeColor="Black"></asp:Label>
<asp:TextBox ID="txtrdes" runat="server" TabIndex="6"></asp:TextBox>
          <asp:RequiredFieldValidator ID="valdes" runat="server" ControlToValidate="txtrdes" Display="Dynamic" ErrorMessage="Enter Recipe Description" Font-Names="Verdana" Font-Size="0.8em" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br /><br />

         <asp:Label ID="lbladding" runat="server" Text="Enter Ingridents" ForeColor="Black"></asp:Label>
<asp:TextBox ID="txtadding" runat="server" TabIndex="7"></asp:TextBox>
           

<asp:Button ID="btnadding" runat="server" Text="Add" OnClick="btnadding_Click" TabIndex="8" ></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />

         <asp:Label ID="lbling" runat="server" Text="Choose Ingridents : " ForeColor="Black"></asp:Label>
       
    <center>
        <div id="dis" runat="server" visible="true" style="border:12px double black; width:50%; color:black; font-family:Verdana; padding:15px; margin:0px; margin-top:10px; text-align:justify;">

         
                                 <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
                                     DataSourceID="SqlDataSource1" DataTextField="ING_name" 
                                     RepeatColumns="3" DataValueField="ING_id" 
                                    Width="95%" Visible="true" TabIndex="9">                                     
                                 </asp:CheckBoxList>
          </div>       
        </center> 
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             ConnectionString="<%$ ConnectionStrings:Cook With UsConnectionString %>" 
             SelectCommand="SELECT ING_id, ING_name FROM [ING_master] ORDER BY ING_name" ></asp:SqlDataSource>
        <br />
        <asp:Button ID="btning" runat="server" Text="Select..." OnClick="btning_Click" TabIndex="10" ></asp:Button><br />        
        <br />
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
<%--<asp:BoundField DataField="Ing_ID" HeaderText="Ing ID" ReadOnly="True">
<ControlStyle Width="95%"></ControlStyle>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%"></ItemStyle>
</asp:BoundField>--%>
<asp:TemplateField HeaderText="Ing ID"><ItemTemplate>
    <asp:Label ID="txtIng_Id" Text='<%# Bind("ING_id") %>' runat="server" Width="10%"></asp:Label>
</ItemTemplate>
    <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
</asp:TemplateField>
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

        
        <asp:Label ID="Label2" runat="server" Text="Choose Image : " ForeColor="Black" Font-Size="20"></asp:Label>
        <asp:FileUpload ID="flimg" runat="server" ForeColor="Black" TabIndex="11"></asp:FileUpload><br /><br />

          <asp:Label ID="lblmethod" runat="server" Text="Enter Recipe Method : " ForeColor="Black"></asp:Label>
        <textarea id="Textarea1" rows="2" cols="20" runat="server" tabindex="12"></textarea>
        <asp:RequiredFieldValidator ID="valmethod" runat="server" ControlToValidate="Textarea1" Display="Dynamic" ErrorMessage="Enter Recipe Method" Font-Names="Verdana" Font-Size="0.8em" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <br /><br />

        <asp:Button ID="btnaddrec" runat="server" Text="Add" OnClick="btnaddrec_Click" TabIndex="13" ></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btncamrec" runat="server" Text="Cancel" OnClick="btncamrec_Click"  TabIndex="14"></asp:Button>
        <br />
              </div>
         <br />
        

    </div>
        </center>

</asp:Content>


