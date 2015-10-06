<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Announcement.aspx.cs" Inherits="AwsWebApp1.Announcement" %>
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
            <asp:Button runat="server" Text="Create a New Announcement" OnClick="newAnnouncement_Click" type="button" ID="newAnnouncement" class="btn btn-info"></asp:Button>
        </div>
    </div>
    <br />
    <div runat="server">
    <asp:GridView OnSelectedIndexChanged="announcementData_SelectedIndexChanged"
        CssClass="table table-bordered table-striped table-responsive" AllowPaging="true" 
        AlternatingRowStyle-BackColor="#FFFFFF" BorderStyle="None" BackColor="#F9F9F9" ID="announcementData" 
        runat="server" AutoGenerateColumns="false" PagerStyle-BackColor="White">
        <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" />
        <PagerStyle BackColor="#FFFFFF" CssClass="GridPager" HorizontalAlign="center"/>
     <Columns>
     <asp:TemplateField HeaderText="AnnouncementId"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="announcementId" runat="server" Text='<%# Eval("announcementId") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="announcementId" BorderStyle="None" runat="server" Text='<%# Eval("announcementId") %>'></asp:TextBox>
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
<asp:TemplateField HeaderText="PublishTime"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="publishTime" runat="server" Text='<%# Eval("publishTime") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="TextBox2" BorderStyle="None" runat="server" Text='<%# Eval("publishTime") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
<asp:TemplateField HeaderText="Text"  AccessibleHeaderText="center"  HeaderStyle-BackColor="#FFFFFF">
<ItemTemplate>
<asp:Label ID="text" runat="server" Text='<%# Eval("text") %>'></asp:Label>
</ItemTemplate>
<%--<EditItemTemplate>
<asp:TextBox ID="TextBox3" BorderStyle="None" runat="server" Text='<%# Eval("text") %>'></asp:TextBox>
</EditItemTemplate>--%>
    </asp:TemplateField>
     <asp:ButtonField HeaderText="Edit" CommandName="Select"   ImageUrl="images/edit%20(1).png"  Text="Edit" ItemStyle-HorizontalAlign="Center" HeaderStyle-BackColor="#FFFFFFF" ButtonType="Image" ItemStyle-Height="10px" CausesValidation="false"></asp:ButtonField>
    </Columns>  
        </asp:GridView>
    </div>
    </div>
        <div class="panel panel-default" runat="server" id="divEdit" visible="false">
        <div class="panel-heading" style="background-color: #00C7F7; color: white">
            <h3 class="panel-title">Edit an Announcement</h3>
        </div>
        <div class="panel-body text-center">
            <div class="col-md-12" id="divParent">
                <div class="row">
                    <div class="col-md-6">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                    <span style="font-family: Adobe Hebrew">AnnouncementId</span>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:TextBox ID="AnnouncementId" runat="server" ></asp:TextBox>
                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                    <span style="font-family: Adobe Hebrew">EventId</span>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:TextBox ID="EventId" runat="server" ></asp:TextBox>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                    <span style="font-family: Adobe Hebrew">PublishTime</span>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:TextBox ID="PublishTime" runat="server" ></asp:TextBox>
                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="col-xs-12 col-sm-12 col-md-12 row">
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <div class="form-group">
                                    <span style="font-family: Adobe Hebrew">Text</span>
                                </div>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
        <asp:TextBox ID="Text" runat="server" ></asp:TextBox>
                              </div>
             </div>
                            </div>
                        </div>
                    </div>
               
           
           <div class="row">
                    <div class="col-md-6">
                        <asp:Button ID="btncancle" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="btncancle_Click"/>

                    </div>
                    <div class="col-md-6">
                        <asp:Button ID="Update" runat="server" OnClick="btnUpdate_Click" CssClass="btn btn-success" Text="Update"/>
                    </div>
                </div>
    </div>
             </div>
            </div>
</asp:Content>
