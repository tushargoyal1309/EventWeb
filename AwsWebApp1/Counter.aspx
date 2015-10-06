<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Counter.aspx.cs" Inherits="AwsWebApp1.Counter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="background-color:#ffffff">
        <br />
    <div class="row">
       
        <div class="col-md-4" style="padding-left:40px;">
            <input type="text"
                placeholder="Search..."
                class="form-control fa-border"
                data-ng-model="searchKeywords"
                data-ng-keyup="search()">
        </div>
        <div class="col-md-5 filter-result-info">
            <%--<span>Showing {{filteredStores.length}}/{{stores.length}} entries
            </span>--%>
        </div>
        <div class="col-md-3">
       <button type="button" class="btn btn-info">Create Attendee</button>
        </div>
    </div>
    <br />
    <asp:GridView AllowSorting="true" PageSize="6" OnPageIndexChanging="counterData_PageIndexChanging"
        CssClass="table table-bordered table-striped table-responsive" AllowPaging="true" 
        AlternatingRowStyle-BackColor="#FFFFFF" BorderStyle="None" BackColor="#F9F9F9" ID="counterData" 
        runat="server" AutoGenerateColumns="false" PagerStyle-BackColor="White">
        <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
        <PagerStyle BackColor="#FFFFFF" CssClass="GridPager" HorizontalAlign="center"/>
        <Columns>
    
        <asp:TemplateField HeaderText="Businessid"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="Businessid" runat="server" Text='<%# Eval("Businessid") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="Businessid" BorderStyle="None" runat="server" Text='<%# Eval("Businessid") %>'></asp:TextBox>
</EditItemTemplate>
            </asp:TemplateField>
<asp:TemplateField HeaderText="MenIn"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="MenIn" runat="server" Text='<%# Eval("MenIn") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="TextBox1" BorderStyle="None" runat="server" Text='<%# Eval("MenIn") %>'></asp:TextBox>
</EditItemTemplate>
    </asp:TemplateField>
<asp:TemplateField HeaderText="MenOut"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="MenOut" runat="server" Text='<%# Eval("MenOut") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="TextBox2" BorderStyle="None" runat="server" Text='<%# Eval("MenOut") %>'></asp:TextBox>
</EditItemTemplate>
    </asp:TemplateField>
<asp:TemplateField HeaderText="WomenIn"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="WomenIn" runat="server" Text='<%# Eval("WomenIn") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="TextBox3" BorderStyle="None" runat="server" Text='<%# Eval("WomenIn") %>'></asp:TextBox>
</EditItemTemplate>
    </asp:TemplateField>
<asp:TemplateField HeaderText="WomenOut"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="WomenOut" runat="server" Text='<%# Eval("WomenOut") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="TextBox4" BorderStyle="None" runat="server" Text='<%# Eval("WomenOut") %>'></asp:TextBox>
</EditItemTemplate>
    </asp:TemplateField>
<asp:TemplateField HeaderText="DeviceToken"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="deviceToken" runat="server" Text='<%# Eval("deviceToken") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="TextBox5" BorderStyle="None" runat="server" Text='<%# Eval("deviceToken") %>'></asp:TextBox>
</EditItemTemplate>
    </asp:TemplateField>
<asp:TemplateField HeaderText="Latitude"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="latitude" runat="server" Text='<%# Eval("latitude") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="TextBox6" BorderStyle="None" runat="server" Text='<%# Eval("latitude") %>'></asp:TextBox>
</EditItemTemplate>
    </asp:TemplateField>
<asp:TemplateField HeaderText="Longitude"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="longitude" runat="server" Text='<%# Eval("longitude") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="TextBox7" BorderStyle="None" runat="server" Text='<%# Eval("longitude") %>'></asp:TextBox>
</EditItemTemplate>
    </asp:TemplateField>
<asp:TemplateField HeaderText="TotalPeople"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="totalpeople" runat="server" Text='<%# Eval("totalpeople") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="TextBox8" BorderStyle="None" runat="server" Text='<%# Eval("totalpeople") %>'></asp:TextBox>
</EditItemTemplate>
    </asp:TemplateField>
<asp:TemplateField HeaderText="TotalProducts"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="totalproducts" runat="server" Text='<%# Eval("totalproducts") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="TextBox9" BorderStyle="None" runat="server" Text='<%# Eval("totalproducts") %>'></asp:TextBox>
</EditItemTemplate>
    </asp:TemplateField>
<asp:TemplateField HeaderText="TotalVehicles"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="totalvehicles" runat="server" Text='<%# Eval("totalvehicles") %>'></asp:Label>
</ItemTemplate>
<EditItemTemplate>
<asp:TextBox ID="TextBox10" BorderStyle="None" runat="server" Text='<%# Eval("totalvehicles") %>'></asp:TextBox>
</EditItemTemplate>
    </asp:TemplateField>
    <asp:CommandField HeaderText="Edit" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#FFFFFFF" ButtonType="Image" ItemStyle-Height="10px" EditImageUrl="../images/edit (1).png" EditText="Edit" ShowEditButton="true" CausesValidation="false"></asp:CommandField>
    </Columns>   
        </asp:GridView>
</asp:Content>
