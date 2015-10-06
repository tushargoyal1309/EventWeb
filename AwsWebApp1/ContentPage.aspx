<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="ContentPage.aspx.cs" Inherits="AwsWebApp1.ContentPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="divMain" runat="server" style="background-color:#ffffff">
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
       <button type="button" class="btn btn-info">Create Content</button>
        </div>
    </div>
    <br />
    <asp:GridView OnSelectedIndexChanged="contentData_SelectedIndexChanged"
        CssClass="table table-bordered table-striped table-responsive" AllowPaging="true" 
        AlternatingRowStyle-BackColor="#FFFFFF" BorderStyle="None" BackColor="#F9F9F9" ID="contentData" 
        runat="server" AutoGenerateColumns="false" PagerStyle-BackColor="White">
        <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
        <PagerStyle BackColor="#FFFFFF" CssClass="GridPager" HorizontalAlign="center"/>
        <Columns>
           
<asp:TemplateField HeaderText="ContentId"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="contentId" runat="server" Text='<%# Eval("contentId") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="contentId" BorderStyle="None" runat="server" Text='<%# Eval("contentId") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
<asp:TemplateField HeaderText="EventId"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="eventId" runat="server" Text='<%# Eval("eventId") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="TextBox1" BorderStyle="None" runat="server" Text='<%# Eval("eventId") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
<asp:TemplateField HeaderText="FileType"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="fileType" runat="server" Text='<%# Eval("fileType") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="TextBox2" BorderStyle="None" runat="server" Text='<%# Eval("fileType") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
<asp:TemplateField HeaderText="Name"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="name" runat="server" Text='<%# Eval("name") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="TextBox3" BorderStyle="None" runat="server" Text='<%# Eval("name") %>'></asp:TextBox>
</EditItemTemplate>--%>
    <ItemTemplate>
<asp:Label ID="contentUrl" Visible="false" runat="server" Text='<%# Eval("contentUrl") %>'></asp:Label>
</ItemTemplate>
    </asp:TemplateField>
    <asp:ButtonField CommandName="Select" HeaderText="Actions" Text="Edit" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#FFFFFFF" ButtonType="Image" ItemStyle-Height="10px" CausesValidation="false"></asp:ButtonField>
    </Columns>   
        </asp:GridView>
        </div>
    <div id="divEdit" runat="server" visible="false">
        <div class="row">
            <div class="col-md-6">
        <asp:Label class="form-control" rows="10" ID="contentId" runat="server" ></asp:Label>
                </div>
                        <div class="col-md-6">
                            <asp:FileUpload ID="file" runat="server" />
                            </div>
            </div>
         <div class="row">
            <div class="col-md-6">
        <asp:Label ID="txtId" runat="server" ></asp:Label>
                </div>
             </div>
         <div class="row">
                          <div class="col-md-6">
        <asp:TextBox ID="filetype" runat="server" ></asp:TextBox>
        <asp:TextBox ID="name" runat="server" ></asp:TextBox>
                              </div>
             </div>
         <div class="row">
            <div class="col-md-12">
        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                </div>
             </div>
    </div>
</asp:Content>
