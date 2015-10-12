<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="ContentPage.aspx.cs" Inherits="AwsWebApp1.ContentPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="divMain" runat="server" style="background-color:#ffffff; overflow: hidden">
        <br />
    <div class="row" style="background-color:#F9F9F9;">
       
        <div class="col-md-4" style="padding-left:40px;">
            <%--<input type="text"
                placeholder="Search..."
                class="form-control fa-border"
                data-ng-model="searchKeywords"
                data-ng-keyup="search()">--%>
            <p style="padding-top:10px; font-size:large"><span class="fa fa-table">&nbsp;&nbsp;&nbsp;</span>Content</p>
        </div>
        <div class="col-md-5 filter-result-info">
            <%--<span>Showing {{filteredStores.length}}/{{stores.length}} entries
            </span>--%>
        </div>
         <div class="col-md-2" style="padding-top:6px;">
       <asp:Button runat="server" Text="Create a New Content" OnClick="newContent_Click" type="button" ID="newContent" class="btn btn-info pull-right"></asp:Button>
        </div><div class="col-md-1"></div>
        </div>
    <br />
    <asp:GridView OnSelectedIndexChanged="contentData_SelectedIndexChanged" OnPageIndexChanging="contentData_PageIndexChanging"
        CssClass="table table-bordered table-striped table-responsive" AllowPaging="true" PageSize="5"
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
    </asp:TemplateField>
            <asp:TemplateField Visible="false" AccessibleHeaderText="center" HeaderStyle-BackColor="#FFFFFF">
    <ItemTemplate>
<asp:Label ID="contentUrl" Visible="false" runat="server" Text='<%# Eval("contentUrl") %>'></asp:Label>
</ItemTemplate>
    </asp:TemplateField>
    <asp:ButtonField CommandName="Select" HeaderText="Actions" ImageUrl="images/edit%20(1).png"  Text="Edit" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#FFFFFFF" ButtonType="Image" ItemStyle-Height="10px" CausesValidation="false"></asp:ButtonField>
    </Columns>   
        </asp:GridView>
        </div>
    <div class="panel panel-default" runat="server" id="divEdit" visible="false">
        <div class="panel-heading" style="background-color: #6A55C2; color: white">
            <h3 class="panel-title">Edit a Content</h3>
        </div>
        <div class="panel-body">
            <div id="divParent">
                  <div class="row">
                  
                      <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>Content Id</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:Label ID="txtcontentId"  cssclass="form-control input-sm" runat="server"></asp:Label>
                </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        </div>
                <div class="row">
                  
                      <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>Event Id</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:TextBox ID="txtId" runat="server"  cssclass="form-control input-sm"></asp:TextBox>
                                    </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        </div>
                <div class="row">
                  
                      <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>File Type</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:TextBox ID="txtType" runat="server"  cssclass="form-control input-sm"></asp:TextBox>
                              </div>
                            </div>
                     
                   <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">
                  
                      <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>Name</label>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:TextBox ID="txtName" runat="server"  cssclass="form-control input-sm"></asp:TextBox>
                              </div>
                            </div>
                     
                   <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
                <div class="row">
                         <div class="col-xs-2 col-sm-2 col-md-2"></div>
                            <div class="col-xs-2 col-sm-2 col-md-2">
                                <div class="form-group"  style="text-align:left">
                                    <label>Choose a file to update your current</label>

                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group" style="text-align:left;">   
                            <asp:FileUpload ID="file" runat="server" />
                            </div>
                            </div>
                     <div class="col-xs-2 col-sm-2 col-md-2"></div>
                        </div>

                <div class="row">
                    <div class="col-xs-4 col-sm-4 col-md-4"></div>
                    <div class="col-md-6">
        <asp:Button ID="btncancle" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btncancle_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Button ID="btnUpdate" runat="server" CssClass="btn btn-success" OnClick="btnUpdate_Click" text="Update"/>
                    </div>          <div class="col-xs-2 col-sm-2 col-md-2"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
